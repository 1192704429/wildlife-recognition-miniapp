package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity.Comment;
import lombok.Data;
import lombok.ToString;

/**
* @description: 美食评价数据传输层
* @author: wuming
* @create: 2025.02.11 16:40:23
*/
@Data
@ToString
@TableName("comment")
public class CommentDTO extends Comment {

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
    /**
    * 美食名称
    */
    @TableField(exist = false)
    private String title;
    /**
    * 封面图片
    */
    @TableField(exist = false)
    private String bannerImg;

}
