package com.img.api.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.img.api.dto.CommentDTO;
import java.util.List;
/**
* @description: 科普评价业务层接口
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface CommentService extends IService<CommentDTO> {

    /**
    * 默认分页方法
    * @param commentDTO
    * @return
    */
    Page<CommentDTO> basePage(CommentDTO commentDTO);


    /**
    * 根据XML中的sql语句进行查询
    * @param commentDTO
    * @return
    */
    List<CommentDTO> findList(CommentDTO commentDTO);

}
