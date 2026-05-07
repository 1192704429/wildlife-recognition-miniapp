# 基于 SpringBoot + 微信小程序的图片识别科普系统的设计与实现

> 本文围绕图片识别与科普知识结合的应用场景，设计并实现了一个基于 SpringBoot + 微信小程序的图片识别科普系统。

## 一、项目背景

随着移动互联网和人工智能技术的普及，用户对动植物识别与科普知识获取的需求日益增长。传统的科普方式依赖人工讲解或图文手册，效率低且不便携。本项目通过微信小程序接入图片识别能力，用户可快速识别动植物并查看详细科普信息，同时支持文章阅读、每日答题等互动功能，有效提升了科普教育的趣味性和可及性。系统同时为管理员提供后台管理模块，支持对用户、知识库、文章、题目等内容的统一维护。

## 二、功能模块介绍

系统分为两个端：用户端（微信小程序）和管理后台（PC网页）。

| 角色 | 所属端 |
|------|--------|
| 用户 | 微信小程序 |
| 管理员 | 管理后台 |


![功能模块图](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/azhou_promotion/img/module_structure/func_module_431ede2c6531485ca070528a41692ca5.png)


## 三、技术栈说明

前端：Vue + 微信小程序

后端：SpringBoot + JAVA

数据库与中间件：MySQL

## 四、核心模块介绍

###### 微信小程序端

###### 用户

- 用户登录注册
- 首页：动物识别，植物识别
- 博物馆：用户识别之后保存到数据库，可以通过名称或者分类（动物，植物）等进行检索
- 识别物品详情：识别之后查看具体详细信息
- 科普文章
- 文章详情
- 文章评论
- 每日一题：选择题，然后可以下一题上一题等
- 个人中心：个人信息修改等

##### 界面展示

注册页：填写账号密码，完成小程序账号注册

![注册页：填写账号密码，完成小程序账号注册](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/ab191d91-c50b-4c17-8b78-6a554889c6ea.jpg)

登录页：输入账号密码，登录图片识别小程序

![登录页：输入账号密码，登录图片识别小程序](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/0915f2a7-80c5-4c74-812f-de287e6b0c42.jpg)

植物识别页：上传植物图片提交，完成植物识别

![植物识别页：上传植物图片提交，完成植物识别](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/aa58edaf-b6cb-4993-8ee2-2822d68c4538.jpg)

识别物品详情页：展示识别得到的月季花的科普百科详情

![识别物品详情页：展示识别得到的月季花的科普百科详情](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/a18eaa26-f287-428d-82d6-e28c7ba52396.jpg)

科普文章列表页：展示哺乳动物分类下的科普文章列表

![科普文章列表页：展示哺乳动物分类下的科普文章列表](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/13c63bb5-0ad4-40b2-8a1c-976f93d08761.jpg)

列表页：展示已保存的识别物种，支持分类检索

![列表页：展示已保存的识别物种，支持分类检索](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/3a56a248-0e0d-4edb-85d8-ba6a5fd5549d.jpg)

文章详情页：展示哺乳动物科普内容，支持用户评论

![文章详情页：展示哺乳动物科普内容，支持用户评论](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/a216d08e-aa81-4b5f-8a99-3e52d56772c3.jpg)

每日一题页：展示每日科普选择题，支持切换上下题

![每日一题页：展示每日科普选择题，支持切换上下题](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/dea06f68-7296-40c1-8745-2a37e24235f3.jpg)

识别记录列表页：展示用户识别历史，支持筛选搜索识别记录

![识别记录列表页：展示用户识别历史，支持筛选搜索识别记录](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/51e99b4c-0b66-4d98-8fea-cdcb1fd714e8.jpg)

首页：展示各识别功能入口，可跳转对应功能

![首页：展示各识别功能入口，可跳转对应功能](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/29c4bad9-465e-4e19-84b0-3ee99731438e.jpg)

个人中心页：展示个人中心功能，可修改信息修改密码退出登录

![个人中心页：展示个人中心功能，可修改信息修改密码退出登录](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/6337ce29-172a-4028-867e-002beddeab25.jpg)

修改密码页：输入新旧密码，完成个人账号密码修改

![修改密码页：输入新旧密码，完成个人账号密码修改](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/966fa8a7-4548-4dcf-81a0-e85c08640923.jpg)


###### 管理后台

###### 管理员

- 管理员登录
- 用户管理
- 博物馆知识库管理
- 科普文章管理
- 题目管理
- 评论管理

##### 界面展示

登录页：管理员输入账号密码登录图片识别后台

![登录页：管理员输入账号密码登录图片识别后台](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/e5635dee-71a2-494d-8a99-f78c1fe90a0e.jpg)

用户管理页：展示系统用户列表，支持对用户进行管理操作

![用户管理页：展示系统用户列表，支持对用户进行管理操作](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/7604f361-aea2-4501-8a44-f3cab47b27ac.jpg)

知识分类管理页：管理科普知识分类，支持增删改操作

![知识分类管理页：管理科普知识分类，支持增删改操作](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/00063f95-1498-4c48-8c2e-d1dade239fa4.jpg)

博物馆知识库管理页：管理员管理博物馆知识库的科普物种条目

![博物馆知识库管理页：管理员管理博物馆知识库的科普物种条目](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/c72bfcee-244f-471f-8909-d7ec52418864.jpg)

博物馆知识库管理：修改博物馆知识库的科普条目信息

![博物馆知识库管理：修改博物馆知识库的科普条目信息](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/ab51184a-279c-4c89-8309-5eaa97d180c8.jpg)

科普文章管理：管理科普知识，支持搜索增删改操作

![科普文章管理：管理科普知识，支持搜索增删改操作](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/a0aa0ed5-9541-4983-829b-f98d35622980.jpg)

科普文章管理：编辑修改哺乳动物科普文章的相关信息

![科普文章管理：编辑修改哺乳动物科普文章的相关信息](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/0b7bb407-6df8-4651-83de-ef02946d0fa7.jpg)

题库管理页：展示题目列表，可对题目进行增删改操作

![题库管理页：展示题目列表，可对题目进行增删改操作](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/89324f71-e97a-4246-8824-fc9753736abc.jpg)

评价管理页：管理员查看和删除用户对科普内容的评价

![评价管理页：管理员查看和删除用户对科普内容的评价](https://code-graden-server-dev.oss-cn-beijing.aliyuncs.com/2026-05-07/4b218234-2b87-4e90-8748-ec78344b4f54.jpg)


## 五、主要业务流程

1. 用户在微信小程序中打开首页，选择动物识别或植物识别
2. 用户拍摄或上传图片，系统调用识别接口返回识别结果
3. 用户查看识别物品详情，系统自动将识别记录保存至博物馆
4. 用户可在博物馆中按名称或分类检索历史识别记录
5. 用户可浏览科普文章、查看文章详情并发表评论
6. 用户可在每日一题模块中答题，支持上一题和下一题切换
7. 用户在个人中心可修改个人信息
8. 管理员登录管理后台，对用户、博物馆知识库、科普文章、题目、评论进行管理

## 六、项目拓展性

未来可增加语音识别、视频科普、AR展示等功能，进一步提升用户体验。同时可接入更多图片识别模型，扩展识别范围至昆虫、矿物、建筑等类别。后台可增加数据分析模块，对用户识别行为和答题数据进行统计分析，辅助科普内容优化。

## 代码说明 
本仓库为项目的 **后端核心代码部分** 主要用于展示系统的业务设计思路与后端实现方式 出于学习展示与版权保护考虑 前端实现、完整数据库脚本及部署配置未在本仓库中公开 

##  项目交流 
本项目用于学习展示 如需项目完整功能演示、答辩说明或技术交流 请前往作者 GitHub 主页查看联系方式