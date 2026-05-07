package com.img.api.entity;

import com.img.api.common.BaseEntity;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
* @description: 科普评价实体类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment extends BaseEntity {

    /**
    * 主键ID
    */
    private Long id;
    /**
    * 评价内容
    */
    private String content;
    /**
    * 用户ID
    */
    private Long userId;
    /**
    * 文章ID
    */
    private Long knowledgeId;
    /**
    * 创建时间
    */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
    * 回复人编号
    */
    private Long toUserId;
    /**
    * 父级评论编号
    */
    private Long parentId;


}
