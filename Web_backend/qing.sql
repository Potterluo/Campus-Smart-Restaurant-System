/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : qing

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 10/05/2022 09:10:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '青哥哥的文章标题', '# 我是青哥哥\n## 我是青哥哥2号\n\n::: hljs-center\n\n***++~~==我是那个哥哥==~~++***\n\n:::\n\n> 我是青哥哥的引用\n\n我是B站：程序员青戈\n\n[百度](https://www.baidu.com)\n\n```java\nclass Hello {\n  public static void main(String[] args) {\n    System.out.pringln(\"Hello 青哥哥\");\n  }\n}\n\n```\n\n![搜狗截图20220129174103.png](http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png)\n\n\n', '程序员青戈', '2022-03-22 19:22:58');
INSERT INTO `article` VALUES (2, '青哥哥文章2号', '青哥哥文章2号\n\n青哥哥文章2号\n\n青哥哥文章2号\n\n![QQ图片20220307194920.png](http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png)', '程序员青戈', '2022-03-22 19:22:58');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `score` int(11) NULL DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('1', '1', '2022-05-07 14:20:30', NULL, NULL, '已完成', NULL);
INSERT INTO `form` VALUES ('1522821267198169090', '梦飞幻翼', '2022-05-07 14:16:05', '河南郑州', '测试', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522821754714705922', '梦飞幻翼', '2022-05-07 14:16:03', '河南郑州', '1312421', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522821992296861697', '梦飞幻翼', '2022-05-07 14:16:01', '河南郑州', '我3', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522822474234974210', '梦飞幻翼', '2022-05-07 14:15:54', '河南郑州', '鸡蛋*19', '已完成', '餐厅配送');
INSERT INTO `form` VALUES ('1522822955464249346', '梦飞幻翼', '2022-05-07 14:18:55', '河南郑州', '他但', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522823464619200514', '梦飞幻翼', '2022-05-07 14:19:47', '河南郑州', '12412', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522825556796755969', '王定山', '2022-05-07 15:18:22', '美食广场一号窗口', '面粉*19Kg', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522830058803286018', '王定山', '2022-05-07 15:18:23', '美食广场一号窗口', '面粉*19Kg', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522838125787860993', '王定山', '2022-05-07 15:18:24', '美食广场一号窗口', '西红柿*3', '已完成', '餐厅配送');
INSERT INTO `form` VALUES ('1522838144146329602', '王定山', '2022-05-08 09:36:59', '美食广场一号窗口', '西红柿*3', '已完成', '餐厅配送');
INSERT INTO `form` VALUES ('1522838537966309377', '王定山', '2022-05-08 09:36:59', '美食广场一号窗口', '土豆*3', '已完成', '餐厅配送');
INSERT INTO `form` VALUES ('1522838584762159105', '王定山', '2022-05-08 09:36:57', '美食广场一号窗口', '土豆*3', '已完成', '餐厅配送');
INSERT INTO `form` VALUES ('1522838743613034498', '王定山', '2022-05-07 19:18:21', '美食广场一号窗口', '盐*8袋', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522849675210694658', '王定山', '2022-05-07 16:04:17', '美食广场一号窗口', '黄瓜*9', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522897897782362113', '王定山', '2022-05-07 19:15:19', '美食广场1号窗口', '馒头', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522898503582466050', '王定山', '2022-05-07 19:18:19', '美食广场1号窗口', '西瓜', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522900150454960130', '王定山', '2022-05-08 09:36:52', '美食广场1号窗口', '21412412', '已完成', '个人取货');
INSERT INTO `form` VALUES ('1522903229459968002', '王定山', '2022-05-07 19:36:47', '美食广场1号窗口', '青菜', '已完成', '个人取货');
INSERT INTO `form` VALUES ('PS20220405985', '王定山', '2022-04-05 00:00:00', '学生三餐厅9号窗口', '大米*3；火腿肠*2；食用油*1', '已完成', NULL);
INSERT INTO `form` VALUES ('PS20220501211', '刘大鹅', '2022-04-29 15:49:07', '学生二餐厅6号窗口', '面条*1', '已完成', NULL);
INSERT INTO `form` VALUES ('PS20220505675', '何小疯', '2022-05-05 20:47:50', '美食广场1号窗口', '土豆*1', '已完成', NULL);
INSERT INTO `form` VALUES ('PS20220505891', '孙悟空', '2022-05-05 15:33:33', '学生一餐厅三好窗口', '面条*5；土豆*5；西红柿*3', '已完成', NULL);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (28, 1);
INSERT INTO `student_course` VALUES (28, 2);

-- ----------------------------
-- Table structure for sys_device
-- ----------------------------
DROP TABLE IF EXISTS `sys_device`;
CREATE TABLE `sys_device`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_device
-- ----------------------------
INSERT INTO `sys_device` VALUES ('1', '餐车1', '未消毒');
INSERT INTO `sys_device` VALUES ('2', '餐车2', '未消毒');
INSERT INTO `sys_device` VALUES ('3', '筷车1', '未消毒');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');
INSERT INTO `sys_dict` VALUES ('eleme', 'el-icon-platform-eleme', 'icon');
INSERT INTO `sys_dict` VALUES ('shome', 'el-icon-s-home\r\nel-icon-s-home\r\nel-icon-s-home\r\nel-icon-s-home', 'icon');
INSERT INTO `sys_dict` VALUES ('stenv', 'el-icon-film', 'icon');
INSERT INTO `sys_dict` VALUES ('stock', 'el-icon-school', 'icon');
INSERT INTO `sys_dict` VALUES ('form1', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` VALUES ('eleme', 'el-icon-eleme', 'icon');
INSERT INTO `sys_dict` VALUES ('s-tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` VALUES ('star', 'el-icon-star-off', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-help', 'el-icon-help', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-message-solid', 'el-icon-message-solid', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-s-ticket', 'el-icon-s-ticket', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-s-open', 'el-icon-s-open', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-s-operation', 'el-icon-s-operation', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-view', 'el-icon-view', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-folder-opened', 'el-icon-folder-opened', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-paperclip', 'el-icon-paperclip', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-data-analysis', 'el-icon-data-analysis', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-notebook-2\r\nel-icon-notebook-2\r\nel-icon-notebook-2\r\nel-icon-notebook-2', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-toilet-paper', 'el-icon-toilet-paper', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-bank-card', 'el-icon-bank-card', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-set-up', 'el-icon-set-up', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-chat-line-square', 'el-icon-chat-line-square', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-odometer', 'el-icon-odometer', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-medal', 'el-icon-medal', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-alarm-clock', 'el-icon-alarm-clock', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-light-rain', 'el-icon-light-rain', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-sugar', 'el-icon-sugar', 'icon');
INSERT INTO `sys_dict` VALUES ('el-icon-s-cooperation', 'el-icon-s-cooperation', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (17, '649002da71c8473db39892b4a758f875.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 0);
INSERT INTO `sys_file` VALUES (18, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 0);
INSERT INTO `sys_file` VALUES (19, 'Java3年经验开发个人简历模板.doc', 'doc', 47, 'http://localhost:9090/file/0e020e1337474a93ba3b43a75b2890ee.doc', '9ace4fac24420f85c753aa663009edb4', 1, 1);
INSERT INTO `sys_file` VALUES (20, '1626102561055-2.jpg', 'jpg', 24, 'http://localhost:9090/file/cd379f381364482aaad0d6ffb7209d3d.jpg', 'adb0481b283645af3809e3d8a1bdb294', 1, 1);
INSERT INTO `sys_file` VALUES (21, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 1, 1);
INSERT INTO `sys_file` VALUES (22, '1622536738094-7.jpg', 'jpg', 12, 'http://localhost:9090/file/ad5946fe27c14508ac796115f6465826.jpg', '35977e7dc2159a734f3c81de460e4b8d', 1, 1);
INSERT INTO `sys_file` VALUES (23, '用户信息 (1).xlsx', 'xlsx', 3, 'http://localhost:9090/file/02f70e07e69045c38b4748283ffeeabb.xlsx', '687f150737c967e74cfd6fa9ec981589', 1, 1);
INSERT INTO `sys_file` VALUES (24, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 1);
INSERT INTO `sys_file` VALUES (25, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 1);
INSERT INTO `sys_file` VALUES (26, '6.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 1, 1);
INSERT INTO `sys_file` VALUES (27, '9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 1, 1);
INSERT INTO `sys_file` VALUES (28, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 1, 1);
INSERT INTO `sys_file` VALUES (29, '1641024983532cf (1).png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 1, 1);
INSERT INTO `sys_file` VALUES (30, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 1, 1);
INSERT INTO `sys_file` VALUES (31, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 1, 1);
INSERT INTO `sys_file` VALUES (32, 'boot.jpg', 'jpg', 11, 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', 1, 1);
INSERT INTO `sys_file` VALUES (33, 'QQ图片20210828212629.gif', 'gif', 188, 'http://localhost:9090/file/e5512c68a5614135a12064afa66c67e5.gif', 'ce524058758a83c046b97c66ddcb8a83', 1, 1);
INSERT INTO `sys_file` VALUES (34, 'vite.jpg', 'jpg', 27, 'http://localhost:9090/file/782f20b37b8b4a158c5e13a07fe826d5.jpg', 'c67bab9c32968cd0cda3e1608286b0d9', 1, 1);
INSERT INTO `sys_file` VALUES (35, 'mp.jpg', 'jpg', 32, 'http://localhost:9090/file/650e8330e78b4fed8fb0c1d866684b5d.jpg', 'cb887a9d64563352edce80cf50296cc5', 1, 1);
INSERT INTO `sys_file` VALUES (36, 'qq音乐.png', 'png', 445, 'http://localhost:9090/file/461504596ec040729776b674ddec88d3.png', '793fd534fa705475eb3358f68c87ec68', 1, 1);
INSERT INTO `sys_file` VALUES (37, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 1, 1);
INSERT INTO `sys_file` VALUES (38, 'boot.jpg', 'jpg', 11, 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', 1, 1);
INSERT INTO `sys_file` VALUES (39, 'QQ截图20211214232106.jpg', 'jpg', 30, 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', 1, 0);
INSERT INTO `sys_file` VALUES (40, 'v1.mp4', 'mp4', 47484, 'http://localhost:9090/file/a22c9d62ef0648db86b9766bb14d742a.mp4', '3dda54bc1a07bd9112bfb381c20b4867', 1, 1);
INSERT INTO `sys_file` VALUES (41, '搜狗截图20220129174103.png', 'png', 56, 'http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png', '050df6119399582fda666834870608d7', 1, 1);
INSERT INTO `sys_file` VALUES (42, 'QQ图片20220307194920.png', 'png', 100, 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', 1, 1);
INSERT INTO `sys_file` VALUES (43, 'QQ图片20220307194920.png', 'png', 100, 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', 1, 1);
INSERT INTO `sys_file` VALUES (44, 'a202c44c2075478dbfac39baeb800046.png', 'png', 1562, 'http://localhost:9090/file/fd34fc70d3aa4620a75e2581d831f931.png', 'd266c4a87c29396fe7fc417cff63212a', 1, 1);
INSERT INTO `sys_file` VALUES (45, 'a202c44c2075478dbfac39baeb800046.png', 'png', 1562, 'http://localhost:9090/file/fd34fc70d3aa4620a75e2581d831f931.png', 'd266c4a87c29396fe7fc417cff63212a', 1, 1);
INSERT INTO `sys_file` VALUES (46, '001.jpg', 'jpg', 193, 'http://localhost:9090/file/2aa17d64feba46e3a3e1db1f0388d4cf.jpg', '7ac6e816a6af152bc93da784a421d0a6', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-tools', NULL, NULL, NULL, 600);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 601);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-document', NULL, 4, 'Role', 602);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-star-off', NULL, 4, 'Menu', 603);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-platform-eleme', '', NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (43, '仓储物资管理', NULL, 'el-icon-s-home\r\nel-icon-s-home\r\nel-icon-s-home\r\nel-icon-s-home', NULL, NULL, NULL, 200);
INSERT INTO `sys_menu` VALUES (44, '餐厅环境监测', '/stenv', 'el-icon-film', NULL, 43, 'Stenv', 201);
INSERT INTO `sys_menu` VALUES (45, '仓储物资管理', '/stock', 'el-icon-school', NULL, 43, 'Stock', 202);
INSERT INTO `sys_menu` VALUES (46, '商铺订单管理', '/form', 'el-icon-shopping-cart-2', NULL, 43, 'Form', 203);
INSERT INTO `sys_menu` VALUES (51, '餐厅环境监测', NULL, 'el-icon-odometer', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (52, '餐厅设备管理', '/device', 'el-icon-s-operation', NULL, 51, 'Device', 302);
INSERT INTO `sys_menu` VALUES (53, '餐厅环境信息', '/env', 'el-icon-film', NULL, 51, 'Env', 301);
INSERT INTO `sys_menu` VALUES (54, '商铺订单提交', '/submitform', 'el-icon-help', NULL, 43, 'SubmitForm', 204);
INSERT INTO `sys_menu` VALUES (55, '餐厅营业额数据', NULL, 'el-icon-s-marketing', NULL, NULL, NULL, 100);
INSERT INTO `sys_menu` VALUES (56, '餐厅营业数据', '/allorder', 'el-icon-document', NULL, 55, 'AllOrders', 101);
INSERT INTO `sys_menu` VALUES (57, '商铺营业额数据', '/order', 'el-icon-shopping-cart-2', NULL, 55, 'Order', 102);
INSERT INTO `sys_menu` VALUES (58, '学生下单界面', '/submitorder', 'el-icon-coffee\r\n', NULL, 55, 'SubmitOrder', 103);
INSERT INTO `sys_menu` VALUES (59, '疫情防控专区', NULL, 'el-icon-message-solid', NULL, NULL, NULL, 400);
INSERT INTO `sys_menu` VALUES (60, '餐厅测温记录', '/bodytemp', 'el-icon-coffee\r\n', NULL, 59, 'BodyTemp', 401);
INSERT INTO `sys_menu` VALUES (61, '设备消毒状态', '/infect', 'el-icon-film', NULL, 59, 'Infect', 402);
INSERT INTO `sys_menu` VALUES (62, '设备消毒记录', '/notes', 'el-icon-document', NULL, 59, 'Notes', 403);
INSERT INTO `sys_menu` VALUES (63, '餐厅安保监控', '/video', 'el-icon-view', NULL, 51, 'Video', 303);

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remakes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `diets` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES ('1', '2022-05-07 00:00:00', '学生一餐厅8号窗口', '8.3', '张三', '正常', '套餐');
INSERT INTO `sys_order` VALUES ('1522893649191424001', NULL, '', '', '', '正常', '');
INSERT INTO `sys_order` VALUES ('1522893874006118402', NULL, '美食广场1号窗口', '8', '', '正常', '担担面');
INSERT INTO `sys_order` VALUES ('1522894490233262081', NULL, '美食广场1号窗口', '9', '赵四', '正常', '炒面');
INSERT INTO `sys_order` VALUES ('1522895243970662401', NULL, '美食广场1号窗口', '12', '马六', '正常', '麻辣烫');
INSERT INTO `sys_order` VALUES ('1522897704546582529', NULL, '美食广场1号窗口', '1222', '马六', '正常', '麻辣烫');
INSERT INTO `sys_order` VALUES ('1522897744031760386', NULL, '美食广场1号窗口', '1222', '马六', '正常', '麻辣烫');
INSERT INTO `sys_order` VALUES ('1522897760662175745', NULL, '美食广场1号窗口', '23112332', '马六', '正常', '麻辣烫');
INSERT INTO `sys_order` VALUES ('1522898136194990081', NULL, '', '66', '', '正常', '');
INSERT INTO `sys_order` VALUES ('1522898274296643586', NULL, '美食广场1号窗口', '66', '张麻子', '正常', '小炒肉');
INSERT INTO `sys_order` VALUES ('1522899778655076353', NULL, '美食广场1号窗口', '9', '黄老爷', '正常', '大腿');
INSERT INTO `sys_order` VALUES ('1522900742376112129', NULL, '美食广场1号窗口', '12', '叶枫', '正常', '炒米');
INSERT INTO `sys_order` VALUES ('1522900996026646530', NULL, '', '', '', '正常', '');
INSERT INTO `sys_order` VALUES ('1522901019594440706', NULL, '', '', '', '正常', '');
INSERT INTO `sys_order` VALUES ('1522901316781850625', NULL, '', '', '', '正常', '');
INSERT INTO `sys_order` VALUES ('1522901440530595842', '2022-05-07 19:29:42', '', '', '黄', '正常', '');
INSERT INTO `sys_order` VALUES ('1522901803274977281', NULL, '', '', '张五', '正常', '');
INSERT INTO `sys_order` VALUES ('1522902831747674113', '2022-05-07 19:35:03', '', '', '张十', '正常', '');
INSERT INTO `sys_order` VALUES ('1522903375606296577', '2022-05-07 19:37:13', '美食广场1号窗口', '20', '卢浩宇', '正常', '答辩');
INSERT INTO `sys_order` VALUES ('2', '2022-05-07 00:00:00', '美食广场1号窗口', '9.0', '李四', '异常订单', '木须肉');
INSERT INTO `sys_order` VALUES ('3', '2022-05-07 00:00:00', '美食广场1号窗口', '10.5', '王五', '正常', '黄门酥肉');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (4, '保洁', '保洁人员', 'ROLE_BAOJIE');
INSERT INTO `sys_role` VALUES (5, '商铺', '商铺成员', 'ROLE_STORE');
INSERT INTO `sys_role` VALUES (6, '普通用户', '未分配角色', 'ROLE_USER');
INSERT INTO `sys_role` VALUES (7, '经理', '餐厅管理人员', 'ROLE_MANAGER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (3, 39);
INSERT INTO `sys_role_menu` VALUES (4, 10);
INSERT INTO `sys_role_menu` VALUES (4, 51);
INSERT INTO `sys_role_menu` VALUES (4, 52);
INSERT INTO `sys_role_menu` VALUES (4, 59);
INSERT INTO `sys_role_menu` VALUES (4, 62);
INSERT INTO `sys_role_menu` VALUES (5, 10);
INSERT INTO `sys_role_menu` VALUES (5, 43);
INSERT INTO `sys_role_menu` VALUES (5, 54);
INSERT INTO `sys_role_menu` VALUES (5, 55);
INSERT INTO `sys_role_menu` VALUES (5, 57);
INSERT INTO `sys_role_menu` VALUES (6, 10);
INSERT INTO `sys_role_menu` VALUES (7, 10);
INSERT INTO `sys_role_menu` VALUES (7, 43);
INSERT INTO `sys_role_menu` VALUES (7, 44);
INSERT INTO `sys_role_menu` VALUES (7, 45);
INSERT INTO `sys_role_menu` VALUES (7, 46);
INSERT INTO `sys_role_menu` VALUES (7, 51);
INSERT INTO `sys_role_menu` VALUES (7, 52);
INSERT INTO `sys_role_menu` VALUES (7, 53);
INSERT INTO `sys_role_menu` VALUES (7, 55);
INSERT INTO `sys_role_menu` VALUES (7, 56);
INSERT INTO `sys_role_menu` VALUES (7, 59);
INSERT INTO `sys_role_menu` VALUES (7, 60);
INSERT INTO `sys_role_menu` VALUES (7, 61);
INSERT INTO `sys_role_menu` VALUES (7, 63);

-- ----------------------------
-- Table structure for sys_stenv
-- ----------------------------
DROP TABLE IF EXISTS `sys_stenv`;
CREATE TABLE `sys_stenv`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `temperature` float NULL DEFAULT NULL,
  `humidity` float NULL DEFAULT NULL,
  `created_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fire` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_stenv
-- ----------------------------
INSERT INTO `sys_stenv` VALUES (1, 25.86, 65, '2022-05-03 16:32:06', 0);
INSERT INTO `sys_stenv` VALUES (2, 26.47, 48, '2022-05-03 16:32:10', 0);
INSERT INTO `sys_stenv` VALUES (3, 23.85, 55, '2022-05-03 16:32:10', 0);
INSERT INTO `sys_stenv` VALUES (4, 31.65, 68, '2022-05-03 16:33:31', 1);
INSERT INTO `sys_stenv` VALUES (5, 0, 0, NULL, 0);
INSERT INTO `sys_stenv` VALUES (6, 31.68, 0.56, '2022-05-03 16:59:33', 1);
INSERT INTO `sys_stenv` VALUES (7, 33.84, 0.63, NULL, 0);
INSERT INTO `sys_stenv` VALUES (8, 32.67, 0.43, NULL, 0);
INSERT INTO `sys_stenv` VALUES (9, 35.84, 0.32, NULL, 1);
INSERT INTO `sys_stenv` VALUES (10, 31.08, 0.46, NULL, 0);
INSERT INTO `sys_stenv` VALUES (11, 31.68, 56, NULL, 1);
INSERT INTO `sys_stenv` VALUES (12, 28.24, 0.56, NULL, 1);
INSERT INTO `sys_stenv` VALUES (13, 16.24, 0.85, NULL, 0);
INSERT INTO `sys_stenv` VALUES (14, 18.05, 0.66, NULL, 1);
INSERT INTO `sys_stenv` VALUES (15, 34.82, 0.78, NULL, 0);
INSERT INTO `sys_stenv` VALUES (16, 36.08, 0.64, NULL, 1);
INSERT INTO `sys_stenv` VALUES (17, 26.8, 0.42, NULL, 0);

-- ----------------------------
-- Table structure for sys_temp
-- ----------------------------
DROP TABLE IF EXISTS `sys_temp`;
CREATE TABLE `sys_temp`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `temperature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_temp
-- ----------------------------
INSERT INTO `sys_temp` VALUES (1, '2022-04-30 18:41:39', '学生一餐厅', '36.6', '正常');
INSERT INTO `sys_temp` VALUES (2, '2022-05-08 16:02:03.57', '学生二餐厅', '37.8', '异常');
INSERT INTO `sys_temp` VALUES (3, '2022-05-08 16:02:05', '美食广场', '42.87', '无效信息');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '梦飞幻翼', 'admin@qq.com', '13803870363', '河南郑州', '2022-01-22 21:10:27', 'http://localhost:9090/file/avarl01.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (30, 'baojie1', '123456', '张美丽', 'abc@139.com', '1131242361', '郑州大学', '2022-05-06 22:50:03', NULL, 'ROLE_BAOJIE');
INSERT INTO `sys_user` VALUES (31, 'store1', '123', '王定山', 'wang@189.com', '13978540938', '美食广场1号窗口', '2022-05-07 14:27:05', NULL, 'ROLE_STORE');
INSERT INTO `sys_user` VALUES (32, 'abc', '123456', NULL, NULL, NULL, NULL, '2022-05-07 17:49:53', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (34, 'manager1', '123456', '孙中号', 'sun@gmail.com', '13978549273', '学生一餐厅', '2022-05-09 19:57:21', NULL, 'ROLE_MANAGER');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父id',
  `origin_id` int(11) NULL DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 1, '2022-03-22 20:00:00', NULL, NULL, 1);
INSERT INTO `t_comment` VALUES (2, '123', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (5, '回复内容', 1, '2022-03-22 21:01:00', NULL, NULL, 1);
INSERT INTO `t_comment` VALUES (6, '4444', 1, '2022-03-22 21:03:15', 4, 4, 1);
INSERT INTO `t_comment` VALUES (7, '5555', 1, '2022-03-22 21:04:11', 4, 4, 1);
INSERT INTO `t_comment` VALUES (8, '444444', 1, '2022-03-22 21:29:55', 7, 7, 1);
INSERT INTO `t_comment` VALUES (9, '5555', 1, '2022-03-22 21:30:04', 7, 7, 1);
INSERT INTO `t_comment` VALUES (10, '666', 1, '2022-03-22 21:34:05', 7, 4, 1);
INSERT INTO `t_comment` VALUES (11, '甄姬真的好大好大！！', 16, '2022-03-22 21:38:26', 10, 4, 1);
INSERT INTO `t_comment` VALUES (13, '哈哈哈哈，我是ddd', 28, '2022-03-22 21:46:01', 12, 12, 1);
INSERT INTO `t_comment` VALUES (14, '我是李信，我很萌', 20, '2022-03-22 21:46:48', 13, 12, 1);
INSERT INTO `t_comment` VALUES (15, '我在回复ddd', 20, '2022-03-22 21:47:03', 13, 12, 1);
INSERT INTO `t_comment` VALUES (16, '我是李信', 20, '2022-03-22 21:48:19', 4, 4, 1);
INSERT INTO `t_comment` VALUES (17, '33333', 20, '2022-03-22 21:48:42', 5, 5, 1);
INSERT INTO `t_comment` VALUES (19, '我是李信嗯嗯嗯', 20, '2022-03-22 21:49:21', 1, 1, 1);
INSERT INTO `t_comment` VALUES (21, '哈哈哈 我是ddd', 28, '2022-03-22 21:50:04', 20, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
