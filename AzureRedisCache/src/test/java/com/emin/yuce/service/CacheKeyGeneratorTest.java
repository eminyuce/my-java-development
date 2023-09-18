package com.emin.yuce.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CacheKeyGeneratorTest {
    private CacheKeyGenerator cacheKeyGenerator;

    @BeforeEach
    public void setUp() {
        cacheKeyGenerator = new CacheKeyGenerator();
    }

    @Test
    public void testGenerateCacheKey() {
        HashMap<String, String> map = new HashMap<>();
        map.put("key1", "value1");
        map.put("key2", "value2");
        map.put("key3", "value3");

        String expectedCacheKey = "key1=value1&key2=value2&key3=value3";
        String actualCacheKey = cacheKeyGenerator.generateCacheKey(map);

        assertEquals(expectedCacheKey, actualCacheKey);
    }

    @Test
    public void testGenerateCacheKeyWithEmptyMap() {
        HashMap<String, String> map = new HashMap<>();

        String expectedCacheKey = "";
        String actualCacheKey = cacheKeyGenerator.generateCacheKey(map);

        assertEquals(expectedCacheKey, actualCacheKey);
    }

    @Test
    public void testGenerateCacheKeyWithNullMap() {
        String actualCacheKey = cacheKeyGenerator.generateCacheKey(null);

        assertEquals(null, actualCacheKey);
    }
}
