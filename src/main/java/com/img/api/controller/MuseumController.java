package com.img.api.controller;

import cn.hutool.core.util.StrUtil;
import com.img.api.common.BaseController;
import com.img.api.common.ReturnMsg;
import com.img.api.common.util.ImgUtil;
import com.img.api.dto.ImgResult;
import com.img.api.dto.MuseumDTO;
import com.img.api.service.MuseumService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.img.api.common.BaseSelectEntity;

import java.util.ArrayList;

import com.img.api.service.UsersService;
import com.img.api.dto.UsersDTO;

import javax.annotation.Resource;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import com.img.api.common.BaseSelectEntity;
import cn.hutool.core.collection.CollectionUtil;

import java.util.Date;

/**
 * @description: 博物馆管理对外接口层
 * @author: wuming
 * @create: 2025.04.04 17:10:22
 */
@RestController
@RequestMapping("/museum")
public class MuseumController extends BaseController<MuseumService, MuseumDTO> {

    @Autowired
    private UsersService usersService;

    @Autowired
    private ImgUtil imgUtil;

    @Override
    @Resource(name = "museumService")
    protected void setBaseService(MuseumService museumService) {
        this.baseService = museumService;
    }

    /**
     * 默认分页查询
     *
     * @param museumDTO
     * @return
     */
    @PostMapping("/page")
    public ReturnMsg page(@RequestBody MuseumDTO museumDTO) {
        return ReturnMsg.ok(baseService.basePage(museumDTO));
    }

    /**
     * 根据XML中的sql语句进行查询
     *
     * @param museumDTO
     * @return
     */
    @PostMapping(value = "/findList")
    public ReturnMsg findList(@RequestBody MuseumDTO museumDTO) {
        return ReturnMsg.ok(baseService.findList(museumDTO));
    }

    /**
     * 图片识别
     *
     * @param museumDTO
     * @return
     * @throws IOException
     */
    @PostMapping(value = "/imageRecognition")
    public ReturnMsg imageRecognition(@RequestBody MuseumDTO museumDTO) throws IOException {
        String img = museumDTO.getImg();
        museumDTO.setCreateTime(new Date());
        if (StrUtil.isNotEmpty(img)) {
            List<ImgResult> results = imgUtil.imageRecognition(img, true, museumDTO.getType());
            if(CollectionUtil.isNotEmpty(results)) {
                ImgResult imgResult = results.get(0);
                museumDTO.setInfo(imgResult.getDescription());
                museumDTO.setName(imgResult.getName());
                museumDTO.setUrl(imgResult.getBaikeUrl());
            }
        }
        baseService.save(museumDTO);
        return ReturnMsg.ok();
    }

    @Override
    protected void beforeSave(MuseumDTO entity) throws Exception {
        entity.setCreateTime(new Date());
        super.beforeSave(entity);
    }

    @GetMapping("/all/users")
    public ReturnMsg allUsers() {
        List<BaseSelectEntity> list = new ArrayList<>();
        List<UsersDTO> dtos = usersService.list();
        for (UsersDTO dto : dtos) {
            BaseSelectEntity baseSelectEntity = new BaseSelectEntity();
            baseSelectEntity.setKey(dto.getId());
            baseSelectEntity.setValue(dto.getNickName());
            list.add(baseSelectEntity);
        }
        return ReturnMsg.ok(list);
    }

}

