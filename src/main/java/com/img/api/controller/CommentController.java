package com.img.api.controller;

import com.img.api.common.BaseController;
import com.img.api.common.BaseSelectEntity;
import com.img.api.common.ReturnMsg;
import com.img.api.dto.CommentDTO;
import com.img.api.dto.KnowledgeDTO;
import com.img.api.dto.UsersDTO;
import com.img.api.service.CommentService;
import com.img.api.service.KnowledgeService;
import com.img.api.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* @description: 美食评价对外接口层
* @author: wuming
* @create: 2025.02.11 16:40:23
*/
@RestController
@RequestMapping("/comment")
public class CommentController extends BaseController<CommentService, CommentDTO> {

    @Autowired
    private UsersService usersService;

    @Autowired
    private KnowledgeService knowledgeService;

    @Override
    @Resource(name = "commentService")
    protected void setBaseService(CommentService foodCommentService) {
        this.baseService = foodCommentService;
    }

    /**
    * 默认分页查询
    * @param foodCommentDTO
    * @return
    */
    @PostMapping("/page")
    public ReturnMsg page(@RequestBody CommentDTO foodCommentDTO) {
        return ReturnMsg.ok(baseService.basePage(foodCommentDTO));
    }

    /**
    * 根据XML中的sql语句进行查询
    * @param foodCommentDTO
    * @return
    */
    @PostMapping(value = "/findList")
    public ReturnMsg findList(@RequestBody CommentDTO foodCommentDTO) {
        return ReturnMsg.ok(baseService.findList(foodCommentDTO));
    }

    @Override
    protected void beforeSave(CommentDTO entity) throws Exception {
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

    @GetMapping("/all/knowledge")
    public ReturnMsg allKnowledge() {
        List<BaseSelectEntity> list = new ArrayList<>();
        List<KnowledgeDTO> dtos = knowledgeService.list();
            for (KnowledgeDTO dto : dtos) {
            BaseSelectEntity baseSelectEntity = new BaseSelectEntity();
            baseSelectEntity.setKey(dto.getId());
            baseSelectEntity.setValue(dto.getTitle());
            list.add(baseSelectEntity);
        }
        return ReturnMsg.ok(list);
    }

}

