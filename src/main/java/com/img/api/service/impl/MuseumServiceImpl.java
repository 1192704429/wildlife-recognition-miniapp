package com.img.api.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.img.api.dao.MuseumDao;
import com.img.api.dto.MuseumDTO;
import com.img.api.service.MuseumService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @description: 博物馆管理业务层实现类
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@Service("museumService")
public class MuseumServiceImpl extends ServiceImpl<MuseumDao, MuseumDTO> implements MuseumService {

    @Override
    public Page<MuseumDTO> basePage(MuseumDTO museumDTO) {
        if (null != museumDTO.getCurrent() && null != museumDTO.getPageSize())
            museumDTO.setCurrent((museumDTO.getCurrent() - 1) * museumDTO.getPageSize());
        List<MuseumDTO> list = this.baseMapper.findList(museumDTO);
        int count = this.baseMapper.findPageCount(museumDTO);
        Page<MuseumDTO> page = new Page<>();
        page.setTotal(count);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<MuseumDTO> findList(MuseumDTO museumDTO) {
        return this.baseMapper.findList(museumDTO);
    }

}
