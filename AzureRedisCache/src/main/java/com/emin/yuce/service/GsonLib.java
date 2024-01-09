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
    }
    class SuspendAccountFile {
        private String accountFile;
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