package com.emin.yuce.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class GsonLib {

    public static void main(String[] args) {
        String jsonString = "[{\"accountFile\": \"file1.txt\", \"customerFile\": \"customer1.txt\"}," +
                "{\"accountFile\": \"file2.txt\", \"customerFile\": \"customer2.txt\"}]";

        // Define the type for Gson to parse into
        Type suspendAccountFileType = new TypeToken<List<SuspendAccountFile>>(){}.getType();

        // Use Gson to convert JSON string to List<SuspendAccountFile>
        List<SuspendAccountFile> suspendAccountFiles = new Gson().fromJson(jsonString, suspendAccountFileType);

        // Print the result
        for (SuspendAccountFile suspendAccountFile : suspendAccountFiles) {
            System.out.println("Account File: " + suspendAccountFile.getAccountFile());
            System.out.println("Customer File: " + suspendAccountFile.getCustomerFile());
            System.out.println();
        }

        // Define the type for Gson to parse into
        Type suspendAccountFileType = new TypeToken<List<SuspendAccountFile>>(){}.getType();

        // Use Gson to convert JSON string to List<SuspendAccountFile>
        List<SuspendAccountFile> suspendAccountFiles = new Gson().fromJson(jsonString, suspendAccountFileType);


    }
    class SuspendAccountFile {
        private String accountFile;
        @Pattern(regexp = "[1-9]\\d{9}", message = "Invalid value")
        private String yourField;
//        This regular expression breaks down as follows:
// String regex = "\\b\\d{1,10}\\b";
//                [1-9]: Ensures that the first digit is not zero.
//                \\d{9}: Matches exactly 9 digits after the first one.
//        This way, the total length is 10 digits, and the first digit is not allowed to be zero.
        private String customerFile;

        // Add constructors, getters, and setters as needed

        public String getAccountFile() {
            return accountFile;
        }

        public void setAccountFile(String accountFile) {
            this.accountFile = accountFile;
        }

        public String getCustomerFile() {
            return customerFile;
        }

        public void setCustomerFile(String customerFile) {
            this.customerFile = customerFile;
        }
    }
}