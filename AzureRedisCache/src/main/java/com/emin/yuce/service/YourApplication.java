package com.emin.yuce.service;


@SpringBootApplication
public class YourApplication {

    public static void main(String[] args) {
        // Get the application context
        ConfigurableApplicationContext context = SpringApplication.run(YourApplication.class, args);

        // Get the FileService bean from the application context
        FileService fileService = context.getBean(FileService.class);

        try {
            // Call a method on the FileService bean
            List<String> fileContents = fileService.getAllFilesContentInCustomerFolder();

            // Do something with the file contents
            for (String content : fileContents) {
                System.out.println(content);
            }
        } catch (IOException e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
            // Close the application context
            context.close();
        }
    }
}

    public static void IOUtils.toString(String[] args) {
        try {
            // Specify the file path relative to the "resources" folder
            String filePath = "file.txt";

            // Use ClassLoader to get the resource stream
            InputStream inputStream = FileReadingExample.class.getClassLoader().getResourceAsStream(filePath);

            if (inputStream != null) {
                // Read the content of the file using IOUtils
                String fileContent = IOUtils.toString(inputStream, StandardCharsets.UTF_8);

                // Print or process the file content
                System.out.println(fileContent);
            } else {
                System.err.println("File not found: " + filePath);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
<dependencies>
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter</artifactId>
<exclusions>
<exclusion>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-tomcat</artifactId>
</exclusion>
</exclusions>
</dependency>
</dependencies>