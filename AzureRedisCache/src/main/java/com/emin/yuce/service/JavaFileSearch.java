import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class JavaFileSearch {

    public static void main(String[] args) {
        String directoryPath = "/path/to"; // Replace this with your directory path
        String searchString = "debug"; // The string you want to search for
        searchString(directoryPath, searchString);
    }

    public void searchString(String directoryPath, String searchString) {
        List<File> javaFiles = findJavaFiles(new File(directoryPath));

        for (File file : javaFiles) {
            try {
                var lineNumbers=containsStringIndexLine(file.toPath(), searchString);
                if (CollectionUtils.isNotEmpty(lineNumbers)) {
                    System.out.println("Found '" + searchString + "' in file: " + file.getAbsolutePath()+" LineNumbers:"+lineNumbers);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static List<File> findJavaFiles(File directory) {
        List<File> javaFiles = new ArrayList<>();
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory() && file.getName().startsWith("tm-core-")) {
                    javaFiles.addAll(findJavaFiles_v2(file));
                } else if (file.isFile() && file.getName().endsWith(".java")) {
                    javaFiles.add(file);
                }
            }
        }
        return javaFiles;
    }

    private static List<File> findJavaFiles_v2(File directory) {
        List<File> javaFiles = new ArrayList<>();
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    javaFiles.addAll(findJavaFiles(file));
                } else if (file.isFile() && file.getName().endsWith(".java")) {
                    javaFiles.add(file);
                }
            }
        }
        return javaFiles;
    }

    private static boolean containsString(Path file, String searchString) throws IOException {
        return Files.lines(file)
                .anyMatch(line -> line.contains(searchString));
    }





    private static   List<Integer>  containsStringIndexLine(Path file, String searchString) throws IOException {
        List<Integer> resultLineNumber = new ArrayList<Integer>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file.toFile()))) {
            String line;
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber++;
                if (line.contains(searchString)) {
                    resultLineNumber.add(lineNumber);
                }
            }
        }
        return resultLineNumber;
    }
}
