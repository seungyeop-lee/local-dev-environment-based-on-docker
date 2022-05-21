package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/redis-test")
@RequiredArgsConstructor
public class RedisTestController {
    private final RedisTemplate<String, Object> redisTemplate;

    @PostMapping("")
    public ResponseEntity<?> addRedisKey() {
        ValueOperations<String, Object> vop = redisTemplate.opsForValue();
        vop.set("yellow", "banana");
        vop.set("red", "apple");
        vop.set("green", "watermelon");
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("/{key}")
    public ResponseEntity<?> getRedisKey(@PathVariable String key) {
        ValueOperations<String, Object> vop = redisTemplate.opsForValue();
        String value = (String) vop.get(key);
        return new ResponseEntity<>(value, HttpStatus.OK);
    }
}
