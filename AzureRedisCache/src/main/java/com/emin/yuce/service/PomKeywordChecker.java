package com.emin.yuce.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class PomKeywordChecker {

    private static final String[] KEYWORDS = {"keyword1", "keyword2", "keyword3"}; // Replace with your keywords

    public static void main(String[] args) throws IOException {
        File rootDirectory = new File("/path/to/root/directory"); // Replace with the actual root directory
        checkPomFilesRecursively(rootDirectory);
    }

    private static void checkPomFilesRecursively(File directory) throws IOException {
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    checkPomFilesRecursively(file);
                } else if (file.getName().equals("pom.xml")) {
                    checkPomKeywords(file);
                }
            }
        }
    }

    private static void checkPomKeywords(File pomFile) throws IOException {
        List<String> lines = Files.readAllLines(pomFile.toPath());
        boolean allKeywordsFound = true;
        for (String keyword : KEYWORDS) {
            if (!lines.stream().anyMatch(line -> line.contains(keyword))) {
                System.out.println("Keyword '" + keyword + "' not found in " + pomFile.getPath());
                allKeywordsFound = false;
            }
        }
        if (allKeywordsFound) {
            System.out.println("All keywords found in " + pomFile.getPath());
        }
    }
}