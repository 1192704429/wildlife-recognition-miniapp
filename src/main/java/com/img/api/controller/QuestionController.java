package com.img.api.controller;

import com.img.api.common.BaseController;
import com.img.api.common.ReturnMsg;
import com.img.api.dto.QuestionDTO;
import com.img.api.service.QuestionService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;
import com.img.api.common.BaseSelectEntity;
import cn.hutool.core.collection.CollectionUtil;
import java.util.Date;
/**
* @description: 每日一题对外接口层
* @author: wuming
* @create: 2025.04.04 17:10:22
*/
@RestController
@RequestMapping("/question")
public class QuestionController extends BaseController<QuestionService, QuestionDTO> {


    @Override
    @Resource(name = "questionService")
    protected void setBaseService(QuestionService questionService) {
        this.baseService = questionService;
    }

    /**
    * 默认分页查询
    * @param questionDTO
    * @return
    */
    @PostMapping("/page")
    public ReturnMsg page(@RequestBody QuestionDTO questionDTO) {
        return ReturnMsg.ok(baseService.basePage(questionDTO));
    }

    /**
    * 根据XML中的sql语句进行查询
    * @param questionDTO
    * @return
    */
    @PostMapping(value = "/findList")
    public ReturnMsg findList(@RequestBody QuestionDTO questionDTO) {
        return ReturnMsg.ok(baseService.findList(questionDTO));
    }

    @Override
    protected void beforeSave(QuestionDTO entity) throws Exception {
        entity.setCreateTime(new Date());
        super.beforeSave(entity);
    }

}

