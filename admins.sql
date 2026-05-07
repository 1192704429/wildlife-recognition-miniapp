/*
 Navicat Premium Data Transfer

 Source Server         : azhou
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : 20250404tpsb

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 06/05/2025 22:46:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(select)',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像(img)',
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', 'admin', NULL, 'admin', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评价内容',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `knowledge_id` bigint(20) NULL DEFAULT NULL COMMENT '文章ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `to_user_id` bigint(20) NULL DEFAULT NULL COMMENT '回复人编号',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级评论编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科普评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (14, '123', 10, 119, '2025-04-04 18:37:20', NULL, 0);
INSERT INTO `comment` VALUES (15, '666', 10, 119, '2025-04-04 18:37:25', NULL, 0);
INSERT INTO `comment` VALUES (16, '@用户-azhou 哈哈哈', 10, 119, '2025-04-04 18:38:06', NULL, 14);
INSERT INTO `comment` VALUES (17, '@用户-azhou 真nb', 10, 119, '2025-04-04 18:38:13', NULL, 15);

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '科普知识编号',
  `banner_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科普知识管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (119, 'https://picsum.photos/200/300', 1, '哺乳动物是一类恒温、有毛发、以乳腺哺育幼崽的脊椎动物。它们具有高度发达的神经系统和复杂的行为模式。', '介绍哺乳动物的基本特征', '2025-04-04 17:24:54', '哺乳动物的特征');
INSERT INTO `knowledge` VALUES (120, 'https://picsum.photos/200/300', 1, '大多数哺乳动物生活在陆地，但也有一些如海豚、鲸鱼等生活在海洋。它们适应了不同的生态环境。', '讲述哺乳动物的生活环境', '2025-04-04 17:24:54', '哺乳动物的生活环境');
INSERT INTO `knowledge` VALUES (121, 'https://picsum.photos/200/300', 1, '哺乳动物的繁殖方式多样，有胎生和卵胎生等。繁殖过程中，母体对幼崽的照顾非常重要。', '说明哺乳动物的繁殖方式', '2025-04-04 17:24:54', '哺乳动物的繁殖方式');
INSERT INTO `knowledge` VALUES (122, 'https://picsum.photos/200/300', 2, '鸟类具有羽毛、翅膀和坚硬的喙。羽毛不仅能帮助它们飞行，还能起到保暖和保护身体的作用。', '介绍鸟类的身体特征', '2025-04-04 17:24:54', '鸟类的身体特征');
INSERT INTO `knowledge` VALUES (123, 'https://picsum.photos/200/300', 2, '很多鸟类有迁徙的习性，它们会根据季节变化长途飞行寻找适宜的生存环境。', '讲述鸟类的迁徙习性', '2025-04-04 17:24:54', '鸟类的迁徙习性');
INSERT INTO `knowledge` VALUES (124, 'https://picsum.photos/200/300', 2, '鸟类的筑巢行为是一种本能，它们会用各种材料精心搭建巢穴来孵化和养育幼鸟。', '说明鸟类的筑巢行为', '2025-04-04 17:24:54', '鸟类的筑巢行为');
INSERT INTO `knowledge` VALUES (125, 'https://picsum.photos/200/300', 3, '昆虫是地球上数量最多的动物群体，它们具有三对足、两对翅（部分昆虫翅退化）和一对触角。', '介绍昆虫的基本特征', '2025-04-04 17:24:54', '昆虫的基本特征');
INSERT INTO `knowledge` VALUES (126, 'https://picsum.photos/200/300', 3, '一些昆虫如蜜蜂、蝴蝶等在花粉传播中起着重要作用，对生态系统的平衡和植物的繁殖至关重要。', '讲述昆虫在生态系统中的作用', '2025-04-04 17:24:54', '昆虫在生态系统中的作用');
INSERT INTO `knowledge` VALUES (127, 'https://picsum.photos/200/300', 3, '昆虫的变态发育分为完全变态和不完全变态两种类型，不同类型的发育过程有很大差异。', '说明昆虫的变态发育', '2025-04-04 17:24:54', '昆虫的变态发育');
INSERT INTO `knowledge` VALUES (128, 'https://picsum.photos/200/300', 4, '花卉是具有观赏价值的草本植物，它们的花色、花形和花香各不相同，为人们带来美的享受。', '介绍花卉的基本概念', '2025-04-04 17:24:54', '花卉的基本概念');
INSERT INTO `knowledge` VALUES (129, 'https://picsum.photos/200/300', 4, '不同花卉对光照、温度和水分的要求不同，正确的养护方法能让花卉生长得更加茂盛。', '讲述花卉的养护要点', '2025-04-04 17:24:54', '花卉的养护要点');
INSERT INTO `knowledge` VALUES (130, 'https://picsum.photos/200/300', 4, '花卉在文化和艺术中具有重要的象征意义，如玫瑰象征爱情，百合象征纯洁。', '说明花卉的文化象征意义', '2025-04-04 17:24:54', '花卉的文化象征意义');
INSERT INTO `knowledge` VALUES (131, 'https://picsum.photos/200/300', 5, '树木是高大的木本植物，它们能吸收二氧化碳，释放氧气，对改善环境质量起着重要作用。', '介绍树木的基本作用', '2025-04-04 17:24:54', '树木的基本作用');
INSERT INTO `knowledge` VALUES (132, 'https://picsum.photos/200/300', 5, '不同种类的树木有不同的生长习性和寿命，一些古树甚至能存活数百年。', '讲述树木的生长习性和寿命', '2025-04-04 17:24:54', '树木的生长习性和寿命');
INSERT INTO `knowledge` VALUES (133, 'https://picsum.photos/200/300', 5, '树木的木材具有广泛的用途，可用于建筑、家具制作等领域。', '说明树木木材的用途', '2025-04-04 17:24:54', '树木木材的用途');

-- ----------------------------
-- Table structure for museum
-- ----------------------------
DROP TABLE IF EXISTS `museum`;
CREATE TABLE `museum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `type` int(11) NULL DEFAULT NULL COMMENT '分类[0:动物,1:植物]',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '上传用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态[0:下架,1:上架]',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片数组',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度百科URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博物馆管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of museum
-- ----------------------------
INSERT INTO `museum` VALUES (2, '月季花', '月季花（Rosa chinensis Jacq.）是蔷薇科属的常绿、半常绿低矮灌木。叶子为羽状复叶，表面深绿有光泽而叶背青白，且无毛面具有小托叶。花分单瓣和重瓣，重瓣色为深红且略似玫瑰。花色以红色为主，其他有白、黄、粉红、玫瑰红等。蔷薇果卵圆形或梨形，熟时红色。自然花期4月-9月。月季花，以一年四季不分春、夏、秋、冬皆能见花而得名，又以其每月近乎开花一次而得名“月月红”“长春花”。中国是月季花的原产地之一，在中国主要分布于湖北、四川和甘肃等省的山区。月季花适应性强，耐寒、耐旱，对土壤要求不严格，但以富含有机质、排水良好的微带酸性沙壤土最好。喜欢阳光充足，温暖湿润的气候，一般22~25℃为花生长的最适宜温度。月季花可利用播种与扦插进行栽培繁殖。月季花的药用价植最早载于李时珍的《本草纲目》，他认为月季花具有“活血、消肿、傅毒”的功效，由于其活血化疲之功尤佳，故为妇科良药。月季栽培历史悠久，文化', 'http://localhost:8092/file/3c9f3142-bb24-4d4a-b0d1-25c9afb18782.jpg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/%E6%9C%88%E5%AD%A3%E8%8A%B1/14505544');
INSERT INTO `museum` VALUES (4, '东北虎', '东北虎是现存体重最大的猫科亚种之一，分布于亚洲东北部。', 'http://localhost:8092/file/8a5ccd21-5544-4c86-b317-c52bf5f8f36e.jpg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/东北虎');
INSERT INTO `museum` VALUES (5, '银杏树', '银杏树是一种古老的树种，有“活化石”之称。', 'http://localhost:8092/file/cfde3fe8-12a8-478f-a4e8-69d291e68752.jpg', 1, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/银杏树');
INSERT INTO `museum` VALUES (6, '海豚', '海豚是一种非常聪明的海洋哺乳动物，具有出色的沟通能力。', 'http://localhost:8092/file/7f14c973-43a2-42ca-93c9-7575a8a30001.jpg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/海豚');
INSERT INTO `museum` VALUES (7, '仙人掌', '仙人掌具有很强的耐旱能力，多生长在沙漠等干旱地区。', 'http://localhost:8092/file/42a55d8b-57fc-4933-b38f-b304a6b8d459.jpg', 1, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/仙人掌');
INSERT INTO `museum` VALUES (8, '大熊猫', '大熊猫是中国特有的珍稀动物，以竹子为主要食物。', 'http://localhost:8092/file/d2110c92-41d3-45b4-892e-94114bb1a8c1.jpg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/大熊猫');
INSERT INTO `museum` VALUES (9, '玫瑰', '玫瑰是一种常见的花卉，常被用于表达爱情。', 'http://localhost:8092/file/8cdda12f-72bf-45ae-bc01-dd59f8d7abbf.jpg', 1, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/玫瑰');
INSERT INTO `museum` VALUES (10, '孔雀', '孔雀以其美丽的尾羽而闻名，雄性孔雀在求偶时会展开尾羽。', 'http://localhost:8092/file/d5e7bb69-7a60-416e-9d84-726e2ca50eb6.jpeg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/孔雀');
INSERT INTO `museum` VALUES (11, '郁金香', '郁金香是荷兰的国花，有多种颜色和品种。', 'http://localhost:8092/file/37392adc-f2d3-4806-9ef1-82a5f7aebf5f.jpeg', 1, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/郁金香');
INSERT INTO `museum` VALUES (12, '袋鼠', '袋鼠是澳大利亚特有的有袋类动物，善于跳跃。', 'http://localhost:8092/file/de7c2d38-a8ad-4bb2-b7f9-0813bfcce380.jpg', 0, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/袋鼠');
INSERT INTO `museum` VALUES (13, '松树', '松树是常见的针叶树，具有耐寒、耐旱等特点。', 'http://localhost:8092/file/9a4c8b0b-d579-4ee7-9199-4acd77dfd7b0.jpeg', 1, 10, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/松树');
INSERT INTO `museum` VALUES (14, '猫头鹰', '猫头鹰是夜行性猛禽，具有出色的听力和视力。', 'http://localhost:8092/file/084f1ff8-a9ac-4440-b58d-a82bb32439f6.jpg', 0, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/猫头鹰');
INSERT INTO `museum` VALUES (15, '荷花', '荷花是水生植物，花朵美丽，具有较高的观赏价值。', 'http://localhost:8092/file/459c967f-373b-48c6-8b32-c25ff1fb03da.jpg', 1, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/荷花');
INSERT INTO `museum` VALUES (16, '长颈鹿', '长颈鹿是世界上现存最高的陆生动物，以树叶为食。', 'http://localhost:8092/file/08605920-2c7c-4d6b-a22b-9fb6139f146d.jpg', 0, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/长颈鹿');
INSERT INTO `museum` VALUES (17, '竹子', '竹子是一种常见的植物，生长迅速，用途广泛。', 'http://localhost:8092/file/4d7d36c9-8dad-45e7-8b7f-eafcae28e58b.jpeg', 1, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/竹子');
INSERT INTO `museum` VALUES (18, '猴子', '猴子是灵长目动物，具有聪明的头脑和灵活的身手。', 'http://localhost:8092/file/defc3f8a-865a-4337-83eb-2969637ab398.jpg', 0, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/猴子');
INSERT INTO `museum` VALUES (19, '牡丹', '牡丹是中国传统名花，有“花中之王”的美称。', 'http://localhost:8092/file/0a126984-25f1-4089-b0a2-c483eb6c083f.jpeg', 1, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/牡丹');
INSERT INTO `museum` VALUES (20, '大象', '大象是陆地上最大的哺乳动物，具有很强的记忆力。', 'http://localhost:8092/file/27d921ca-989a-404e-8c1d-b8b7f99b080e.jpeg', 0, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/大象');
INSERT INTO `museum` VALUES (21, '向日葵', '向日葵会随着太阳的方向转动，其种子可食用。', 'http://localhost:8092/file/bcc1a1c4-48d4-4d73-85a4-c8856b6da9d9.jpeg', 1, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/向日葵');
INSERT INTO `museum` VALUES (22, '狮子', '狮子是一种大型猫科动物，是草原上的顶级掠食者。', 'http://localhost:8092/file/d76a7ef1-b193-4a7b-a546-8f7a503f8cc8.jpeg', 0, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/狮子');
INSERT INTO `museum` VALUES (23, '梅花', '梅花在冬季开放，具有高洁、坚韧的象征意义。', 'http://localhost:8092/file/a6bc829f-20c6-48bb-9b47-2350d5bad914.jpg', 1, 11, '2025-04-05 17:34:00', 1, '', 'https://baike.baidu.com/item/梅花');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '题目编号',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `answer_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案A',
  `answer_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案B',
  `answer_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案C',
  `answer_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案D',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态[0:隐藏,1:正常]',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日一题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 'https://picsum.photos/200/300', '以下哪种植物是多肉植物？', '仙人掌', '绿萝', '吊兰', '君子兰', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (2, 'https://picsum.photos/200/300', '被称为“活化石”的植物是？', '银杏', '松树', '柏树', '柳树', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (3, 'https://picsum.photos/200/300', '以下哪种花是春天开放的？', '菊花', '梅花', '桃花', '荷花', 'C', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (4, 'https://picsum.photos/200/300', '哪种植物可以吸收甲醛？', '仙人掌', '芦荟', '郁金香', '风信子', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (5, 'https://picsum.photos/200/300', '以下哪种是攀援植物？', '玫瑰', '葡萄', '牡丹', '芍药', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (6, 'https://picsum.photos/200/300', '哪种植物的果实是坚果？', '草莓', '核桃', '香蕉', '橙子', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (7, 'https://picsum.photos/200/300', '以下哪种植物是水生植物？', '仙人掌', '睡莲', '月季', '茉莉', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (8, 'https://picsum.photos/200/300', '哪种植物的叶子是针状的？', '榕树', '松树', '枫树', '杨树', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (9, 'https://picsum.photos/200/300', '以下哪种花有浓郁的香气？', '仙人掌花', '栀子花', '仙人球花', '蟹爪兰花', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (10, 'https://picsum.photos/200/300', '哪种植物是世界上最大的花？', '玫瑰', '大王花', '牡丹', '百合', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (11, 'https://picsum.photos/200/300', '以下哪种动物是夜行性动物？', '鸡', '猫头鹰', '鸽子', '鸭子', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (12, 'https://picsum.photos/200/300', '被称为“森林医生”的动物是？', '啄木鸟', '喜鹊', '乌鸦', '麻雀', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (13, 'https://picsum.photos/200/300', '以下哪种动物是两栖动物？', '乌龟', '青蛙', '蛇', '蜥蜴', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (14, 'https://picsum.photos/200/300', '哪种动物是群居动物？', '老虎', '狮子', '豹子', '猎豹', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (15, 'https://picsum.photos/200/300', '以下哪种动物会冬眠？', '兔子', '熊', '狗', '猫', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (16, 'https://picsum.photos/200/300', '哪种动物是海洋中的哺乳动物？', '鲨鱼', '海豚', '章鱼', '海星', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (17, 'https://picsum.photos/200/300', '以下哪种动物是昆虫？', '蜘蛛', '蝴蝶', '蝎子', '蜈蚣', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (18, 'https://picsum.photos/200/300', '哪种动物是澳大利亚的特有动物？', '袋鼠', '长颈鹿', '大象', '河马', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (19, 'https://picsum.photos/200/300', '以下哪种动物是草食性动物？', '狼', '牛', '狐狸', '老鹰', 'B', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (20, 'https://picsum.photos/200/300', '哪种动物会学人说话？', '鹦鹉', '八哥', '鹩哥', '以上都是', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (21, 'https://picsum.photos/200/300', '以下哪种动植物组合是共生关系？', '鳄鱼和牙签鸟', '猫和老鼠', '人与宠物狗', '蛇和青蛙', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (22, 'https://picsum.photos/200/300', '以下哪种植物是动物爱吃的食物？', '胡萝卜（兔子）', '仙人掌（猴子）', '玫瑰（牛）', '郁金香（鸟）', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (23, 'https://picsum.photos/200/300', '哪种动物会在植物上产卵？', '蝴蝶（叶子上）', '鱼（水草上）', '鸟（树枝上）', '以上都对', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (24, 'https://picsum.photos/200/300', '以下哪种植物可以吸引特定动物？', '捕蝇草（苍蝇）', '夜来香（蜜蜂）', '紫罗兰（蝴蝶）', '含羞草（鸟）', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (25, 'https://picsum.photos/200/300', '哪种动物会破坏植物？', '蝗虫（庄稼）', '松鼠（坚果）', '蜜蜂（花蜜）', '啄木鸟（树木）', 'A', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (26, 'https://picsum.photos/200/300', '以下哪种动植物搭配会形成生态链？', '草 - 兔子 - 狼', '花 - 蝴蝶 - 青蛙', '树 - 鸟 - 蛇', '以上都是', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (27, 'https://picsum.photos/200/300', '哪种植物为动物提供栖息地？', '森林（多种动物）', '仙人掌（沙漠动物）', '芦苇（水鸟）', '以上都对', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (28, 'https://picsum.photos/200/300', '以下哪种动物会帮助植物传播种子？', '松鼠（埋藏坚果）', '鸟（吞食果实）', '蜜蜂（携带花粉）', '以上都是', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (29, 'https://picsum.photos/200/300', '哪种植物和动物的颜色相似起到保护作用？', '竹节虫（竹子）', '枯叶蝶（枯叶）', '变色龙（环境）', '以上都是', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (30, 'https://picsum.photos/200/300', '以下哪种动植物组合会相互影响生存？', '珊瑚礁和小丑鱼', '草原和牛羊', '湿地和水鸟', '以上都是', 'D', 1, '2025-04-04 17:28:36');
INSERT INTO `question` VALUES (31, 'https://picsum.photos/200/300', '以下哪种植物是多肉植物？', '仙人掌', '绿萝', '吊兰', '君子兰', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (32, 'https://picsum.photos/200/300', '被称为“活化石”的植物是？', '银杏', '松树', '柏树', '柳树', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (33, 'https://picsum.photos/200/300', '以下哪种花是春天开放的？', '菊花', '梅花', '桃花', '荷花', 'C', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (34, 'https://picsum.photos/200/300', '哪种植物可以吸收甲醛？', '仙人掌', '芦荟', '郁金香', '风信子', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (35, 'https://picsum.photos/200/300', '以下哪种是攀援植物？', '玫瑰', '葡萄', '牡丹', '芍药', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (36, 'https://picsum.photos/200/300', '哪种植物的果实是坚果？', '草莓', '核桃', '香蕉', '橙子', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (37, 'https://picsum.photos/200/300', '以下哪种植物是水生植物？', '仙人掌', '睡莲', '月季', '茉莉', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (38, 'https://picsum.photos/200/300', '哪种植物的叶子是针状的？', '榕树', '松树', '枫树', '杨树', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (39, 'https://picsum.photos/200/300', '以下哪种花有浓郁的香气？', '仙人掌花', '栀子花', '仙人球花', '蟹爪兰花', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (40, 'https://picsum.photos/200/300', '哪种植物是世界上最大的花？', '玫瑰', '大王花', '牡丹', '百合', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (41, 'https://picsum.photos/200/300', '以下哪种动物是夜行性动物？', '鸡', '猫头鹰', '鸽子', '鸭子', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (42, 'https://picsum.photos/200/300', '被称为“森林医生”的动物是？', '啄木鸟', '喜鹊', '乌鸦', '麻雀', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (43, 'https://picsum.photos/200/300', '以下哪种动物是两栖动物？', '乌龟', '青蛙', '蛇', '蜥蜴', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (44, 'https://picsum.photos/200/300', '哪种动物是群居动物？', '老虎', '狮子', '豹子', '猎豹', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (45, 'https://picsum.photos/200/300', '以下哪种动物会冬眠？', '兔子', '熊', '狗', '猫', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (46, 'https://picsum.photos/200/300', '哪种动物是海洋中的哺乳动物？', '鲨鱼', '海豚', '章鱼', '海星', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (47, 'https://picsum.photos/200/300', '以下哪种动物是昆虫？', '蜘蛛', '蝴蝶', '蝎子', '蜈蚣', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (48, 'https://picsum.photos/200/300', '哪种动物是澳大利亚的特有动物？', '袋鼠', '长颈鹿', '大象', '河马', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (49, 'https://picsum.photos/200/300', '以下哪种动物是草食性动物？', '狼', '牛', '狐狸', '老鹰', 'B', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (50, 'https://picsum.photos/200/300', '哪种动物会学人说话？', '鹦鹉', '八哥', '鹩哥', '以上都是', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (51, 'https://picsum.photos/200/300', '以下哪种动植物组合是共生关系？', '鳄鱼和牙签鸟', '猫和老鼠', '人与宠物狗', '蛇和青蛙', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (52, 'https://picsum.photos/200/300', '以下哪种植物是动物爱吃的食物？', '胡萝卜（兔子）', '仙人掌（猴子）', '玫瑰（牛）', '郁金香（鸟）', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (53, 'https://picsum.photos/200/300', '哪种动物会在植物上产卵？', '蝴蝶（叶子上）', '鱼（水草上）', '鸟（树枝上）', '以上都对', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (54, 'https://picsum.photos/200/300', '以下哪种植物可以吸引特定动物？', '捕蝇草（苍蝇）', '夜来香（蜜蜂）', '紫罗兰（蝴蝶）', '含羞草（鸟）', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (55, 'https://picsum.photos/200/300', '哪种动物会破坏植物？', '蝗虫（庄稼）', '松鼠（坚果）', '蜜蜂（花蜜）', '啄木鸟（树木）', 'A', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (56, 'https://picsum.photos/200/300', '以下哪种动植物搭配会形成生态链？', '草 - 兔子 - 狼', '花 - 蝴蝶 - 青蛙', '树 - 鸟 - 蛇', '以上都是', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (57, 'https://picsum.photos/200/300', '哪种植物为动物提供栖息地？', '森林（多种动物）', '仙人掌（沙漠动物）', '芦苇（水鸟）', '以上都对', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (58, 'https://picsum.photos/200/300', '以下哪种动物会帮助植物传播种子？', '松鼠（埋藏坚果）', '鸟（吞食果实）', '蜜蜂（携带花粉）', '以上都是', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (59, 'https://picsum.photos/200/300', '哪种植物和动物的颜色相似起到保护作用？', '竹节虫（竹子）', '枯叶蝶（枯叶）', '变色龙（环境）', '以上都是', 'D', 1, '2025-04-04 18:11:14');
INSERT INTO `question` VALUES (60, 'https://picsum.photos/200/300', '以下哪种动植物组合会相互影响生存？', '珊瑚礁和小丑鱼', '草原和牛羊', '湿地和水鸟', '以上都是', 'D', 1, '2025-04-04 18:11:14');

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科普知识分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '哺乳动物科普', '2025-04-04 17:23:38');
INSERT INTO `types` VALUES (2, '鸟类科普', '2025-04-04 17:23:38');
INSERT INTO `types` VALUES (3, '昆虫科普', '2025-04-04 17:23:38');
INSERT INTO `types` VALUES (4, '花卉科普', '2025-04-04 17:23:38');
INSERT INTO `types` VALUES (5, '树木科普', '2025-04-04 17:23:38');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (10, 'azhou', 'azhou', '用户-azhou', 'http://localhost:8092/file/4299fbb9-9435-461b-b307-4f3fb6dbf9a4.jpg', '2025-04-04 17:44:45');
INSERT INTO `users` VALUES (11, 'anneg', 'aneng', 'aneng', 'http://localhost:8092/file/ec3b7896-41d2-4502-a2e4-970106ba311a.jpg', '2025-04-05 17:53:04');

SET FOREIGN_KEY_CHECKS = 1;
