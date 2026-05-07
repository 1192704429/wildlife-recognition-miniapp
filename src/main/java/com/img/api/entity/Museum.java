package com.img.api.entity;

import com.img.api.common.BaseEntity;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
* @description: 博物馆管理实体类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Museum extends BaseEntity {

    /**
    * 编号
    */
    private Long id;
    /**
    * 名称
    */
    private String name;
    /**
    * 简介
    */
    private String info;
    /**
    * 图片
    */
    private String img;
    /**
    * 分类
    */
    private Integer type;
    /**
    * 上传用户
    */
    private Long userId;
    /**
    * 创建时间
    */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
    * 状态
    */
    private Integer status;
    /**
    * 图片组
    */
    private String imgs;
    /**
    * 同步状态
    */
    private String url;


}
