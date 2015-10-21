package com.emin.yuce.service;

import com.emin.yuce.genericDao.GDao;
import com.emin.yuce.genericDao.SimpleDao;
import com.emin.yuce.models.Brands;
import com.emin.yuce.models.Categories;
import com.emin.yuce.models.ProductCategories;
import com.emin.yuce.util.Finder;
import com.emin.yuce.util.FinderFactory;
import com.emin.yuce.util.SimpleCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ProductCategoryService extends BaseService {

    @SimpleDao(ProductCategories.class)
    protected GDao<ProductCategories> productCategoryDao;

    @Transactional
    public List<ProductCategories> findAllByStoreId(int storeId){
        SimpleCacheManager simpleCacheManager = SimpleCacheManager.getInstance();
        String key="findAllProductCategories-"+storeId;
        List<ProductCategories> items = (List<ProductCategories>) simpleCacheManager.get(key);
        if(items == null){
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("storeId", storeId);
            items = productCategoryDao.findWithFinder(finder);
            simpleCacheManager.put(key,items);
        }
        return items;
    }
    @Transactional
    public void updateParentId(int storeId) throws Exception {
        List<ProductCategories> items = this.findAllByStoreId(storeId);
        for (ProductCategories p : items){
            String parentCategoryApiId=p.getApiCategoryParentId();
            Finder finder = FinderFactory.getInstance();
            finder.addFilterEqual("ApiCategoryParentId", p.getApiCategoryId());
            finder.addFilterEqual("parentId", 0);
            List<ProductCategories>  result = productCategoryDao.findWithFinder(finder);
            for (ProductCategories p1 : result){
                p1.setParentId(p.getId());
            }
            productCategoryDao.saveOrUpdateAll(result);
        }



    }

    @Transactional
    public List<ProductCategories> findAllApiCategoryId(int storeId, String categoryId, String parentId) throws Exception {
        List<ProductCategories> items = this.findAllByStoreId(storeId);
        List<ProductCategories> results = new ArrayList<ProductCategories>();

        for (ProductCategories p : items){
            if( p.getApiCategoryId() != null &&
                    p.getApiCategoryParentId() != null &&
                    p.getApiCategoryId().equals(categoryId) &&
                    p.getApiCategoryParentId().equals(parentId)){
                results.add(p);
            }
        }

        return results;

    }

    @Transactional
    public ProductCategories saveProductCategory(int storeId, String name, String categoryId, String parentId) {
        ProductCategories item = new ProductCategories();
        List<ProductCategories> productCategoriesList = null;
        try {
            productCategoriesList = findAllApiCategoryId(storeId, categoryId,parentId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(productCategoriesList != null && productCategoriesList.size()  == 0) {
            item.setName(name);
            item.setCategoryType("product");
            item.setParentId(0);
            item.setCreatedDate(new Date());
            item.setDescription(parentId);
            item.setOrdering(1);
            item.setUpdatedDate(new Date());
            item.setStoreId(storeId);
            item.setState(true);
            item.setApiCategoryId(categoryId);
            item.setApiCategoryParentId(parentId);
            this.saveOrUpdate(this.productCategoryDao, item);





        }else{
            item = productCategoriesList.get(0);
        }
        return item;
    }
//
//    public void CreateTreeView(TreeView tree, string lang)
//    {
//
//        var roots = from s in db.Navigations where s.ParentID == 0 && s.Lang == lang orderby s.NavigationOrdering select s;
//
//        foreach (Navigation item in roots)
//        {
//            TreeNode node = new TreeNode();
//            node.Checked = item.State.Value;
//            node.ToolTip = item.PageShortDesc;
//            node.SelectAction = TreeNodeSelectAction.SelectExpand;
//            node.Text = item.PageName;
//            node.Value = item.ID.ToString();
//            tree.Nodes.Add(node);
//            CreateChildTree(node, item.ID, lang);
//        }
//
//    }
//    private void CreateChildTree(TreeNode node, int categoryID, string lang)
//    {
//        var childs = from s in db.Navigations where s.ParentID == categoryID && s.Lang == lang orderby s.NavigationOrdering select s;
//
//
//        for (Navigation item in childs)
//        {
//
//            CreateChildTree(tn, item.ID, lang);
//        }
//
//    }

}
