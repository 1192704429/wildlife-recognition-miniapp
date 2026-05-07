package com.img.api.controller;

import com.img.api.common.BaseController;
import com.img.api.common.ReturnMsg;
import com.img.api.dto.KnowledgeDTO;
import com.img.api.service.KnowledgeService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.img.api.common.BaseSelectEntity;
import java.util.ArrayList;
import com.img.api.service.TypesService;
import com.img.api.dto.TypesDTO;
import javax.annotation.Resource;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;
import com.img.api.common.BaseSelectEntity;
import cn.hutool.core.collection.CollectionUtil;
import java.util.Date;
/**
* @description: 科普知识管理对外接口层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@RestController
@RequestMapping("/knowledge")
public class KnowledgeController extends BaseController<KnowledgeService, KnowledgeDTO> {

    @Autowired
    private TypesService typesService;

    @Override
    @Resource(name = "knowledgeService")
    protected void setBaseService(KnowledgeService knowledgeService) {
        this.baseService = knowledgeService;
    }

    /**
    * 默认分页查询
    * @param knowledgeDTO
    * @return
    */
    @PostMapping("/page")
    public ReturnMsg page(@RequestBody KnowledgeDTO knowledgeDTO) {
        return ReturnMsg.ok(baseService.basePage(knowledgeDTO));
    }

    /**
    * 根据XML中的sql语句进行查询
    * @param knowledgeDTO
    * @return
    */
    @PostMapping(value = "/findList")
    public ReturnMsg findList(@RequestBody KnowledgeDTO knowledgeDTO) {
        return ReturnMsg.ok(baseService.findList(knowledgeDTO));
    }

    @Override
    protected void beforeSave(KnowledgeDTO entity) throws Exception {
        entity.setCreateTime(new Date());
        super.beforeSave(entity);
    }

    @GetMapping("/all/types")
    public ReturnMsg allTypes() {
        List<BaseSelectEntity> list = new ArrayList<>();
        List<TypesDTO> dtos = typesService.list();
            for (TypesDTO dto : dtos) {
            BaseSelectEntity baseSelectEntity = new BaseSelectEntity();
            baseSelectEntity.setKey(dto.getId());
            baseSelectEntity.setValue(dto.getTypeName());
            list.add(baseSelectEntity);
        }
        return ReturnMsg.ok(list);
    }

}

