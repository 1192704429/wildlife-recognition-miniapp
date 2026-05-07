package com.img.api.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.img.api.dao.CommentDao;
import com.img.api.dto.CommentDTO;
import com.img.api.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @description: 科普评价业务层实现类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentDao, CommentDTO> implements CommentService {

    @Override
    public Page<CommentDTO> basePage(CommentDTO commentDTO) {
        if (null != commentDTO.getCurrent() && null != commentDTO.getPageSize())
            commentDTO.setCurrent((commentDTO.getCurrent() - 1) * commentDTO.getPageSize());
        List<CommentDTO> list = this.baseMapper.findList(commentDTO);
        int count = this.baseMapper.findPageCount(commentDTO);
        Page<CommentDTO> page = new Page<>();
        page.setTotal(count);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<CommentDTO> findList(CommentDTO commentDTO) {
        return this.baseMapper.findList(commentDTO);
    }

}
