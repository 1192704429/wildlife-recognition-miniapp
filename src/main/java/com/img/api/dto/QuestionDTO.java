package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity. Question;
import lombok.Data;
import lombok.ToString;

/**
* @description: 每日一题数据传输层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@ToString
@TableName("question")
public class QuestionDTO extends Question {


}
