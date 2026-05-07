package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity. Users;
import lombok.Data;
import lombok.ToString;

/**
* @description: 用户表数据传输层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@ToString
@TableName("users")
public class UsersDTO extends Users {


}
