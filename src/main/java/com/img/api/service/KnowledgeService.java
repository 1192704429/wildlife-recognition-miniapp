package com.img.api.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.img.api.dto.DataVO;
import com.img.api.dto.KnowledgeDTO;
import java.util.List;
/**
* @description: 科普知识管理业务层接口
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface KnowledgeService extends IService<KnowledgeDTO> {

    /**
    * 默认分页方法
    * @param knowledgeDTO
    * @return
    */
    Page<KnowledgeDTO> basePage(KnowledgeDTO knowledgeDTO);


    /**
    * 根据XML中的sql语句进行查询
    * @param knowledgeDTO
    * @return
    */
    List<KnowledgeDTO> findList(KnowledgeDTO knowledgeDTO);

    List<DataVO> listByType();
}
