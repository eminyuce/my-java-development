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