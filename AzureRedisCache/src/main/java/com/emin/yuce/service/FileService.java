package com.emin.yuce.service;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FileService {

    private final ResourceLoader resourceLoader;

    public FileService(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    public List<String> getAllFilesContentInCustomerFolder() throws IOException {
        List<String> fileContents = new ArrayList<>();

        // Get the resource representing the "customer" folder
        Resource resource = resourceLoader.getResource("classpath:customer/");

        // Get the absolute path of the resource
        Path customerFolderPath = resource.getFile().toPath();

        // List all files in the "customer" folder
        List<Path> filePaths = Files.walk(customerFolderPath)
                .filter(Files::isRegularFile)
                .collect(Collectors.toList());

        // Read the content of each file
        for (Path filePath : filePaths) {
            String content = new String(Files.readAllBytes(filePath));
            fileContents.add(content);
        }

        return fileContents;
    }
}
