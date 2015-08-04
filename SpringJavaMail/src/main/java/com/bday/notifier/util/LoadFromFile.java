package com.bday.notifier.util;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by EMINYUCE on 12/12/13.
 */
public class LoadFromFile {

    public List<String> getLinks(){
        List<String> lines = null;
        try {
            //Path path = Paths.get("pageLinks.properties");
            Resource resource = new ClassPathResource("/pageLinks.properties");
            File f = resource.getFile();
            lines = Files.readAllLines(Paths.get(f.getAbsolutePath()), StandardCharsets.UTF_8);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return lines;
    }
}
