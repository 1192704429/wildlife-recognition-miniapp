package com.img.api.dao;

import com.img.api.common.BaseDao;
import com.img.api.dto.DataVO;
import com.img.api.dto.KnowledgeDTO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
* @description: 科普知识管理持久层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
public interface KnowledgeDao extends BaseDao<KnowledgeDTO> {

    @Select("select t.type_name name,type_id,count(*) value from knowledge k left join types t on t.id = k.type_id group  by type_id ")
    List<DataVO> listByType();
}
