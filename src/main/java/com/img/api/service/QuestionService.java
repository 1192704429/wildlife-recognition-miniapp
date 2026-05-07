package com.img.api.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.img.api.dto.QuestionDTO;
import java.util.List;
/**
* @description: 每日一题业务层接口
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface QuestionService extends IService<QuestionDTO> {

    /**
    * 默认分页方法
    * @param questionDTO
    * @return
    */
    Page<QuestionDTO> basePage(QuestionDTO questionDTO);


    /**
    * 根据XML中的sql语句进行查询
    * @param questionDTO
    * @return
    */
    List<QuestionDTO> findList(QuestionDTO questionDTO);

}
