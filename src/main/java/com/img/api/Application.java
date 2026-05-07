package com.img.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;
/**
* @description: 主启动类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@MapperScan("com.img.api.dao")
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
