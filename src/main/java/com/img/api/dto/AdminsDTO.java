package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity. Admins;
import lombok.Data;
import lombok.ToString;

/**
* @description: 管理员数据传输层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@ToString
@TableName("admins")
public class AdminsDTO extends Admins {


}
