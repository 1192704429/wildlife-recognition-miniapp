package com.img.api.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.img.api.dao.KnowledgeDao;
import com.img.api.dto.DataVO;
import com.img.api.dto.KnowledgeDTO;
import com.img.api.service.KnowledgeService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @description: 科普知识管理业务层实现类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Service("knowledgeService")
public class KnowledgeServiceImpl extends ServiceImpl<KnowledgeDao, KnowledgeDTO> implements KnowledgeService {

    @Override
    public Page<KnowledgeDTO> basePage(KnowledgeDTO knowledgeDTO) {
        if (null != knowledgeDTO.getCurrent() && null != knowledgeDTO.getPageSize())
            knowledgeDTO.setCurrent((knowledgeDTO.getCurrent() - 1) * knowledgeDTO.getPageSize());
        List<KnowledgeDTO> list = this.baseMapper.findList(knowledgeDTO);
        int count = this.baseMapper.findPageCount(knowledgeDTO);
        Page<KnowledgeDTO> page = new Page<>();
        page.setTotal(count);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<KnowledgeDTO> findList(KnowledgeDTO knowledgeDTO) {
        return this.baseMapper.findList(knowledgeDTO);
    }

    @Override
    public List<DataVO> listByType() {
        return  this.baseMapper.listByType();
    }

}
