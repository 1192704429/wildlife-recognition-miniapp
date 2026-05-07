package com.img.api.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.img.api.dao.QuestionDao;
import com.img.api.dto.QuestionDTO;
import com.img.api.service.QuestionService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @description: 每日一题业务层实现类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Service("questionService")
public class QuestionServiceImpl extends ServiceImpl<QuestionDao, QuestionDTO> implements QuestionService {

    @Override
    public Page<QuestionDTO> basePage(QuestionDTO questionDTO) {
        if (null != questionDTO.getCurrent() && null != questionDTO.getPageSize())
            questionDTO.setCurrent((questionDTO.getCurrent() - 1) * questionDTO.getPageSize());
        List<QuestionDTO> list = this.baseMapper.findList(questionDTO);
        int count = this.baseMapper.findPageCount(questionDTO);
        Page<QuestionDTO> page = new Page<>();
        page.setTotal(count);
        page.setSize(questionDTO.getPageSize());
        page.setRecords(list);
        return page;
    }

    @Override
    public List<QuestionDTO> findList(QuestionDTO questionDTO) {
        return this.baseMapper.findList(questionDTO);
    }

}
