package com.img.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.img.api.entity. Knowledge;
import lombok.Data;
import lombok.ToString;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
* @description: 科普知识管理数据传输层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Data
@ToString
@TableName("knowledge")
public class KnowledgeDTO extends Knowledge {


}
