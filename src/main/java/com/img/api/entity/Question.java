package com.img.api.entity;

import com.img.api.common.BaseEntity;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
* @description: 每日一题实体类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Question extends BaseEntity {

    /**
    * 题目编号
    */
    private Long id;
    /**
    * 图片
    */
    private String img;
    /**
    * 标题
    */
    private String title;
    /**
    * 答案A
    */
    private String answerA;
    /**
    * 答案B
    */
    private String answerB;
    /**
    * 答案C
    */
    private String answerC;
    /**
    * 答案D
    */
    private String answerD;
    /**
    * 正确答案
    */
    private String answer;
    /**
    * 状态
    */
    private Integer status;
    /**
    * 创建时间
    */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;


}
