package com.emin.yuce.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;


/***


 <dependency>
 <groupId>org.springframework.boot</groupId> <artifactId>spring-boot-starter-cache</artifactId>
 </dependency>
 <dependency>
 <groupId>org.springframework.boot</groupId>
 <artifactId>spring-boot-starter-data-redis</artifactId>
 </dependency>
 <dependency>
 <groupId>redis.clients</groupId>
 <artifactId>jedis</artifactId>
 </dependency>


 */


@Configuration
@EnableCaching
public class RedisConfiguration {
    @Value("${spring.redis.host}")
    private String REDIS_HOSTNAME;
    @Value("${spring.redis.port}")
    private int REDIS_PORT;

    @Bean
    public RedisTemplate<String, String> redisTemplate() {
        final RedisTemplate<String, String> redisTemplate = new RedisTemplate<String, String>();
.setKeySerializer(new StringRedisSerializer());
        redisTemplate
                redisTemplate
.setHashKeySerializer(
                new GenericToStringSerializer<String>(
                        String.class));

        redisTemplate
                .setHashValueSerializer(
                        new JdkSerializationRedisSerializer());
        redisTemplate
                .setValueSerializer(
                        new JdkSerializationRedisSerializer());
        RedisStandaloneConfiguration configuration =
                new RedisStandaloneConfiguration(REDIS_HOSTNAME, REDIS_PORT);
//Building Jedis Redis Template
        JedisClientConfiguration jedisClientConfiguration =
                JedisClientConfiguration.builder().build();
        JedisConnectionFactory factory =
                new JedisConnectionFactory(configuration,
                        jedisClientConfiguration);
        factory.afterPropertiesSet();
        redisTemplate.setConnectionFactory(factory);
        return redisTemplate;

    }
}
