/*
 Navicat Premium Data Transfer

 Source Server         : gac
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : rm-6weca864bt3a666l2no.mysql.japan.rds.aliyuncs.com:3306
 Source Schema         : gac

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 15/12/2022 14:31:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_admin
-- ----------------------------
DROP TABLE IF EXISTS `account_admin`;
CREATE TABLE `account_admin`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sso账号id',
  `role_pk` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账户',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：停用  3:  删除',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建管理ID',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建Ip',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登陆时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '安全秘钥',
  `is_admin` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是超级管理员：1:是 0 否',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_admin
-- ----------------------------
INSERT INTO `account_admin` VALUES (1, '7afa3e1e251011ed800c9ac3cc94a789', 0, '超级管理员', 'super_admin', 1, '2022-09-22 15:44:45', '2022-09-22 15:44:45', '0', NULL, '127.0.0.1', '127.0.0.1', 130, '2022-09-07 14:03:05', '', '5959e798c36f0333e5fbc5a1c64cce2b9b573c218d19c769f1547d0913ad3757', '', 1);
INSERT INTO `account_admin` VALUES (2, '85ffb1e4395e11edb22fee360bed21de', 3, '山东派盟', 'paimeng', 1, '2022-12-15 11:14:55', '2022-12-15 11:14:55', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 25, '2022-12-15 11:14:56', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (3, '9df09f27395e11edb22fee360bed21de', 10, '张国桢', 'zhangguozhen', 1, '2022-12-14 18:50:33', '2022-12-14 18:50:33', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 106, '2022-12-14 18:50:34', '', 'b1fbfb9f29821d6a4637816c185446023cfc972201341aeac58e12bc47cbcb4a', '', 0);
INSERT INTO `account_admin` VALUES (4, '2f9d091f396311edb22fee360bed21de', 43, '服务商运营', 'provider', 1, '2022-09-21 13:18:46', '2022-09-21 13:18:46', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 3, '2022-09-21 13:18:47', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (5, 'dd33432c396e11edb22fee360bed21de', 10, '李美露', 'limeilu', 1, '2022-12-14 11:13:22', '2022-12-14 11:13:22', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '3.113.23.101', 134, '2022-12-14 11:13:22', '', '7b838575db3c90aedfb98e7f2cea3239f78a4d4131ee3c8c65f366aa5f597284', '', 0);
INSERT INTO `account_admin` VALUES (6, '9b77b1cb3a2011ed8bf10a1a0af9082f', 10, '张国栋', 'zhangguodong', 1, '2022-11-02 16:29:33', '2022-11-02 16:29:33', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '202.85.211.226', 8, '2022-11-02 16:29:33', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (7, 'e81bbbc43a2011ed8bf10a1a0af9082f', 10, '程俊生', 'chengjuncheng', 3, '2022-09-22 11:47:57', '2022-09-22 11:47:58', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '124.128.97.210', 0, '2022-09-22 11:47:33', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (8, '0bd0bd1e3a2111ed8bf10a1a0af9082f', 10, '程俊生', 'chengjunsheng', 1, '2022-12-15 09:40:21', '2022-12-15 09:40:21', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '219.121.2.115', 6, '2022-12-15 09:40:21', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (9, '207c59e03a2111ed8bf10a1a0af9082f', 10, '吴均', 'wujun', 1, '2022-09-22 11:49:08', '2022-09-22 11:49:08', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '124.128.97.210', 0, '2022-09-22 11:49:08', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (10, '306a9ec13a2111ed8bf10a1a0af9082f', 10, '董植', 'dongzhi', 1, '2022-12-14 14:21:21', '2022-12-14 14:21:21', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '219.121.2.115', 3, '2022-12-14 14:21:22', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (11, '4465b72c3a2111ed8bf10a1a0af9082f', 10, '韩大昕', 'handaxin', 1, '2022-12-14 18:50:49', '2022-12-14 18:50:49', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '219.121.2.115', 1, '2022-12-14 18:50:49', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (12, '4ca686153a2111ed8bf10a1a0af9082f', 10, '陈强', 'chenqiang', 1, '2022-11-14 16:53:20', '2022-11-14 16:53:20', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '202.85.211.226', 144, '2022-11-14 16:53:21', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (13, 'eb0b2a493a2111ed8bf10a1a0af9082f', 10, '于泳', 'yuyong', 1, '2022-09-22 11:54:47', '2022-09-22 11:54:47', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '124.128.97.210', 0, '2022-09-22 11:54:47', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (14, 'c751fc153a4111ed8bf10a1a0af9082f', 10, '王成', 'wangcheng', 1, '2022-12-05 14:38:26', '2022-12-05 14:38:26', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '124.128.97.210', 5, '2022-12-05 14:38:27', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (15, 'f896048b3a4211ed8bf10a1a0af9082f', 3, '大蒜', 'dasuan', 3, '2022-09-22 15:51:56', '2022-09-22 15:51:57', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 0, '2022-09-22 15:51:23', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (16, '29f67a703a4311ed8bf10a1a0af9082f', 10, '大蒜', 'dasuan', 1, '2022-12-05 14:47:30', '2022-12-05 14:47:30', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 5, '2022-12-05 14:47:31', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (17, '769746c63a4311ed8bf10a1a0af9082f', 10, '芬奇', 'finch', 1, '2022-10-12 18:37:19', '2022-10-12 18:37:19', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '202.85.211.226', 20, '2022-10-12 18:37:20', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (18, 'fdd277c83e0c11ed8bf10a1a0af9082f', 10, '君陌', 'zhaokebin', 1, '2022-12-09 14:27:56', '2022-12-09 14:27:56', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 10, '2022-12-09 14:27:56', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (19, '2735cb543fb811ed8bf10a1a0af9082f', 10, '談偉倫', 'tanweilun', 1, '2022-12-14 10:57:02', '2022-12-14 10:57:02', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '126.166.163.245', 36, '2022-12-14 10:57:03', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (20, 'fea25ee2537711ed8bf10a1a0af9082f', 10, '刘健', 'liujian', 1, '2022-10-24 17:43:56', '2022-10-24 17:43:56', '7afa3e1e251011ed800c9ac3cc94a789', '', '124.128.97.210', '124.128.97.210', 0, '2022-10-24 17:43:56', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (21, '0e95337755bf11ed8bf10a1a0af9082f', 10, '姚远', 'yaoyuan', 1, '2022-11-16 09:27:28', '2022-11-16 09:27:28', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '154.31.112.8', 6, '2022-11-16 09:27:29', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (22, 'b5eef0b26ec011ed8bf10a1a0af9082f', 10, '常桂果', 'changguiguo', 1, '2022-12-14 15:10:58', '2022-12-14 15:10:58', '85ffb1e4395e11edb22fee360bed21de', '', '113.128.98.17', '124.128.97.210', 29, '2022-12-14 15:10:58', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (23, '4684368c7b5411eda5651a878f93c2e4', 10, '刘竟天', 'liujingtian', 1, '2022-12-14 11:09:32', '2022-12-14 11:09:32', '7afa3e1e251011ed800c9ac3cc94a789', '', '3.113.23.101', '5.44.249.51', 2, '2022-12-14 11:09:32', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (24, '5b5cef457b5411eda5651a878f93c2e4', 10, '刘德金', 'liudejin', 1, '2022-12-14 11:10:01', '2022-12-14 11:10:01', '7afa3e1e251011ed800c9ac3cc94a789', '', '3.113.23.101', '5.44.249.51', 1, '2022-12-14 11:10:01', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);
INSERT INTO `account_admin` VALUES (25, '655442bf7c1e11eda5651a878f93c2e4', 10, '郝豆豆', 'haodoudou', 1, '2022-12-15 11:22:01', '2022-12-15 11:22:01', '85ffb1e4395e11edb22fee360bed21de', '', '124.128.97.210', '219.121.2.115', 2, '2022-12-15 11:22:02', '', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 0);

-- ----------------------------
-- Table structure for account_provider
-- ----------------------------
DROP TABLE IF EXISTS `account_provider`;
CREATE TABLE `account_provider`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NULL DEFAULT NULL COMMENT '服务商id',
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sso账号id',
  `role_pk` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账户',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '安全秘钥',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：停用',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建Ip',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登陆时间',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务商表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_provider
-- ----------------------------
INSERT INTO `account_provider` VALUES (1, 185, '7cbabc76396e11edb22fee360bed21de', 41, 'OMjpchangA', 'OMjpchangA', 'adb31dfaec05922f6b5e11905e41467b7102e57741e119591940817e8c3c86b3', '', 1, '2022-12-14 12:31:46', '2022-09-21 14:30:22', '124.128.97.210', '124.128.97.210', 43, '2022-12-14 12:31:47', 'dev_test001');
INSERT INTO `account_provider` VALUES (2, 181, '3df018a5396f11edb22fee360bed21de', 41, 'BJOM7700', 'BJOM7700', '3b832bd9614df28d3639f3b0f00f23323b6914b946b2d55e9367435ce12489af', '', 1, '2022-12-14 19:03:49', '2022-09-21 14:35:47', '124.128.97.210', '124.128.97.210', 91, '2022-12-14 19:03:50', '山东派盟');
INSERT INTO `account_provider` VALUES (3, 215, '5bba6a5f397111edb22fee360bed21de', 41, '株式会社SDベンディング', 'Inspiry_SD1', '30cc8348d9e5b6213db50b0c7adc7f140ce87827671846462ad2549f65fbe335', '', 1, '2022-12-11 15:40:35', '2022-09-21 14:50:55', '124.128.97.210', '219.121.2.115', 72, '2022-12-11 15:40:35', '山东派盟');
INSERT INTO `account_provider` VALUES (4, 217, '1cbf9735397211edb22fee360bed21de', 41, '金井自動販売株式会社', 'Inspiry_Kanai', '904503f292e9c95bd0bd521edc3b5b09ea54d2d2ea5e616201ce1ca777898f91', '', 1, '2022-12-10 17:33:41', '2022-09-21 14:56:19', '124.128.97.210', '124.128.97.210', 7, '2022-12-10 17:33:42', 'dev_test001');
INSERT INTO `account_provider` VALUES (5, 221, 'efbd23ae397211edb22fee360bed21de', 41, 'サンポッカサービス株式会社', 'Inspiry_SUNPOKKA', 'aa026d846a8330ddada781631e1d7af4e779ca99649bd2dfdd8929059fc260b3', '', 1, '2022-12-15 10:37:41', '2022-09-21 15:02:13', '124.128.97.210', '124.128.97.210', 12, '2022-12-15 10:37:41', '山东派盟');
INSERT INTO `account_provider` VALUES (6, 216, '2db31d41397311edb22fee360bed21de', 41, 'INSPIRYJAPANキャンペーン専用', '7700khsy', 'd715196d508e2369e5e16eaf56e971a05e8eb7bee1d712157d872afb3f0e622e', '', 1, '2022-12-06 16:47:59', '2022-09-21 15:03:57', '124.128.97.210', '219.121.2.115', 17, '2022-12-06 16:47:59', '山东派盟');
INSERT INTO `account_provider` VALUES (7, 220, '4aa2db15397311edb22fee360bed21de', 41, 'INSPIRYJAPAN演示専用', '7700jptest', 'e97414fab6c43701ad08eabfa97d63b68dd9c8087a06f367f5883e3d8bdbd310', '', 1, '2022-11-29 14:58:32', '2022-09-21 15:04:46', '124.128.97.210', '113.128.49.18', 7, '2022-11-29 14:58:33', '山东派盟');
INSERT INTO `account_provider` VALUES (8, 99, 'dde33558397311edb22fee360bed21de', 41, 'INSPIRY日本社内', 'inspayjp', '5c2b4a5b6e3c1821f1a29f1b2950edbbeefd02b48241fb2c335cb9f260cb804a', '', 1, '2022-12-14 19:09:47', '2022-09-21 15:08:53', '124.128.97.210', '124.128.97.210', 11, '2022-12-14 19:09:48', '山东派盟');
INSERT INTO `account_provider` VALUES (9, 195, '56b9689e3a4811ed8bf10a1a0af9082f', 41, 'SDOM1', 'SDOM1', '8f9f8c6b5e7519412ac4ceb5ced47a1ce5e2491f52d39abd02520e642eab6e07', '', 1, '2022-12-14 19:26:18', '2022-09-22 16:29:49', '124.128.97.210', '124.128.97.210', 39, '2022-12-14 19:26:19', '山东派盟');
INSERT INTO `account_provider` VALUES (10, 225, 'e99bf11755c011ed8bf10a1a0af9082f', 41, '鲁班科技', 'BenMarTech', '78abe8b1d246edeb3c9dca74e07f76c68aa306e813ceb09683ac9d133a396b24', '', 1, '2022-10-31 17:49:42', '2022-10-27 15:30:56', '124.128.97.210', '176.119.150.110', 3, '2022-10-31 17:49:42', '山东派盟');
INSERT INTO `account_provider` VALUES (11, 226, 'f362089e58c711ed8bf10a1a0af9082f', 41, '株式会社Halloween', 'Inspiry_Halloween', 'ad6600c2c3c5b8697946eee13b0bbda400debac0d6ec5feb31a6782001836ab2', '', 1, '2022-12-02 14:27:04', '2022-10-31 11:58:53', '124.128.97.210', '219.121.2.115', 13, '2022-12-02 14:27:04', '山东派盟');

-- ----------------------------
-- Table structure for account_provider_profile
-- ----------------------------
DROP TABLE IF EXISTS `account_provider_profile`;
CREATE TABLE `account_provider_profile`  (
  `id` bigint(20) NOT NULL COMMENT '服务商id',
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sso账号id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商简称',
  `reg_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商唯一标识码',
  `type` int(11) NULL DEFAULT NULL COMMENT '服务商类型1：无开发能力服务商',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address_detail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务商信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_provider_profile
-- ----------------------------
INSERT INTO `account_provider_profile` VALUES (99, 'dde33558397311edb22fee360bed21de', 'INSPIRY日本社内', '', '', 1, 'BEN', '13911518174', '', 'ben@inspiry.jp', '2022-09-21 15:08:53', '2022-09-21 15:08:53');
INSERT INTO `account_provider_profile` VALUES (181, '3df018a5396f11edb22fee360bed21de', 'BJOM7700', '', '', 1, 'zhangguodong', '', '', '691322222@qq.com', '2022-09-21 14:35:47', '2022-09-21 14:35:47');
INSERT INTO `account_provider_profile` VALUES (185, '7cbabc76396e11edb22fee360bed21de', '济南OM测试服务商A', '', '', 1, '运营', '', '', 'yueguangniwu@163.com', '2022-09-21 14:30:22', '2022-09-21 14:30:22');
INSERT INTO `account_provider_profile` VALUES (195, '56b9689e3a4811ed8bf10a1a0af9082f', '山东OMtest', '', '', 1, '运营', '', '', '999999999999@112', '2022-09-22 16:29:49', '2022-09-22 16:29:49');
INSERT INTO `account_provider_profile` VALUES (215, '5bba6a5f397111edb22fee360bed21de', '株式会社SDベンディング', '', '', 1, '安達友一', '', '', 'adachi@inspiry.jp', '2022-09-21 14:50:55', '2022-09-21 14:50:55');
INSERT INTO `account_provider_profile` VALUES (216, '2db31d41397311edb22fee360bed21de', 'INSPIRYJAPANキャンペーン専用', '', '', 1, '阿桢', '', '', '12345@11', '2022-09-21 15:03:57', '2022-09-21 15:03:57');
INSERT INTO `account_provider_profile` VALUES (217, '1cbf9735397211edb22fee360bed21de', '金井自動販売株式会社', '', '', 1, '安達友一', '', '', 'adachi@inspiry.jp', '2022-09-21 14:56:19', '2022-09-21 14:56:19');
INSERT INTO `account_provider_profile` VALUES (220, '4aa2db15397311edb22fee360bed21de', 'INSPIRYJAPAN演示専用	', '', '', 1, 'zhanggd', '', '', '691398273@qq.com', '2022-09-21 15:04:46', '2022-09-21 15:04:46');
INSERT INTO `account_provider_profile` VALUES (221, 'efbd23ae397211edb22fee360bed21de', 'サンポッカサービス株式会社', '', '', 1, '佐々木　祐輔', '', '', 'adachi@qq.com', '2022-09-21 15:02:13', '2022-09-21 15:02:13');
INSERT INTO `account_provider_profile` VALUES (225, 'e99bf11755c011ed8bf10a1a0af9082f', '鲁班科技', '', '', 1, 'ben', '', '', '13911518174@qq.com', '2022-10-27 15:30:56', '2022-10-27 15:30:56');
INSERT INTO `account_provider_profile` VALUES (226, 'f362089e58c711ed8bf10a1a0af9082f', '株式会社Halloween', '', '', 1, '刘健', '', '', 'liujian@gmail.com', '2022-10-31 11:58:53', '2022-10-31 11:58:53');

-- ----------------------------
-- Table structure for account_provider_subclass
-- ----------------------------
DROP TABLE IF EXISTS `account_provider_subclass`;
CREATE TABLE `account_provider_subclass`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '对外ID',
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务商sso账号id',
  `sub_role_pk` int(11) NULL DEFAULT NULL COMMENT '子账号角色id',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账户',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：停用 3:删除',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建Ip',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登陆时间',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务商外部子账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_provider_subclass
-- ----------------------------

-- ----------------------------
-- Table structure for account_user
-- ----------------------------
DROP TABLE IF EXISTS `account_user`;
CREATE TABLE `account_user`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外暴漏用户id',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `passwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NULL DEFAULT 3 COMMENT '1 启用 2 禁用 3 锁定 启用状态; 可以随便操作， 禁用状态：不能登陆，  锁定状态：不能使用权益',
  `twitter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方表中twitter对应id',
  `line_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方表中line对应id',
  `facebook_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方表中facebook对应id',
  `wechat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方表中wechat对应id',
  `score` bigint(11) NULL DEFAULT NULL COMMENT '当前积分',
  `total_score` bigint(11) NULL DEFAULT NULL COMMENT '总积分',
  `exp` bigint(11) NULL DEFAULT NULL COMMENT '经验值',
  `level_pk` int(11) NULL DEFAULT NULL COMMENT '当前等级',
  `created_time` timestamp(0) NULL DEFAULT NULL,
  `updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `registed_time` timestamp(0) NULL DEFAULT NULL COMMENT '注册时间',
  `registed_type` int(11) NULL DEFAULT NULL COMMENT '注册方式 1:手机号短信 2:手机号密码 3:twitter 4:line 5:facebook 6:wechat',
  `platform` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '平台',
  `dialling_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话区号',
  `last_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_user
-- ----------------------------

-- ----------------------------
-- Table structure for account_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `account_user_profile`;
CREATE TABLE `account_user_profile`  (
  `pk` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `identity` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `sex` int(11) NOT NULL DEFAULT 0 COMMENT '1:男 2:女 0：保密',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `site` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '站点',
  `company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '公司',
  `work` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职业',
  `country` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '国家',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建ip',
  PRIMARY KEY (`pk`) USING BTREE,
  INDEX `user_profile_mix_csa`(`sex`, `age`, `country`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for admin_app
-- ----------------------------
DROP TABLE IF EXISTS `admin_app`;
CREATE TABLE `admin_app`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'app归属',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'code',
  `org_pk` int(11) NULL DEFAULT NULL COMMENT '组织id',
  `api_logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `api_host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'host',
  `api_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'secret',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 1 启用 2 禁用 3 删除',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'app类别 2：系统 3：服务商 ',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_app
-- ----------------------------
INSERT INTO `admin_app` VALUES (1, '165120980493131774', 'gac', 'GAC', 'gac', 1, 'gac', 'gac', '', 1, 'dev_test_account', '2022-09-16 14:49:06', '2022-09-16 14:49:06', 2);
INSERT INTO `admin_app` VALUES (2, '166149410949029888', '', 'SAAS-COSJP', 'cosjp', 1, '', '', '-8131865235067308714', 1, 'dev_test_account', '2022-09-16 14:49:06', '2022-09-16 14:49:06', 2);
INSERT INTO `admin_app` VALUES (3, '166135369732055040', '', '服务商系统管理', 'outsys', 1, '', '', '-6919018388903711747', 1, 'dev_test_account', '2022-09-19 11:10:07', '2022-09-19 11:10:07', 3);
INSERT INTO `admin_app` VALUES (4, '167634109651345408', '', '运营', 'terminal', 1, '', '', '8015254177308419590', 1, 'dev_test_account', '2022-09-16 13:40:09', '2022-09-16 13:40:09', 2);
INSERT INTO `admin_app` VALUES (5, '167648345324642304', '', '营销', 'marketing', 1, '', '', '-3470485728849690602', 1, 'dev_test_account', '2022-09-16 13:40:14', '2022-09-16 13:40:14', 2);
INSERT INTO `admin_app` VALUES (6, '170547193382559744', '', '预警', 'warning', 1, '', '', '-6964362553910058384', 1, 'dev_test_account', '2022-10-18 10:32:43', '2022-10-18 10:32:43', 2);
INSERT INTO `admin_app` VALUES (7, '166146362868621312', '', '创意', 'material', 1, '', '', '-3486080775799465252', 1, 'dev_test_account', '2022-09-16 14:49:07', '2022-09-16 14:49:07', 2);
INSERT INTO `admin_app` VALUES (8, '165120980493131775', 'gms', '会员', 'member', 1, NULL, NULL, '', 1, 'dev_test_account', '2022-09-19 15:22:57', '2022-09-19 15:22:57', 2);
INSERT INTO `admin_app` VALUES (10, '171300160574447616', '', '营销（服务商）', 'marketing', 1, '', '', '-839923955904630996', 1, 'dev_test_account', '2022-09-16 17:07:55', '2022-09-16 17:07:55', 3);
INSERT INTO `admin_app` VALUES (11, '171303883484815360', '', '运营（服务商）', 'terminal', 1, '', '', '3678240635844243659', 1, 'dev_test_account', '2022-09-16 17:00:28', '0000-00-00 00:00:00', 3);
INSERT INTO `admin_app` VALUES (12, '172295739442061312', '', 'SASS-COSJP-Provider', 'cosjp', 1, '', '', '7354209482800782133', 1, 'dev_test_account', '2022-09-19 10:41:45', '0000-00-00 00:00:00', 3);

-- ----------------------------
-- Table structure for admin_org
-- ----------------------------
DROP TABLE IF EXISTS `admin_org`;
CREATE TABLE `admin_org`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织code',
  `type` enum('low','middle','high') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织类型',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon链接',
  `site` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 1 启用 2 禁用 3 删除',
  `contacts` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_org
-- ----------------------------
INSERT INTO `admin_org` VALUES (1, '山东派盟网络科技有限公司', 'pm', 'low', NULL, NULL, 1, '', '', 'low', '2022-09-02 09:34:31', '2022-09-02 09:34:33');
INSERT INTO `admin_org` VALUES (2, '北京意锐新创科技有限公司', 'yr', 'low', NULL, NULL, 1, '', '', 'low', '2022-09-02 09:34:33', '2022-09-02 09:34:35');
INSERT INTO `admin_org` VALUES (3, '北京派盟互通科技有限公司', '165464282941743104', 'low', '', '', 1, '', '', '', '2022-09-02 09:34:36', '2022-09-02 09:34:37');
INSERT INTO `admin_org` VALUES (4, '山东派盟数字科技有限公司', '165745406502887424', 'low', '', '', 1, '', '', '', '2022-09-02 09:34:38', '2022-09-02 09:34:40');
INSERT INTO `admin_org` VALUES (5, '上海英思派锐科技有限公司', '165746180553302016', 'low', '', '', 1, '', '', '', '2022-09-02 09:34:40', '2022-09-02 09:34:42');
INSERT INTO `admin_org` VALUES (6, '安徽意派电子科技有限公司', '165746256826720256', 'low', '', '', 1, '', '', '', '2022-09-02 09:34:42', '2022-09-02 09:34:44');
INSERT INTO `admin_org` VALUES (7, 'INSPIRY JAPAN株式会社', '165746720616079360', 'low', '', '', 1, '', '', '', '2022-09-02 09:34:45', '2022-09-02 09:34:48');
INSERT INTO `admin_org` VALUES (8, 'INSPIRYJAPANキャンペーン专用', '166118275875463168', 'low', '', '', 1, '', '', '', '2022-09-02 11:25:52', '2022-09-02 11:25:52');
INSERT INTO `admin_org` VALUES (9, '株式会社SDベンディング', '166124900019462144', 'low', '', '', 1, '', '', '', '2022-09-02 11:26:14', '2022-09-02 11:26:14');
INSERT INTO `admin_org` VALUES (10, '金井自動販売株式会社', '166125758861926400', 'low', '', '', 3, '', '', '', '2022-09-02 10:05:38', '2022-09-02 10:05:38');
INSERT INTO `admin_org` VALUES (11, '金井自動販売株式会社', '166126081559093248', 'low', '', '', 1, '', '', '', '2022-09-02 11:25:54', '2022-09-02 11:25:54');
INSERT INTO `admin_org` VALUES (12, 'Inspiry&東京会社週間販売機', '166126721467277312', 'low', '', '', 1, '', '', '', '2022-09-02 11:25:56', '2022-09-02 11:25:56');

-- ----------------------------
-- Table structure for auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
CREATE TABLE `auth_menu`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `org_pk` int(11) NULL DEFAULT 0 COMMENT '组织',
  `app_pk` int(11) NULL DEFAULT 0 COMMENT '应用',
  `parent_pk` int(11) NULL DEFAULT 0 COMMENT '上级id',
  `parent_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上级名称',
  `joins` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'id路径',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限code',
  `version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '版本',
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '前台路由重定向',
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '前台路由',
  `view_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '前端模板路径',
  `api_route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口路由',
  `method` enum('GET','POST','DELETE','PATCH','PUT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法:get,post,put,patch,options',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `type` tinyint(4) NULL DEFAULT 2 COMMENT '菜单类型： 1：菜单 2：路由 3：按钮',
  `show` tinyint(4) NULL DEFAULT 2 COMMENT '前端显示状态1：显示 2：隐藏 ',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：停用  3:  删除',
  `updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者Ip',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `keep_alive` tinyint(4) NULL DEFAULT 2 COMMENT '路由缓存： 1：是 2：否 ',
  `i18n_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '多语言CODE',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES (1, 1, 1, 0, '', '', 'GAC系统', '20220901llmzyz', NULL, NULL, '/sys', '', '', NULL, NULL, 5, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', '2021-10-26 18:21:03', 2, NULL);
INSERT INTO `auth_menu` VALUES (2, 1, 1, 1, 'GAC系统', '1', '菜单管理', '20220901llmzyz', NULL, NULL, '/sys/menu', 'views/menu/index', '', NULL, NULL, 3, 1, 1, 1, '2022-09-21 09:14:26', NULL, '', NULL, 1, NULL);
INSERT INTO `auth_menu` VALUES (3, 1, 1, 1, 'GAC系统', '1', '角色管理', '20220901llmzyz', NULL, NULL, '/sys/role', '', '', NULL, NULL, 4, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (4, 1, 1, 1, 'GAC系统', '1', '账户管理', '20220901llmzyz', NULL, NULL, '/sys/account', '', '', NULL, NULL, 5, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (5, 1, 1, 1, 'GAC系统', '1', '组织管理', '20220901llmzyz', '', NULL, '/sys/org', 'views/org/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '127.0.0.1', '2022-08-22 16:12:31', 2, NULL);
INSERT INTO `auth_menu` VALUES (6, 1, 1, 1, 'GAC系统', '1', '应用管理', '20220901llmzyz', '', NULL, '/sys/appmenus', 'views/appmenus/index', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '127.0.0.1', '2022-08-22 16:14:26', 2, NULL);
INSERT INTO `auth_menu` VALUES (7, 1, 1, 1, 'GAC系统', '1', '日志管理', '20220901llmzyz', '', NULL, '/log', 'views/log/index', '', NULL, '', 6, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.221', '2022-09-01 10:38:34', 2, NULL);
INSERT INTO `auth_menu` VALUES (8, 1, 1, 2, '菜单管理', '1,2', '菜单管理-编辑', '', NULL, NULL, '', '', 'gac/v1/admin/menu/update', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 14:04:44', 'admin', '', '2021-10-26 18:21:03', 2, NULL);
INSERT INTO `auth_menu` VALUES (9, 1, 1, 2, '菜单管理', '1,2', '菜单管理-添加', '', '', NULL, '', '', 'gac/v1/admin/menu/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:04:44', 'admin', '127.0.0.1', '2022-08-22 16:12:31', 2, NULL);
INSERT INTO `auth_menu` VALUES (10, 1, 1, 2, '菜单管理', '1,2', '菜单管理-删除', '', '', NULL, '', '', 'gac/v1/admin/menu/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:04:44', 'admin', '127.0.0.1', '2022-08-22 16:12:31', 2, NULL);
INSERT INTO `auth_menu` VALUES (11, 1, 1, 2, '菜单管理', '1,2', '菜单管理-列表', '', '', NULL, '', '', 'gac/v1/admin/menu/page', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:55:44', 'admin', '127.0.0.1', '2022-08-22 16:12:31', 2, NULL);
INSERT INTO `auth_menu` VALUES (12, 1, 1, 2, '菜单管理', '1,2', '菜单管理-启用停用', '', '', NULL, '', '', 'gac/v1/admin/menu/enable', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:04:44', 'admin', '127.0.0.1', '2022-08-22 16:12:31', 2, NULL);
INSERT INTO `auth_menu` VALUES (13, 1, 1, 3, '角色管理', '1,3', '管理员角色', '', NULL, NULL, '/sys/role/admin', 'views/role/admin/index', '', NULL, NULL, 0, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', NULL, 1, NULL);
INSERT INTO `auth_menu` VALUES (14, 1, 1, 3, '角色管理', '1,3', '企业角色', '', NULL, NULL, '/sys/role/sass', 'views/role/sass/index', '', NULL, NULL, 0, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (15, 1, 1, 3, '角色管理', '1,3', '服务商角色', '', NULL, NULL, '/sys/role/merchant', 'views/role/merchant/index', '', NULL, NULL, 0, 1, 1, 1, '2022-09-21 09:14:26', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (16, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色列表', '', NULL, NULL, '', '', 'gac/v1/admin/role/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:55:44', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (17, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色添加', '', '', NULL, '', '', 'gac/v1/admin/role/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:49:46', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:04', 2, NULL);
INSERT INTO `auth_menu` VALUES (18, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色删除', '', '', NULL, '', '', 'gac/v1/admin/role/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:49:46', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:31', 0, NULL);
INSERT INTO `auth_menu` VALUES (19, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色编辑', '', '', NULL, '', '', 'gac/v1/admin/role/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:49:46', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:57', 0, NULL);
INSERT INTO `auth_menu` VALUES (20, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色启用停用', '', '', NULL, '', '', 'gac/v1/admin/role/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:49:46', 'dev_test_account', '192.168.0.74', '2022-09-01 09:52:23', 0, NULL);
INSERT INTO `auth_menu` VALUES (21, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业角色列表', '', NULL, NULL, '', '', 'gac/v1/admin/staff_role/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:55:45', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (22, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业角色添加', '', '', NULL, '', '', 'gac/v1/admin/staff_role/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:06', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:04', 2, NULL);
INSERT INTO `auth_menu` VALUES (23, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业角色删除', '', '', NULL, '', '', 'gac/v1/admin/staff_role/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:06', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:31', 0, NULL);
INSERT INTO `auth_menu` VALUES (24, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业角色编辑', '', '', NULL, '', '', 'gac/v1/admin/staff_role/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:06', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:57', 0, NULL);
INSERT INTO `auth_menu` VALUES (25, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业角色启用停用', '', '', NULL, '', '', 'gac/v1/admin/staff_role/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:06', 'dev_test_account', '192.168.0.74', '2022-09-01 09:52:23', 0, NULL);
INSERT INTO `auth_menu` VALUES (26, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色列表', '', NULL, NULL, '', '', 'gac/v1/admin/service_role/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:55:45', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (27, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色添加', '', '', NULL, '', '', 'gac/v1/admin/service_role/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:25', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:04', 2, NULL);
INSERT INTO `auth_menu` VALUES (28, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色删除', '', '', NULL, '', '', 'gac/v1/admin/service_role/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:25', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:31', 0, NULL);
INSERT INTO `auth_menu` VALUES (29, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色编辑', '', '', NULL, '', '', 'gac/v1/admin/service_role/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:25', 'dev_test_account', '192.168.0.74', '2022-09-01 09:51:57', 0, NULL);
INSERT INTO `auth_menu` VALUES (30, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色启用停用', '', '', NULL, '', '', 'gac/v1/admin/service_role/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:50:25', 'dev_test_account', '192.168.0.74', '2022-09-01 09:52:23', 0, NULL);
INSERT INTO `auth_menu` VALUES (31, 1, 1, 4, '账户管理', '1,4', '管理员账户', '', '', '', '/sys/account/admin', 'views/account/admin/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', NULL, 1, '');
INSERT INTO `auth_menu` VALUES (32, 1, 1, 4, '账户管理', '1,4', '服务商账户', '', '', '', '/sys/account/merchant', 'views/account/merchant/index', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', NULL, 2, '');
INSERT INTO `auth_menu` VALUES (33, 1, 1, 4, '账户管理', '1,4', '企业账户', '', '', '', '/sys/account/sass', 'views/account/sass/index', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', NULL, 2, '');
INSERT INTO `auth_menu` VALUES (34, 1, 1, 4, '账户管理', '1,4', 'SSO账户', '', '', '', '/sys/account/sso', 'views/account/sso/index', '', NULL, '', 4, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', NULL, 2, '');
INSERT INTO `auth_menu` VALUES (35, 1, 1, 31, '账户管理', '1,4,31', '账户管理-管理员账户添加', '', '', NULL, '', '', 'gac/v1/admin/accounts/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:07', 'dev_test_account', '192.168.0.221', '2022-09-01 10:38:42', 2, NULL);
INSERT INTO `auth_menu` VALUES (36, 1, 1, 31, '账户管理', '1,4,31', '账户管理-管理员账户编辑', '', '', NULL, '', '', 'gac/v1/admin/accounts/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:07', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (37, 1, 1, 31, '账户管理', '1,4,31', '账户管理-管理员账户列表', '', '', NULL, '', '', 'gac/v1/admin/accounts/page', 'GET', '', 0, 3, 2, 1, '2022-09-16 18:15:07', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (38, 1, 1, 31, '账户管理', '1,4,31', '账户管理-管理员账户删除', '', '', NULL, '', '', 'gac/v1/admin/accounts/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:07', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (39, 1, 1, 31, '账户管理', '1,4,31', '账户管理-管理员账户启用停用', '', '', NULL, '', '', 'gac/v1/admin/accounts/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:07', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (40, 1, 1, 32, '账户管理', '1,4,32', '账户管理-服务商账户添加', '', '', NULL, '', '', 'gac/v1/admin/provd/accounts/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:20', 'dev_test_account', '192.168.0.221', '2022-09-01 10:38:42', 2, NULL);
INSERT INTO `auth_menu` VALUES (41, 1, 1, 32, '账户管理', '1,4,32', '账户管理-服务商账户编辑', '', '', NULL, '', '', 'gac/v1/admin/provd/accounts/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:20', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (42, 1, 1, 32, '账户管理', '1,4,32', '账户管理-服务商账户列表', '', '', NULL, '', '', 'gac/v1/admin/provd/accounts/page', 'GET', '', 0, 3, 2, 1, '2022-09-16 18:15:20', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (43, 1, 1, 32, '账户管理', '1,4,32', '账户管理-服务商账户删除', '', '', NULL, '', '', 'gac/v1/admin/provd/accounts/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:20', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (44, 1, 1, 32, '账户管理', '1,4,32', '账户管理-服务商账户启用停用', '', '', NULL, '', '', 'gac/v1/admin/provd/accounts/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:20', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (45, 1, 1, 33, '账户管理', '1,4,33', '账户管理-企业账户添加', '', '', NULL, '', '', 'gac/v1/admin/enterprise/accounts/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:12', 'dev_test_account', '192.168.0.221', '2022-09-01 10:38:42', 2, NULL);
INSERT INTO `auth_menu` VALUES (46, 1, 1, 33, '账户管理', '1,4,33', '账户管理-企业账户编辑', '', '', NULL, '', '', 'gac/v1/admin/enterprise/accounts/update', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:12', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (47, 1, 1, 33, '账户管理', '1,4,33', '账户管理-企业账户列表', '', '', NULL, '', '', 'gac/v1/admin/enterprise/accounts/page', 'GET', '', 0, 3, 2, 1, '2022-09-16 18:15:12', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (48, 1, 1, 33, '账户管理', '1,4,33', '账户管理-企业账户删除', '', '', NULL, '', '', 'gac/v1/admin/enterprise/accounts/delete', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:12', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (49, 1, 1, 33, '账户管理', '1,4,33', '账户管理-企业账户启用停用', '', '', NULL, '', '', 'gac/v1/admin/enterprise/accounts/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 18:15:12', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (50, 1, 1, 34, '账户管理', '1,4,34', '账户管理-SSO账户列表', '', '', NULL, '', '', 'gac/v1/admin/accounts/page', 'GET', '', 0, 3, 2, 1, '2022-09-16 18:15:30', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (53, 1, 1, 5, '组织管理', '1,5', '组织管理-添加', '', NULL, NULL, '', '', 'gac/v1/admin/org/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:05:13', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (54, 1, 1, 5, '组织管理', '1,5', '组织管理-编辑', '', NULL, NULL, '', '', 'gac/v1/admin/org/update', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 14:05:13', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (55, 1, 1, 5, '组织管理', '1,5', '组织管理-列表', '', NULL, NULL, '', '', 'gac/v1/admin/org/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:55:45', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (56, 1, 1, 5, '组织管理', '1,5', '组织管理-删除', '', NULL, NULL, '', '', 'gac/v1/admin/org/delete', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 14:05:13', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (57, 1, 1, 5, '组织管理', '1,5', '组织管理-选项', '', NULL, NULL, '', '', 'gac/v1/admin/org/option', 'GET', NULL, 0, 3, 2, 1, '2022-09-16 14:05:13', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (58, 1, 1, 6, '应用管理', '1,6', '应用管理-添加', '', NULL, NULL, '', '', 'gac/v1/admin/app/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:05:17', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (59, 1, 1, 6, '应用管理', '1,6', '应用管理-编辑', '', NULL, NULL, '', '', 'gac/v1/admin/app/update', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 14:05:17', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (60, 1, 1, 6, '应用管理', '1,6', '应用管理-列表', '', NULL, NULL, '', '', 'gac/v1/admin/app/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:55:45', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (61, 1, 1, 6, '应用管理', '1,6', '应用管理-删除', '', NULL, NULL, '', '', 'gac/v1/admin/app/delete', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 14:05:17', 'admin', '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (62, 1, 1, 6, '应用管理', '1,6', '应用管理-选项', '', NULL, NULL, '', '', 'gac/v1/admin/app/option', 'POST', NULL, 0, 3, 2, 1, '2022-09-16 15:29:40', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (63, 1, 1, 6, '应用管理', '1,6', '应用管理-启用停用', '', '', NULL, '', '', 'gac/v1/admin/app/disable', 'POST', '', 0, 3, 2, 1, '2022-09-16 14:05:17', 'dev_test_account', '192.168.0.221', '2022-09-01 10:39:08', 2, NULL);
INSERT INTO `auth_menu` VALUES (64, 1, 2, 0, '', '0', 'SAAS-COSJP', 'cosjp', '', NULL, '', '', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', '', '', '2022-09-02 10:42:39', 2, '');
INSERT INTO `auth_menu` VALUES (65, 1, 2, 64, 'SAAS-COSJP', '0,64', '运营', '', '', '', '/app-terminal-center', '', '', NULL, 'Platform', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-02 11:26:20', 2, 'COMMON_TXT_00049');
INSERT INTO `auth_menu` VALUES (66, 1, 2, 64, 'SAAS-COSJP', '0,64', '营销', '', '', '', '/app-marketing', '', '', NULL, 'Promotion', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-02 15:19:54', 2, 'COMMON_TXT_00050');
INSERT INTO `auth_menu` VALUES (67, 1, 2, 64, 'SAAS-COSJP', '0,64', '创意', '', '', '', '/app-material-center', '', '', NULL, 'Brush', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-06 13:58:06', 2, 'COMMON_TXT_00051');
INSERT INTO `auth_menu` VALUES (68, 1, 2, 64, 'SAAS-COSJP', '0,64', '风控', '', '', '', '/app-warning', '', '', NULL, 'Bell', 4, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-06 14:54:40', 2, 'COMMON_TXT_00053');
INSERT INTO `auth_menu` VALUES (69, 1, 2, 64, 'SAAS-COSJP', '0,64', '会员', '', '', '', '/app-member', '', '', NULL, 'User', 5, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-07 11:01:12', 2, 'COMMON_TXT_00105');
INSERT INTO `auth_menu` VALUES (70, 1, 12, 227, 'SASS-COSJP-Provider', '227', '系统管理', '', '', '', '/app-auth', '', '', NULL, 'Setting', 999, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-08 14:52:34', 2, 'COMMON_TXT_00110');
INSERT INTO `auth_menu` VALUES (71, 1, 2, 65, 'SAAS-COSJP', '64,65', '运营子项目页面', '', '', '', '', 'views/platform/terminal', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-02 11:26:20', 2, 'COMMON_TXT_00049');
INSERT INTO `auth_menu` VALUES (72, 1, 2, 66, 'SAAS-COSJP', '64,66', '营销子项目页面', '', '', '', '', 'views/platform/marketing', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-02 15:19:54', 2, 'COMMON_TXT_00050');
INSERT INTO `auth_menu` VALUES (73, 1, 12, 70, 'SASS-COSJP-Provider', '227,70', '系统管理子项目页面', '', '', '', '', 'views/platform/auth', '', NULL, '', 999, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-08 14:52:34', 2, 'COMMON_TXT_00110');
INSERT INTO `auth_menu` VALUES (74, 1, 2, 67, 'SAAS-COSJP', '64,67', '创意子项目页面', '', '', '', '', 'views/platform/material', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-14 11:40:45', 2, 'COMMON_TXT_00051');
INSERT INTO `auth_menu` VALUES (75, 1, 2, 68, 'SAAS-COSJP', '0,64,68', '风控子系统页面', '', '', '', '', 'views/platform/warning', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-14 13:50:11', 2, 'COMMON_TXT_00053');
INSERT INTO `auth_menu` VALUES (76, 1, 2, 69, 'SAAS-COSJP', '0,64,69', '会员子系统页面', '', '', '', '', 'views/platform/member', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-14 13:51:25', 2, 'COMMON_TXT_00105');
INSERT INTO `auth_menu` VALUES (77, 1, 4, 0, '', '', '运营子系统', '', '', '', '', '', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 14:18:25', 2, '');
INSERT INTO `auth_menu` VALUES (78, 1, 4, 77, '运营子系统', '77', '默认路由-终端详情', '', '', '/terminal-info', '/', '', '', NULL, '', 1, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:37:12', 2, '');
INSERT INTO `auth_menu` VALUES (79, 1, 4, 77, '运营子系统', '77', '终端详情', '', '', '', '/terminal-info', '', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:37:54', 2, 'TERMINAL_TXT_00004');
INSERT INTO `auth_menu` VALUES (80, 1, 4, 79, '终端详情', '77,79', '终端详情-页面', '', '', '', '', 'views/platform/terminal-info/terminal-index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:41:38', 2, '');
INSERT INTO `auth_menu` VALUES (81, 1, 4, 77, '运营子系统', '77', '交易分析', '', '', '', '/pay-analysis', '', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:43:14', 2, 'TERMINAL_TXT_00091');
INSERT INTO `auth_menu` VALUES (82, 1, 4, 81, '交易分析', '77,81', '实时交易', '', '', '', '/pay-analysis/realtime', 'views/platform/pay-analysis/realtime/index', '', 'GET', '', 1, 1, 1, 1, '2022-11-23 12:19:08', 'super_admin', '39.98.233.68', '2022-09-13 18:43:42', 2, 'TERMINAL_TXT_00332');
INSERT INTO `auth_menu` VALUES (83, 1, 4, 77, '运营子系统', '77', '销售地图', '', '', '', '/sales-map', '', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:44:17', 2, 'TERMINAL_TXT_00280');
INSERT INTO `auth_menu` VALUES (84, 1, 4, 83, '销售地图', '77,83', '销售地图-页面', '', '', '', '', 'views/platform/sales-map/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:44:40', 2, '');
INSERT INTO `auth_menu` VALUES (85, 1, 4, 77, '运营子系统', '77', '终端地图', '', '', '', '/map', '', '', NULL, '', 4, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:45:08', 2, 'TERMINAL_TXT_00088');
INSERT INTO `auth_menu` VALUES (86, 1, 4, 85, '终端地图', '161,85', '终端地图-页面', '', '', '', '', 'views/platform/map/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:45:33', 2, '');
INSERT INTO `auth_menu` VALUES (87, 1, 4, 77, '运营子系统', '77', '在线分析', '', '', '', '/online-analysis', '', '', NULL, '', 5, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:46:51', 2, 'TERMINAL_TXT_00089');
INSERT INTO `auth_menu` VALUES (88, 1, 4, 87, '在线分析', '77,87', '在线分析-页面', '', '', '', '', 'views/platform/online-analysis/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:47:13', 2, '');
INSERT INTO `auth_menu` VALUES (89, 1, 4, 77, '运营子系统', '77', '移机分析', '', '', '', '/move-machine', '', '', NULL, '', 6, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:48:10', 2, 'TERMINAL_TXT_00311');
INSERT INTO `auth_menu` VALUES (90, 1, 4, 89, '移机分析', '77,89', '移机分析-页面', '', '', '', '', 'views/platform/move-machine/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:48:36', 2, '');
INSERT INTO `auth_menu` VALUES (91, 1, 4, 77, '运营子系统', '77', '部署分析', '', '', '', '/deployment', '', '', NULL, '', 7, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:48:59', 2, 'TERMINAL_TXT_00281');
INSERT INTO `auth_menu` VALUES (92, 1, 4, 91, '部署分析', '77,91', '部署分析-页面', '', '', '', '', 'views/platform/deployment/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:49:18', 2, '');
INSERT INTO `auth_menu` VALUES (93, 1, 4, 77, '运营子系统', '77', '标签库', '', '', '', '/tag-library', '', '', NULL, '', 8, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-13 18:49:45', 2, 'TERMINAL_TXT_00092');
INSERT INTO `auth_menu` VALUES (94, 1, 4, 93, '标签库', '77,93', '标签库-页面', '', '', '', '', 'views/platform/tag-library/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:50:03', 2, '');
INSERT INTO `auth_menu` VALUES (103, 1, 5, 0, '', '', '营销子系统', '', '', '', '', '', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.74', '2022-09-09 14:18:25', 2, '');
INSERT INTO `auth_menu` VALUES (104, 1, 5, 103, '营销子系统', '103', '默认路由-活动', '', '', '/marketing-activitis', '/', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 14:20:52', 2, '');
INSERT INTO `auth_menu` VALUES (110, 1, 5, 103, '营销子系统', '103', '活动管理', '', '', '', '/marketing-activitis', '', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 14:41:19', 2, 'MARKETING_TXT_00027');
INSERT INTO `auth_menu` VALUES (111, 1, 5, 110, '活动管理', '103,110', '默认路由-折扣活动', '', '', '/marketing-activitis/list', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'super', '172.20.0.193', '2022-09-09 14:42:22', 2, '');
INSERT INTO `auth_menu` VALUES (112, 1, 5, 110, '活动管理', '103,110', '折扣活动', '', '', '', '/marketing-activitis/list', 'views/platform/marketing-activities/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.70', '2022-09-09 14:44:11', 2, 'MARKETING_TXT_00028');
INSERT INTO `auth_menu` VALUES (113, 1, 5, 110, '活动管理', '103,110', '买赠活动', '', '', '', '/marketing-activitis/list-lucky-activities', 'views/platform/lucky-activities/index', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.70', '2022-09-09 14:44:11', 2, 'MARKETING_TXT_00029');
INSERT INTO `auth_menu` VALUES (114, 1, 5, 110, '活动管理', '103,110', '满减券', '', '', '', '/marketing-activitis/coupon-list', 'views/platform/coupon/index', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'super', '172.20.0.65', '2022-09-09 14:47:31', 2, 'MARKETING_TXT_00050');
INSERT INTO `auth_menu` VALUES (119, 1, 5, 103, '营销子系统', '103', '数据中心', '', '', '', '/data-center', '', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 18:35:51', 2, 'MARKETING_TXT_00030');
INSERT INTO `auth_menu` VALUES (120, 1, 5, 119, '数据中心', '103,119', '默认路由-实时数据', '', '', '/data-center/realtime', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-09 18:36:38', 2, '');
INSERT INTO `auth_menu` VALUES (121, 1, 5, 119, '数据中心', '103,119', '实时数据', '', '', '', '/data-center/realtime', 'views/platform/data-center/realtime/index', '', 'GET', '', 1, 1, 1, 1, '2022-10-27 11:28:42', 'super_admin', '124.128.97.210', '2022-09-09 18:37:22', 2, 'MARKETING_TXT_00031');
INSERT INTO `auth_menu` VALUES (122, 1, 5, 119, '数据中心', '103,119', '历史数据', '', '', '', '/data-center/history', 'views/platform/data-center/history/index', '', 'GET', '', 2, 1, 1, 1, '2022-10-27 11:28:38', 'super_admin', '124.128.97.210', '2022-09-09 18:38:12', 2, 'MARKETING_TXT_00032');
INSERT INTO `auth_menu` VALUES (123, 1, 5, 103, '营销子系统', '103', '财务中心', '', '', '', '/financial', '', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-13 15:37:13', 2, 'MARKETING_TXT_00148');
INSERT INTO `auth_menu` VALUES (124, 1, 5, 123, '财务中心', '103,123', '财务中心-页面', '', '', '', '', 'views/platform/financial/reconciliation/index', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-13 15:38:24', 2, '');
INSERT INTO `auth_menu` VALUES (125, 1, 5, 103, '营销子系统', '103', '皮肤管理', '', '', '', '/seasonal-skin', '', '', NULL, '', 4, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-13 15:38:24', 2, 'MARKETING_TXT_00033');
INSERT INTO `auth_menu` VALUES (126, 1, 5, 125, '皮肤管理', '103,125', '皮肤管理-页面', '', '', '', '', 'views/platform/seasonal-skin/index', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-13 15:38:53', 2, '');
INSERT INTO `auth_menu` VALUES (127, 1, 6, 0, '', '', '预警', '', '', '', '', '', '', 'GET', '', 0, 1, 1, 1, '2022-10-18 10:32:54', 'super_admin', '60.208.132.34', '2022-09-14 14:53:40', 2, '');
INSERT INTO `auth_menu` VALUES (128, 1, 6, 127, '', '127', '默认路由', '', '', '/warning_management', '/', '', '', NULL, '', 1, 1, 2, 1, '2022-10-18 10:32:54', 'dev_test_account', '172.20.0.193', '2022-09-14 15:00:38', 2, '');
INSERT INTO `auth_menu` VALUES (129, 1, 6, 127, '', '127', '事件管理', '', '', '', '/warning_management', '', '', NULL, 'Management', 1, 1, 1, 1, '2022-10-18 10:32:54', 'dev_test_account', '172.20.0.193', '2022-09-14 15:01:08', 2, '');
INSERT INTO `auth_menu` VALUES (130, 1, 6, 129, '事件管理', '127,129', '事件管理', '', '', '', '', 'iews/platform/warning/management/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-14 15:03:08', 2, '');
INSERT INTO `auth_menu` VALUES (131, 1, 6, 127, '', '127', '预警分析', '', '', '', '/warning_records', '', '', 'GET', 'List', 2, 1, 1, 1, '2022-10-18 10:32:54', 'super_admin', '124.128.97.210', '2022-09-14 15:03:55', 2, '');
INSERT INTO `auth_menu` VALUES (132, 1, 6, 131, '风控', '127,131', '预警分析', '', '', '', '', 'views/platform/warning/records/index', '', NULL, '', 1, 1, 1, 1, '2022-09-23 16:47:46', 'dev_test_account', '172.20.0.65', '2022-09-14 15:04:18', 2, '');
INSERT INTO `auth_menu` VALUES (133, 1, 6, 127, '', '127', '预警规则', '', '', '', '/warning_rules', '', '', 'GET', 'Checked', 3, 1, 1, 1, '2022-10-18 10:32:54', 'super_admin', '124.128.97.210', '2022-09-14 15:05:15', 2, '');
INSERT INTO `auth_menu` VALUES (134, 1, 6, 133, '风控', '127,133', '预警规则', '', '', '', '', 'views/platform/warning/rules/index', '', NULL, '', 1, 1, 1, 1, '2022-09-23 16:47:34', 'dev_test_account', '172.20.0.65', '2022-09-14 15:05:44', 2, '');
INSERT INTO `auth_menu` VALUES (135, 1, 6, 127, '', '127', '钉钉-预警记录', '', '', '', '/dingding-warnings', 'views/others/dingding-warnings/index', '', NULL, '', 999, 1, 2, 1, '2022-10-18 10:32:54', 'dev_test_account', '192.168.0.70', '2022-09-14 15:43:07', 2, '');
INSERT INTO `auth_menu` VALUES (136, 1, 8, 0, '', '', '会员', '', '', '', '', '', '', NULL, '', 0, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 15:45:59', 2, '');
INSERT INTO `auth_menu` VALUES (137, 1, 8, 136, '会员', '136', '默认路由', '', '', '/member_management', '/', '', '', NULL, '', 1, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-14 16:08:41', 2, '');
INSERT INTO `auth_menu` VALUES (138, 1, 8, 136, '会员', '136', '会员管理', '', '', '', '/member_management', '', '', NULL, 'User', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:10:10', 2, '');
INSERT INTO `auth_menu` VALUES (139, 1, 8, 138, '会员管理', '136,138', '会员管理-默认页面', '', '', '', '', 'views/platform/member-management/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:10:48', 2, '');
INSERT INTO `auth_menu` VALUES (140, 1, 8, 136, '会员', '136', '积分管理', '', '', '', '/integral_management', '', '', NULL, 'Wallet', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:11:13', 2, '');
INSERT INTO `auth_menu` VALUES (141, 1, 8, 140, '积分管理', '136,140', '积分管理-默认页面', '', '', '', '', 'views/platform/integral-management/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:11:42', 2, '');
INSERT INTO `auth_menu` VALUES (142, 1, 8, 136, '会员', '136', '事件管理', '', '', '', '/event_management', '', '', NULL, 'Document', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-14 16:11:59', 2, '');
INSERT INTO `auth_menu` VALUES (143, 1, 8, 142, '事件管理', '136,142', '事件列表', '', '', '', '/event_management/event-list', 'views/platform/event-management/event-list/index', '', NULL, 'Notebook', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:12:55', 2, '');
INSERT INTO `auth_menu` VALUES (144, 1, 8, 142, '事件管理', '136,142', '等级列表', '', '', '', '/event_management/class-list', 'views/platform/event-management/class-list/index', '', NULL, 'Histogram', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-14 16:13:21', 2, '');
INSERT INTO `auth_menu` VALUES (145, 1, 7, 0, '', '', '创意', '', '', NULL, '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-02 10:30:22', 2, '');
INSERT INTO `auth_menu` VALUES (146, 1, 7, 145, '创意', '145', '默认路由', '', '', '/material_repository', '/', '', '', NULL, '', 1, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-14 14:33:17', 2, '');
INSERT INTO `auth_menu` VALUES (147, 1, 7, 145, '创意', '145', '创意素材库', '', '', '', '/material_repository', '', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-14 14:36:26', 2, 'MATERIAL_TXT_00022');
INSERT INTO `auth_menu` VALUES (148, 1, 7, 147, '创意素材库', '145,147', '创意库', '', '', '', '', 'views/platform/ideas-center/material/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-14 14:36:56', 2, '');
INSERT INTO `auth_menu` VALUES (149, 1, 7, 145, '创意', '145', '创意包', '', '', '', '/material_resources', '', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-14 14:38:18', 2, 'MATERIAL_TXT_00023');
INSERT INTO `auth_menu` VALUES (150, 1, 7, 149, '创意包', '145,149', '创意包', '', '', '', '', 'views/platform/ideas-center/resource/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-14 14:39:03', 2, '');
INSERT INTO `auth_menu` VALUES (151, 1, 3, 0, '', '', '系统管理', '', '', '', '', '', '', NULL, '', 999, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-02 10:42:39', 2, '');
INSERT INTO `auth_menu` VALUES (152, 1, 3, 151, '系统管理', '151', '默认路由', '', '', '/menu', '', '', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 19:55:59', 2, '');
INSERT INTO `auth_menu` VALUES (153, 1, 3, 151, '系统管理', '151', '菜单权限', '', NULL, NULL, '/menu', '', '', 'GET', NULL, 2, 1, 1, 1, '2022-09-19 11:02:14', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (154, 1, 3, 151, '系统管理', '151', '角色管理', '', NULL, NULL, '/role', '', '', 'GET', NULL, 3, 1, 1, 1, '2022-09-19 11:02:15', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (155, 1, 3, 151, '系统管理', '151', '子账号管理', '', NULL, NULL, '/subaccount', '', '', 'GET', NULL, 4, 1, 1, 1, '2022-09-19 11:02:15', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (156, 1, 3, 151, '系统管理', '151', '我的信息', '', '', '', '/info', '', '', NULL, '', 999, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-15 13:52:12', 2, '');
INSERT INTO `auth_menu` VALUES (176, 1, 3, 153, '菜单权限', '151,153', '菜单权限-页面', '', '', '', '', 'views/provider/menu/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-13 19:59:46', 2, '');
INSERT INTO `auth_menu` VALUES (177, 1, 3, 153, '菜单权限', '151,153', '菜单权限-列表', '', NULL, NULL, '', '', 'gac/v1/sso/menu/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-07 10:14:34', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (178, 1, 3, 154, '角色管理', '151,154', '角色管理-页面', '', '', '', '', 'views/provider/role/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 20:06:13', 2, '');
INSERT INTO `auth_menu` VALUES (179, 1, 3, 154, '角色管理', '151,154', '角色管理-列表', '', NULL, NULL, '', '', 'gac/v1/sso/role/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:53', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (180, 1, 3, 154, '角色管理', '151,154', '角色管理-创建', '', NULL, NULL, '', '', 'gac/v1/sso/role/create', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:53:06', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (181, 1, 3, 154, '角色管理', '151,154', '角色管理-删除', '', NULL, NULL, '', '', 'gac/v1/sso/role/delete', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:53:02', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (182, 1, 3, 154, '角色管理', '151,154', '角色管理-禁用/启用', '', NULL, NULL, '', '', 'gac/v1/sso/role/disable', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:59', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (183, 1, 3, 154, '角色管理', '151,154', '角色管理-编辑', '', NULL, NULL, '', '', 'gac/v1/sso/role/update', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:50', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (184, 1, 3, 154, '角色管理', '151,154', '角色管理-下拉列表', '', NULL, NULL, '', '', 'gac/v1/sso/role/option', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:55', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (185, 1, 3, 154, '角色管理', '151,154', '角色管理-添加权限', '', NULL, NULL, '', '', 'gac/v1/sso/permission/create', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:53:11', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (186, 1, 3, 154, '角色管理', '151,154', '角色管理-查询权限', '', NULL, NULL, '', '', 'gac/v1/sso/permission/query', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:53:08', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (187, 1, 3, 155, '子账号管理', '151,155', '子账号管理-页面', '', '', '', '', 'views/provider/subaccount/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 20:06:47', 2, '');
INSERT INTO `auth_menu` VALUES (188, 1, 3, 155, '子账号管理', '151,155', '子账号管理-列表', '', NULL, NULL, '', '', 'gac/v1/sso/subclass/page', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:37', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (189, 1, 3, 155, '子账号管理', '151,155', '子账号管理-创建', '', NULL, NULL, '', '', 'gac/v1/sso/subclass/create', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:45', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (190, 1, 3, 155, '子账号管理', '151,155', '子账号管理-删除', '', NULL, NULL, '', '', 'gac/v1/sso/subclass/delete', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:42', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (191, 1, 3, 155, '子账号管理', '151,155', '子账号管理-禁用/启用', '', NULL, NULL, '', '', 'gac/v1/sso/subclass/disable', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:40', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (192, 1, 3, 155, '子账号管理', '151,155', '子账号管理-绑定角色', '', NULL, NULL, '', '', 'gac/v1/sso/subclass/bind_role', 'POST', NULL, 0, 3, 2, 1, '2022-09-21 17:52:47', NULL, '', NULL, 2, NULL);
INSERT INTO `auth_menu` VALUES (193, 1, 2, 64, 'SAAS-COSJP', '64', '账户信息-平台类型', '', '', '', '', '', 'gac/v1/sso/auth/platform/info', 'GET', '', 0, 3, 2, 1, '2022-09-21 17:53:23', 'dev_test_account', '192.168.0.70', '2022-09-08 10:30:09', 2, '');
INSERT INTO `auth_menu` VALUES (194, 1, 3, 156, '系统管理', '151,156', '账户信息-服务商类型', '', '', '', '', '', 'gac/v1/sso/auth/provider/info', 'GET', '', 0, 3, 2, 1, '2022-09-21 17:53:21', 'dev_test_account', '192.168.0.70', '2022-09-08 10:30:37', 2, '');
INSERT INTO `auth_menu` VALUES (195, 1, 3, 156, '系统管理', '151,156', '账户信息-服务商子账号', '', '', '', '', '', 'gac/v1/sso/auth/subclass/info', 'GET', '', 0, 3, 2, 1, '2022-09-21 17:53:18', 'dev_test_account', '192.168.0.70', '2022-09-08 10:31:03', 2, '');
INSERT INTO `auth_menu` VALUES (196, 1, 1, 4, '账户管理', '1,4', '角色管理-选项', '', '', '', '', '', 'gac/v1/admin/role/option', 'POST', '', 0, 3, 2, 1, '2022-09-22 11:12:50', 'dev_test_account', '124.128.97.210', '2022-09-16 15:23:13', 2, '');
INSERT INTO `auth_menu` VALUES (197, 1, 1, 7, '日志管理', '1,7', '日志管理-列表', '', '', '', '', '', 'gac/v1/admin/log/page', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:55:52', 'dev_test_account', '192.168.0.74', '2022-09-16 15:31:10', 2, '');
INSERT INTO `auth_menu` VALUES (198, 1, 1, 7, '日志管理', '1,7', '日志管理-模块选项', '', '', '', '', '', 'gac/v1/admin/log/module_option', 'GET', '', 0, 3, 2, 1, '2022-09-16 15:33:45', 'dev_test_account', '192.168.0.74', '2022-09-16 15:33:07', 2, '');
INSERT INTO `auth_menu` VALUES (199, 1, 1, 7, '日志管理', '1,7', '日志管理-行为选项', '', '', '', '', '', 'gac/v1/admin/log/action_option', 'GET', '', 0, 3, 2, 1, '2022-09-19 14:27:30', 'dev_test_account', '192.168.0.74', '2022-09-16 15:33:39', 2, '');
INSERT INTO `auth_menu` VALUES (200, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色权限绑定', '', '', '', '', '', 'gac/v1/admin/permission/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:48:05', 'dev_test_account', '192.168.0.70', '2022-09-16 15:45:28', 2, '');
INSERT INTO `auth_menu` VALUES (201, 1, 1, 13, '管理员角色', '1,3,13', '角色管理-管理员角色权限查询', '', '', '', '', '', 'gac/v1/admin/permission/query', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:48:05', 'dev_test_account', '192.168.0.70', '2022-09-16 15:45:59', 2, '');
INSERT INTO `auth_menu` VALUES (202, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色权限绑定', '', '', '', '', '', 'gac/v1/admin/service_permission/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:48:05', 'dev_test_account', '192.168.0.70', '2022-09-16 15:46:37', 2, '');
INSERT INTO `auth_menu` VALUES (203, 1, 1, 15, '服务商角色', '1,3,15', '角色管理-服务商角色权限查询', '', '', '', '', '', 'gac/v1/admin/service_permission/query', 'POST', '', 0, 3, 2, 1, '2022-09-19 14:27:39', 'dev_test_account', '192.168.0.70', '2022-09-16 15:47:03', 2, '');
INSERT INTO `auth_menu` VALUES (204, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业商角色权限绑定', '', '', '', '', '', 'gac/v1/admin/staff_permission/create', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:48:05', 'dev_test_account', '192.168.0.70', '2022-09-16 15:47:36', 2, '');
INSERT INTO `auth_menu` VALUES (205, 1, 1, 14, '企业角色', '1,3,14', '角色管理-企业商角色权限查询', '', '', '', '', '', 'gac/v1/admin/staff_permission/query', 'POST', '', 0, 3, 2, 1, '2022-09-16 15:48:05', 'dev_test_account', '192.168.0.70', '2022-09-16 15:47:56', 2, '');
INSERT INTO `auth_menu` VALUES (206, 1, 10, 0, '', '', '营销（服务商）', '', '', '', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-16 16:45:41', 2, '');
INSERT INTO `auth_menu` VALUES (207, 1, 11, 0, '', '', '运营（服务商）', '', '', '', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-16 17:00:29', 2, '');
INSERT INTO `auth_menu` VALUES (208, 1, 11, 207, '运营（服务商）', '207', '默认路由-终端详情', '', '', '/terminal-info', '/', '', '', NULL, '', 1, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:37:12', 2, '');
INSERT INTO `auth_menu` VALUES (209, 1, 11, 207, '运营（服务商）', '207', '终端信息', '', '', '', '/terminal-info', '', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:50:50', 2, 'TERMINAL_TXT_00004');
INSERT INTO `auth_menu` VALUES (210, 1, 11, 209, '终端信息', '207,209', '终端信息-页面', '', '', '', '', 'views/provider/terminal-info/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:51:16', 2, '');
INSERT INTO `auth_menu` VALUES (211, 1, 11, 207, '运营（服务商）', '207', '交易分析', '', '', '', '/pay-analysis', '', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.193', '2022-09-13 18:52:22', 2, 'TERMINAL_TXT_00091');
INSERT INTO `auth_menu` VALUES (212, 1, 11, 211, '交易分析', '207,211', '实时交易', '', '', '', '/pay-analysis/realtime', 'views/provider/pay-analysis/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-13 18:55:18', 2, 'TERMINAL_TXT_00332');
INSERT INTO `auth_menu` VALUES (213, 1, 11, 211, '交易分析', '207,211', '历史交易', '', '', '', '/pay-analysis/history', 'views/provider/pay-analysis/history/index', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:56:05', 2, 'TERMINAL_TXT_00333');
INSERT INTO `auth_menu` VALUES (214, 1, 11, 211, '交易分析', '207,211', '交易查询', '', '', '', '/pay-analysis/search', 'views/provider/pay-analysis/search/index', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:56:51', 2, 'TERMINAL_TXT_00334');
INSERT INTO `auth_menu` VALUES (215, 1, 11, 207, '运营（服务商）', '207', '终端地图', '', '', '', '/map', '', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:57:24', 2, 'TERMINAL_TXT_00088');
INSERT INTO `auth_menu` VALUES (216, 1, 11, 215, '终端地图', '207,215', '终端地图-页面', '', '', '', '', 'views/provider/map/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '172.20.0.65', '2022-09-13 18:57:46', 2, '');
INSERT INTO `auth_menu` VALUES (217, 1, 10, 206, '营销（服务商）', '206', '默认路由-活动', '', '', '/marketing-activitis', '/', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 14:20:52', 2, '');
INSERT INTO `auth_menu` VALUES (218, 1, 10, 206, '营销（服务商）', '206', '活动管理', '', '', '', '/marketing-activitis', '', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 14:24:32', 2, 'MARKETING_TXT_00027');
INSERT INTO `auth_menu` VALUES (219, 1, 10, 218, '活动管理', '206,218', '默认路由-折扣活动', '', '', '/marketing-activitis/list', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'super', '192.168.0.76', '2022-09-09 14:29:34', 2, '');
INSERT INTO `auth_menu` VALUES (220, 1, 10, 218, '活动管理', '206,218', '折扣活动', '', '', '', '/marketing-activitis/list', 'views/provider/marketing-activities/index', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.70', '2022-09-09 14:34:00', 2, 'MARKETING_TXT_00028');
INSERT INTO `auth_menu` VALUES (221, 1, 10, 218, '活动管理', '206,218', '买赠活动', '', '', '', '/marketing-activitis/list-lucky-activities', 'views/provider/lucky-activities/index', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.74', '2022-09-09 14:36:16', 2, 'MARKETING_TXT_00029');
INSERT INTO `auth_menu` VALUES (222, 1, 10, 218, '活动管理', '206,218', '满减券', '', '', '', '/marketing-activitis/coupon-list', 'views/provider/coupon/index', '', NULL, '', 3, 1, 1, 1, '2022-09-21 09:14:26', 'super', '192.168.0.74', '2022-09-09 14:37:37', 2, 'MARKETING_TXT_00050');
INSERT INTO `auth_menu` VALUES (223, 1, 10, 206, '营销（服务商）', '206', '数据中心', '', '', '', '/data-center', '', '', NULL, '', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-09 17:47:08', 2, 'MARKETING_TXT_00030');
INSERT INTO `auth_menu` VALUES (224, 1, 10, 223, '数据中心', '206,223', '默认路由-实时数据', '', '', '/data-center/realtime', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.76', '2022-09-09 17:56:00', 2, '');
INSERT INTO `auth_menu` VALUES (225, 1, 10, 223, '数据中心', '206,223', '实时数据', '', '', '', '/data-center/realtime', 'views/provider/data-center/realtime/index', '', 'GET', 'icon_shiyongwendang', 1, 1, 1, 1, '2022-10-27 11:28:19', 'super_admin', '124.128.97.210', '2022-09-09 17:58:49', 2, 'MARKETING_TXT_00031');
INSERT INTO `auth_menu` VALUES (226, 1, 10, 223, '数据中心', '206,223', '历史数据', '', '', '', '/data-center/history', 'views/provider/data-center/history/index', '', 'GET', '', 2, 1, 1, 1, '2022-10-27 11:28:52', 'super_admin', '124.128.97.210', '2022-09-09 17:59:28', 2, 'MARKETING_TXT_00032');
INSERT INTO `auth_menu` VALUES (227, 1, 12, 0, '', '', 'SASS-COSJP-Provider', '', '', '', '', '', '', NULL, '', 0, 1, 2, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-19 10:41:45', 2, '');
INSERT INTO `auth_menu` VALUES (228, 12, 12, 227, 'SASS-COSJP-Provider', '227', '运营', '', '', '', '/app-terminal-center', '', '', NULL, 'Platform', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-19 10:52:52', 2, 'COMMON_TXT_00049');
INSERT INTO `auth_menu` VALUES (229, 12, 12, 228, '运营', '227,228', '运营子项目页面', '', '', '', '', 'views/platform/terminal', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-19 10:54:44', 2, 'COMMON_TXT_00049');
INSERT INTO `auth_menu` VALUES (230, 12, 12, 227, 'SASS-COSJP-Provider', '227', '营销', '', '', '', '/app-marketing', '', '', NULL, 'Promotion', 2, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.70', '2022-09-19 10:55:12', 2, 'COMMON_TXT_00050');
INSERT INTO `auth_menu` VALUES (231, 12, 12, 230, '营销', '227,230', '营销子项目页面', '', '', '', '', 'views/platform/marketing', '', NULL, '', 1, 1, 1, 1, '2022-09-21 09:14:26', 'dev_test_account', '192.168.0.74', '2022-09-19 10:55:40', 2, 'COMMON_TXT_00050');
INSERT INTO `auth_menu` VALUES (232, 3, 3, 154, '角色管理', '151,154', '角色管理-角色权限绑定', '', '', '', '', '', 'gac/v1/sso/permission/create', 'POST', '', 0, 3, 2, 1, '0000-00-00 00:00:00', 'dev_test_account', '172.20.0.193', '2022-09-19 14:21:15', 2, '');
INSERT INTO `auth_menu` VALUES (233, 3, 3, 154, '角色管理', '151,154', '角色管理-服务商角色权限查询', '', '', '', '', '', 'gac/v1/sso/permission/query', 'POST', '', 0, 3, 2, 1, '0000-00-00 00:00:00', 'dev_test_account', '172.20.0.193', '2022-09-19 14:21:52', 2, '');
INSERT INTO `auth_menu` VALUES (234, 1, 1, 32, '服务商账户', '1,4,32', '服务商下拉列表', '', '', '', '', '', 'gac/v1/admin/provd/provider/list', 'GET', '', 0, 3, 2, 1, '2022-09-21 17:53:31', 'dev_test_account', '172.20.0.193', '2022-09-20 11:32:11', 2, '');
INSERT INTO `auth_menu` VALUES (235, 1, 1, 32, '服务商账户', '1,4,32', '重置密码', '', '', '', '', '', 'gac/v1/admin/provd/provider/reset_password', 'POST', '', 0, 3, 2, 1, '2022-09-21 17:53:28', 'dev_test_account', '192.168.0.74', '2022-09-20 11:39:34', 2, '');
INSERT INTO `auth_menu` VALUES (236, 1, 1, 33, '企业账户', '1,4,33', '重置密码', '', '', '', '', '', 'gac/v1/admin/enterprise/accounts/reset_password', 'POST', '', 0, 3, 2, 1, '2022-09-21 17:53:36', 'dev_test_account', '172.20.0.193', '2022-09-20 11:41:06', 2, '');
INSERT INTO `auth_menu` VALUES (237, 1, 1, 31, '管理员账户', '1,4,31', '重置密码', '', '', '', '', '', 'gac/v1/admin/accounts/reset_password', 'POST', '', 0, 3, 2, 1, '2022-09-21 17:53:40', 'dev_test_account', '172.20.0.193', '2022-09-20 11:41:41', 2, '');
INSERT INTO `auth_menu` VALUES (238, 1, 1, 13, '管理员角色', '1,3,13', '管理员角色查询菜单列表', '', '', '', '', '', 'gac/v1/admin/permission/menus', 'POST', '', 0, 3, 2, 1, '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210', '2022-09-22 11:13:33', 2, '');
INSERT INTO `auth_menu` VALUES (239, 1, 1, 14, '企业角色', '1,3,14', '企业角色查询菜单列表', '', '', '', '', '', 'gac/v1/admin/staff_permission/menus', 'POST', '', 0, 3, 2, 1, '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210', '2022-09-22 11:13:58', 2, '');
INSERT INTO `auth_menu` VALUES (240, 1, 1, 15, '服务商角色', '1,3,15', '服务商角色查询菜单列表', '', '', '', '', '', 'gac/v1/admin/service_permission/menus', 'POST', '', 0, 3, 2, 1, '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210', '2022-09-22 11:14:21', 2, '');
INSERT INTO `auth_menu` VALUES (241, 2, 2, 64, 'SAAS-COSJP', '0,64', '工单', '', '', '', '/app-workorder', '', '', 'GET', 'Document', 6, 1, 1, 1, '2022-10-12 12:10:04', 'super_admin', '124.128.97.210', '2022-09-22 16:48:49', 2, 'WORKORDER_TXT_00008');
INSERT INTO `auth_menu` VALUES (242, 2, 2, 241, '工单', '0,64,241', '工单子系统页面', '', '', '', '', 'views/platform/workorder', '', 'GET', '', 1, 1, 1, 1, '2022-10-12 12:10:24', 'super_admin', '124.128.97.210', '2022-09-22 16:49:49', 2, 'WORKORDER_TXT_00008');
INSERT INTO `auth_menu` VALUES (243, 6, 6, 127, '', '127', '通知实例', '', '', '', '/notify_instance', '', '', 'GET', 'Tools', 4, 1, 1, 1, '2022-10-18 10:32:54', 'super_admin', '124.128.97.210', '2022-10-12 14:52:59', 2, '');
INSERT INTO `auth_menu` VALUES (244, 6, 6, 243, '通知实例', '127,243', '通知实例', '', '', '', '', 'views/platform/warning/notifyInstance/index', '', 'GET', '', 1, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '124.128.97.210', '2022-10-12 14:53:27', 2, '');
INSERT INTO `auth_menu` VALUES (245, 1, 2, 64, 'SAAS-COSJP', '0,64', 'POC', '', '', '', '/app-poc-dashboard', '', '', 'GET', 'Bicycle', 8, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-14 17:24:19', 2, 'POC');
INSERT INTO `auth_menu` VALUES (246, 1, 2, 245, 'POC', '0,64,245', 'POC', '', '', '', '', 'views/platform/poc-dashboard', '', 'GET', '', 1, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-14 17:25:08', 2, '');
INSERT INTO `auth_menu` VALUES (247, 1, 10, 223, '数据中心', '206,223', '交易查询', '', '', '', 'order-list', 'views/provider/data-center/order-list/index', '', 'GET', '', 3, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-18 14:44:57', 2, 'TERMINAL_TXT_00334');
INSERT INTO `auth_menu` VALUES (248, 1, 5, 119, '数据中心', '103,119', '交易查询', '', '', '', '/data-center/order-list', 'views/platform/data-center/order-list/index', '', 'GET', '', 3, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-18 14:45:56', 2, 'TERMINAL_TXT_00334');
INSERT INTO `auth_menu` VALUES (249, 1, 5, 103, '营销子系统', '103', '服务商专属', '', '', '', '/exclusive', '', '', 'GET', '', 5, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-18 14:48:27', 2, '服务商专属');
INSERT INTO `auth_menu` VALUES (250, 1, 5, 249, '服务商专属', '103,249', '默认页面', '', '', '', '', 'views/platform/exclusive/index', '', 'GET', '', 1, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '60.208.132.34', '2022-11-18 14:48:58', 2, '');
INSERT INTO `auth_menu` VALUES (251, 1, 4, 81, '交易分析', '77,81', '默认页面', '', '', '/pay-analysis/realtime', '', '', '', 'GET', '', 0, 1, 2, 1, '0000-00-00 00:00:00', 'super_admin', '39.98.233.68', '2022-11-23 12:18:20', 2, '');
INSERT INTO `auth_menu` VALUES (252, 1, 4, 81, '交易分析', '77,81', '历史交易', '', '', '', '/pay-analysis/history', 'views/platform/pay-analysis/history/index', '', 'GET', '', 2, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '39.98.233.68', '2022-11-23 12:19:54', 2, 'TERMINAL_TXT_00333');
INSERT INTO `auth_menu` VALUES (253, 1, 4, 81, '交易分析', '77,81', '交易查询', '', '', '', '/pay-analysis/query', 'views/platform/pay-analysis/query/index', '', 'GET', '', 3, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '39.98.233.68', '2022-11-23 12:20:45', 2, 'TERMINAL_TXT_00334');
INSERT INTO `auth_menu` VALUES (254, 1, 4, 81, '交易分析', '77,81', '财务对账', '', '', '', '/pay-analysis/finance', 'views/platform/pay-analysis/finance/index', '', 'GET', '', 4, 1, 1, 1, '0000-00-00 00:00:00', 'super_admin', '39.98.233.68', '2022-11-23 12:21:22', 2, 'TERMINAL_TXT_00379');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `role_pk` int(11) NOT NULL COMMENT '角色Id',
  `permission_ids` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单Id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：禁用 3：删除',
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字段权限补充',
  `created_time` timestamp(0) NULL DEFAULT NULL,
  `updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者Ip',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-09-19 16:31:16', '2022-09-22 11:27:11', 'dev_test_account', '192.168.0.70');
INSERT INTO `auth_permission` VALUES (2, 5, '151,152,153,154,155,156,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,70,73', 0, 1, '', '2022-09-19 17:13:56', '2022-09-21 10:41:27', 'dev_test_account', '192.168.0.74');
INSERT INTO `auth_permission` VALUES (3, 3, '1,13,14,15,16,17,18,19,196,197,198,199,20,200,201,202,203,204,205,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49,5,50,53,54,55,56,57,7', 0, 3, '', '2022-09-20 10:14:22', '2022-09-21 12:35:00', 'gactest', '192.168.0.70');
INSERT INTO `auth_permission` VALUES (4, 7, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 1, '', '2022-09-20 10:20:18', '2022-09-21 10:41:30', 'gactest', '192.168.0.70');
INSERT INTO `auth_permission` VALUES (5, 2, '1,10,11,12,13,14,15,16,17,18,19,196,197,198,199,2,20,200,201,202,203,204,205,21,22,23,234,235,236,237,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49,5,50,53,54,55,56,57,58,59,6,60,61,62,63,7,8,9', 0, 3, '', '2022-09-20 11:42:05', '2022-09-22 11:14:41', 'dev_test_account', '172.20.0.193');
INSERT INTO `auth_permission` VALUES (6, 41, '151,152,153,154,155,156,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,70,73', 0, 3, '', '2022-09-20 12:14:18', '2022-09-22 11:31:35', 'dev_test_account', '192.168.0.70');
INSERT INTO `auth_permission` VALUES (47, 3, '1,13,14,15,16,17,18,19,196,197,198,199,20,200,201,202,203,204,205,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49,50,7', 0, 3, '', '2022-09-21 12:35:00', '2022-09-21 12:59:32', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (48, 3, '1,15,196,197,198,199,202,203,26,27,28,29,3,30,31,32,35,36,37,38,39,4,40,41,42,43,44,7', 0, 3, '', '2022-09-21 12:59:33', '2022-09-21 12:59:59', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (49, 3, '1,15,196,197,198,199,202,203,26,27,28,29,3,30,32,4,40,41,42,43,44,7', 0, 3, '', '2022-09-21 12:59:59', '2022-09-21 13:07:54', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (50, 43, '1,15,196,202,203,234,235,26,27,28,29,3,30,32,4,40,41,42,43,44', 0, 3, '', '2022-09-21 13:02:15', '2022-09-21 13:15:18', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (51, 3, '1,13,14,15,16,17,18,19,196,20,200,201,202,203,204,205,21,22,23,234,236,237,24,25,26,27,28,29,3,30,31,32,33,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-21 13:07:55', '2022-09-21 14:46:05', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (52, 43, '1,15,196,202,203,234,235,26,27,28,29,3,30,32,4,40,41,42,43,44', 0, 3, '', '2022-09-21 13:15:18', '2022-09-21 13:18:32', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (53, 43, '1,196,234,235,3,32,4,40,41,42,43,44', 0, 3, '', '2022-09-21 13:18:33', '2022-09-22 11:51:11', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (54, 3, '1,13,14,15,16,17,18,19,196,20,200,201,202,203,204,205,21,22,23,234,236,237,24,25,26,27,28,29,3,30,31,32,33,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-21 14:46:05', '2022-09-21 14:49:55', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (55, 3, '1,11,13,14,15,16,17,18,19,196,2,20,200,201,202,203,204,205,21,22,23,234,236,237,24,25,26,27,28,29,3,30,31,32,33,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-21 14:49:55', '2022-09-22 11:14:52', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (56, 2, '1,10,11,12,13,14,15,16,17,18,19,196,197,198,199,2,20,200,201,202,203,204,205,21,22,23,234,235,236,237,238,239,24,240,25,26,27,28,29,3,30,31,32,33,34,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49,5,50,53,54,55,56,57,58,59,6,60,61,62,63,7,8,9', 0, 1, '', '2022-09-22 11:14:42', '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (57, 3, '1,11,13,14,15,16,17,18,19,196,2,20,200,201,202,203,204,205,21,22,23,234,236,237,238,239,24,240,25,26,27,28,29,3,30,31,32,33,35,36,37,38,39,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-22 11:14:53', '2022-09-22 11:42:08', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (58, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-09-22 11:27:12', '2022-09-22 12:12:36', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (59, 41, '151,152,153,154,155,156,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,70,73', 0, 3, '', '2022-09-22 11:31:36', '2022-09-22 11:34:00', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (60, 41, '151,156,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231', 0, 3, '', '2022-09-22 11:34:00', '2022-10-27 11:29:29', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (61, 3, '1,11,14,15,196,2,202,203,204,205,21,22,23,234,236,239,24,240,25,26,27,28,29,3,30,32,33,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-22 11:42:09', '2022-09-22 11:45:05', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (62, 3, '1,14,15,196,202,203,204,205,21,22,23,234,236,239,24,240,25,26,27,28,29,3,30,32,33,4,40,41,42,43,44,45,46,47,48,49', 0, 3, '', '2022-09-22 11:45:06', '2022-09-22 11:50:24', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (63, 3, '1,196,234,236,32,33,4,40,41,42,43,44,45,46,47,48,49', 0, 1, '', '2022-09-22 11:50:25', '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (64, 43, '1,196,234,235,32,4,40,41,42,43,44', 0, 1, '', '2022-09-22 11:51:12', '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (65, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-09-22 12:12:37', '2022-09-22 16:54:50', 'dev_test_account', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (66, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-09-22 16:54:51', '2022-09-22 16:55:03', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (67, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-09-22 16:55:04', '2022-10-12 12:10:49', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (68, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-10-12 12:10:50', '2022-10-12 14:53:43', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (69, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-10-12 14:53:43', '2022-11-14 17:25:25', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (70, 41, '151,156,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231', 0, 3, '', '2022-10-27 11:29:29', '2022-10-27 11:43:03', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (71, 41, '151,156,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231', 0, 3, '', '2022-10-27 11:43:04', '2022-11-23 14:44:37', 'super_admin', '124.128.97.210');
INSERT INTO `auth_permission` VALUES (72, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-11-14 17:25:26', '2022-11-18 14:46:08', 'super_admin', '60.208.132.34');
INSERT INTO `auth_permission` VALUES (73, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,248,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-11-18 14:46:09', '2022-11-18 14:46:40', 'super_admin', '60.208.132.34');
INSERT INTO `auth_permission` VALUES (74, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-11-18 14:46:41', '2022-11-18 14:49:27', 'super_admin', '60.208.132.34');
INSERT INTO `auth_permission` VALUES (75, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,249,250,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-11-18 14:49:27', '2022-11-23 12:24:03', 'super_admin', '60.208.132.34');
INSERT INTO `auth_permission` VALUES (76, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,249,250,251,252,253,254,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 3, '', '2022-11-23 12:24:03', '2022-11-23 12:33:50', 'super_admin', '39.98.233.68');
INSERT INTO `auth_permission` VALUES (77, 10, '103,104,110,111,112,113,114,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,193,241,242,243,244,245,246,248,249,250,251,252,253,254,64,65,66,67,68,69,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94', 0, 1, '', '2022-11-23 12:33:51', '0000-00-00 00:00:00', 'super_admin', '39.98.233.68');
INSERT INTO `auth_permission` VALUES (78, 41, '151,156,194,195,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,247', 0, 1, '', '2022-11-23 14:44:37', '0000-00-00 00:00:00', 'super_admin', '111.17.91.155');

-- ----------------------------
-- Table structure for auth_permission_subclass
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission_subclass`;
CREATE TABLE `auth_permission_subclass`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `sub_role_pk` int(11) NOT NULL COMMENT '子账号角色Id',
  `permission_ids` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单Id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：禁用 3：删除',
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字段权限补充',
  `created_time` timestamp(0) NULL DEFAULT NULL,
  `updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者Ip',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字账号角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission_subclass
-- ----------------------------

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色代号',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:启用 2：禁用 3：删除',
  `type` tinyint(4) NOT NULL COMMENT '角色类别 1:gac管理员 2：sass员工 3：sass服务商 ',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建Ip',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (1, '主管理员', 'admin', 1, 0, '主管理', '2022-08-28 09:57:07', '2022-08-31 16:56:58', 'admin', '');
INSERT INTO `auth_role` VALUES (2, '集团管理员', '', 1, 1, '集团管理员', '2022-08-23 16:27:17', '2022-09-16 13:42:30', '', '127.0.0.1');
INSERT INTO `auth_role` VALUES (3, '派盟管理员', '', 1, 1, '派盟管理员', '2022-08-27 16:13:59', '2022-09-21 12:34:05', 'dev_test_account', '172.20.0.193');
INSERT INTO `auth_role` VALUES (4, '意锐管理员', '', 1, 1, '意锐管理员', '2022-09-02 15:18:38', '2022-09-16 13:42:44', 'dev_test_account', '172.20.0.65');
INSERT INTO `auth_role` VALUES (5, '基础服务商', '', 3, 3, 'SAAS平台基础配置', '2022-08-30 19:39:31', '2022-09-21 14:47:14', '', '192.168.0.70');
INSERT INTO `auth_role` VALUES (6, 'Director', '', 1, 2, '董事会&Board of Directors ', '2022-09-05 23:47:02', '2022-09-16 13:42:55', 'mao', '');
INSERT INTO `auth_role` VALUES (7, 'CEO', '', 1, 2, '首席执行官&Chief Executive Officer', '2022-09-05 23:46:53', '2022-09-16 13:42:57', 'mao', '');
INSERT INTO `auth_role` VALUES (8, 'CTO', '', 1, 2, '首席技术官&Chief Technology Officer', '2022-09-07 13:28:31', '2022-09-16 13:42:59', 'dev_test_account', '192.168.0.74');
INSERT INTO `auth_role` VALUES (9, 'CIO', '', 1, 2, '首席信息官&Chief Information Officer', '2022-09-07 13:29:19', '2022-09-16 13:43:00', 'dev_test_account', '192.168.0.74');
INSERT INTO `auth_role` VALUES (10, 'Employee', '', 1, 2, '雇员&Employee and ER', '2022-09-07 13:33:52', '2022-09-16 13:43:03', 'dev_test_account', '172.20.0.65');
INSERT INTO `auth_role` VALUES (41, '服务商', '', 1, 3, '', '2022-09-19 14:29:57', '0000-00-00 00:00:00', 'gactest', '172.20.0.193');
INSERT INTO `auth_role` VALUES (42, '管理员', '', 3, 1, '', '2022-09-19 14:30:06', '2022-09-21 12:34:32', 'gactest', '172.20.0.193');
INSERT INTO `auth_role` VALUES (43, '服务商管理员', '', 1, 1, '', '2022-09-21 13:01:48', '0000-00-00 00:00:00', 'dev_test_account', '124.128.97.210');

-- ----------------------------
-- Table structure for auth_role_subclass
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_subclass`;
CREATE TABLE `auth_role_subclass`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sso账号id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色代号',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:启用 2：禁用 3：删除',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '角色类别 1:服务商子账号',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建Ip',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role_subclass
-- ----------------------------

-- ----------------------------
-- Table structure for dc_aiot_customer
-- ----------------------------
DROP TABLE IF EXISTS `dc_aiot_customer`;
CREATE TABLE `dc_aiot_customer`  (
  `id` bigint(20) NOT NULL COMMENT '服务商id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商名称',
  `shortName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商简称',
  `regCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商唯一标识码',
  `type` int(11) NULL DEFAULT NULL COMMENT '服务商类型1：无开发能力服务商',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `addressDetail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0-禁用，1-启用',
  `isTest` tinyint(1) NULL DEFAULT 0 COMMENT '是否为测试，1测试服务商',
  `createdDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务商' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dc_aiot_customer
-- ----------------------------
INSERT INTO `dc_aiot_customer` VALUES (63, 'JapanTest', NULL, 'C615017502119404992', 4, 'Lily', '', '北京', '630179443@qq.com', 1, 1, '2020-08-13 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (75, 'JP支付矩阵', NULL, 'C616845569945571008', 1, '郭子', '', '中关村创新中心', '929181959@qq.com', 1, 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (81, 'JapanTest3', NULL, 'C620506619255992064', 1, 'JapanTest3', '', '贵州', '65@2334', 1, 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (83, 'jpaiot01', NULL, 'C644702803770649856', 1, '丰田', '', '中关村创新中心', '17712752946@qq.com', 1, 1, '2020-11-03 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (85, 'aiot_jp_01', NULL, 'C644745871360579456', 1, 'yjx', '', '北海道', '1@qq.com', 1, 1, '2022-12-06 00:00:09', '2022-12-06 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (87, '北京意锐新创科技有限公司', NULL, 'C251344816792442048', 1, '张伟鹏', '13426130328', '1', '123456789@sina.com', 1, 1, '2020-11-03 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (97, 'JP测试服务商', NULL, 'C353805268609290880', 1, 'jptest', '15731659260', '日本济州岛', '1665987439@qq.com', 1, 1, '2020-11-03 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (99, 'INSPIRY日本社内', NULL, 'C356385684133590528', 1, 'BEN', '13911518174', 'TOYO', 'ben@inspiry.jp', 1, 1, '2022-01-20 21:23:37', '2022-01-20 21:23:37');
INSERT INTO `dc_aiot_customer` VALUES (111, 'ISC', NULL, 'C467484593390048448', 1, '陳明財', '12345678', '東京都千代田神田小川町3-1　BMビル4FAX', 'chen.mingcai@intasect.co.jp', 1, 1, '2020-11-03 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (119, '銭方日本', NULL, 'C559555573014488832', 1, 'A', '123456', 'a', 'a@qf.jp', 1, 1, '2020-11-03 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (149, 'aiot_jp_02', NULL, 'C678109442268077056', 1, 'yjx001', '', '济南', '1027763684@qq.com', 1, 1, '1970-01-01 00:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (157, '山东派盟商用试点', NULL, 'C696625253097964864', 1, '国栋', '', 'xiaozhen', '15717718800@qq.com', 1, 1, '2021-03-26 08:00:00', '1970-01-01 00:00:00');
INSERT INTO `dc_aiot_customer` VALUES (159, 'jpzhang', NULL, 'C709245920822240832', 1, 'zhanggd', '', '互联网中心', 'zhangguodong@inspiry.cn', 1, 1, '2021-04-30 08:01:23', '2021-04-30 08:01:23');
INSERT INTO `dc_aiot_customer` VALUES (161, 'om02fan', NULL, 'C719100115738119040', 1, 'testfan', '', '贵州', '65@2334', 1, 1, '2021-05-27 08:01:14', '2021-05-27 08:01:15');
INSERT INTO `dc_aiot_customer` VALUES (169, '即时退款服务商', NULL, 'C751308525353608384', 1, 'lisa', '', 'Green Lake Bay', '12345@11', 1, 1, '2022-05-14 00:01:14', '2022-05-14 00:01:14');
INSERT INTO `dc_aiot_customer` VALUES (171, '月结活动服务商', NULL, 'C751318619570761024', 1, '赵轩', '', '山东运营', '543@11', 1, 1, '2022-03-24 00:01:14', '2022-03-24 00:01:14');
INSERT INTO `dc_aiot_customer` VALUES (173, '7700自动化测试服务商监听', NULL, 'C756387806574548096', 1, 'auto7700', '', 'v', '526@51', 1, 1, '2021-09-07 08:00:09', '2021-09-07 08:00:09');
INSERT INTO `dc_aiot_customer` VALUES (181, 'BJOM7700', NULL, 'C768644246689778624', 1, 'zhangguodong', '', '北京互联网创新中心', '691322222@qq.com', 1, 1, '2022-11-25 00:00:10', '2022-11-25 00:00:10');
INSERT INTO `dc_aiot_customer` VALUES (185, '济南OM测试服务商A', NULL, 'C768685405434571328', 1, '运营', '', '山东济南', 'yueguangniwu@163.com', 1, 1, '2022-03-01 00:01:23', '2022-03-01 00:01:23');
INSERT INTO `dc_aiot_customer` VALUES (187, '济南OM测试服务商B', NULL, 'C768988781384231488', 1, '常桂果', '', '山东济南', 'yueguangniwu@163.com', 1, 1, '2021-10-12 08:00:13', '2021-10-12 08:00:14');
INSERT INTO `dc_aiot_customer` VALUES (189, 'BJOM7700_2', NULL, 'C771970866442557696', 1, 'zhangguodong', '', 'yirui', '32157@qq.com', 1, 1, '2022-04-26 00:01:14', '2022-04-26 00:01:14');
INSERT INTO `dc_aiot_customer` VALUES (195, '山东OMtest', NULL, 'C777381136749021440', 1, '运营', '', '山东济南运营', '999999999999@112', 1, 1, '2022-02-27 00:01:23', '2022-02-27 00:01:23');
INSERT INTO `dc_aiot_customer` VALUES (197, '山东派盟研发部', NULL, 'C786844951276455552', 1, '小花', '', '山东派盟', '1222@qq.com', 1, 1, '2021-11-30 08:00:01', '2021-11-30 08:00:01');
INSERT INTO `dc_aiot_customer` VALUES (201, 'Inspiry&東京会社週間販売機', NULL, 'C802783609274549248', 1, '周浩之', '', '日本意锐营业', '12345@11', 1, 1, '2022-01-14 00:06:24', '2022-01-14 00:06:24');
INSERT INTO `dc_aiot_customer` VALUES (203, 'アマネ株式会社', NULL, 'C803118720159381952', 1, '安达', '', '日本意锐营业', 'amane_H@hotmail.com', 1, 1, '2022-01-15 00:06:23', '2022-01-15 00:06:23');
INSERT INTO `dc_aiot_customer` VALUES (205, 'SDベンディング', NULL, 'C805294689117710720', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 1, '2022-01-20 21:23:37', '2022-01-20 21:23:37');
INSERT INTO `dc_aiot_customer` VALUES (207, 'Netstars', NULL, 'C805360008511599808', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 1, '2022-01-20 21:23:37', '2022-01-20 21:23:37');
INSERT INTO `dc_aiot_customer` VALUES (211, 'ToyoVending', NULL, 'C805366958048144960', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 1, '2022-01-20 21:23:37', '2022-01-20 21:23:37');
INSERT INTO `dc_aiot_customer` VALUES (213, 'inspayjp2', NULL, 'C805369263014872768', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 1, '2022-08-11 00:01:14', '2022-08-11 00:01:14');
INSERT INTO `dc_aiot_customer` VALUES (215, '株式会社SDベンディング', NULL, 'C807765725172156416', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 0, '2022-03-08 00:01:23', '2022-03-08 00:01:23');
INSERT INTO `dc_aiot_customer` VALUES (216, 'INSPIRYJAPANキャンペーン専用', NULL, 'C837479223569031424', 1, '阿桢', '', '山东济南运营', '12345@11', 1, 0, '2022-06-17 00:01:12', '2022-06-17 00:01:12');
INSERT INTO `dc_aiot_customer` VALUES (217, '金井自動販売', NULL, 'C855694154546463168', 1, '安達友一', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'adachi@inspiry.jp', 1, 0, '2022-12-01 00:00:09', '2022-12-01 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (218, 'autotest', NULL, '', 1, '老铁', '', '13716063119', 'fanyingying@inspriy.cn', 1, 1, '2022-08-26 16:52:59', '2022-08-26 16:52:59');
INSERT INTO `dc_aiot_customer` VALUES (219, '7700lite', NULL, 'C885418319378774784', 1, 'zhang', '', 'beijingyirui', '691398273@qq.com', 1, 1, '2022-08-30 00:01:13', '2022-08-30 00:01:13');
INSERT INTO `dc_aiot_customer` VALUES (220, 'INSPIRYJAPAN演示専用	', NULL, 'C886052362636063616', 1, 'zhanggd', '', 'yirui', '691398273@qq.com', 1, 1, '2022-09-03 00:01:08', '2022-09-03 00:01:08');
INSERT INTO `dc_aiot_customer` VALUES (221, 'サンポッカサービス', NULL, 'C886523598035858880', 1, '佐々木　祐輔', '', '愛知県名古屋市守山区小幡宮ノ腰8-21', 'adachi@qq.com', 1, 0, '2022-12-01 00:00:09', '2022-12-01 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (223, 'クリエイト開発', NULL, 'C900990240251687040', 1, '大當　鉄也', '', '〒807-0825 福岡県北九州市八幡西区折尾4丁目10-8', 'adachi1011@qq.com', 1, 0, '2022-12-01 00:00:09', '2022-12-01 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (224, 'プロダクトオブタイム', NULL, 'C905610175840324224', 1, '野頼', '', '東京都千代田区丸の内1-9-1 東京駅 グランスタ B1F', 'adachi1024@qq.com', 1, 0, '2022-12-01 00:00:09', '2022-12-01 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (225, '鲁班科技', NULL, 'C905972964311983552', 1, 'ben', '', 'yirui', '13911518174@qq.com', 1, 1, '2022-10-26 00:01:09', '2022-10-26 00:01:09');
INSERT INTO `dc_aiot_customer` VALUES (226, '株式会社Halloween', NULL, 'C908137491450450176', 1, '刘健', '', '新川本社', 'liujian@gmail.com', 1, 1, '2022-10-31 11:58:07', '2022-10-31 11:58:07');
INSERT INTO `dc_aiot_customer` VALUES (227, 'INSPIRYJAPAN	', NULL, 'C910664736482371776', 1, 'INSPIRYJAPAN', '', '東京都中央区新川1丁目16-4 VORT茅場町イースト５F', 'A1000@inspiry.jp', 1, 0, '2022-11-08 00:00:07', '2022-11-08 00:00:07');
INSERT INTO `dc_aiot_customer` VALUES (228, 'A1000OMtest', NULL, 'C911762978944611008', 1, '阿桢', '18338097753', '山东派盟', '123@yirui', 1, 1, '2022-11-11 00:00:09', '2022-11-11 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (229, 'SLICK', NULL, 'C919070694376835008', 1, '森田', '088-854-7950', '高知県南国市岡豊町八幡784−3', 'office@slick-inc.jp', 1, 0, '2022-12-01 00:00:09', '2022-12-01 00:00:09');
INSERT INTO `dc_aiot_customer` VALUES (231, 'リージョナルマーケティング', NULL, 'C921237927787931008', 1, '小野　英', '011-215-1002', '〒060-0062札幌市中央区南2条西5丁目23番1号', 'ono@ezoclub.jp', 1, 0, '2022-12-06 18:20:01', '2022-12-06 18:20:01');
INSERT INTO `dc_aiot_customer` VALUES (232, '大王亭', NULL, 'C921253651545485056', 1, '安達友一', '090-4955-0332', '未知', 'adachi1206@gmail.com', 1, 0, '2022-12-06 18:20:01', '2022-12-06 18:20:01');
INSERT INTO `dc_aiot_customer` VALUES (235, 'ジラック', NULL, 'C921624525375659520', 1, '亀山', '0575-28-2600', '501-3954　岐阜県関市千疋1061-19', 'kameyama_yuji@bchiko.jp', 1, 0, '2022-12-07 18:30:09', '2022-12-07 18:30:09');
INSERT INTO `dc_aiot_customer` VALUES (236, 'リフェット', NULL, 'C923808308702899840', 1, '大屋　毅', '03-5447-7123', '150-0012　東京都渋谷区広尾1-11-4 共立ビル301', 'adachi1213@gmail.com', 1, 0, '2022-12-13 17:00:09', '2022-12-13 17:00:09');

-- ----------------------------
-- Table structure for log_system
-- ----------------------------
DROP TABLE IF EXISTS `log_system`;
CREATE TABLE `log_system`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `org_pk` int(11) NULL DEFAULT 0 COMMENT '组织',
  `app_pk` int(11) NULL DEFAULT NULL COMMENT '应用',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块',
  `action` enum('insert','update','delete','login','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'other' COMMENT '行为',
  `action_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人',
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '记录',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'ip',
  PRIMARY KEY (`pk`) USING BTREE,
  INDEX `org_pk`(`org_pk`) USING BTREE,
  INDEX `app_pk`(`app_pk`) USING BTREE,
  INDEX `module_action_x`(`module`, `action`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1525 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_system
-- ----------------------------
INSERT INTO `log_system` VALUES (1, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":1}', '2022-09-20 15:44:20', '172.20.0.193');
INSERT INTO `log_system` VALUES (2, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":1}', '2022-09-20 15:44:26', '172.20.0.193');
INSERT INTO `log_system` VALUES (3, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":1}', '2022-09-20 15:44:34', '172.20.0.193');
INSERT INTO `log_system` VALUES (4, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 10:33:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (5, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 10:33:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (6, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 10:36:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (7, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 11:30:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (8, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 11:30:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (9, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 11:31:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (10, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 12:31:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (11, 1, 1, 'role', 'update', 'dev_test001', '禁用角色:{\"pk\":3,\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 12:34:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (12, 1, 1, 'role', 'delete', 'dev_test001', '删除角色:{\"pk\":42,\"status\":3,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 12:34:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (13, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"16,17,18,19,20,200,201,21,22,23,24,25,204,205,26,27,28,29,30,202,203,196,35,36,37,38,39,45,46,47,48,49,40,41,42,43,44,50,197,198,199,13,14,15,34,3,7,31,32,33,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 12:35:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (14, 1, 1, 'account', 'insert', 'dev_test001', '添加角色:{\"account\":\"paimeng\",\"account_name\":\"山东派盟\",\"password\":\"a123456\",\"role_pk\":3,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-21 12:36:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (15, 1, 1, 'account', 'insert', 'dev_test001', '添加角色:{\"account\":\"zhangguozhen\",\"account_name\":\"张国桢\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-21 12:36:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (16, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 12:38:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (17, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 12:39:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (18, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 12:40:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (19, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"35,36,37,38,39,40,41,42,43,44,197,198,199,7,15,26,27,28,29,30,202,203,196,31,32,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 12:59:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (20, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"26,27,28,29,30,202,203,196,40,41,42,43,44,197,198,199,15,7,32,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 12:59:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (21, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:00:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (22, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:01:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (23, 1, 1, 'role', 'insert', 'dev_test001', '添加角色:{\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:01:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (24, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":43,\"permission_ids\":\"15,26,27,28,29,30,202,203,196,32,40,41,42,43,44,234,235,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:02:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (25, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (26, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (27, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (28, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (29, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (30, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (31, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (32, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":43,\"name\":\"服务商管理员\",\"code\":\"\",\"type\":1,\"status\":1,\"remark\":\"服务商管理\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:04:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (33, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"26,27,28,29,30,202,203,196,40,41,42,43,44,15,31,35,36,37,38,39,237,33,45,46,47,48,49,236,234,13,16,17,18,19,20,200,201,14,21,22,23,24,25,204,205,3,32,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:07:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (34, 1, 1, 'account', 'insert', 'dev_test001', '添加角色:{\"account\":\"provider\",\"account_name\":\"服务商运营\",\"password\":\"a123456\",\"role_pk\":43,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-21 13:09:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (35, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"provider\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:09:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (36, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:10:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (37, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":43,\"permission_ids\":\"26,27,28,29,30,202,203,196,40,41,42,43,44,234,235,15,32,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:15:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (38, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"provider\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:15:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (39, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:18:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (40, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":43,\"permission_ids\":\"196,40,41,42,43,44,234,235,32,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:18:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (41, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"provider\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:18:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (42, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 13:19:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (43, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":196,\"org_pk\":1,\"app_pk\":1,\"parent_pk\":4,\"name\":\"账户管理-角色选项\",\"code\":\"\",\"api_route\":\"gac/v1/admin/role/option\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:21:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (44, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":196,\"org_pk\":1,\"app_pk\":1,\"parent_pk\":4,\"name\":\"账户管理-角色选项\",\"code\":\"\",\"api_route\":\"gac/v1/admin/role/option\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:21:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (45, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":196,\"org_pk\":1,\"app_pk\":1,\"parent_pk\":4,\"name\":\"账户管理-角色选项\",\"code\":\"\",\"api_route\":\"gac/v1/admin/role/option\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 13:21:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (46, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account1\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:12:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (47, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:21:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (48, 1, 1, 'account', 'insert', 'dev_test001', '添加角色:{\"account\":\"OMjpchangA\",\"account_name\":\"OMjpchangA\",\"password\":\"abc123\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":185,\"account_id\":\"\"}', '2022-09-21 14:30:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (49, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:32:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (50, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"limeilu\",\"account_name\":\"李美露\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-21 14:33:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (51, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"BJOM7700\",\"account_name\":\"BJOM7700\",\"password\":\"BJOM7700\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":181,\"account_id\":\"\"}', '2022-09-21 14:35:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (52, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:38:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (53, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:43:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (54, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:44:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (55, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:45:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (56, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"16,17,18,19,20,200,201,21,22,23,24,25,204,205,26,27,28,29,30,202,203,196,35,36,37,38,39,237,45,46,47,48,49,236,40,41,42,43,44,234,13,14,15,31,33,3,32,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 14:46:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (57, 1, 1, 'role', 'delete', '山东派盟', '删除角色:{\"pk\":5,\"status\":3,\"created_user\":\"paimeng\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 14:47:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (58, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"16,17,18,19,20,200,201,21,22,23,24,25,204,205,26,27,28,29,30,202,203,196,35,36,37,38,39,237,45,46,47,48,49,236,40,41,42,43,44,234,13,14,15,31,33,3,11,32,2,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 14:49:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (59, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:50:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (60, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"Inspiry_SD1\",\"account_name\":\"安達友一\\t\",\"password\":\"Yrd7r6\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":215,\"account_id\":\"\"}', '2022-09-21 14:50:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (61, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:51:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (62, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 14:55:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (63, 1, 1, 'account', 'insert', 'dev_test001', '添加角色:{\"account\":\"Inspiry_Kanai\",\"account_name\":\"安達友一\\t\",\"password\":\"ux170j\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":217,\"account_id\":\"\"}', '2022-09-21 14:56:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (64, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 15:00:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (65, 1, 1, 'account', 'update', '山东派盟', '更新角色:{\"account\":\"Inspiry_SD1\",\"account_name\":\"株式会社SDベンディング\",\"password\":\"\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":0,\"account_id\":\"5bba6a5f397111edb22fee360bed21de\"}', '2022-09-21 15:01:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (66, 1, 1, 'account', 'update', '山东派盟', '更新角色:{\"account\":\"Inspiry_Kanai\",\"account_name\":\"金井自動販売株式会社\",\"password\":\"\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":0,\"account_id\":\"1cbf9735397211edb22fee360bed21de\"}', '2022-09-21 15:01:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (67, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"Inspiry_SUNPOKKA\",\"account_name\":\"サンポッカサービス株式会社\",\"password\":\"f48r32\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":221,\"account_id\":\"\"}', '2022-09-21 15:02:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (68, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-21 15:03:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (69, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"7700khsy\",\"account_name\":\"INSPIRYJAPANキャンペーン専用\",\"password\":\"7700khsy\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":216,\"account_id\":\"\"}', '2022-09-21 15:03:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (70, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"7700jptest\",\"account_name\":\"INSPIRYJAPAN演示専用\",\"password\":\"7700jptest\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":220,\"account_id\":\"\"}', '2022-09-21 15:04:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (71, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":196,\"org_pk\":1,\"app_pk\":1,\"parent_pk\":4,\"name\":\"角色管理-选项\",\"code\":\"\",\"api_route\":\"gac/v1/admin/role/option\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 15:07:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (72, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"inspayjp\",\"account_name\":\"INSPIRY日本社内\",\"password\":\"inspayjp\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":99,\"account_id\":\"\"}', '2022-09-21 15:08:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (73, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 15:37:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (74, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-21 16:44:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (75, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"基础服务商\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:27:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (76, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"基础服务商\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:27:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (77, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"基础服务商\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:27:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (78, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"基础服务商\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:28:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (79, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"基础服务商\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:28:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (80, 1, 1, 'role', 'update', 'dev_test001', '更新角色:{\"pk\":41,\"name\":\"服务商1\",\"code\":\"\",\"type\":3,\"status\":1,\"remark\":\"服务商1\",\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-21 17:29:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (81, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:02:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (82, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:02:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (83, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:02:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (84, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:03:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (85, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:03:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (86, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:03:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (87, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:04:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (88, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-22 11:04:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (89, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-22 11:04:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (90, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (91, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (92, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (93, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (94, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (95, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (96, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (97, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (98, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:05:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (99, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (100, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (101, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (102, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (103, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (104, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:05:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (105, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (106, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (107, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (108, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (109, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (110, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (111, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (112, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (113, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (114, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (115, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (116, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (117, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:06:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (118, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:06:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (119, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":196,\"org_pk\":1,\"app_pk\":1,\"parent_pk\":4,\"name\":\"角色管理-选项\",\"code\":\"\",\"api_route\":\"gac/v1/admin/role/option\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:12:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (120, 1, 1, 'menu', 'insert', 'dev_test001', '添加菜单:{\"org_pk\":1,\"app_pk\":1,\"parent_pk\":13,\"name\":\"管理员角色查询菜单列表\",\"code\":\"\",\"api_route\":\"gac/v1/admin/permission/menus\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:13:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (121, 1, 1, 'menu', 'insert', 'dev_test001', '添加菜单:{\"org_pk\":1,\"app_pk\":1,\"parent_pk\":14,\"name\":\"企业角色查询菜单列表\",\"code\":\"\",\"api_route\":\"gac/v1/admin/staff_permission/menus\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:13:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (122, 1, 1, 'menu', 'insert', 'dev_test001', '添加菜单:{\"org_pk\":1,\"app_pk\":1,\"parent_pk\":15,\"name\":\"服务商角色查询菜单列表\",\"code\":\"\",\"api_route\":\"gac/v1/admin/service_permission/menus\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"POST\",\"sort\":0,\"type\":3,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:14:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (123, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":2,\"permission_ids\":\"53,54,55,56,57,58,59,60,61,62,63,8,9,10,11,12,16,17,18,19,20,200,201,21,22,23,24,25,204,205,26,27,28,29,30,202,203,35,36,37,38,39,237,45,46,47,48,49,236,40,41,42,43,44,234,235,50,196,197,198,199,31,32,33,34,2,4,5,6,7,238,13,240,15,239,14,3,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:14:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (124, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"11,16,17,18,19,20,200,201,21,22,23,24,25,204,205,26,27,28,29,30,202,203,35,36,37,38,39,237,45,46,47,48,49,236,40,41,42,43,44,234,196,31,33,239,14,240,15,238,13,3,32,2,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:14:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (125, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:15:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (126, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:15:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (127, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (128, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:20', '139.162.102.149');
INSERT INTO `log_system` VALUES (129, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:27', '139.162.102.149');
INSERT INTO `log_system` VALUES (130, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (131, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:40', '139.162.102.149');
INSERT INTO `log_system` VALUES (132, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:16:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (133, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:17:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (134, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:18:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (135, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:18:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (136, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (137, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (138, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (139, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (140, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (141, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (142, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:20:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (143, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:20:53', '5.44.249.53');
INSERT INTO `log_system` VALUES (144, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"139,137,141,143,144,71,72,74,75,76,193,104,111,112,113,114,122,121,120,124,126,130,128,132,134,135,80,78,82,84,86,88,90,92,94,146,148,150,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,64,77,103,127,136,145\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:27:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (145, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:27:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (146, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:27:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (147, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:27:30', '103.172.116.195');
INSERT INTO `log_system` VALUES (148, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:27:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (149, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:28:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (150, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:28:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (151, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:28:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (152, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:29:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (153, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:29:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (154, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:29:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (155, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:30:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (156, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:30:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (157, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:30:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (158, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:31:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (159, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":41,\"permission_ids\":\"210,208,212,213,214,216,217,219,220,221,222,226,225,224,229,231,73,152,176,177,178,233,232,186,185,184,183,182,181,180,179,187,192,191,190,189,188,195,194,70,153,154,155,156,209,211,215,218,223,228,230,227,151,207,206\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:31:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (160, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:31:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (161, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:31:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (162, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:31:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (163, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:31:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (164, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:31:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (165, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:32:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (166, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:32:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (167, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:32:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (168, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:32:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (169, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (170, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (171, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (172, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (173, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (174, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:33:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (175, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":41,\"permission_ids\":\"210,208,212,213,214,216,217,219,220,221,222,226,225,224,229,231,209,211,215,218,223,228,230,207,206,195,194,156,227,151\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:34:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (176, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (177, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (178, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (179, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (180, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (181, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (182, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 11:34:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (183, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:35:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (184, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"11,21,22,23,24,25,204,205,239,26,27,28,29,30,202,203,240,45,46,47,48,49,236,40,41,42,43,44,234,196,14,15,33,32,2,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:42:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (185, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-22 11:42:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (186, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"21,22,23,24,25,204,205,239,26,27,28,29,30,202,203,240,45,46,47,48,49,236,40,41,42,43,44,234,196,14,15,33,32,3,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:45:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (187, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-22 11:45:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (188, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"zhangguodong\",\"account_name\":\"张国栋\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:45:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (189, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:46:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (190, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"chengjuncheng\",\"account_name\":\"程俊生\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:47:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (191, 1, 1, 'account', 'delete', '山东派盟', '删除角色:\"e81bbbc43a2011ed8bf10a1a0af9082f\"', '2022-09-22 11:47:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (192, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 11:48:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (193, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"chengjunsheng\",\"account_name\":\"程俊生\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:48:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (194, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"wujun\",\"account_name\":\"吴均\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:49:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (195, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"dongzhi\",\"account_name\":\"董植\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:49:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (196, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"handaxin\",\"account_name\":\"韩大昕\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:50:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (197, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"chenqiang\",\"account_name\":\"陈强\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:50:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (198, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":3,\"permission_ids\":\"45,46,47,48,49,40,41,42,43,44,234,196,236,33,32,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:50:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (199, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":43,\"permission_ids\":\"40,41,42,43,44,234,235,196,32,4,1\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 11:51:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (200, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"yuyong\",\"account_name\":\"于泳\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 11:54:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (201, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:07:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (202, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:11:31', '124.128.97.210');
INSERT INTO `log_system` VALUES (203, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dev_test_account\",\"password\":\"\",\"account_type\":0}', '2022-09-22 12:12:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (204, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:12:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (205, 1, 1, 'permission', 'insert', 'dev_test001', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"130,128,132,134,135,80,78,82,84,86,88,90,92,94,146,148,150,139,137,141,143,144,71,72,74,75,76,193,104,111,112,113,114,122,121,120,124,126,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,64,77,103,127,136,145\",\"status\":1,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 12:12:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (206, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:12:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (207, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"liemilu\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:12:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (208, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:12:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (209, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"liemilu\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:12:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (210, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:13:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (211, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:13:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (212, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:22:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (213, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-09-22 12:22:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (214, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-22 12:22:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (215, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-22 13:13:58', '219.121.2.115');
INSERT INTO `log_system` VALUES (216, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 14:10:21', '211.128.60.37');
INSERT INTO `log_system` VALUES (217, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:27:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (218, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:27:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (219, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:27:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (220, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:29:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (221, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:30:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (222, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:31:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (223, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:33:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (224, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:36:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (225, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:37:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (226, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:38:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (227, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:38:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (228, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:38:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (229, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:38:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (230, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Luffy\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:40:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (231, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Luffy\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:40:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (232, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (233, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (234, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (235, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (236, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (237, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (238, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (239, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (240, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:42:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (241, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"wangcheng\",\"account_name\":\"王成\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 15:42:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (242, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:42:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (243, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:43:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (244, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:44:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (245, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 15:45:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (246, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:45:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (247, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:45:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (248, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:45:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (249, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:45:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (250, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:46:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (251, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:46:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (252, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:48:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (253, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:50:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (254, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"dasuan\",\"account_name\":\"大蒜\",\"password\":\"a123456\",\"role_pk\":3,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 15:51:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (255, 1, 1, 'account', 'delete', '超级管理员', '删除角色:\"f896048b3a4211ed8bf10a1a0af9082f\"', '2022-09-22 15:51:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (256, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"dasuan\",\"account_name\":\"大蒜\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 15:52:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (257, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dasuan\",\"password\":\"\",\"account_type\":1}', '2022-09-22 15:53:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (258, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 15:54:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (259, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"finch\",\"account_name\":\"芬奇\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-22 15:54:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (260, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-09-22 16:16:31', '124.128.97.210');
INSERT INTO `log_system` VALUES (261, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-22 16:18:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (262, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 16:29:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (263, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"SDOM1\",\"account_name\":\"SDOM1\",\"password\":\"SDOM1\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":195,\"account_id\":\"\"}', '2022-09-22 16:29:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (264, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-09-22 16:30:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (265, 1, 1, 'menu', 'insert', 'dev_test001', '添加菜单:{\"org_pk\":2,\"app_pk\":2,\"parent_pk\":64,\"name\":\"工单\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/workorder\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":6,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Document\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 16:48:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (266, 1, 1, 'menu', 'insert', 'dev_test001', '添加菜单:{\"org_pk\":2,\"app_pk\":2,\"parent_pk\":241,\"name\":\"工单子系统页面\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"views/platform/workorder\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 16:49:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (267, 1, 1, 'menu', 'update', 'dev_test001', '更新菜单:{\"pk\":241,\"org_pk\":2,\"app_pk\":2,\"parent_pk\":64,\"name\":\"工单\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/app-workorder\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":6,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Document\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"dev_test_account\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 16:50:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (268, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 16:54:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (269, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"71,72,74,75,76,193,104,111,112,113,114,122,121,120,124,126,146,148,150,130,128,132,134,135,80,78,82,84,86,88,90,92,94,139,137,141,143,144,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,77,103,127,136,145,241,242,64\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 16:54:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (270, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"146,148,150,71,72,74,75,76,193,104,111,112,113,114,122,121,120,124,126,139,137,141,143,144,130,128,132,134,135,80,78,82,84,86,88,90,92,94,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,77,103,127,136,145,64\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-09-22 16:55:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (271, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 17:17:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (272, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-22 17:19:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (273, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1   \",\"password\":\"\",\"account_type\":2}', '2022-09-22 17:20:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (274, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin  \",\"password\":\"\",\"account_type\":0}', '2022-09-22 17:22:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (275, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 17:22:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (276, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-22 17:23:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (277, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 11:24:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (278, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 12:22:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (279, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 12:22:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (280, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-23 14:51:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (281, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-23 14:51:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (282, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"login\",\"password\":\"\",\"account_type\":2}', '2022-09-23 14:52:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (283, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 14:52:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (284, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-23 15:10:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (285, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-23 15:32:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (286, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 16:01:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (287, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin  \",\"password\":\"\",\"account_type\":0}', '2022-09-23 16:36:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (288, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":133,\"org_pk\":1,\"app_pk\":6,\"parent_pk\":127,\"name\":\"预警规则\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/warning_rules\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":3,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Checked\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-09-23 16:47:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (289, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":131,\"org_pk\":1,\"app_pk\":6,\"parent_pk\":127,\"name\":\"预警分析\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/warning_records\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":2,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"List\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-09-23 16:47:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (290, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-23 16:48:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (291, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":2}', '2022-09-23 18:06:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (292, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-26 09:37:02', '219.121.2.115');
INSERT INTO `log_system` VALUES (293, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 10:48:54', '66.152.178.214');
INSERT INTO `log_system` VALUES (294, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-26 13:31:30', '219.121.2.115');
INSERT INTO `log_system` VALUES (295, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-26 14:39:03', '219.121.2.115');
INSERT INTO `log_system` VALUES (296, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-26 14:39:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (297, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-26 14:49:19', '5.44.249.44');
INSERT INTO `log_system` VALUES (298, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"test\",\"password\":\"\",\"account_type\":1}', '2022-09-26 14:49:28', '5.44.249.44');
INSERT INTO `log_system` VALUES (299, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-09-26 14:49:43', '5.44.249.44');
INSERT INTO `log_system` VALUES (300, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-26 16:26:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (301, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Luffy\",\"password\":\"\",\"account_type\":2}', '2022-09-26 16:26:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (302, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-26 16:27:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (303, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-26 17:13:46', '219.121.2.115');
INSERT INTO `log_system` VALUES (304, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-26 17:13:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (305, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-26 17:30:39', '202.85.211.226');
INSERT INTO `log_system` VALUES (306, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":2}', '2022-09-26 17:31:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (307, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-09-26 17:46:56', '202.85.211.226');
INSERT INTO `log_system` VALUES (308, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-09-26 17:48:37', '202.85.211.226');
INSERT INTO `log_system` VALUES (309, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-26 17:50:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (310, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 18:02:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (311, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-09-26 18:06:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (312, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-09-26 18:06:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (313, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-09-26 18:06:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (314, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-26 18:07:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (315, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 18:12:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (316, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 18:13:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (317, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 18:19:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (318, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-26 18:20:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (319, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-27 10:24:57', '219.121.2.115');
INSERT INTO `log_system` VALUES (320, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-27 10:25:01', '219.121.2.115');
INSERT INTO `log_system` VALUES (321, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-27 10:25:13', '219.121.2.115');
INSERT INTO `log_system` VALUES (322, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-27 10:25:23', '219.121.2.115');
INSERT INTO `log_system` VALUES (323, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 10:42:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (324, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:18:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (325, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:33:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (326, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:33:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (327, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:34:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (328, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-27 11:34:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (329, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"zhaokebin\",\"account_name\":\"君陌\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-27 11:35:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (330, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:35:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (331, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-27 11:46:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (332, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:46:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (333, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 11:52:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (334, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-27 12:05:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (335, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-09-27 12:41:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (336, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":1}', '2022-09-27 12:42:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (337, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-27 12:43:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (338, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dasuan\",\"password\":\"\",\"account_type\":1}', '2022-09-27 12:44:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (339, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-27 12:45:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (340, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-27 15:00:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (341, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-09-27 15:01:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (342, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dasuan\",\"password\":\"\",\"account_type\":1}', '2022-09-27 15:01:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (343, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-27 15:56:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (344, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-27 15:56:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (345, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-27 15:56:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (346, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-27 15:57:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (347, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-27 15:58:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (348, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"wangcheng\",\"account_name\":\"wangcheng\",\"password\":\"a123456\",\"role_pk\":6,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-27 15:59:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (349, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-09-27 16:00:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (350, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:02:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (351, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:02:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (352, 1, 1, 'account', 'update', '超级管理员', '更新角色:\"c751fc153a4111ed8bf10a1a0af9082f\"', '2022-09-27 16:02:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (353, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:02:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (354, 1, 1, 'account', 'update', '超级管理员', '更新角色:{\"account_name\":\"王成\",\"role_pk\":7,\"mobile\":\"\",\"account_id\":\"c751fc153a4111ed8bf10a1a0af9082f\"}', '2022-09-27 16:02:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (355, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:03:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (356, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:03:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (357, 1, 1, 'account', 'update', '超级管理员', '更新角色:{\"account_name\":\"王成\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"c751fc153a4111ed8bf10a1a0af9082f\"}', '2022-09-27 16:04:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (358, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:04:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (359, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":2}', '2022-09-27 16:04:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (360, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":1}', '2022-09-27 16:05:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (361, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-09-27 16:22:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (362, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 16:54:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (363, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-09-27 16:57:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (364, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-27 17:18:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (365, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 17:40:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (366, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-27 17:59:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (367, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-27 17:59:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (368, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-09-27 18:00:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (369, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-27 18:02:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (370, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-09-27 21:12:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (371, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-27 21:12:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (372, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 06:43:14', '211.128.60.37');
INSERT INTO `log_system` VALUES (373, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-28 06:46:51', '211.128.60.37');
INSERT INTO `log_system` VALUES (374, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wujun\",\"password\":\"\",\"account_type\":2}', '2022-09-28 06:47:05', '211.128.60.37');
INSERT INTO `log_system` VALUES (375, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-28 06:47:12', '211.128.60.37');
INSERT INTO `log_system` VALUES (376, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 07:23:55', '211.128.60.37');
INSERT INTO `log_system` VALUES (377, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 11:02:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (378, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 11:02:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (379, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 11:02:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (380, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 11:03:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (381, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-28 11:03:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (382, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 15:09:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (383, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 15:27:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (384, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-28 15:51:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (385, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 15:53:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (386, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-09-28 16:11:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (387, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-28 17:23:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (388, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-28 17:28:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (389, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 18:19:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (390, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-28 18:19:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (391, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-28 18:20:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (392, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-09-28 19:53:54', '112.224.143.40');
INSERT INTO `log_system` VALUES (393, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"gactest\",\"password\":\"\",\"account_type\":2}', '2022-09-28 20:01:47', '112.224.143.121');
INSERT INTO `log_system` VALUES (394, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-29 09:54:46', '219.121.2.115');
INSERT INTO `log_system` VALUES (395, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-29 10:41:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (396, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-29 11:12:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (397, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-29 11:13:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (398, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-29 12:00:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (399, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-29 14:14:16', '61.194.64.41');
INSERT INTO `log_system` VALUES (400, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-09-29 14:32:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (401, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"tanweilun\",\"account_name\":\"談偉倫\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-09-29 14:32:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (402, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-09-29 14:34:13', '61.194.64.41');
INSERT INTO `log_system` VALUES (403, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-29 14:46:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (404, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-29 14:47:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (405, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-09-29 14:48:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (406, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-09-29 14:48:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (407, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-29 14:48:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (408, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-09-29 15:00:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (409, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-09-29 15:01:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (410, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-29 15:57:07', '13.115.71.156');
INSERT INTO `log_system` VALUES (411, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-29 16:13:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (412, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-30 10:15:00', '219.121.2.115');
INSERT INTO `log_system` VALUES (413, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-30 10:16:34', '219.121.2.115');
INSERT INTO `log_system` VALUES (414, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BG001\",\"password\":\"\",\"account_type\":2}', '2022-09-30 10:41:12', '219.121.2.115');
INSERT INTO `log_system` VALUES (415, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-09-30 10:41:23', '219.121.2.115');
INSERT INTO `log_system` VALUES (416, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-09-30 16:55:17', '61.194.64.41');
INSERT INTO `log_system` VALUES (417, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-03 14:31:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (418, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-03 22:14:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (419, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-04 09:44:36', '219.121.2.115');
INSERT INTO `log_system` VALUES (420, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-04 14:14:58', '61.194.64.41');
INSERT INTO `log_system` VALUES (421, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-04 14:18:09', '61.194.64.41');
INSERT INTO `log_system` VALUES (422, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-04 14:18:14', '61.194.64.41');
INSERT INTO `log_system` VALUES (423, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-04 14:18:17', '61.194.64.41');
INSERT INTO `log_system` VALUES (424, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-04 14:22:23', '61.194.64.41');
INSERT INTO `log_system` VALUES (425, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-04 14:25:43', '61.194.64.41');
INSERT INTO `log_system` VALUES (426, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-04 14:26:37', '61.194.64.41');
INSERT INTO `log_system` VALUES (427, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-05 09:05:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (428, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-05 14:11:13', '219.121.2.115');
INSERT INTO `log_system` VALUES (429, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-06 14:42:13', '61.194.64.41');
INSERT INTO `log_system` VALUES (430, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-06 14:42:19', '61.194.64.41');
INSERT INTO `log_system` VALUES (431, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-06 15:07:53', '219.121.2.115');
INSERT INTO `log_system` VALUES (432, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-06 15:08:09', '219.121.2.115');
INSERT INTO `log_system` VALUES (433, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-06 15:08:13', '219.121.2.115');
INSERT INTO `log_system` VALUES (434, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":1}', '2022-10-06 15:13:14', '219.121.2.115');
INSERT INTO `log_system` VALUES (435, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:24:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (436, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:41:28', '219.121.2.115');
INSERT INTO `log_system` VALUES (437, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:41:41', '219.121.2.115');
INSERT INTO `log_system` VALUES (438, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:41:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (439, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:43:04', '219.121.2.115');
INSERT INTO `log_system` VALUES (440, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:43:11', '219.121.2.115');
INSERT INTO `log_system` VALUES (441, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-10-07 09:44:06', '219.121.2.115');
INSERT INTO `log_system` VALUES (442, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-10-07 09:45:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (443, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:45:18', '219.121.2.115');
INSERT INTO `log_system` VALUES (444, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700testjp\",\"password\":\"\",\"account_type\":2}', '2022-10-07 09:46:13', '219.121.2.115');
INSERT INTO `log_system` VALUES (445, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-07 09:46:38', '219.121.2.115');
INSERT INTO `log_system` VALUES (446, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-10-07 09:50:06', '219.121.2.115');
INSERT INTO `log_system` VALUES (447, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-07 09:50:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (448, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-10-07 10:02:40', '219.121.2.115');
INSERT INTO `log_system` VALUES (449, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-07 10:03:47', '219.121.2.115');
INSERT INTO `log_system` VALUES (450, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-07 10:34:26', '219.121.2.115');
INSERT INTO `log_system` VALUES (451, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-08 11:32:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (452, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-10-08 11:34:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (453, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-10-08 11:35:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (454, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-10-08 11:35:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (455, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-08 12:08:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (456, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-10-08 15:23:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (457, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-08 15:24:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (458, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-08 15:24:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (459, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-09 10:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (460, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-09 11:08:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (461, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-09 11:08:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (462, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-10-09 11:09:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (463, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-09 11:09:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (464, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-09 11:09:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (465, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-09 14:38:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (466, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-09 16:49:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (467, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-10-09 16:55:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (468, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-09 18:48:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (469, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-09 18:48:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (470, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:05:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (471, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:05:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (472, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:05:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (473, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:05:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (474, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:06:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (475, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:06:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (476, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:08:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (477, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:26:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (478, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:27:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (479, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 11:36:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (480, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 12:21:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (481, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 12:36:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (482, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 14:22:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (483, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 14:36:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (484, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 14:42:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (485, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-10 18:22:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (486, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 18:25:31', '124.128.97.210');
INSERT INTO `log_system` VALUES (487, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-10 18:34:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (488, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:29:36', '202.85.211.226');
INSERT INTO `log_system` VALUES (489, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:06', '202.85.211.226');
INSERT INTO `log_system` VALUES (490, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (491, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (492, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (493, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (494, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (495, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (496, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (497, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (498, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (499, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:11', '202.85.211.226');
INSERT INTO `log_system` VALUES (500, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (501, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (502, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (503, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (504, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (505, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (506, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (507, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (508, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (509, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:25', '202.85.211.226');
INSERT INTO `log_system` VALUES (510, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:25', '202.85.211.226');
INSERT INTO `log_system` VALUES (511, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-11 11:31:25', '202.85.211.226');
INSERT INTO `log_system` VALUES (512, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:32:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (513, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:33:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (514, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Admin\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:33:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (515, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Admin\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:33:30', '202.85.211.226');
INSERT INTO `log_system` VALUES (516, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Admin\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:33:30', '202.85.211.226');
INSERT INTO `log_system` VALUES (517, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Admin\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:33:30', '202.85.211.226');
INSERT INTO `log_system` VALUES (518, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:34:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (519, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":1}', '2022-10-11 11:39:15', '202.85.211.226');
INSERT INTO `log_system` VALUES (520, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-11 12:00:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (521, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-11 12:00:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (522, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-11 12:01:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (523, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-10-11 12:03:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (524, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-10-11 12:04:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (525, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-11 12:21:31', '124.128.97.210');
INSERT INTO `log_system` VALUES (526, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-11 15:35:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (527, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-11 15:57:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (528, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-10-11 16:17:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (529, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-10-11 16:17:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (530, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-11 16:17:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (531, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-10-11 16:17:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (532, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-11 16:17:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (533, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-11 16:29:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (534, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-11 16:30:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (535, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-11 16:39:32', '219.121.2.115');
INSERT INTO `log_system` VALUES (536, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-11 17:15:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (537, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-10-11 17:24:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (538, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-11 17:24:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (539, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-11 17:46:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (540, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-12 11:46:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (541, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 11:47:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (542, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-12 11:58:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (543, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-12 12:08:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (544, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-12 12:08:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (545, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-12 12:08:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (546, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-12 12:09:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (547, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":241,\"org_pk\":2,\"app_pk\":2,\"parent_pk\":64,\"name\":\"工单\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/app-workorder\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":6,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Document\",\"i18n_code\":\"WORKORDER_TXT_00008\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 12:10:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (548, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":242,\"org_pk\":2,\"app_pk\":2,\"parent_pk\":241,\"name\":\"工单子系统页面\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"views/platform/workorder\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"WORKORDER_TXT_00008\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 12:10:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (549, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"130,128,132,134,135,78,80,82,84,86,88,90,92,94,146,148,150,71,72,74,75,76,193,104,111,112,113,114,122,121,120,124,126,139,137,141,143,144,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,77,103,127,136,145,241,242,64\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 12:10:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (550, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 12:11:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (551, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 12:18:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (552, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 12:34:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (553, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-12 14:40:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (554, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":6,\"app_pk\":6,\"parent_pk\":127,\"name\":\"通知实例\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/notify_instance\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":4,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Tools\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 14:52:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (555, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":6,\"app_pk\":6,\"parent_pk\":243,\"name\":\"通知实例\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"views/platform/warning/notifyInstance/index\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 14:53:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (556, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"139,137,141,143,144,130,128,132,134,135,80,78,82,84,86,88,90,92,94,146,148,150,71,72,74,75,76,242,193,104,111,112,113,114,122,121,120,124,126,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,241,64,77,103,136,145,243,244,127\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-12 14:53:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (557, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 14:54:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (558, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-10-12 14:54:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (559, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-12 14:54:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (560, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 14:54:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (561, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:24:56', '5.44.249.157');
INSERT INTO `log_system` VALUES (562, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:25:04', '5.44.249.157');
INSERT INTO `log_system` VALUES (563, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:25:30', '5.44.249.157');
INSERT INTO `log_system` VALUES (564, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:25:39', '5.44.249.157');
INSERT INTO `log_system` VALUES (565, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:26:23', '5.44.249.157');
INSERT INTO `log_system` VALUES (566, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:36:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (567, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:42:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (568, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:50:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (569, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:50:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (570, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:51:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (571, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:51:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (572, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 15:57:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (573, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:12:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (574, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:14:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (575, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:17:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (576, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:19:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (577, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:19:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (578, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:19:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (579, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:30:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (580, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:44:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (581, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-12 16:51:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (582, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 16:58:32', '202.85.211.226');
INSERT INTO `log_system` VALUES (583, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 17:02:54', '202.85.211.226');
INSERT INTO `log_system` VALUES (584, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-12 17:25:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (585, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-12 17:58:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (586, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 18:02:44', '202.85.211.226');
INSERT INTO `log_system` VALUES (587, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-12 18:06:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (588, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-12 18:07:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (589, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-12 18:26:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (590, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-12 18:29:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (591, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-12 18:36:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (592, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"finch\",\"password\":\"\",\"account_type\":1}', '2022-10-12 18:37:19', '202.85.211.226');
INSERT INTO `log_system` VALUES (593, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-13 10:57:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (594, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-13 11:16:18', '219.121.2.115');
INSERT INTO `log_system` VALUES (595, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-13 11:16:29', '219.121.2.115');
INSERT INTO `log_system` VALUES (596, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-13 15:01:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (597, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-13 15:03:09', '219.121.2.115');
INSERT INTO `log_system` VALUES (598, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-13 15:22:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (599, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-13 15:22:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (600, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-13 16:26:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (601, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-13 18:01:32', '103.135.250.195');
INSERT INTO `log_system` VALUES (602, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-13 18:10:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (603, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-13 18:22:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (604, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-14 10:40:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (605, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-14 10:40:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (606, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":2}', '2022-10-14 11:48:55', '202.85.211.226');
INSERT INTO `log_system` VALUES (607, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":2}', '2022-10-14 11:49:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (608, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-10-14 11:55:14', '202.85.211.226');
INSERT INTO `log_system` VALUES (609, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-10-14 11:55:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (610, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-10-14 11:56:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (611, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-14 11:56:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (612, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-14 11:57:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (613, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-14 11:58:31', '202.85.211.226');
INSERT INTO `log_system` VALUES (614, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-14 14:54:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (615, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-14 17:09:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (616, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-14 18:10:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (617, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 08:49:18', '219.121.2.115');
INSERT INTO `log_system` VALUES (618, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 10:35:16', '219.121.2.115');
INSERT INTO `log_system` VALUES (619, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-17 11:40:35', '219.121.2.115');
INSERT INTO `log_system` VALUES (620, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 11:40:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (621, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-17 15:03:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (622, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 15:06:31', '219.121.2.115');
INSERT INTO `log_system` VALUES (623, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 15:25:40', '219.121.2.115');
INSERT INTO `log_system` VALUES (624, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 15:27:32', '219.121.2.115');
INSERT INTO `log_system` VALUES (625, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 16:30:20', '219.121.2.115');
INSERT INTO `log_system` VALUES (626, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-17 16:33:34', '219.121.2.115');
INSERT INTO `log_system` VALUES (627, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-17 18:06:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (628, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-17 19:01:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (629, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-17 19:02:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (630, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-17 19:04:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (631, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-17 19:05:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (632, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-17 19:05:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (633, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-18 09:03:46', '219.121.2.115');
INSERT INTO `log_system` VALUES (634, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-18 09:03:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (635, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-18 10:32:30', '60.208.132.34');
INSERT INTO `log_system` VALUES (636, 1, 1, 'app', 'update', '超级管理员', '编辑应用:{\"pk\":6,\"id\":\"\",\"tag\":\"\",\"name\":\"预警\",\"code\":\"warning\",\"org_pk\":1,\"api_logo\":\"\",\"api_host\":\"\",\"api_secret\":\"\",\"status\":0,\"created_user\":\"\",\"created_time\":\"0001-01-01T00:00:00Z\",\"updated_time\":\"0001-01-01T00:00:00Z\",\"type\":2}', '2022-10-18 10:32:44', '60.208.132.34');
INSERT INTO `log_system` VALUES (637, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":127,\"org_pk\":1,\"app_pk\":6,\"parent_pk\":0,\"name\":\"预警\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":0,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-10-18 10:32:54', '60.208.132.34');
INSERT INTO `log_system` VALUES (638, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-18 10:45:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (639, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-18 14:04:54', '61.194.64.41');
INSERT INTO `log_system` VALUES (640, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-18 14:37:40', '219.121.2.115');
INSERT INTO `log_system` VALUES (641, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-18 15:39:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (642, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-18 15:41:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (643, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-18 15:59:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (644, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-18 16:29:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (645, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-19 16:17:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (646, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-19 16:17:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (647, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-19 16:17:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (648, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-19 17:46:11', '202.85.211.226');
INSERT INTO `log_system` VALUES (649, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-19 17:46:34', '202.85.211.226');
INSERT INTO `log_system` VALUES (650, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":1}', '2022-10-19 17:46:39', '202.85.211.226');
INSERT INTO `log_system` VALUES (651, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":2}', '2022-10-19 17:49:57', '202.85.211.226');
INSERT INTO `log_system` VALUES (652, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-19 17:50:00', '202.85.211.226');
INSERT INTO `log_system` VALUES (653, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-19 19:23:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (654, 1, 1, 'account', 'update', '超级管理员', '更新角色:\"4ca686153a2111ed8bf10a1a0af9082f\"', '2022-10-19 19:24:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (655, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-10-19 19:25:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (656, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-20 11:41:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (657, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-20 14:26:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (658, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-20 15:28:27', '60.208.132.34');
INSERT INTO `log_system` VALUES (659, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-10-20 16:10:59', '202.85.211.226');
INSERT INTO `log_system` VALUES (660, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-21 11:53:18', '60.208.132.34');
INSERT INTO `log_system` VALUES (661, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-21 11:53:24', '60.208.132.34');
INSERT INTO `log_system` VALUES (662, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-10-21 11:53:45', '60.208.132.34');
INSERT INTO `log_system` VALUES (663, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-21 11:54:04', '60.208.132.34');
INSERT INTO `log_system` VALUES (664, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-21 15:28:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (665, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-21 16:56:38', '60.208.132.34');
INSERT INTO `log_system` VALUES (666, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-24 10:07:27', '219.121.2.115');
INSERT INTO `log_system` VALUES (667, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-24 10:17:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (668, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-24 14:50:34', '219.121.2.115');
INSERT INTO `log_system` VALUES (669, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-24 15:58:22', '219.121.2.115');
INSERT INTO `log_system` VALUES (670, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-24 16:13:59', '60.208.132.34');
INSERT INTO `log_system` VALUES (671, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-24 16:14:20', '60.208.132.34');
INSERT INTO `log_system` VALUES (672, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-24 16:14:33', '60.208.132.34');
INSERT INTO `log_system` VALUES (673, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-24 17:15:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (674, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-10-24 17:16:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (675, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-24 17:21:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (676, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-10-24 17:28:47', '202.85.211.226');
INSERT INTO `log_system` VALUES (677, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-10-24 17:28:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (678, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":2}', '2022-10-24 17:29:13', '202.85.211.226');
INSERT INTO `log_system` VALUES (679, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-10-24 17:29:29', '202.85.211.226');
INSERT INTO `log_system` VALUES (680, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-24 17:42:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (681, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"liujian\",\"account_name\":\"刘健\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-10-24 17:43:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (682, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-24 17:55:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (683, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-25 13:14:16', '219.121.2.115');
INSERT INTO `log_system` VALUES (684, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-25 13:20:07', '219.121.2.115');
INSERT INTO `log_system` VALUES (685, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-26 09:19:14', '219.121.2.115');
INSERT INTO `log_system` VALUES (686, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:49:46', '219.121.2.115');
INSERT INTO `log_system` VALUES (687, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:51:14', '219.121.2.115');
INSERT INTO `log_system` VALUES (688, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:51:23', '219.121.2.115');
INSERT INTO `log_system` VALUES (689, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:51:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (690, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:52:17', '219.121.2.115');
INSERT INTO `log_system` VALUES (691, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:52:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (692, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:54:55', '219.121.2.115');
INSERT INTO `log_system` VALUES (693, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:55:42', '219.121.2.115');
INSERT INTO `log_system` VALUES (694, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 13:55:43', '219.121.2.115');
INSERT INTO `log_system` VALUES (695, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:04:41', '219.121.2.115');
INSERT INTO `log_system` VALUES (696, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:04:43', '219.121.2.115');
INSERT INTO `log_system` VALUES (697, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun \",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:04:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (698, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:12:40', '219.121.2.115');
INSERT INTO `log_system` VALUES (699, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:12:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (700, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-26 14:13:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (701, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-10-26 14:13:30', '219.121.2.115');
INSERT INTO `log_system` VALUES (702, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-26 14:13:56', '219.121.2.115');
INSERT INTO `log_system` VALUES (703, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qytest\",\"password\":\"\",\"account_type\":1}', '2022-10-27 10:51:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (704, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-27 10:51:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (705, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-27 10:51:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (706, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-10-27 11:19:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (707, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-27 11:22:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (708, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":225,\"org_pk\":1,\"app_pk\":10,\"parent_pk\":223,\"name\":\"实时数据\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/data-center/realtime\",\"redirect\":\"\",\"view_path\":\"views/provider/data-center/realtime/index\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"icon_shiyongwendang\",\"i18n_code\":\"MARKETING_TXT_00031\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:28:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (709, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":122,\"org_pk\":1,\"app_pk\":5,\"parent_pk\":119,\"name\":\"历史数据\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/data-center/history\",\"redirect\":\"\",\"view_path\":\"views/platform/data-center/history/index\",\"method\":\"\",\"sort\":2,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"MARKETING_TXT_00032\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:28:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (710, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":121,\"org_pk\":1,\"app_pk\":5,\"parent_pk\":119,\"name\":\"实时数据\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/data-center/realtime\",\"redirect\":\"\",\"view_path\":\"views/platform/data-center/realtime/index\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"MARKETING_TXT_00031\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:28:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (711, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":226,\"org_pk\":1,\"app_pk\":10,\"parent_pk\":223,\"name\":\"历史数据\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/data-center/history\",\"redirect\":\"\",\"view_path\":\"views/provider/data-center/history/index\",\"method\":\"\",\"sort\":2,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"MARKETING_TXT_00032\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:28:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (712, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":41,\"permission_ids\":\"210,208,212,213,214,216,217,219,220,221,222,224,225,226,229,231,195,194,156,209,211,215,218,223,228,230,207,206,227,151\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:29:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (713, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-27 11:31:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (714, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":41,\"permission_ids\":\"229,231,210,208,212,213,214,216,217,219,220,221,222,224,225,226,195,194,156,209,211,215,218,223,228,230,207,206,227,151\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"124.128.97.210\"}', '2022-10-27 11:43:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (715, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-27 11:43:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (716, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:01:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (717, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:03:01', '219.121.2.115');
INSERT INTO `log_system` VALUES (718, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:05:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (719, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:12:42', '103.135.250.237');
INSERT INTO `log_system` VALUES (720, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:12:51', '103.135.250.237');
INSERT INTO `log_system` VALUES (721, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:12:54', '103.135.250.237');
INSERT INTO `log_system` VALUES (722, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:00', '103.135.250.237');
INSERT INTO `log_system` VALUES (723, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:01', '103.135.250.237');
INSERT INTO `log_system` VALUES (724, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:02', '103.135.250.237');
INSERT INTO `log_system` VALUES (725, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:02', '103.135.250.237');
INSERT INTO `log_system` VALUES (726, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:02', '103.135.250.237');
INSERT INTO `log_system` VALUES (727, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:03', '103.135.250.237');
INSERT INTO `log_system` VALUES (728, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:03', '103.135.250.237');
INSERT INTO `log_system` VALUES (729, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:03', '103.135.250.237');
INSERT INTO `log_system` VALUES (730, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:03', '103.135.250.237');
INSERT INTO `log_system` VALUES (731, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:04', '103.135.250.237');
INSERT INTO `log_system` VALUES (732, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:04', '103.135.250.237');
INSERT INTO `log_system` VALUES (733, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:04', '103.135.250.237');
INSERT INTO `log_system` VALUES (734, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:04', '103.135.250.237');
INSERT INTO `log_system` VALUES (735, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (736, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (737, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (738, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:45', '103.135.250.237');
INSERT INTO `log_system` VALUES (739, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:47', '103.135.250.237');
INSERT INTO `log_system` VALUES (740, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:47', '103.135.250.237');
INSERT INTO `log_system` VALUES (741, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:13:47', '103.135.250.237');
INSERT INTO `log_system` VALUES (742, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-10-27 15:17:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (743, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"yaoyuan\",\"account_name\":\"姚远\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-10-27 15:17:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (744, 1, 1, 'account', 'update', '山东派盟', '更新角色:\"0e95337755bf11ed8bf10a1a0af9082f\"', '2022-10-27 15:18:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (745, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:19:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (746, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:19:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (747, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:19:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (748, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:19:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (749, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:19:20', '103.135.250.237');
INSERT INTO `log_system` VALUES (750, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:20:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (751, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:21:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (752, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:22:32', '103.135.250.237');
INSERT INTO `log_system` VALUES (753, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:24:04', '103.135.250.237');
INSERT INTO `log_system` VALUES (754, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:24:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (755, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:24:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (756, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Ben_Technology\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:24:05', '103.135.250.237');
INSERT INTO `log_system` VALUES (757, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"13911518174\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:24:55', '103.135.250.237');
INSERT INTO `log_system` VALUES (758, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-10-27 15:26:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (759, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":0}', '2022-10-27 15:27:06', '103.135.250.237');
INSERT INTO `log_system` VALUES (760, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:28:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (761, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:28:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (762, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"BenMarTech\",\"account_name\":\"鲁班科技\",\"password\":\"a123456\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":225,\"account_id\":\"\"}', '2022-10-27 15:30:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (763, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BenMarTech\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:31:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (764, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BenMarTech\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:32:33', '103.135.250.237');
INSERT INTO `log_system` VALUES (765, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:34:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (766, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:34:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (767, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:34:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (768, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:34:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (769, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-27 15:34:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (770, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"abc123\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:35:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (771, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:35:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (772, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:37:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (773, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:37:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (774, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:49:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (775, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-27 15:59:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (776, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-27 16:16:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (777, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dasuan\",\"password\":\"\",\"account_type\":1}', '2022-10-27 18:00:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (778, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":2}', '2022-10-27 18:33:31', '176.119.150.110');
INSERT INTO `log_system` VALUES (779, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":2}', '2022-10-27 18:33:39', '176.119.150.110');
INSERT INTO `log_system` VALUES (780, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":1}', '2022-10-27 18:35:03', '176.119.150.110');
INSERT INTO `log_system` VALUES (781, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":2}', '2022-10-27 18:53:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (782, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-27 18:53:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (783, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-27 20:04:31', '113.120.49.209');
INSERT INTO `log_system` VALUES (784, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-28 10:39:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (785, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-10-28 11:17:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (786, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-10-28 11:18:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (787, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-28 15:32:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (788, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-28 15:33:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (789, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-28 16:02:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (790, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-28 16:20:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (791, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA \",\"password\":\"\",\"account_type\":2}', '2022-10-28 16:38:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (792, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-28 16:40:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (793, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-28 16:40:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (794, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-10-28 17:04:58', '176.119.150.110');
INSERT INTO `log_system` VALUES (795, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":1}', '2022-10-28 17:38:47', '219.121.2.115');
INSERT INTO `log_system` VALUES (796, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-28 17:39:00', '219.121.2.115');
INSERT INTO `log_system` VALUES (797, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-10-29 21:37:37', '113.149.139.129');
INSERT INTO `log_system` VALUES (798, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-31 10:21:09', '219.121.2.115');
INSERT INTO `log_system` VALUES (799, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-10-31 11:37:30', '219.121.2.115');
INSERT INTO `log_system` VALUES (800, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-31 11:38:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (801, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 11:50:35', '219.121.2.115');
INSERT INTO `log_system` VALUES (802, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-10-31 11:51:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (803, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-31 11:55:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (804, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"Inspiry_Halloween\",\"account_name\":\"株式会社Halloween\",\"password\":\"0cw57w\",\"role_pk\":41,\"mobile\":\"\",\"provd_id\":226,\"account_id\":\"\"}', '2022-10-31 11:58:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (805, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:01:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (806, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:01:50', '219.121.2.115');
INSERT INTO `log_system` VALUES (807, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:01:57', '219.121.2.115');
INSERT INTO `log_system` VALUES (808, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"IJH001\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:02:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (809, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"IJH001\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:02:11', '219.121.2.115');
INSERT INTO `log_system` VALUES (810, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:02:16', '219.121.2.115');
INSERT INTO `log_system` VALUES (811, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 12:02:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (812, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 12:03:03', '219.121.2.115');
INSERT INTO `log_system` VALUES (813, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:05:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (814, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-10-31 12:08:16', '219.121.2.115');
INSERT INTO `log_system` VALUES (815, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 13:11:38', '219.121.2.115');
INSERT INTO `log_system` VALUES (816, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-10-31 16:31:51', '61.194.64.41');
INSERT INTO `log_system` VALUES (817, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 16:42:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (818, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:01:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (819, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":1}', '2022-10-31 17:07:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (820, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:43:23', '219.121.2.115');
INSERT INTO `log_system` VALUES (821, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:43:29', '219.121.2.115');
INSERT INTO `log_system` VALUES (822, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BenMarTech\",\"password\":\"\",\"account_type\":1}', '2022-10-31 17:49:27', '176.119.150.110');
INSERT INTO `log_system` VALUES (823, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BenMarTech\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:49:42', '176.119.150.110');
INSERT INTO `log_system` VALUES (824, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:55:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (825, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-10-31 17:57:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (826, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":1}', '2022-10-31 18:19:38', '176.119.150.110');
INSERT INTO `log_system` VALUES (827, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":2}', '2022-10-31 18:29:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (828, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-10-31 18:29:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (829, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-01 11:28:15', '202.85.211.226');
INSERT INTO `log_system` VALUES (830, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-01 11:28:29', '202.85.211.226');
INSERT INTO `log_system` VALUES (831, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-01 11:35:06', '202.85.211.226');
INSERT INTO `log_system` VALUES (832, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-01 11:46:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (833, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-01 11:47:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (834, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-01 13:55:27', '219.121.2.115');
INSERT INTO `log_system` VALUES (835, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-01 14:52:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (836, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-01 17:21:00', '202.85.211.226');
INSERT INTO `log_system` VALUES (837, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-01 17:49:45', '219.121.2.115');
INSERT INTO `log_system` VALUES (838, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-01 18:21:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (839, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-01 18:23:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (840, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 11:50:45', '202.85.211.226');
INSERT INTO `log_system` VALUES (841, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 11:50:53', '202.85.211.226');
INSERT INTO `log_system` VALUES (842, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 11:55:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (843, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-11-02 12:11:24', '219.121.2.115');
INSERT INTO `log_system` VALUES (844, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:26:02', '202.85.211.226');
INSERT INTO `log_system` VALUES (845, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:26:42', '202.85.211.226');
INSERT INTO `log_system` VALUES (846, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:26:54', '202.85.211.226');
INSERT INTO `log_system` VALUES (847, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:27:47', '202.85.211.226');
INSERT INTO `log_system` VALUES (848, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:28:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (849, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:28:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (850, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:28:46', '202.85.211.226');
INSERT INTO `log_system` VALUES (851, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:29:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (852, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:29:43', '202.85.211.226');
INSERT INTO `log_system` VALUES (853, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:29:57', '202.85.211.226');
INSERT INTO `log_system` VALUES (854, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:30:10', '202.85.211.226');
INSERT INTO `log_system` VALUES (855, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:32:04', '202.85.211.226');
INSERT INTO `log_system` VALUES (856, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 12:32:33', '202.85.211.226');
INSERT INTO `log_system` VALUES (857, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-11-02 14:12:37', '219.121.2.115');
INSERT INTO `log_system` VALUES (858, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-02 14:24:09', '172.104.105.45');
INSERT INTO `log_system` VALUES (859, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-11-02 14:24:46', '172.104.105.45');
INSERT INTO `log_system` VALUES (860, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:30:28', '172.104.115.136');
INSERT INTO `log_system` VALUES (861, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-11-02 14:35:07', '185.230.245.163');
INSERT INTO `log_system` VALUES (862, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:36:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (863, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:37:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (864, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:38:54', '202.85.211.226');
INSERT INTO `log_system` VALUES (865, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:39:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (866, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:39:53', '202.85.211.226');
INSERT INTO `log_system` VALUES (867, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:40:56', '202.85.211.226');
INSERT INTO `log_system` VALUES (868, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:41:03', '202.85.211.226');
INSERT INTO `log_system` VALUES (869, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:41:18', '202.85.211.226');
INSERT INTO `log_system` VALUES (870, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:48:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (871, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:49:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (872, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:49:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (873, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:52:50', '202.85.211.226');
INSERT INTO `log_system` VALUES (874, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:53:59', '202.85.211.226');
INSERT INTO `log_system` VALUES (875, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 14:55:43', '202.85.211.226');
INSERT INTO `log_system` VALUES (876, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 15:06:00', '202.85.211.226');
INSERT INTO `log_system` VALUES (877, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 15:17:09', '219.121.2.115');
INSERT INTO `log_system` VALUES (878, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:27:40', '202.85.211.226');
INSERT INTO `log_system` VALUES (879, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-11-02 15:28:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (880, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-11-02 15:33:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (881, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:35:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (882, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:35:16', '202.85.211.226');
INSERT INTO `log_system` VALUES (883, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:35:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (884, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:35:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (885, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:35:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (886, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 15:53:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (887, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-02 15:55:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (888, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:08:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (889, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:08:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (890, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:10:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (891, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Kanai\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:10:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (892, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:11:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (893, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:15:01', '202.85.211.226');
INSERT INTO `log_system` VALUES (894, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:17:55', '202.85.211.226');
INSERT INTO `log_system` VALUES (895, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:18:20', '202.85.211.226');
INSERT INTO `log_system` VALUES (896, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:18:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (897, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:19:20', '202.85.211.226');
INSERT INTO `log_system` VALUES (898, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:20:01', '202.85.211.226');
INSERT INTO `log_system` VALUES (899, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:20:21', '202.85.211.226');
INSERT INTO `log_system` VALUES (900, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:21:20', '202.85.211.226');
INSERT INTO `log_system` VALUES (901, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:25:33', '202.85.211.226');
INSERT INTO `log_system` VALUES (902, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:26:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (903, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:26:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (904, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:26:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (905, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:27:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (906, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:27:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (907, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguodong\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:29:33', '202.85.211.226');
INSERT INTO `log_system` VALUES (908, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 16:31:01', '202.85.211.226');
INSERT INTO `log_system` VALUES (909, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:38:05', '202.85.211.226');
INSERT INTO `log_system` VALUES (910, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:39:19', '202.85.211.226');
INSERT INTO `log_system` VALUES (911, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:41:56', '202.85.211.226');
INSERT INTO `log_system` VALUES (912, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:43:55', '202.85.211.226');
INSERT INTO `log_system` VALUES (913, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:50:36', '202.85.211.226');
INSERT INTO `log_system` VALUES (914, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:51:07', '202.85.211.226');
INSERT INTO `log_system` VALUES (915, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 16:52:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (916, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 17:08:52', '202.85.211.226');
INSERT INTO `log_system` VALUES (917, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 17:11:13', '202.85.211.226');
INSERT INTO `log_system` VALUES (918, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 17:11:31', '202.85.211.226');
INSERT INTO `log_system` VALUES (919, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-02 17:16:31', '202.85.211.226');
INSERT INTO `log_system` VALUES (920, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 17:51:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (921, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-02 17:56:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (922, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-02 18:36:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (923, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 18:37:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (924, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-02 18:38:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (925, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-02 18:39:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (926, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-03 00:21:12', '39.82.235.178');
INSERT INTO `log_system` VALUES (927, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-11-03 00:21:30', '39.82.235.178');
INSERT INTO `log_system` VALUES (928, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-03 00:24:00', '39.82.235.178');
INSERT INTO `log_system` VALUES (929, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-03 11:24:12', '202.85.211.226');
INSERT INTO `log_system` VALUES (930, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-03 11:24:34', '202.85.211.226');
INSERT INTO `log_system` VALUES (931, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-11-03 12:21:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (932, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-03 16:10:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (933, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-03 17:09:53', '202.85.211.226');
INSERT INTO `log_system` VALUES (934, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-04 10:44:01', '60.208.132.34');
INSERT INTO `log_system` VALUES (935, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:11:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (936, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:13:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (937, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:23:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (938, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:24:30', '202.85.211.226');
INSERT INTO `log_system` VALUES (939, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:25:01', '202.85.211.226');
INSERT INTO `log_system` VALUES (940, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:33:48', '202.85.211.226');
INSERT INTO `log_system` VALUES (941, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:35:46', '202.85.211.226');
INSERT INTO `log_system` VALUES (942, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:36:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (943, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:36:36', '202.85.211.226');
INSERT INTO `log_system` VALUES (944, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:37:00', '202.85.211.226');
INSERT INTO `log_system` VALUES (945, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:52:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (946, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:52:52', '202.85.211.226');
INSERT INTO `log_system` VALUES (947, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:54:18', '202.85.211.226');
INSERT INTO `log_system` VALUES (948, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:54:46', '202.85.211.226');
INSERT INTO `log_system` VALUES (949, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:57:50', '202.85.211.226');
INSERT INTO `log_system` VALUES (950, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:59:05', '202.85.211.226');
INSERT INTO `log_system` VALUES (951, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 11:59:19', '202.85.211.226');
INSERT INTO `log_system` VALUES (952, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:08:23', '202.85.211.226');
INSERT INTO `log_system` VALUES (953, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:11:47', '202.85.211.226');
INSERT INTO `log_system` VALUES (954, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:14:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (955, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:15:49', '202.85.211.226');
INSERT INTO `log_system` VALUES (956, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:19:07', '202.85.211.226');
INSERT INTO `log_system` VALUES (957, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:20:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (958, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:23:12', '202.85.211.226');
INSERT INTO `log_system` VALUES (959, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:25:32', '202.85.211.226');
INSERT INTO `log_system` VALUES (960, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:27:43', '202.85.211.226');
INSERT INTO `log_system` VALUES (961, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:28:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (962, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:33:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (963, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:35:34', '202.85.211.226');
INSERT INTO `log_system` VALUES (964, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:40:37', '202.85.211.226');
INSERT INTO `log_system` VALUES (965, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:48:45', '202.85.211.226');
INSERT INTO `log_system` VALUES (966, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:51:22', '202.85.211.226');
INSERT INTO `log_system` VALUES (967, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:53:32', '202.85.211.226');
INSERT INTO `log_system` VALUES (968, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 12:56:04', '202.85.211.226');
INSERT INTO `log_system` VALUES (969, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 14:23:19', '202.85.211.226');
INSERT INTO `log_system` VALUES (970, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-11-04 15:24:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (971, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-04 16:40:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (972, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 18:26:54', '202.85.211.226');
INSERT INTO `log_system` VALUES (973, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-04 18:30:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (974, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-04 18:33:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (975, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-07 11:27:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (976, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-07 11:33:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (977, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 11:54:50', '202.85.211.226');
INSERT INTO `log_system` VALUES (978, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 11:57:38', '202.85.211.226');
INSERT INTO `log_system` VALUES (979, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:03:21', '202.85.211.226');
INSERT INTO `log_system` VALUES (980, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-07 12:08:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (981, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:08:38', '202.85.211.226');
INSERT INTO `log_system` VALUES (982, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:13:16', '202.85.211.226');
INSERT INTO `log_system` VALUES (983, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:16:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (984, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:20:19', '202.85.211.226');
INSERT INTO `log_system` VALUES (985, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:23:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (986, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:39:45', '202.85.211.226');
INSERT INTO `log_system` VALUES (987, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 12:45:09', '202.85.211.226');
INSERT INTO `log_system` VALUES (988, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-07 14:38:32', '202.85.211.226');
INSERT INTO `log_system` VALUES (989, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-07 15:44:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (990, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-07 17:04:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (991, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-07 17:21:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (992, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-07 17:22:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (993, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-07 17:23:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (994, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-07 17:23:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (995, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-07 17:23:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (996, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-07 17:23:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (997, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-11-07 17:40:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (998, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-08 10:29:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (999, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-08 10:29:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (1000, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-08 10:29:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (1001, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-08 12:50:11', '202.85.211.226');
INSERT INTO `log_system` VALUES (1002, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-08 12:54:17', '202.85.211.226');
INSERT INTO `log_system` VALUES (1003, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-08 15:18:34', '60.208.132.34');
INSERT INTO `log_system` VALUES (1004, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-08 15:19:09', '60.208.132.34');
INSERT INTO `log_system` VALUES (1005, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-08 15:19:15', '60.208.132.34');
INSERT INTO `log_system` VALUES (1006, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-08 15:19:21', '60.208.132.34');
INSERT INTO `log_system` VALUES (1007, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-08 15:19:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (1008, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-08 15:19:28', '60.208.132.34');
INSERT INTO `log_system` VALUES (1009, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-08 15:46:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (1010, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-08 15:55:24', '60.208.132.34');
INSERT INTO `log_system` VALUES (1011, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-08 15:57:03', '60.208.132.34');
INSERT INTO `log_system` VALUES (1012, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-08 17:35:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1013, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 11:41:47', '202.85.211.226');
INSERT INTO `log_system` VALUES (1014, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 11:41:47', '202.85.211.226');
INSERT INTO `log_system` VALUES (1015, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 11:48:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (1016, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 11:49:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (1017, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 11:55:40', '202.85.211.226');
INSERT INTO `log_system` VALUES (1018, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:28:40', '202.85.211.226');
INSERT INTO `log_system` VALUES (1019, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:36:18', '202.85.211.226');
INSERT INTO `log_system` VALUES (1020, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:57:38', '202.85.211.226');
INSERT INTO `log_system` VALUES (1021, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:57:38', '202.85.211.226');
INSERT INTO `log_system` VALUES (1022, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:58:55', '202.85.211.226');
INSERT INTO `log_system` VALUES (1023, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 12:58:55', '202.85.211.226');
INSERT INTO `log_system` VALUES (1024, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:35:37', '202.85.211.226');
INSERT INTO `log_system` VALUES (1025, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:36:27', '202.85.211.226');
INSERT INTO `log_system` VALUES (1026, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:37:08', '202.85.211.226');
INSERT INTO `log_system` VALUES (1027, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:37:53', '202.85.211.226');
INSERT INTO `log_system` VALUES (1028, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:40:17', '202.85.211.226');
INSERT INTO `log_system` VALUES (1029, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:42:14', '202.85.211.226');
INSERT INTO `log_system` VALUES (1030, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:43:24', '202.85.211.226');
INSERT INTO `log_system` VALUES (1031, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:45:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (1032, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:46:40', '202.85.211.226');
INSERT INTO `log_system` VALUES (1033, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 14:53:53', '202.85.211.226');
INSERT INTO `log_system` VALUES (1034, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 15:04:28', '202.85.211.226');
INSERT INTO `log_system` VALUES (1035, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 15:18:05', '202.85.211.226');
INSERT INTO `log_system` VALUES (1036, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 15:37:35', '202.85.211.226');
INSERT INTO `log_system` VALUES (1037, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 15:59:41', '202.85.211.226');
INSERT INTO `log_system` VALUES (1038, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-11-09 16:21:54', '126.255.71.118');
INSERT INTO `log_system` VALUES (1039, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 16:48:21', '202.85.211.226');
INSERT INTO `log_system` VALUES (1040, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 17:02:18', '202.85.211.226');
INSERT INTO `log_system` VALUES (1041, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 17:22:26', '202.85.211.226');
INSERT INTO `log_system` VALUES (1042, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 17:27:18', '202.85.211.226');
INSERT INTO `log_system` VALUES (1043, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-09 17:28:57', '202.85.211.226');
INSERT INTO `log_system` VALUES (1044, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-11-10 11:31:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (1045, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-10 11:31:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (1046, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-11 11:09:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (1047, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-11 16:14:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1048, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-11 16:22:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1049, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 16:37:12', '202.85.211.226');
INSERT INTO `log_system` VALUES (1050, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 16:41:33', '202.85.211.226');
INSERT INTO `log_system` VALUES (1051, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-11 16:52:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (1052, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 17:09:42', '202.85.211.226');
INSERT INTO `log_system` VALUES (1053, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 17:21:30', '202.85.211.226');
INSERT INTO `log_system` VALUES (1054, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-11 17:42:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (1055, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 18:14:36', '202.85.211.226');
INSERT INTO `log_system` VALUES (1056, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-11 18:14:58', '202.85.211.226');
INSERT INTO `log_system` VALUES (1057, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-14 10:35:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (1058, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-14 10:35:52', '219.121.2.115');
INSERT INTO `log_system` VALUES (1059, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-14 10:54:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (1060, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-14 11:28:51', '202.85.211.226');
INSERT INTO `log_system` VALUES (1061, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-14 11:35:31', '202.85.211.226');
INSERT INTO `log_system` VALUES (1062, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-14 11:56:12', '202.85.211.226');
INSERT INTO `log_system` VALUES (1063, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:00:36', '202.85.211.226');
INSERT INTO `log_system` VALUES (1064, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-14 12:00:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (1065, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (1066, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (1067, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1068, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1069, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1070, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1071, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1072, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1073, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1074, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1075, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1076, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1077, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1078, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1079, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1080, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1081, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1082, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1083, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1084, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:07:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (1085, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:08:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (1086, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-11-14 12:08:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (1087, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-14 12:09:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (1088, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (1089, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (1090, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (1091, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1092, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1093, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1094, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":1}', '2022-11-14 12:09:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1095, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-14 14:40:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1096, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-14 15:09:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (1097, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-14 15:21:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (1098, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chenqiang\",\"password\":\"\",\"account_type\":1}', '2022-11-14 16:53:20', '202.85.211.226');
INSERT INTO `log_system` VALUES (1099, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-14 17:23:07', '60.208.132.34');
INSERT INTO `log_system` VALUES (1100, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":2,\"parent_pk\":64,\"name\":\"POC\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/app-poc-dashboard\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":8,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"Bicycle\",\"i18n_code\":\"POC\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-14 17:24:19', '60.208.132.34');
INSERT INTO `log_system` VALUES (1101, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":2,\"parent_pk\":245,\"name\":\"POC\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"views/platform/poc-dashboard\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-14 17:25:08', '60.208.132.34');
INSERT INTO `log_system` VALUES (1102, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"146,148,150,130,128,132,134,244,135,80,78,82,84,86,88,90,92,94,139,137,141,143,144,71,72,74,75,76,242,193,104,111,112,113,114,120,121,122,124,126,65,66,67,68,69,79,81,83,85,87,89,91,93,110,119,123,125,129,131,133,138,140,142,147,149,241,243,77,103,127,136,145,245,246,64\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-14 17:25:26', '60.208.132.34');
INSERT INTO `log_system` VALUES (1103, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:27:07', '60.208.132.34');
INSERT INTO `log_system` VALUES (1104, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:27:18', '60.208.132.34');
INSERT INTO `log_system` VALUES (1105, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"qiyetest\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:27:38', '60.208.132.34');
INSERT INTO `log_system` VALUES (1106, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:27:48', '60.208.132.34');
INSERT INTO `log_system` VALUES (1107, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:28:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (1108, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:52:44', '60.208.132.34');
INSERT INTO `log_system` VALUES (1109, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-14 17:52:49', '60.208.132.34');
INSERT INTO `log_system` VALUES (1110, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 10:23:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1111, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-15 12:13:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (1112, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-15 12:13:09', '124.128.97.210');
INSERT INTO `log_system` VALUES (1113, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 14:40:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (1114, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 14:40:18', '61.194.64.41');
INSERT INTO `log_system` VALUES (1115, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-15 14:40:27', '61.194.64.41');
INSERT INTO `log_system` VALUES (1116, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-15 14:40:36', '61.194.64.41');
INSERT INTO `log_system` VALUES (1117, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-15 14:40:54', '61.194.64.41');
INSERT INTO `log_system` VALUES (1118, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:14:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (1119, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:14:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (1120, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:14:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (1121, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:14:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (1122, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:15:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (1123, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:15:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (1124, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Kanai\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:25:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (1125, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-15 16:25:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (1126, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-15 17:04:16', '219.121.2.115');
INSERT INTO `log_system` VALUES (1127, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-15 17:07:14', '219.121.2.115');
INSERT INTO `log_system` VALUES (1128, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":1}', '2022-11-15 17:49:49', '172.104.119.246');
INSERT INTO `log_system` VALUES (1129, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":2}', '2022-11-16 09:26:17', '124.126.202.155');
INSERT INTO `log_system` VALUES (1130, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"yaoyuan\",\"password\":\"\",\"account_type\":1}', '2022-11-16 09:27:28', '154.31.112.8');
INSERT INTO `log_system` VALUES (1131, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-16 11:18:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (1132, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-16 11:19:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (1133, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-16 15:11:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (1134, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-16 18:13:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1135, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-16 18:14:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (1136, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-11-16 18:14:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (1137, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-16 19:07:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1138, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-17 02:20:27', '110.233.66.31');
INSERT INTO `log_system` VALUES (1139, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-11-17 09:28:27', '219.121.2.115');
INSERT INTO `log_system` VALUES (1140, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-17 18:40:21', '112.224.141.115');
INSERT INTO `log_system` VALUES (1141, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-17 18:40:28', '112.224.141.115');
INSERT INTO `log_system` VALUES (1142, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-17 18:44:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (1143, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-18 12:02:52', '112.36.235.25');
INSERT INTO `log_system` VALUES (1144, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:30:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1145, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-18 14:31:34', '60.208.132.34');
INSERT INTO `log_system` VALUES (1146, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":10,\"parent_pk\":223,\"name\":\"交易查询\",\"code\":\"\",\"api_route\":\"\",\"route\":\"order-list\",\"redirect\":\"\",\"view_path\":\"views/provider/data-center/order-list/index\",\"method\":\"\",\"sort\":3,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00334\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:44:57', '60.208.132.34');
INSERT INTO `log_system` VALUES (1147, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":5,\"parent_pk\":119,\"name\":\"交易查询\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/data-center/order-list\",\"redirect\":\"\",\"view_path\":\"views/platform/data-center/order-list/index\",\"method\":\"\",\"sort\":3,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00334\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:45:56', '60.208.132.34');
INSERT INTO `log_system` VALUES (1148, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:45:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (1149, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"130,128,132,134,244,135,78,80,82,84,86,88,90,92,94,146,148,150,71,72,74,75,76,242,246,193,104,111,112,113,114,120,121,122,124,126,139,137,141,143,144,65,66,67,68,69,79,81,83,85,87,89,91,93,110,123,125,129,131,133,138,140,142,147,149,241,243,245,64,77,127,136,145,248,119,103\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:46:09', '60.208.132.34');
INSERT INTO `log_system` VALUES (1150, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"71,72,74,75,76,242,246,193,104,111,112,113,114,120,121,122,124,126,146,148,150,130,128,132,134,244,135,80,78,82,84,86,88,90,92,94,139,137,141,143,144,65,66,67,68,69,79,81,83,85,87,89,91,93,110,123,125,129,131,133,138,140,142,147,149,241,243,245,64,77,127,136,145,119,103\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:46:41', '60.208.132.34');
INSERT INTO `log_system` VALUES (1151, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:47:32', '60.248.114.182');
INSERT INTO `log_system` VALUES (1152, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":5,\"parent_pk\":103,\"name\":\"服务商专属\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/exclusive\",\"redirect\":\"\",\"view_path\":\"\",\"method\":\"\",\"sort\":5,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"服务商专属\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:48:27', '60.208.132.34');
INSERT INTO `log_system` VALUES (1153, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":5,\"parent_pk\":249,\"name\":\"默认页面\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"\",\"view_path\":\"views/platform/exclusive/index\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:48:58', '60.208.132.34');
INSERT INTO `log_system` VALUES (1154, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"146,148,150,71,72,74,75,76,242,246,193,104,111,112,113,114,120,121,122,124,126,139,137,141,143,144,130,128,132,134,244,135,80,78,82,84,86,88,90,92,94,65,66,67,68,69,79,81,83,85,87,89,91,93,110,123,125,129,131,133,138,140,142,147,149,241,243,245,64,77,127,136,145,249,250,119,103\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"60.208.132.34\"}', '2022-11-18 14:49:27', '60.208.132.34');
INSERT INTO `log_system` VALUES (1155, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-18 14:50:28', '112.36.235.25');
INSERT INTO `log_system` VALUES (1156, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:50:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1157, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:50:49', '60.248.114.182');
INSERT INTO `log_system` VALUES (1158, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-18 14:50:54', '112.36.235.25');
INSERT INTO `log_system` VALUES (1159, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:09:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (1160, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:16:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (1161, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:18:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (1162, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:19:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (1163, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:19:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (1164, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:21:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (1165, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:21:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1166, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-11-18 15:21:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (1167, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:21:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1168, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:28:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (1169, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:28:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (1170, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-18 15:40:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (1171, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-11-20 22:47:16', '112.36.235.25');
INSERT INTO `log_system` VALUES (1172, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-20 22:48:10', '112.36.235.25');
INSERT INTO `log_system` VALUES (1173, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-21 11:30:23', '60.208.132.34');
INSERT INTO `log_system` VALUES (1174, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-21 12:19:11', '219.121.2.115');
INSERT INTO `log_system` VALUES (1175, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-21 19:02:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1176, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-22 17:31:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (1177, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 12:00:22', '112.36.235.25');
INSERT INTO `log_system` VALUES (1178, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-23 12:05:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1179, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-23 12:05:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1180, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-23 12:11:53', '39.98.233.68');
INSERT INTO `log_system` VALUES (1181, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-23 12:15:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (1182, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":4,\"parent_pk\":81,\"name\":\"默认页面\",\"code\":\"\",\"api_route\":\"\",\"route\":\"\",\"redirect\":\"/pay-analysis/realtime\",\"view_path\":\"\",\"method\":\"\",\"sort\":0,\"type\":1,\"show\":2,\"status\":1,\"icon\":\"\",\"i18n_code\":\"\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:18:20', '39.98.233.68');
INSERT INTO `log_system` VALUES (1183, 1, 1, 'menu', 'update', '超级管理员', '更新菜单:{\"pk\":82,\"org_pk\":1,\"app_pk\":4,\"parent_pk\":81,\"name\":\"实时交易\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/pay-analysis/realtime\",\"redirect\":\"\",\"view_path\":\"views/platform/pay-analysis/realtime/index\",\"method\":\"\",\"sort\":1,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00332\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:19:08', '39.98.233.68');
INSERT INTO `log_system` VALUES (1184, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":4,\"parent_pk\":81,\"name\":\"历史交易\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/pay-analysis/history\",\"redirect\":\"\",\"view_path\":\"views/platform/pay-analysis/history/index\",\"method\":\"\",\"sort\":2,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00333\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:19:54', '39.98.233.68');
INSERT INTO `log_system` VALUES (1185, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":4,\"parent_pk\":81,\"name\":\"交易查询\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/pay-analysis/query\",\"redirect\":\"\",\"view_path\":\"views/platform/pay-analysis/query/index\",\"method\":\"\",\"sort\":3,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00334\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:20:45', '39.98.233.68');
INSERT INTO `log_system` VALUES (1186, 1, 1, 'menu', 'insert', '超级管理员', '添加菜单:{\"org_pk\":1,\"app_pk\":4,\"parent_pk\":81,\"name\":\"财务对账\",\"code\":\"\",\"api_route\":\"\",\"route\":\"/pay-analysis/finance\",\"redirect\":\"\",\"view_path\":\"views/platform/pay-analysis/finance/index\",\"method\":\"\",\"sort\":4,\"type\":1,\"show\":1,\"status\":1,\"icon\":\"\",\"i18n_code\":\"TERMINAL_TXT_00379\",\"keep_alive\":2,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:21:22', '39.98.233.68');
INSERT INTO `log_system` VALUES (1187, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:23:25', '39.98.233.68');
INSERT INTO `log_system` VALUES (1188, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"71,72,74,75,76,242,246,193,104,111,112,113,114,120,121,122,124,126,250,146,148,150,130,128,132,134,244,135,80,78,82,84,86,88,90,92,94,139,137,141,143,144,65,66,67,68,69,79,83,85,87,89,91,93,110,123,125,129,131,133,138,140,142,147,149,241,243,245,249,64,127,136,145,251,252,254,253,81,77,119,103\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:24:03', '39.98.233.68');
INSERT INTO `log_system` VALUES (1189, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:24:37', '39.98.233.68');
INSERT INTO `log_system` VALUES (1190, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:32:42', '39.98.233.68');
INSERT INTO `log_system` VALUES (1191, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":10,\"permission_ids\":\"130,128,132,134,244,135,80,78,251,82,252,253,254,84,86,88,90,92,94,146,148,150,71,72,74,75,76,242,246,193,139,137,141,143,144,104,111,112,113,114,120,121,122,124,126,250,65,66,67,68,69,79,81,83,85,87,89,91,93,110,123,125,129,131,133,138,140,142,147,149,241,243,245,249,64,77,127,136,145,248,119,103\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"39.98.233.68\"}', '2022-11-23 12:33:51', '39.98.233.68');
INSERT INTO `log_system` VALUES (1192, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:34:14', '39.98.233.68');
INSERT INTO `log_system` VALUES (1193, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:36:42', '124.128.97.210');
INSERT INTO `log_system` VALUES (1194, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:40:26', '112.36.235.25');
INSERT INTO `log_system` VALUES (1195, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 12:42:05', '39.98.233.68');
INSERT INTO `log_system` VALUES (1196, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 14:42:14', '112.36.235.25');
INSERT INTO `log_system` VALUES (1197, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-23 14:44:11', '111.17.91.155');
INSERT INTO `log_system` VALUES (1198, 1, 1, 'permission', 'insert', '超级管理员', '权限绑定:{\"role_pk\":41,\"permission_ids\":\"210,208,212,213,214,216,229,231,217,219,220,221,222,224,225,226,195,194,156,209,211,215,218,228,230,207,247,223,206,227,151\",\"status\":1,\"created_user\":\"super_admin\",\"created_ip\":\"111.17.91.155\"}', '2022-11-23 14:44:37', '111.17.91.155');
INSERT INTO `log_system` VALUES (1199, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-23 14:45:03', '111.17.91.155');
INSERT INTO `log_system` VALUES (1200, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 14:45:35', '112.36.235.25');
INSERT INTO `log_system` VALUES (1201, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-11-23 14:52:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (1202, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 14:52:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (1203, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 14:56:00', '124.128.97.210');
INSERT INTO `log_system` VALUES (1204, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 14:59:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (1205, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-11-23 16:51:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (1206, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-23 17:01:55', '39.98.233.68');
INSERT INTO `log_system` VALUES (1207, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-23 17:19:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1208, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-11-23 17:20:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (1209, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-23 17:21:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1210, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 17:30:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (1211, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-23 18:57:23', '39.98.233.68');
INSERT INTO `log_system` VALUES (1212, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":2}', '2022-11-24 13:28:51', '39.98.233.68');
INSERT INTO `log_system` VALUES (1213, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":2}', '2022-11-24 13:28:55', '39.98.233.68');
INSERT INTO `log_system` VALUES (1214, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-24 13:29:02', '39.98.233.68');
INSERT INTO `log_system` VALUES (1215, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-11-24 15:35:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (1216, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-24 15:46:56', '113.128.98.17');
INSERT INTO `log_system` VALUES (1217, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-24 15:54:50', '113.128.98.17');
INSERT INTO `log_system` VALUES (1218, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":1}', '2022-11-24 16:08:32', '219.121.2.115');
INSERT INTO `log_system` VALUES (1219, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-24 16:08:37', '219.121.2.115');
INSERT INTO `log_system` VALUES (1220, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-11-24 16:19:06', '219.121.2.115');
INSERT INTO `log_system` VALUES (1221, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-24 16:20:01', '219.121.2.115');
INSERT INTO `log_system` VALUES (1222, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-25 22:16:08', '61.194.64.41');
INSERT INTO `log_system` VALUES (1223, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-26 20:19:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (1224, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-28 10:59:15', '112.36.235.25');
INSERT INTO `log_system` VALUES (1225, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-11-28 10:59:52', '113.128.98.17');
INSERT INTO `log_system` VALUES (1226, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-11-28 11:00:08', '113.128.98.17');
INSERT INTO `log_system` VALUES (1227, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":0}', '2022-11-28 11:00:09', '39.98.233.68');
INSERT INTO `log_system` VALUES (1228, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":0}', '2022-11-28 11:00:37', '39.98.233.68');
INSERT INTO `log_system` VALUES (1229, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":0}', '2022-11-28 11:00:54', '39.98.233.68');
INSERT INTO `log_system` VALUES (1230, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-11-28 11:01:08', '113.128.98.17');
INSERT INTO `log_system` VALUES (1231, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"changguiguo\",\"account_name\":\"常桂果\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-11-28 11:02:28', '113.128.98.17');
INSERT INTO `log_system` VALUES (1232, 1, 1, 'account', 'update', '山东派盟', '更新角色:\"b5eef0b26ec011ed8bf10a1a0af9082f\"', '2022-11-28 11:03:39', '113.128.98.17');
INSERT INTO `log_system` VALUES (1233, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-11-28 11:15:14', '223.98.151.133');
INSERT INTO `log_system` VALUES (1234, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-11-28 11:15:33', '223.98.151.133');
INSERT INTO `log_system` VALUES (1235, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-11-28 11:15:38', '223.98.151.133');
INSERT INTO `log_system` VALUES (1236, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-28 14:40:25', '39.98.233.68');
INSERT INTO `log_system` VALUES (1237, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-28 14:42:17', '124.133.61.89');
INSERT INTO `log_system` VALUES (1238, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-28 14:43:53', '39.98.233.68');
INSERT INTO `log_system` VALUES (1239, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":1}', '2022-11-28 14:45:23', '39.98.233.68');
INSERT INTO `log_system` VALUES (1240, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-28 14:45:28', '39.98.233.68');
INSERT INTO `log_system` VALUES (1241, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-11-28 16:48:45', '223.98.151.133');
INSERT INTO `log_system` VALUES (1242, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-11-28 16:49:02', '223.98.151.133');
INSERT INTO `log_system` VALUES (1243, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-28 16:55:52', '111.17.91.155');
INSERT INTO `log_system` VALUES (1244, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-11-28 19:02:54', '113.128.98.17');
INSERT INTO `log_system` VALUES (1245, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":2}', '2022-11-28 19:49:35', '113.128.98.17');
INSERT INTO `log_system` VALUES (1246, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-11-29 09:29:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (1247, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-11-29 10:19:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (1248, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-11-29 10:50:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (1249, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-29 14:56:49', '113.128.49.18');
INSERT INTO `log_system` VALUES (1250, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700jptest\",\"password\":\"\",\"account_type\":2}', '2022-11-29 14:58:32', '113.128.49.18');
INSERT INTO `log_system` VALUES (1251, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-29 17:54:10', '60.208.132.34');
INSERT INTO `log_system` VALUES (1252, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-11-29 18:24:35', '60.208.132.34');
INSERT INTO `log_system` VALUES (1253, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":2}', '2022-11-30 15:40:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (1254, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-30 15:40:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (1255, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-11-30 16:17:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (1256, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-11-30 17:23:17', '113.128.49.18');
INSERT INTO `log_system` VALUES (1257, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-01 11:53:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (1258, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-01 12:24:48', '124.128.97.210');
INSERT INTO `log_system` VALUES (1259, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-01 12:42:34', '103.172.116.121');
INSERT INTO `log_system` VALUES (1260, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-01 13:29:21', '219.121.2.115');
INSERT INTO `log_system` VALUES (1261, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-12-01 14:18:31', '219.121.2.115');
INSERT INTO `log_system` VALUES (1262, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-01 14:34:58', '219.121.2.115');
INSERT INTO `log_system` VALUES (1263, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-01 14:48:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (1264, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-01 14:48:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1265, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-12-01 15:17:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (1266, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-12-01 15:27:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1267, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-01 15:55:20', '124.128.97.210');
INSERT INTO `log_system` VALUES (1268, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-12-01 16:18:23', '219.121.2.115');
INSERT INTO `log_system` VALUES (1269, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-01 16:27:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1270, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-01 19:37:07', '172.104.105.45');
INSERT INTO `log_system` VALUES (1271, 1, 1, 'account', 'update', '李美露', '更新角色:{\"old_password\":\"a123456\",\"password\":\"123456789\"}', '2022-12-01 19:37:20', '172.104.105.45');
INSERT INTO `log_system` VALUES (1272, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-02 10:53:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (1273, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-02 10:53:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (1274, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-02 11:26:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (1275, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-02 11:29:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1276, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-02 11:31:40', '124.128.97.210');
INSERT INTO `log_system` VALUES (1277, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:07:26', '219.121.2.115');
INSERT INTO `log_system` VALUES (1278, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:07:30', '219.121.2.115');
INSERT INTO `log_system` VALUES (1279, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:18:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (1280, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:18:30', '219.121.2.115');
INSERT INTO `log_system` VALUES (1281, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-12-02 14:18:37', '219.121.2.115');
INSERT INTO `log_system` VALUES (1282, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:22:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (1283, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Halloween\",\"password\":\"\",\"account_type\":2}', '2022-12-02 14:27:04', '219.121.2.115');
INSERT INTO `log_system` VALUES (1284, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-02 14:31:12', '219.121.2.115');
INSERT INTO `log_system` VALUES (1285, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-02 16:35:01', '172.104.105.45');
INSERT INTO `log_system` VALUES (1286, 1, 1, 'account', 'update', '张国桢', '更新角色:{\"old_password\":\"a123456\",\"password\":\"1\"}', '2022-12-02 16:36:28', '172.104.105.45');
INSERT INTO `log_system` VALUES (1287, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-02 16:36:36', '172.104.105.45');
INSERT INTO `log_system` VALUES (1288, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:33:47', '60.208.132.34');
INSERT INTO `log_system` VALUES (1289, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":1}', '2022-12-02 17:38:32', '60.208.132.34');
INSERT INTO `log_system` VALUES (1290, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-02 17:38:49', '60.208.132.34');
INSERT INTO `log_system` VALUES (1291, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:39:12', '60.208.132.34');
INSERT INTO `log_system` VALUES (1292, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:39:23', '60.208.132.34');
INSERT INTO `log_system` VALUES (1293, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:39:36', '60.208.132.34');
INSERT INTO `log_system` VALUES (1294, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Admin\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:39:41', '60.208.132.34');
INSERT INTO `log_system` VALUES (1295, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"admin\",\"password\":\"\",\"account_type\":2}', '2022-12-02 17:39:49', '60.208.132.34');
INSERT INTO `log_system` VALUES (1296, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-02 18:36:49', '124.128.97.210');
INSERT INTO `log_system` VALUES (1297, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-05 11:09:38', '219.121.2.115');
INSERT INTO `log_system` VALUES (1298, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":1}', '2022-12-05 11:13:52', '219.121.2.115');
INSERT INTO `log_system` VALUES (1299, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"jichu\",\"password\":\"\",\"account_type\":1}', '2022-12-05 11:13:53', '219.121.2.115');
INSERT INTO `log_system` VALUES (1300, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-05 12:00:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (1301, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-05 12:00:50', '219.121.2.115');
INSERT INTO `log_system` VALUES (1302, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-12-05 12:31:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (1303, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-05 14:38:14', '124.128.97.210');
INSERT INTO `log_system` VALUES (1304, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"wangcheng\",\"password\":\"\",\"account_type\":1}', '2022-12-05 14:38:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (1305, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dasuan\",\"password\":\"\",\"account_type\":1}', '2022-12-05 14:47:30', '124.128.97.210');
INSERT INTO `log_system` VALUES (1306, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-05 15:04:17', '172.104.105.45');
INSERT INTO `log_system` VALUES (1307, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-05 16:59:59', '172.104.105.45');
INSERT INTO `log_system` VALUES (1308, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-05 17:00:06', '172.104.105.45');
INSERT INTO `log_system` VALUES (1309, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-05 17:00:09', '172.104.105.45');
INSERT INTO `log_system` VALUES (1310, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-05 17:04:22', '124.128.97.210');
INSERT INTO `log_system` VALUES (1311, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-05 17:05:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (1312, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-05 18:08:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (1313, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-05 18:08:45', '124.128.97.210');
INSERT INTO `log_system` VALUES (1314, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-06 09:17:03', '219.121.2.115');
INSERT INTO `log_system` VALUES (1315, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:53:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (1316, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:53:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1317, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilv\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:54:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (1318, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:54:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (1319, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:54:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1320, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:54:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (1321, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"lvsige\",\"password\":\"\",\"account_type\":0}', '2022-12-06 12:57:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (1322, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-06 14:31:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (1323, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-06 14:32:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (1324, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-06 14:53:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1325, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-06 14:56:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1326, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-06 15:16:29', '60.208.132.34');
INSERT INTO `log_system` VALUES (1327, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-06 15:59:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (1328, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"7700khsy\",\"password\":\"\",\"account_type\":2}', '2022-12-06 16:47:59', '219.121.2.115');
INSERT INTO `log_system` VALUES (1329, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:25', '219.121.2.115');
INSERT INTO `log_system` VALUES (1330, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:33', '219.121.2.115');
INSERT INTO `log_system` VALUES (1331, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:42', '219.121.2.115');
INSERT INTO `log_system` VALUES (1332, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (1333, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:51', '219.121.2.115');
INSERT INTO `log_system` VALUES (1334, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:49:52', '219.121.2.115');
INSERT INTO `log_system` VALUES (1335, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:50:10', '219.121.2.115');
INSERT INTO `log_system` VALUES (1336, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:50:27', '219.121.2.115');
INSERT INTO `log_system` VALUES (1337, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:51:04', '219.121.2.115');
INSERT INTO `log_system` VALUES (1338, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:51:47', '219.121.2.115');
INSERT INTO `log_system` VALUES (1339, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:55:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (1340, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:55:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1341, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:57:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (1342, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-06 16:59:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (1343, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-06 17:00:21', '124.128.97.210');
INSERT INTO `log_system` VALUES (1344, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-06 17:00:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (1345, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-06 17:01:05', '124.128.97.210');
INSERT INTO `log_system` VALUES (1346, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-06 17:03:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1347, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-06 18:19:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1348, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-07 10:38:29', '124.128.97.210');
INSERT INTO `log_system` VALUES (1349, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-07 11:41:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1350, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-07 11:55:57', '124.128.97.210');
INSERT INTO `log_system` VALUES (1351, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-07 11:56:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (1352, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-12-07 11:57:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1353, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":1}', '2022-12-07 12:04:34', '124.128.97.210');
INSERT INTO `log_system` VALUES (1354, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-07 12:04:54', '124.128.97.210');
INSERT INTO `log_system` VALUES (1355, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-07 16:21:22', '60.208.132.34');
INSERT INTO `log_system` VALUES (1356, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-07 18:14:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1357, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-07 18:19:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (1358, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-07 18:19:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (1359, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":1}', '2022-12-08 10:40:13', '3.113.23.101');
INSERT INTO `log_system` VALUES (1360, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-08 10:41:37', '3.113.23.101');
INSERT INTO `log_system` VALUES (1361, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-08 11:37:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (1362, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-08 11:40:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (1363, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-08 11:40:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1364, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-12-08 12:09:27', '172.104.105.45');
INSERT INTO `log_system` VALUES (1365, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":1}', '2022-12-08 12:09:37', '172.104.105.45');
INSERT INTO `log_system` VALUES (1366, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-08 12:11:12', '172.104.105.45');
INSERT INTO `log_system` VALUES (1367, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-08 15:37:40', '3.113.23.101');
INSERT INTO `log_system` VALUES (1368, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-08 15:42:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (1369, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-08 18:17:43', '124.128.97.210');
INSERT INTO `log_system` VALUES (1370, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-08 18:18:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1371, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-12-08 18:21:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1372, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-08 18:35:52', '124.128.97.210');
INSERT INTO `log_system` VALUES (1373, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-09 11:18:26', '3.113.23.101');
INSERT INTO `log_system` VALUES (1374, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:23:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (1375, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:23:31', '219.121.2.115');
INSERT INTO `log_system` VALUES (1376, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:23:52', '219.121.2.115');
INSERT INTO `log_system` VALUES (1377, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:24:20', '219.121.2.115');
INSERT INTO `log_system` VALUES (1378, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-12-09 14:25:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (1379, 1, 1, 'account', 'update', '超级管理员', '更新账号信息:\"306a9ec13a2111ed8bf10a1a0af9082f\"', '2022-12-09 14:26:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (1380, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:26:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (1381, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:27:04', '124.128.97.210');
INSERT INTO `log_system` VALUES (1382, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-09 14:27:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1383, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-09 14:27:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1384, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:27:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (1385, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhaokebin\",\"password\":\"\",\"account_type\":0}', '2022-12-09 14:27:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1386, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:34:31', '124.128.97.210');
INSERT INTO `log_system` VALUES (1387, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:34:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1388, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:34:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (1389, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:35:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (1390, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:35:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1391, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-12-09 14:38:08', '124.128.97.210');
INSERT INTO `log_system` VALUES (1392, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:38:19', '219.121.2.115');
INSERT INTO `log_system` VALUES (1393, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:38:32', '219.121.2.115');
INSERT INTO `log_system` VALUES (1394, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:38:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (1395, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 14:39:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1396, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:46:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1397, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 14:46:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (1398, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-09 15:35:59', '210.254.120.241');
INSERT INTO `log_system` VALUES (1399, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 15:49:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1400, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:50:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (1401, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:51:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1402, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:52:03', '124.128.97.210');
INSERT INTO `log_system` VALUES (1403, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:52:35', '124.128.97.210');
INSERT INTO `log_system` VALUES (1404, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:52:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1405, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:55:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (1406, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 15:55:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1407, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 15:55:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (1408, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 15:56:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1409, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 16:02:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1410, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:10:02', '124.128.97.210');
INSERT INTO `log_system` VALUES (1411, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:10:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (1412, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:10:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1413, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:10:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1414, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:38:36', '124.128.97.210');
INSERT INTO `log_system` VALUES (1415, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:49:56', '124.128.97.210');
INSERT INTO `log_system` VALUES (1416, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:52:06', '124.128.97.210');
INSERT INTO `log_system` VALUES (1417, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 16:58:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (1418, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 16:58:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1419, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:04:23', '124.128.97.210');
INSERT INTO `log_system` VALUES (1420, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:04:39', '124.128.97.210');
INSERT INTO `log_system` VALUES (1421, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:05:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (1422, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 17:05:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (1423, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:57:41', '3.113.23.101');
INSERT INTO `log_system` VALUES (1424, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:57:43', '3.113.23.101');
INSERT INTO `log_system` VALUES (1425, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:57:44', '3.113.23.101');
INSERT INTO `log_system` VALUES (1426, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-09 17:57:44', '3.113.23.101');
INSERT INTO `log_system` VALUES (1427, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 17:58:12', '3.113.23.101');
INSERT INTO `log_system` VALUES (1428, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-09 18:09:35', '172.104.105.45');
INSERT INTO `log_system` VALUES (1429, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-09 18:26:01', '124.128.97.210');
INSERT INTO `log_system` VALUES (1430, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 18:54:28', '172.104.105.45');
INSERT INTO `log_system` VALUES (1431, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-09 18:54:36', '172.104.105.45');
INSERT INTO `log_system` VALUES (1432, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-09 18:56:25', '124.128.97.210');
INSERT INTO `log_system` VALUES (1433, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-09 19:02:32', '124.128.97.210');
INSERT INTO `log_system` VALUES (1434, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_Kanai\",\"password\":\"\",\"account_type\":2}', '2022-12-10 17:33:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1435, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SD1\",\"password\":\"\",\"account_type\":2}', '2022-12-11 15:40:35', '219.121.2.115');
INSERT INTO `log_system` VALUES (1436, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-12 11:26:43', '3.113.23.101');
INSERT INTO `log_system` VALUES (1437, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-12 11:34:07', '124.128.97.210');
INSERT INTO `log_system` VALUES (1438, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-12 13:59:20', '219.121.2.115');
INSERT INTO `log_system` VALUES (1439, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-12 15:27:28', '219.121.2.115');
INSERT INTO `log_system` VALUES (1440, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-12 16:09:22', '219.121.2.115');
INSERT INTO `log_system` VALUES (1441, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-12 16:10:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (1442, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-12 16:47:57', '60.208.132.34');
INSERT INTO `log_system` VALUES (1443, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-12 17:17:20', '60.208.132.34');
INSERT INTO `log_system` VALUES (1444, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-13 10:32:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1445, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-13 10:34:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1446, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-13 10:53:15', '219.121.2.115');
INSERT INTO `log_system` VALUES (1447, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-13 11:00:40', '219.121.2.115');
INSERT INTO `log_system` VALUES (1448, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:48:00', '60.208.132.34');
INSERT INTO `log_system` VALUES (1449, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:48:28', '60.208.132.34');
INSERT INTO `log_system` VALUES (1450, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:48:38', '60.208.132.34');
INSERT INTO `log_system` VALUES (1451, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:50:12', '60.208.132.34');
INSERT INTO `log_system` VALUES (1452, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:51:23', '60.208.132.34');
INSERT INTO `log_system` VALUES (1453, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-13 11:51:47', '60.208.132.34');
INSERT INTO `log_system` VALUES (1454, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:55:42', '60.208.132.34');
INSERT INTO `log_system` VALUES (1455, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 11:55:54', '60.208.132.34');
INSERT INTO `log_system` VALUES (1456, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-13 11:56:04', '60.208.132.34');
INSERT INTO `log_system` VALUES (1457, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":2}', '2022-12-13 12:03:25', '60.208.132.34');
INSERT INTO `log_system` VALUES (1458, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 12:03:36', '60.208.132.34');
INSERT INTO `log_system` VALUES (1459, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 12:06:55', '60.208.132.34');
INSERT INTO `log_system` VALUES (1460, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 12:07:03', '60.208.132.34');
INSERT INTO `log_system` VALUES (1461, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 12:07:18', '60.208.132.34');
INSERT INTO `log_system` VALUES (1462, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 12:13:30', '60.208.132.34');
INSERT INTO `log_system` VALUES (1463, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 15:06:48', '60.208.132.34');
INSERT INTO `log_system` VALUES (1464, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 15:39:38', '60.208.132.34');
INSERT INTO `log_system` VALUES (1465, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 15:44:49', '60.208.132.34');
INSERT INTO `log_system` VALUES (1466, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":1}', '2022-12-13 15:45:17', '60.208.132.34');
INSERT INTO `log_system` VALUES (1467, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 15:45:21', '60.208.132.34');
INSERT INTO `log_system` VALUES (1468, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 15:46:00', '60.208.132.34');
INSERT INTO `log_system` VALUES (1469, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 15:46:56', '60.208.132.34');
INSERT INTO `log_system` VALUES (1470, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-13 16:13:41', '60.208.132.34');
INSERT INTO `log_system` VALUES (1471, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-13 16:13:55', '60.208.132.34');
INSERT INTO `log_system` VALUES (1472, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 16:14:15', '60.208.132.34');
INSERT INTO `log_system` VALUES (1473, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 16:54:16', '124.128.97.210');
INSERT INTO `log_system` VALUES (1474, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 16:54:27', '124.128.97.210');
INSERT INTO `log_system` VALUES (1475, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-13 18:10:22', '219.121.2.115');
INSERT INTO `log_system` VALUES (1476, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-13 18:17:28', '124.128.97.210');
INSERT INTO `log_system` VALUES (1477, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 18:18:11', '124.128.97.210');
INSERT INTO `log_system` VALUES (1478, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 18:20:10', '124.128.97.210');
INSERT INTO `log_system` VALUES (1479, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-13 18:26:37', '124.128.97.210');
INSERT INTO `log_system` VALUES (1480, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-13 18:27:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (1481, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-12-14 10:54:23', '126.166.163.245');
INSERT INTO `log_system` VALUES (1482, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-12-14 10:56:04', '126.166.163.245');
INSERT INTO `log_system` VALUES (1483, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":2}', '2022-12-14 10:56:07', '126.166.163.245');
INSERT INTO `log_system` VALUES (1484, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"tanweilun\",\"password\":\"\",\"account_type\":1}', '2022-12-14 10:57:02', '126.166.163.245');
INSERT INTO `log_system` VALUES (1485, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:07:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (1486, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"super_admin\",\"password\":\"\",\"account_type\":0}', '2022-12-14 11:07:57', '3.113.23.101');
INSERT INTO `log_system` VALUES (1487, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"liujingtian\",\"account_name\":\"刘竟天\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-12-14 11:09:01', '3.113.23.101');
INSERT INTO `log_system` VALUES (1488, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"liujingtian\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:09:12', '124.128.97.210');
INSERT INTO `log_system` VALUES (1489, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"liujingtian\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:09:32', '5.44.249.51');
INSERT INTO `log_system` VALUES (1490, 1, 1, 'account', 'insert', '超级管理员', '添加角色:{\"account\":\"liudejin\",\"account_name\":\"刘德金\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-12-14 11:09:36', '3.113.23.101');
INSERT INTO `log_system` VALUES (1491, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"liudejin\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:10:01', '5.44.249.51');
INSERT INTO `log_system` VALUES (1492, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:11:15', '124.128.97.210');
INSERT INTO `log_system` VALUES (1493, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"limeilu\",\"password\":\"\",\"account_type\":1}', '2022-12-14 11:13:22', '3.113.23.101');
INSERT INTO `log_system` VALUES (1494, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"OMjpchangA\",\"password\":\"\",\"account_type\":2}', '2022-12-14 12:31:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (1495, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-14 14:08:13', '124.128.97.210');
INSERT INTO `log_system` VALUES (1496, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-14 14:09:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1497, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"dongzhi\",\"password\":\"\",\"account_type\":1}', '2022-12-14 14:21:21', '219.121.2.115');
INSERT INTO `log_system` VALUES (1498, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"changguiguo\",\"password\":\"\",\"account_type\":1}', '2022-12-14 15:10:58', '124.128.97.210');
INSERT INTO `log_system` VALUES (1499, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-14 16:23:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (1500, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:12:38', '124.128.97.210');
INSERT INTO `log_system` VALUES (1501, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:12:59', '124.128.97.210');
INSERT INTO `log_system` VALUES (1502, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:15:46', '124.128.97.210');
INSERT INTO `log_system` VALUES (1503, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:16:19', '124.128.97.210');
INSERT INTO `log_system` VALUES (1504, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:43:53', '124.128.97.210');
INSERT INTO `log_system` VALUES (1505, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-14 17:44:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1506, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-14 18:42:44', '124.128.97.210');
INSERT INTO `log_system` VALUES (1507, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"handaxin\",\"password\":\"\",\"account_type\":2}', '2022-12-14 18:49:12', '219.121.2.115');
INSERT INTO `log_system` VALUES (1508, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-12-14 18:49:24', '124.128.97.210');
INSERT INTO `log_system` VALUES (1509, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"handaxin\",\"password\":\"\",\"account_type\":2}', '2022-12-14 18:50:12', '219.121.2.115');
INSERT INTO `log_system` VALUES (1510, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"zhangguozhen\",\"password\":\"\",\"account_type\":1}', '2022-12-14 18:50:33', '124.128.97.210');
INSERT INTO `log_system` VALUES (1511, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"handaxin\",\"password\":\"\",\"account_type\":1}', '2022-12-14 18:50:49', '219.121.2.115');
INSERT INTO `log_system` VALUES (1512, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-14 18:56:17', '124.128.97.210');
INSERT INTO `log_system` VALUES (1513, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-14 19:03:26', '124.128.97.210');
INSERT INTO `log_system` VALUES (1514, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"BJOM7700\",\"password\":\"\",\"account_type\":2}', '2022-12-14 19:03:50', '124.128.97.210');
INSERT INTO `log_system` VALUES (1515, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"inspayjp\",\"password\":\"\",\"account_type\":2}', '2022-12-14 19:09:47', '124.128.97.210');
INSERT INTO `log_system` VALUES (1516, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"SDOM1\",\"password\":\"\",\"account_type\":2}', '2022-12-14 19:26:18', '124.128.97.210');
INSERT INTO `log_system` VALUES (1517, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-15 09:37:48', '219.121.2.115');
INSERT INTO `log_system` VALUES (1518, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-15 09:40:20', '219.121.2.115');
INSERT INTO `log_system` VALUES (1519, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"chengjunsheng\",\"password\":\"\",\"account_type\":1}', '2022-12-15 09:40:21', '219.121.2.115');
INSERT INTO `log_system` VALUES (1520, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"Inspiry_SUNPOKKA\",\"password\":\"\",\"account_type\":2}', '2022-12-15 10:37:41', '124.128.97.210');
INSERT INTO `log_system` VALUES (1521, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"paimeng\",\"password\":\"\",\"account_type\":0}', '2022-12-15 11:14:55', '124.128.97.210');
INSERT INTO `log_system` VALUES (1522, 1, 1, 'account', 'insert', '山东派盟', '添加角色:{\"account\":\"haodoudou\",\"account_name\":\"郝豆豆\",\"password\":\"a123456\",\"role_pk\":10,\"mobile\":\"\",\"account_id\":\"\"}', '2022-12-15 11:15:51', '124.128.97.210');
INSERT INTO `log_system` VALUES (1523, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"haodoudou\",\"password\":\"\",\"account_type\":1}', '2022-12-15 11:20:13', '219.121.2.115');
INSERT INTO `log_system` VALUES (1524, 1, 1, 'account', 'login', '', '账户登录:{\"mobile\":\"\",\"account\":\"haodoudou\",\"password\":\"\",\"account_type\":1}', '2022-12-15 11:22:01', '219.121.2.115');

-- ----------------------------
-- Table structure for sso_account
-- ----------------------------
DROP TABLE IF EXISTS `sso_account`;
CREATE TABLE `sso_account`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外ID',
  `account_type` set('0x01','0x02','0x03','0x04') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0x01' COMMENT '账户类型 0x01 员工 ，0x02 服务商，0x03 商户，0x04 消费者',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `pm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '派盟账户',
  `dingtalk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉账户',
  `wechat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信账户',
  `github` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'github',
  `qq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `twitter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `line` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '安全秘钥',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sso_account
-- ----------------------------
INSERT INTO `sso_account` VALUES (1, '7afa3e1e251011ed800c9ac3cc94a789', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (2, '85ffb1e4395e11edb22fee360bed21de', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (3, '9df09f27395e11edb22fee360bed21de', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (4, '2f9d091f396311edb22fee360bed21de', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (5, '7cbabc76396e11edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (6, 'dd33432c396e11edb22fee360bed21de', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (7, '3df018a5396f11edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (8, '5bba6a5f397111edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (9, '1cbf9735397211edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (10, 'efbd23ae397211edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (11, '2db31d41397311edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (12, '4aa2db15397311edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (13, 'dde33558397311edb22fee360bed21de', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (14, '9b77b1cb3a2011ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (15, 'e81bbbc43a2011ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (16, '0bd0bd1e3a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (17, '207c59e03a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (18, '306a9ec13a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (19, '4465b72c3a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (20, '4ca686153a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (21, 'eb0b2a493a2111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (22, 'c751fc153a4111ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (23, 'f896048b3a4211ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (24, '29f67a703a4311ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (25, '769746c63a4311ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (26, '56b9689e3a4811ed8bf10a1a0af9082f', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (27, 'fdd277c83e0c11ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (28, '2735cb543fb811ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (29, 'fea25ee2537711ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (30, '0e95337755bf11ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (31, 'e99bf11755c011ed8bf10a1a0af9082f', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (32, 'f362089e58c711ed8bf10a1a0af9082f', '0x02', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (33, 'b5eef0b26ec011ed8bf10a1a0af9082f', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (34, '4684368c7b5411eda5651a878f93c2e4', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (35, '5b5cef457b5411eda5651a878f93c2e4', '0x01', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `sso_account` VALUES (36, '655442bf7c1e11eda5651a878f93c2e4', '0x01', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for sso_token
-- ----------------------------
DROP TABLE IF EXISTS `sso_token`;
CREATE TABLE `sso_token`  (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('jwt') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'jwt' COMMENT 'token 类型',
  `access_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
  `org_pk` int(11) NULL DEFAULT NULL COMMENT '组织id',
  `app_pk` int(11) NULL DEFAULT NULL COMMENT '应用id',
  `account_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'code',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sso_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
