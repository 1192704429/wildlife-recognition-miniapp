package com.img.api.entity;

import com.img.api.common.BaseEntity;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
* @description: 科普知识分类实体类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Types extends BaseEntity {

    /**
    * 分类编号
    */
    private Long id;
    /**
    * 分类名称
    */
    private String typeName;
    /**
    * 创建时间
    */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;


}
