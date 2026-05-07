package com.img.api.controller;

import com.img.api.common.BaseController;
import com.img.api.common.ReturnMsg;
import com.img.api.dto.AdminsDTO;
import com.img.api.dto.DataVO;
import com.img.api.service.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

import com.img.api.common.BaseSelectEntity;
import cn.hutool.core.collection.CollectionUtil;

/**
 * @description: 管理员对外接口层
 * @author: wuming
 * @create: 2025.04.04 17:10:22
 */
@RestController
@RequestMapping("/admins")
public class AdminsController extends BaseController<AdminsService, AdminsDTO> {


    @Autowired
    private UsersService usersService;

    @Autowired
    private TypesService typesService;

    @Autowired
    private KnowledgeService knowledgeService;

    @Autowired
    private QuestionService questionService;

    @Override
    @Resource(name = "adminsService")
    protected void setBaseService(AdminsService adminsService) {
        this.baseService = adminsService;
    }

    /**
     * 默认分页查询
     *
     * @param adminsDTO
     * @return
     */
    @PostMapping("/page")
    public ReturnMsg page(@RequestBody AdminsDTO adminsDTO) {
        return ReturnMsg.ok(baseService.basePage(adminsDTO));
    }

    /**
     * 根据XML中的sql语句进行查询
     *
     * @param adminsDTO
     * @return
     */
    @PostMapping(value = "/findList")
    public ReturnMsg findList(@RequestBody AdminsDTO adminsDTO) {
        return ReturnMsg.ok(baseService.findList(adminsDTO));
    }

    @Override
    protected void beforeSave(AdminsDTO entity) throws Exception {
        entity.setCreateTime(new Date());
        super.beforeSave(entity);
    }


    @GetMapping(value = "/echarts")
    public ReturnMsg echarts() {
        // 用户数量
        int userNum = usersService.count();
        // 题目数量
        int questionNum = questionService.count();
        // 分类数量
        int typeNum = typesService.count();
        // 博物馆数量
        int knowNum = knowledgeService.count();
        // 不同分类下的科普数量
        List<DataVO> dataVOS = knowledgeService.listByType();
        HashMap<String, Object> map = new HashMap<>();
        map.put("userNum", userNum);
        map.put("questionNum", questionNum);
        map.put("typeNum", typeNum);
        map.put("knowNum", knowNum);
        map.put("dataVOS", dataVOS);
        return ReturnMsg.ok(map);
    }


}

