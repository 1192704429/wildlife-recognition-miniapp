package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity. Museum;
import lombok.Data;
import lombok.ToString;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
* @description: 博物馆管理数据传输层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@ToString
@TableName("museum")
public class MuseumDTO extends Museum {

    /**
    * 昵称
    */
    @TableField(exist = false)
    private String nickName;
    /**
    * 头像
    */
    @TableField(exist = false)
    private String headImg;

}
