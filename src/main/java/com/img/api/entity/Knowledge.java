package com.img.api.entity;

import com.img.api.common.BaseEntity;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
* @description: 科普知识管理实体类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Knowledge extends BaseEntity {

    /**
    * 科普知识编号
    */
    private Long id;
    /**
    * 封面图片
    */
    private String bannerImg;
    /**
    * 所属分类
    */
    private Long typeId;
    /**
    * 内容
    */
    private String content;
    /**
    * 简介
    */
    private String info;
    /**
    * 创建时间
    */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
    * 标题
    */
    private String title;


}
