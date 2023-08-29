package com.emin.yuce.service;

        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.cache.annotation.CacheEvict;
        import org.springframework.cache.annotation.Cacheable;
        import org.springframework.cache.annotation.EnableCaching;
        import org.springframework.data.redis.cache.RedisCacheManager;
        import org.springframework.stereotype.Service;

@Service
@EnableCaching
public class RedisCacheService {

    private final RedisCacheManager cacheManager;

    @Autowired
    public RedisCacheService(RedisCacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    @Cacheable(cacheNames = "myCache", key = "#key")
    public String getFromCache(String key) {
        System.out.println("Fetching from cache: " + key);
        return "Cached value for " + key;
    }

    @CacheEvict(cacheNames = "myCache", key = "#key")
    public void evictCache(String key) {
        System.out.println("Evicting cache for key: " + key);
    }

    public void dehydrateCache(String key) {
        cacheManager.getCache("myCache").evictIfPresent(key);
        System.out.println("Dehydrating cache for key: " + key);
    }
}