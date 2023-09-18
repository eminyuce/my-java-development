package com.emin.yuce.service;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
public class KeyUtil {
    public static String generateCacheKey(HashMap<String, String> map) {
        // Sort the map by keys to ensure consistency in the cache key
        Map<String, String> sortedMap = map.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, HashMap::new));

        // Create a StringBuilder to build the cache key
        StringBuilder cacheKeyBuilder = new StringBuilder();

        for (Map.Entry<String, String> entry : sortedMap.entrySet()) {
            cacheKeyBuilder.append(entry.getKey())
                    .append("=")
                    .append(entry.getValue())
                    .append("&");
        }

        // Remove the trailing '&' character
        if (cacheKeyBuilder.length() > 0) {
            cacheKeyBuilder.setLength(cacheKeyBuilder.length() - 1);
        }

        // Convert the StringBuilder to a String for the final cache key
        return cacheKeyBuilder.toString();
    }
}
