package com.emin.yuce.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class RedisUtility {
    @Qualifier("redisTemplate")
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    Gson gson;

    public void setValue(final String key, AuthUserDto authUserDto) {
        redisTemplate.ops ForValue ().set(key, gson.toJson(authUserDto));
        redisTemplate.expire(key, 10, TimeUnit.MINUTES);
    }

    public AuthUserDto getValue(final String key) {

        return gson
                .fromJson(redisTemplate.ops ForValue().get(key), AuthUserDto.class);
    }

    public void deleteKeyformredis(String key) {

        redisTemplate.delete(key);
    }

}