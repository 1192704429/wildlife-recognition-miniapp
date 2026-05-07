package com.img.api.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.img.api.dto.MuseumDTO;
import java.util.List;
/**
* @description: 博物馆管理业务层接口
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface MuseumService extends IService<MuseumDTO> {

    /**
    * 默认分页方法
    * @param museumDTO
    * @return
    */
    Page<MuseumDTO> basePage(MuseumDTO museumDTO);


    /**
    * 根据XML中的sql语句进行查询
    * @param museumDTO
    * @return
    */
    List<MuseumDTO> findList(MuseumDTO museumDTO);

}
