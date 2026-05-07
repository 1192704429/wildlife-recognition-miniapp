package com.img.api.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.img.api.dto.TypesDTO;
import java.util.List;
/**
* @description: 科普知识分类业务层接口
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface TypesService extends IService<TypesDTO> {

    /**
    * 默认分页方法
    * @param typesDTO
    * @return
    */
    Page<TypesDTO> basePage(TypesDTO typesDTO);


    /**
    * 根据XML中的sql语句进行查询
    * @param typesDTO
    * @return
    */
    List<TypesDTO> findList(TypesDTO typesDTO);

}
