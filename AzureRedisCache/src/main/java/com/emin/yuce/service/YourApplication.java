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



        import org.junit.jupiter.api.BeforeEach;
        import org.junit.jupiter.api.Test;
        import org.mockito.Mock;
        import org.mockito.MockitoAnnotations;
        import org.springframework.core.io.DefaultResourceLoader;
        import org.springframework.core.io.Resource;
        import org.springframework.core.io.ResourceLoader;

        import java.io.IOException;
        import java.nio.file.Files;
        import java.nio.file.Path;
        import java.util.HashMap;
        import java.util.Map;

        import static org.junit.jupiter.api.Assertions.assertEquals;
        import static org.mockito.Mockito.when;

class FileServiceTest {

    @Mock
    private ResourceLoader resourceLoader;

    private FileService fileService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
        fileService = new FileService(resourceLoader);
    }

    @Test
    void testGetAllFilesContentInCustomerFolder() throws IOException {
        // Mock the behavior of the ResourceLoader
        Resource resource = new DefaultResourceLoader().getResource("classpath:customer/");
        when(resourceLoader.getResource("classpath:customer/")).thenReturn(resource);

        // Mock file content
        String file1Content = "File 1 Content";
        String file2Content = "File 2 Content";

        // Mock the behavior of Files.walk()
        Path tempFile1 = Files.createTempFile("tempfile1", ".txt");
        Path tempFile2 = Files.createTempFile("tempfile2", ".txt");
        when(Files.walk(resource.getFile().toPath()))
                .thenReturn(List.of(tempFile1, tempFile2));

        // Mock the behavior of Files.readAllBytes()
        when(Files.readAllBytes(tempFile1)).thenReturn(file1Content.getBytes());
        when(Files.readAllBytes(tempFile2)).thenReturn(file2Content.getBytes());

        // Execute the method to test
        Map<String, String> result = fileService.getAllFilesContentInCustomerFolder();

        // Verify the result
        Map<String, String> expected = new HashMap<>();
        expected.put(tempFile1.getFileName().toString(), file1Content);
        expected.put(tempFile2.getFileName().toString(), file2Content);
        assertEquals(expected, result);
    }
}

@SpringBootApplication
@EnableAutoConfiguration(exclude = {ResourceServerTokenServicesConfiguration.class},
        excludeName = {"org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerTokenServicesConfiguration$JwtTokenServicesConfiguration"})
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true, proxyTargetClass = true)
public class Elephant

@Configuration
@ComponentScan(basePackages = "com.example",
        excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, value = MyExcludeComponent.class))
public class AppConfig {