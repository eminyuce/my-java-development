package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.FileManagers;
import com.emin.yuce.models.ProductFiles;
import com.emin.yuce.models.Products;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import com.shopstyle.bo.Image;
import com.shopstyle.bo.ImageSize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class FileManagerService extends BaseService {

    private SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();

    @SimpleDao(FileManagers.class)
    public GDao<FileManagers> fileManagerDao;

    @Autowired
    public ProductFileService productFileService;

    public void removeCache(int storeId){
        String key="findAllFileManagers-"+storeId;
        simpleCacheManager.clear(key);
    }


    @Transactional
    @Rollback(false)
    public List<FileManagers> findAllByStoreId(int storeId, String url){
        Finder finder = FinderFactory.getInstance();
        finder.addFilterEqual("storeId", storeId);
        finder.addFilterEqual("webContentLink", url);
        return fileManagerDao.findWithFinder(finder);
    }

    @Transactional
    @Rollback(false)
    public void SaveFileManagers(int storeId, Image image, Products product) {

        if(productFileService.findAllByProductId(product.getId()).size() > 0){
            return;
        }

        List<FileManagers> fileManagers = new ArrayList<FileManagers>();
        Map<ImageSize.SizeName, ImageSize>  sizeNameImageSizeMap = image.getSizes();
        for (Map.Entry<ImageSize.SizeName, ImageSize> entry : sizeNameImageSizeMap.entrySet())
        {
            FileManagers fileManager = new FileManagers();
            try {

                ImageSize.SizeName sizeName = entry.getKey();
                ImageSize imageSize = entry.getValue();
                List<FileManagers> sameFiles = findAllByStoreId(storeId,imageSize.getUrl());
                if(sameFiles != null && sameFiles.size() == 0) {

                    fileManager.setStoreId(storeId);
                    fileManager.setWebContentLink(imageSize.getUrl());
                    fileManager.setWidth(imageSize.getWidth());
                    fileManager.setHeight(imageSize.getHeight());
                    fileManager.setName(image.getId());
                    fileManager.setCreatedDate(new Date());
                    fileManager.setOrdering(1);
                    fileManager.setUpdatedDate(new Date());
                    fileManager.setImageSourceType("ShopStyle");
                    fileManager.setFileStatus("success");
                    fileManager.setFileSize(imageSize.getSizeName().name());
                    fileManager.setState(true);
                    fileManager.setIsCarousel(false);
                    String fileName = product.getName() + ",  " + imageSize.getSizeName().name() + " = " + imageSize.getWidth() + " × " + imageSize.getHeight();
                    fileManager.setOriginalFilename(fileName);
                    fileManager.setModifiedDate(new Date());
                    fileManager.setContentLength(0);
                    fileManager.setGoogleImageId("");
                    fileManager.setTitle("");
                    fileManager.setContentType("jpg");
                    fileManager.setIconLink("");
                    fileManager.setThumbnailLink("");
                    fileManagers.add(fileManager);

                }else{
                    fileManagers.add(sameFiles.get(0));
                }
            }catch (Exception e){
                LOGGER.error(e.getMessage(),e);
            }


        }
        this.fileManagerDao.saveOrUpdateAll(fileManagers);
        List<ProductFiles> productFilesList = new ArrayList<ProductFiles>();
        for (FileManagers f : fileManagers){

            try{

                ProductFiles productFiles = new ProductFiles();

                productFiles.setFileManagerId(f.getId());
                productFiles.setIsMainImage(f.getFileStatus().equals("Best"));
                productFiles.setProductId(product.getId());
                productFilesList.add(productFiles);

            }catch (Exception e){
                LOGGER.error(e.getMessage(),e);

            }
        }

        productFileService.saveOrUpdateAllProductFiles(productFilesList);

    }




}
