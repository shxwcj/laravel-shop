/*
Navicat MySQL Data Transfer

Source Server         : homestead
Source Server Version : 50725
Source Host           : 192.168.10.10:3306
Source Database       : laravel-shop

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-13 17:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, null, '2019-05-09 04:15:30');
INSERT INTO `admin_menu` VALUES ('2', '0', '6', '系统管理', 'fa-tasks', null, null, null, '2019-06-12 08:19:47');
INSERT INTO `admin_menu` VALUES ('3', '2', '7', '管理员', 'fa-users', 'auth/users', null, null, '2019-06-12 08:19:47');
INSERT INTO `admin_menu` VALUES ('4', '2', '8', '角色', 'fa-user', 'auth/roles', null, null, '2019-06-12 08:19:47');
INSERT INTO `admin_menu` VALUES ('5', '2', '9', '权限', 'fa-ban', 'auth/permissions', null, null, '2019-06-12 08:19:47');
INSERT INTO `admin_menu` VALUES ('6', '2', '10', '菜单', 'fa-bars', 'auth/menu', null, null, '2019-06-12 08:19:48');
INSERT INTO `admin_menu` VALUES ('7', '2', '11', '操作日志', 'fa-history', 'auth/logs', null, null, '2019-06-12 08:19:48');
INSERT INTO `admin_menu` VALUES ('8', '0', '2', '用户管理', 'fa-users', '/users', null, '2019-05-09 04:37:22', '2019-05-09 05:01:12');
INSERT INTO `admin_menu` VALUES ('9', '0', '3', '商品管理', 'fa-cubes', '/products', null, '2019-05-09 10:48:01', '2019-05-09 10:49:38');
INSERT INTO `admin_menu` VALUES ('10', '0', '4', '订单管理', 'fa-rmb', '/orders', null, '2019-05-17 02:58:14', '2019-05-17 02:58:23');
INSERT INTO `admin_menu` VALUES ('11', '0', '5', '优惠券管理', 'fa-tags', '/coupon_codes', null, '2019-06-12 08:19:36', '2019-06-12 08:19:47');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-09 04:11:21', '2019-05-09 04:11:21');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:14:32', '2019-05-09 04:14:32');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:14:55', '2019-05-09 04:14:55');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:15:30', '2019-05-09 04:15:30');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:15:31', '2019-05-09 04:15:31');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:15:41', '2019-05-09 04:15:41');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:15:45', '2019-05-09 04:15:45');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:16:00', '2019-05-09 04:16:00');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:16:14', '2019-05-09 04:16:14');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:16:15', '2019-05-09 04:16:15');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:16:21', '2019-05-09 04:16:21');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:16:40', '2019-05-09 04:16:40');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:16:41', '2019-05-09 04:16:41');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:16:47', '2019-05-09 04:16:47');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:16:57', '2019-05-09 04:16:57');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:16:59', '2019-05-09 04:16:59');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:17:14', '2019-05-09 04:17:14');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:17:19', '2019-05-09 04:17:19');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:17:21', '2019-05-09 04:17:21');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:17:28', '2019-05-09 04:17:28');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:17:39', '2019-05-09 04:17:39');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:17:41', '2019-05-09 04:17:41');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:17:50', '2019-05-09 04:17:50');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 04:17:55', '2019-05-09 04:17:55');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:17:57', '2019-05-09 04:17:57');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:18:08', '2019-05-09 04:18:08');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:36:16', '2019-05-09 04:36:16');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:36:20', '2019-05-09 04:36:20');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\"}', '2019-05-09 04:37:21', '2019-05-09 04:37:21');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 04:37:23', '2019-05-09 04:37:23');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 05:00:58', '2019-05-09 05:00:58');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 05:01:11', '2019-05-09 05:01:11');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 05:01:13', '2019-05-09 05:01:13');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 06:14:59', '2019-05-09 06:14:59');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:15:08', '2019-05-09 06:15:08');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:16:33', '2019-05-09 06:16:33');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:18:24', '2019-05-09 06:18:24');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:18:31', '2019-05-09 06:18:31');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-05-09 06:19:23', '2019-05-09 06:19:23');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-05-09 06:19:25', '2019-05-09 06:19:25');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:19:57', '2019-05-09 06:19:57');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:20:16', '2019-05-09 06:20:16');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:20:23', '2019-05-09 06:20:23');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/roles', 'POST', '192.168.10.1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/roles\"}', '2019-05-09 06:22:50', '2019-05-09 06:22:50');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-05-09 06:22:52', '2019-05-09 06:22:52');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:23:18', '2019-05-09 06:23:18');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:23:25', '2019-05-09 06:23:25');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/auth/users', 'POST', '192.168.10.1', '{\"username\":\"operator\",\"name\":\"\\u8fd0\\u8425\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NVkP0gA9hiV0FKr9tXrmmewe2B8KIenkRFtNm1jy\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/users\"}', '2019-05-09 06:24:17', '2019-05-09 06:24:17');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2019-05-09 06:24:19', '2019-05-09 06:24:19');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:24:27', '2019-05-09 06:24:27');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:24:38', '2019-05-09 06:24:38');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:25:05', '2019-05-09 06:25:05');
INSERT INTO `admin_operation_log` VALUES ('53', '2', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-09 06:25:38', '2019-05-09 06:25:38');
INSERT INTO `admin_operation_log` VALUES ('54', '2', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:25:51', '2019-05-09 06:25:51');
INSERT INTO `admin_operation_log` VALUES ('55', '2', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:25:51', '2019-05-09 06:25:51');
INSERT INTO `admin_operation_log` VALUES ('56', '2', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:26:03', '2019-05-09 06:26:03');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-09 06:26:44', '2019-05-09 06:26:44');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:47:12', '2019-05-09 10:47:12');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"q5ADa1LAX4BCb68RfVKbf7m6bHQVBoEBGV4ena22\"}', '2019-05-09 10:48:00', '2019-05-09 10:48:00');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 10:48:02', '2019-05-09 10:48:02');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:48:23', '2019-05-09 10:48:23');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:48:47', '2019-05-09 10:48:47');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 10:49:26', '2019-05-09 10:49:26');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"q5ADa1LAX4BCb68RfVKbf7m6bHQVBoEBGV4ena22\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 10:49:38', '2019-05-09 10:49:38');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:49:40', '2019-05-09 10:49:40');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 10:49:44', '2019-05-09 10:49:44');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:50:54', '2019-05-09 10:50:54');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"q5ADa1LAX4BCb68RfVKbf7m6bHQVBoEBGV4ena22\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2019-05-09 10:56:21', '2019-05-09 10:56:21');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-09 10:56:24', '2019-05-09 10:56:24');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 10:56:32', '2019-05-09 10:56:32');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-05-09 10:58:07', '2019-05-09 10:58:07');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-05-09 11:23:05', '2019-05-09 11:23:05');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-05-09 11:24:29', '2019-05-09 11:24:29');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-10 02:20:58', '2019-05-10 02:20:58');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:22:05', '2019-05-10 02:22:05');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-05-10 02:23:35', '2019-05-10 02:23:35');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-05-10 02:29:02', '2019-05-10 02:29:02');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:29:12', '2019-05-10 02:29:12');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"iPhone XS Max\",\"description\":\"<p>Apple iPhone XS Max (A2104) 256GB \\u94f6\\u8272 \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a \\u53cc\\u5361\\u53cc\\u5f85<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u94f6\\u8272256GB\",\"description\":\"iPhone XS Max\",\"price\":\"9699.00\",\"stock\":\"150\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"9LMVEL5C6vLNh3v3d4tMmcM6aLNs3VscGqjCaPsd\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2019-05-10 02:52:33', '2019-05-10 02:52:33');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-05-10 02:52:36', '2019-05-10 02:52:36');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 03:01:39', '2019-05-10 03:01:39');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"iPhone XS Max\",\"description\":\"<p>Apple iPhone XS Max (A2104) 256GB \\u94f6\\u8272 \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a \\u53cc\\u5361\\u53cc\\u5f85<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272256GB\",\"description\":\"iPhone XS Max \\u652f\\u6301\\u53cc\\u5361\\u53cc\\u5f85\",\"price\":\"9699.00\",\"stock\":\"150\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"9LMVEL5C6vLNh3v3d4tMmcM6aLNs3VscGqjCaPsd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2019-05-10 03:02:52', '2019-05-10 03:02:52');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2019-05-10 03:02:54', '2019-05-10 03:02:54');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 03:03:28', '2019-05-10 03:03:28');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2019-05-10 03:06:15', '2019-05-10 03:06:15');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-17 02:04:28', '2019-05-17 02:04:28');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 02:10:41', '2019-05-17 02:10:41');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 02:57:28', '2019-05-17 02:57:28');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"permission\":null,\"_token\":\"onWzZ7dUsCAd5ODYMaTemXMGAwKCU0Q2EK1rtn9a\"}', '2019-05-17 02:58:13', '2019-05-17 02:58:13');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-17 02:58:15', '2019-05-17 02:58:15');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"onWzZ7dUsCAd5ODYMaTemXMGAwKCU0Q2EK1rtn9a\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-17 02:58:23', '2019-05-17 02:58:23');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 02:58:24', '2019-05-17 02:58:24');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 02:58:34', '2019-05-17 02:58:34');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-05-17 02:58:37', '2019-05-17 02:58:37');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 02:58:42', '2019-05-17 02:58:42');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/orders', 'GET', '192.168.10.1', '[]', '2019-05-17 02:58:56', '2019-05-17 02:58:56');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 03:22:51', '2019-05-17 03:22:51');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 03:23:22', '2019-05-17 03:23:22');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 03:45:00', '2019-05-17 03:45:00');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/orders/1', 'GET', '192.168.10.1', '[]', '2019-05-17 03:46:18', '2019-05-17 03:46:18');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/orders/1/ship', 'POST', '192.168.10.1', '{\"_token\":\"onWzZ7dUsCAd5ODYMaTemXMGAwKCU0Q2EK1rtn9a\",\"express_company\":null,\"express_no\":null}', '2019-05-17 03:47:59', '2019-05-17 03:47:59');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-17 03:48:18', '2019-05-17 03:48:18');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 03:48:23', '2019-05-17 03:48:23');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/orders/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 03:48:26', '2019-05-17 03:48:26');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/orders/1/ship', 'POST', '192.168.10.1', '{\"_token\":\"onWzZ7dUsCAd5ODYMaTemXMGAwKCU0Q2EK1rtn9a\",\"express_company\":null,\"express_no\":null}', '2019-05-17 03:48:30', '2019-05-17 03:48:30');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/orders/1', 'GET', '192.168.10.1', '[]', '2019-05-17 03:48:37', '2019-05-17 03:48:37');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-17 06:46:29', '2019-05-17 06:46:29');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-28 07:17:48', '2019-05-28 07:17:48');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-28 07:18:02', '2019-05-28 07:18:02');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-28 07:18:10', '2019-05-28 07:18:10');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-05-29 02:33:09', '2019-05-29 02:33:09');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-29 02:33:20', '2019-05-29 02:33:20');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-29 02:33:26', '2019-05-29 02:33:26');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2019-05-29 02:42:44', '2019-05-29 02:42:44');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2019-05-29 02:46:05', '2019-05-29 02:46:05');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-06-10 01:54:26', '2019-06-10 01:54:26');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:10:20', '2019-06-11 10:10:20');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-11 10:10:41', '2019-06-11 10:10:41');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/orders/4', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-11 10:10:49', '2019-06-11 10:10:49');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:12:44', '2019-06-11 10:12:44');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:13:15', '2019-06-11 10:13:15');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:15:17', '2019-06-11 10:15:17');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/orders/4/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"\\u60a8\\u5df2\\u7ecf\\u62c6\\u5c01\\u5e76\\u4e14\\u4f7f\\u7528\",\"_token\":\"HtCTNG7VEajA5WZFNS4sIFfKl7mBZELVkw6ARW3K\"}', '2019-06-11 10:16:37', '2019-06-11 10:16:37');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:16:45', '2019-06-11 10:16:45');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:17:06', '2019-06-11 10:17:06');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/orders/2', 'GET', '192.168.10.1', '[]', '2019-06-11 10:17:15', '2019-06-11 10:17:15');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:20:07', '2019-06-11 10:20:07');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:25:29', '2019-06-11 10:25:29');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:28:19', '2019-06-11 10:28:19');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:29:16', '2019-06-11 10:29:16');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:29:21', '2019-06-11 10:29:21');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:30:17', '2019-06-11 10:30:17');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:30:55', '2019-06-11 10:30:55');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/orders/4/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"\\u60a8\\u5df2\\u4f7f\\u7528\",\"_token\":\"HtCTNG7VEajA5WZFNS4sIFfKl7mBZELVkw6ARW3K\"}', '2019-06-11 10:31:07', '2019-06-11 10:31:07');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/orders/4/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"\\u548c\\u4eba\\u5605\\u8df3\\u4e00\\u8df3\\u4e8e\\u540c\\u4e00\\u5bb6\",\"_token\":\"HtCTNG7VEajA5WZFNS4sIFfKl7mBZELVkw6ARW3K\"}', '2019-06-11 10:33:03', '2019-06-11 10:33:03');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/orders/4/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"\\u628a\\u628a\\u5173\",\"_token\":\"HtCTNG7VEajA5WZFNS4sIFfKl7mBZELVkw6ARW3K\"}', '2019-06-11 10:33:20', '2019-06-11 10:33:20');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:56:22', '2019-06-11 10:56:22');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/orders/4/refund', 'POST', '192.168.10.1', '{\"agree\":true,\"_token\":\"HtCTNG7VEajA5WZFNS4sIFfKl7mBZELVkw6ARW3K\"}', '2019-06-11 10:56:29', '2019-06-11 10:56:29');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:56:33', '2019-06-11 10:56:33');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/orders/4', 'GET', '192.168.10.1', '[]', '2019-06-11 10:57:55', '2019-06-11 10:57:55');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-06-12 08:18:37', '2019-06-12 08:18:37');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:18:48', '2019-06-12 08:18:48');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa-tags\",\"uri\":\"\\/coupon_codes\",\"roles\":[null],\"permission\":null,\"_token\":\"et6RC1CmQVplMbByiCJnMOYtXVgwJ32YZjVWxQ3S\"}', '2019-06-12 08:19:34', '2019-06-12 08:19:34');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-06-12 08:19:39', '2019-06-12 08:19:39');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"et6RC1CmQVplMbByiCJnMOYtXVgwJ32YZjVWxQ3S\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-06-12 08:19:47', '2019-06-12 08:19:47');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:19:49', '2019-06-12 08:19:49');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-06-12 08:20:15', '2019-06-12 08:20:15');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:20:23', '2019-06-12 08:20:23');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-12 08:34:58', '2019-06-12 08:34:58');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"name\":\"et aut ut\",\"code\":null,\"created_at\":null,\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:35:43', '2019-06-12 08:35:43');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"code\":null,\"created_at\":null}', '2019-06-12 08:35:52', '2019-06-12 08:35:52');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"code\":\"S8QGZRDAG4C7VV\",\"created_at\":null}', '2019-06-12 08:36:07', '2019-06-12 08:36:07');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"code\":null,\"created_at\":null}', '2019-06-12 08:36:22', '2019-06-12 08:36:22');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"name\":null,\"code\":null,\"created_at\":null}', '2019-06-12 08:48:00', '2019-06-12 08:48:00');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"name\":null,\"code\":null,\"created_at\":null}', '2019-06-12 08:49:54', '2019-06-12 08:49:54');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/coupon_codes/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:51:57', '2019-06-12 08:51:57');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/coupon_codes/1', 'GET', '192.168.10.1', '[]', '2019-06-12 08:53:18', '2019-06-12 08:53:18');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/coupon_codes/1', 'GET', '192.168.10.1', '[]', '2019-06-12 08:54:04', '2019-06-12 08:54:04');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/coupon_codes/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:54:12', '2019-06-12 08:54:12');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/coupon_codes/1', 'PUT', '192.168.10.1', '{\"name\":\"modi omnis et\",\"code\":\"90MN5R2ZB4XU3NS0\",\"type\":\"percent\",\"value\":\"50\",\"total\":\"1000\",\"used\":\"0\",\"min_amount\":\"0\",\"not_before\":\"2019-06-12 08:54:12\",\"not_after\":\"2019-06-12 08:54:12\",\"enabled\":\"on\",\"_token\":\"et6RC1CmQVplMbByiCJnMOYtXVgwJ32YZjVWxQ3S\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/coupon_codes\\/1\"}', '2019-06-12 08:54:31', '2019-06-12 08:54:31');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/coupon_codes/1', 'GET', '192.168.10.1', '[]', '2019-06-12 08:54:33', '2019-06-12 08:54:33');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-12 08:57:04', '2019-06-12 08:57:04');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-06-13 06:23:18', '2019-06-13 06:23:18');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:23:38', '2019-06-13 06:23:38');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:25:12', '2019-06-13 06:25:12');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/coupon_codes', 'POST', '192.168.10.1', '{\"name\":null,\"code\":null,\"type\":\"fixed\",\"value\":null,\"total\":null,\"min_amount\":null,\"not_before\":\"2019-06-13 00:00:00\",\"not_after\":\"2019-06-13 00:00:00\",\"enabled\":\"0\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/coupon_codes\"}', '2019-06-13 06:25:30', '2019-06-13 06:25:30');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2019-06-13 06:25:47', '2019-06-13 06:25:47');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/coupon_codes', 'POST', '192.168.10.1', '{\"name\":\"Walmart\",\"code\":\"90MN5R2ZB4XU3NS0\",\"type\":\"fixed\",\"value\":\"50\",\"total\":\"1000\",\"min_amount\":\"500\",\"not_before\":\"2019-06-13 00:00:00\",\"not_after\":\"2019-06-13 00:00:00\",\"enabled\":\"0\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\"}', '2019-06-13 06:28:30', '2019-06-13 06:28:30');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2019-06-13 06:28:36', '2019-06-13 06:28:36');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/coupon_codes', 'POST', '192.168.10.1', '{\"name\":\"Walmart\",\"code\":null,\"type\":\"fixed\",\"value\":\"50\",\"total\":\"1000\",\"min_amount\":\"500\",\"not_before\":\"2019-06-13 00:00:00\",\"not_after\":\"2019-06-13 00:00:00\",\"enabled\":\"0\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\"}', '2019-06-13 06:28:49', '2019-06-13 06:28:49');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-13 06:28:54', '2019-06-13 06:28:54');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:29:39', '2019-06-13 06:29:39');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/coupon_codes/11', 'PUT', '192.168.10.1', '{\"name\":\"Walmart\",\"code\":\"JMQGXSPHDHZA0YGP\",\"type\":\"fixed\",\"value\":\"50.00\",\"total\":\"1000\",\"min_amount\":\"500.00\",\"not_before\":\"2019-06-20 00:00:00\",\"not_after\":\"2019-06-13 00:00:00\",\"enabled\":\"0\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/coupon_codes\"}', '2019-06-13 06:49:21', '2019-06-13 06:49:21');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:52:31', '2019-06-13 06:52:31');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '[]', '2019-06-13 06:52:32', '2019-06-13 06:52:32');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-13 06:52:43', '2019-06-13 06:52:43');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '[]', '2019-06-13 06:52:45', '2019-06-13 06:52:45');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '[]', '2019-06-13 06:53:10', '2019-06-13 06:53:10');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/coupon_codes/11/edit', 'GET', '192.168.10.1', '[]', '2019-06-13 06:53:41', '2019-06-13 06:53:41');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/coupon_codes/11', 'PUT', '192.168.10.1', '{\"name\":\"Walmart\",\"code\":\"JMQGXSPHDHZA0YGP\",\"type\":\"fixed\",\"value\":\"50.00\",\"total\":\"200\",\"min_amount\":\"500.00\",\"not_before\":\"2019-06-13 00:00:00\",\"not_after\":\"2019-06-13 00:00:00\",\"enabled\":\"0\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_method\":\"PUT\"}', '2019-06-13 06:53:59', '2019-06-13 06:53:59');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-13 06:54:04', '2019-06-13 06:54:04');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:54:13', '2019-06-13 06:54:13');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-13 06:54:28', '2019-06-13 06:54:28');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2019-06-13 06:56:57', '2019-06-13 06:56:57');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:57:09', '2019-06-13 06:57:09');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:57:56', '2019-06-13 06:57:56');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/coupon_codes/11', 'DELETE', '192.168.10.1', '{\"_method\":\"delete\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\"}', '2019-06-13 06:58:07', '2019-06-13 06:58:07');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 06:58:11', '2019-06-13 06:58:11');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin', 'GET', '192.168.10.1', '[]', '2019-06-13 08:00:10', '2019-06-13 08:00:10');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:00:27', '2019-06-13 08:00:27');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:20:23', '2019-06-13 08:20:23');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:20:32', '2019-06-13 08:20:32');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"products\",\"name\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/products*\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-06-13 08:21:18', '2019-06-13 08:21:18');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-06-13 08:21:19', '2019-06-13 08:21:19');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:21:28', '2019-06-13 08:21:28');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"coupon_codes\",\"name\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/coupon_codes*\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-06-13 08:22:12', '2019-06-13 08:22:12');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-06-13 08:22:14', '2019-06-13 08:22:14');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:22:18', '2019-06-13 08:22:18');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"orders\",\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/orders*\",\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2019-06-13 08:22:44', '2019-06-13 08:22:44');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2019-06-13 08:22:46', '2019-06-13 08:22:46');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:23:27', '2019-06-13 08:23:27');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/auth/roles/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-06-13 08:23:41', '2019-06-13 08:23:41');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/auth/roles/2', 'PUT', '192.168.10.1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",null],\"_token\":\"ZGvEFLeS1VVDuYBMBBaexeaPlNodYogTzIoCYIh4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/roles\"}', '2019-06-13 08:24:05', '2019-06-13 08:24:05');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2019-06-13 08:24:07', '2019-06-13 08:24:07');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', '用户管理', 'users', '', '/users*', '2019-05-09 06:19:23', '2019-05-09 06:19:23');
INSERT INTO `admin_permissions` VALUES ('7', '商品管理', 'products', '', '/products*', '2019-06-13 08:21:18', '2019-06-13 08:21:18');
INSERT INTO `admin_permissions` VALUES ('8', '优惠券管理', 'coupon_codes', '', '/coupon_codes*', '2019-06-13 08:22:13', '2019-06-13 08:22:13');
INSERT INTO `admin_permissions` VALUES ('9', '订单管理', 'orders', '', '/orders*', '2019-06-13 08:22:44', '2019-06-13 08:22:44');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '2', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '3', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '4', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '6', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '7', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '8', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '9', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_users` VALUES ('2', '2', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2019-05-09 04:03:01', '2019-05-09 04:03:01');
INSERT INTO `admin_roles` VALUES ('2', '运营', 'operation', '2019-05-09 06:22:51', '2019-05-09 06:22:51');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
INSERT INTO `admin_user_permissions` VALUES ('1', '1', '2019-05-17 12:32:03', '2019-05-17 12:32:06');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$JYKT/rU0V.DsRmoJmGJmjOoMHD4C6tGQLYwoXYIQmP/4tf2XF72Vy', 'Administrator', null, 'rAYRCi8OtKcYYnKJqKnlB7MtiZ6DOkX2eSqU8XIyajfEUxCI3PGgyQ1ePLeJ', '2019-05-09 04:03:01', '2019-05-09 04:03:01');
INSERT INTO `admin_users` VALUES ('2', 'operator', '$2y$10$LTy.XzWWCTehVl9iUVJQC.1h..sXQ5njdrpaBH4H26lALyTDHSrji', '运营', null, 'osMdfgGj7IKvwqk996XHxpId9J9JQP31aqJTUq1XYYludmsmNTURZMtuyU62', '2019-05-09 06:24:18', '2019-05-09 06:24:18');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `product_sku_id` bigint(20) unsigned NOT NULL COMMENT '商品 SKU ID',
  `amount` bigint(20) unsigned NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES ('4', '1', '27', '1');

-- ----------------------------
-- Table structure for coupon_codes
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '	优惠券的标题',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠码',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券类型',
  `value` decimal(8,2) NOT NULL COMMENT '折扣值',
  `total` bigint(20) unsigned NOT NULL COMMENT '可兑换的数量',
  `used` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '当前已兑换的数量',
  `min_amount` decimal(10,2) NOT NULL COMMENT '使用该优惠券的最低订单金额',
  `not_before` datetime DEFAULT NULL COMMENT '在这个时间之前不可用',
  `not_after` datetime DEFAULT NULL COMMENT '在这个时间之后不可用',
  `enabled` tinyint(1) NOT NULL COMMENT '优惠券是否生效',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------
INSERT INTO `coupon_codes` VALUES ('1', 'modi omnis et', '90MN5R2ZB4XU3NS0', 'percent', '50.00', '1000', '7', '0.00', '2019-06-12 08:54:12', '2019-06-12 08:54:12', '1', '2019-06-12 08:33:46', '2019-06-13 08:52:04');
INSERT INTO `coupon_codes` VALUES ('2', 'est labore ut', '2RUDM2AOEIY4XXTG', 'fixed', '198.00', '1000', '1', '198.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-13 08:16:46');
INSERT INTO `coupon_codes` VALUES ('3', 'maiores et expedita', 'FZERXP2C8AB9QJKA', 'fixed', '70.00', '1000', '0', '70.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('4', 'minus incidunt enim', 'S8QGZRDAG4C7VVFY', 'fixed', '68.00', '1000', '0', '68.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('5', 'et aut ut', '2RKT6JJSN7XSZMIM', 'percent', '49.00', '1000', '1', '0.00', null, null, '1', '2019-06-12 08:33:46', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('6', 'fugiat ipsum placeat', 'YMGAUELO3ZDNI8RF', 'fixed', '79.00', '1000', '0', '79.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('7', 'architecto accusamus magnam', 'TK3TS8RBNCDO6KO6', 'percent', '41.00', '1000', '8', '0.00', null, null, '1', '2019-06-12 08:33:46', '2019-06-13 08:52:04');
INSERT INTO `coupon_codes` VALUES ('8', 'id vitae sit', 'WT8DTLGYNHQBPZXT', 'fixed', '36.00', '1000', '0', '36.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('9', 'enim et labore', 'HZZVSYA6UN4QTLTL', 'fixed', '24.00', '1000', '0', '24.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('10', 'aspernatur dolores voluptates', 'XUA2FT2TVLLXQU0R', 'fixed', '129.00', '1000', '0', '129.01', null, null, '1', '2019-06-12 08:33:46', '2019-06-12 08:33:46');
INSERT INTO `coupon_codes` VALUES ('12', 'accusantium doloremque voluptatum', 'U2YHQINAFKKTLWBS', 'fixed', '128.00', '1000', '0', '128.01', null, null, '1', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `coupon_codes` VALUES ('13', 'qui sed quod', 'ESMU08GJ7ES2R5Y9', 'fixed', '149.00', '1000', '0', '149.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('14', 'vero accusantium vitae', 'EPRT8ELAA7BHN45P', 'percent', '50.00', '1000', '0', '316.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('15', 'aspernatur quidem mollitia', 'HIFYMTMR97TBMACS', 'fixed', '19.00', '1000', '0', '19.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('16', 'ullam dolorem impedit', 'LNE93BJ2FJ40PZEW', 'percent', '7.00', '1000', '0', '202.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('17', 'aut qui optio', 'YF2XJPOWWL4HO8VS', 'fixed', '109.00', '1000', '0', '109.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('18', 'nihil illo enim', 'EFIMRELPQUQROOQX', 'fixed', '126.00', '1000', '0', '126.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('19', 'possimus sunt expedita', 'R0HKKBIRZ1MOT5LX', 'percent', '50.00', '1000', '0', '644.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('20', 'et error sit', 'VKOSW4QJKUZDOTMZ', 'fixed', '177.00', '1000', '0', '177.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('21', 'qui voluptas sunt', 'KEGJE4DGS6CLSKOV', 'percent', '26.00', '1000', '7', '0.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:04');
INSERT INTO `coupon_codes` VALUES ('22', 'rerum repellat et', 'G9IPRVBLWGUTFOBE', 'percent', '11.00', '1000', '5', '0.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:04');
INSERT INTO `coupon_codes` VALUES ('23', 'fuga repudiandae sunt', '6UNGL0QGOPHXOYWT', 'percent', '37.00', '1000', '0', '999.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('24', 'illum aspernatur beatae', 'XGLF3RH5BF8AKTYV', 'fixed', '37.00', '1000', '0', '37.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('25', 'quaerat enim sunt', 'OBSUARG5CHWGLEKM', 'fixed', '138.00', '1000', '0', '138.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('26', 'repellendus sunt et', 'PRFESIXJYP7JG7NG', 'percent', '37.00', '1000', '0', '602.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('27', 'quidem ut asperiores', 'ODP5BDKB3QJALTEZ', 'percent', '38.00', '1000', '4', '0.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:04');
INSERT INTO `coupon_codes` VALUES ('28', 'cum sit labore', 'X0U0GVBTJWOLVXAF', 'fixed', '150.00', '1000', '0', '150.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('29', 'recusandae eos aut', 'SGMA307JLBZG0HD1', 'fixed', '200.00', '1000', '0', '200.01', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('30', 'vel perferendis nihil', '3J3UUDZPMPSTGKYS', 'percent', '31.00', '1000', '0', '683.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');
INSERT INTO `coupon_codes` VALUES ('31', 'enim repudiandae omnis', '9MQ8RF9UNDMHFRVS', 'percent', '12.00', '1000', '3', '0.00', null, null, '1', '2019-06-13 08:52:03', '2019-06-13 08:52:03');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_05_07_080003_create_user_addresses_table', '2');
INSERT INTO `migrations` VALUES ('4', '2016_01_04_173148_create_admin_tables', '3');
INSERT INTO `migrations` VALUES ('5', '2019_05_09_064514_create_products_table', '4');
INSERT INTO `migrations` VALUES ('6', '2019_05_09_064801_create_product_skus_table', '4');
INSERT INTO `migrations` VALUES ('7', '2019_05_13_022523_create_user_favorite_products_table', '5');
INSERT INTO `migrations` VALUES ('8', '2019_05_14_063227_create_cart_items_table', '6');
INSERT INTO `migrations` VALUES ('9', '2019_05_14_084813_create_orders_table', '7');
INSERT INTO `migrations` VALUES ('10', '2019_05_14_085958_create_order_items_table', '7');
INSERT INTO `migrations` VALUES ('11', '2019_06_12_074506_create_coupon_codes_table', '8');
INSERT INTO `migrations` VALUES ('12', '2019_06_12_075657_orders_add_coupon_code_id', '8');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL COMMENT '所属订单 ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '对应商品 ID',
  `product_sku_id` bigint(20) unsigned NOT NULL COMMENT '对应商品 SKU ID',
  `amount` int(10) unsigned NOT NULL COMMENT '数量',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `rating` int(10) unsigned DEFAULT NULL COMMENT '用户打分',
  `review` text COLLATE utf8mb4_unicode_ci COMMENT '用户评价',
  `reviewed_at` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '1', '3', '5', '1', '9803.00', null, null, null);
INSERT INTO `order_items` VALUES ('2', '2', '3', '5', '1', '9803.00', '2', '还好', '2019-06-04 10:55:07');
INSERT INTO `order_items` VALUES ('3', '3', '2', '2', '1', '7288.00', '3', 'srhttjytyjnn', '2019-06-05 10:05:11');
INSERT INTO `order_items` VALUES ('4', '4', '3', '5', '1', '9803.00', null, null, null);
INSERT INTO `order_items` VALUES ('5', '7', '6', '15', '1', '4529.00', null, null, null);
INSERT INTO `order_items` VALUES ('6', '8', '6', '15', '1', '4529.00', null, null, null);
INSERT INTO `order_items` VALUES ('7', '9', '6', '15', '1', '4529.00', null, null, null);
INSERT INTO `order_items` VALUES ('8', '10', '16', '44', '1', '1357.00', null, null, null);
INSERT INTO `order_items` VALUES ('9', '11', '16', '44', '1', '1357.00', null, null, null);
INSERT INTO `order_items` VALUES ('10', '12', '11', '29', '1', '933.00', null, null, null);
INSERT INTO `order_items` VALUES ('11', '12', '10', '27', '1', '127.00', null, null, null);
INSERT INTO `order_items` VALUES ('12', '13', '19', '54', '3', '1079.00', '4', 'Omnis molestiae iure quas.', '2019-06-12 22:42:24');
INSERT INTO `order_items` VALUES ('13', '13', '31', '89', '2', '6107.00', '4', 'Omnis molestiae iure quas.', '2019-06-12 22:42:24');
INSERT INTO `order_items` VALUES ('14', '14', '16', '45', '4', '6267.00', null, null, null);
INSERT INTO `order_items` VALUES ('15', '14', '56', '164', '3', '4531.00', null, null, null);
INSERT INTO `order_items` VALUES ('16', '14', '4', '9', '1', '6493.00', null, null, null);
INSERT INTO `order_items` VALUES ('17', '15', '40', '116', '2', '5430.00', null, null, null);
INSERT INTO `order_items` VALUES ('18', '15', '28', '80', '3', '5720.00', null, null, null);
INSERT INTO `order_items` VALUES ('19', '16', '13', '36', '4', '3200.00', '3', 'Laborum aut nisi dolorem odit nobis neque quae.', '2019-06-05 13:26:05');
INSERT INTO `order_items` VALUES ('20', '16', '49', '145', '3', '444.00', '3', 'Laborum aut nisi dolorem odit nobis neque quae.', '2019-06-05 13:26:05');
INSERT INTO `order_items` VALUES ('21', '17', '8', '22', '3', '718.00', '2', 'Neque incidunt exercitationem necessitatibus consequatur.', '2019-06-02 04:38:14');
INSERT INTO `order_items` VALUES ('22', '17', '6', '15', '1', '4529.00', '2', 'Neque incidunt exercitationem necessitatibus consequatur.', '2019-06-02 04:38:14');
INSERT INTO `order_items` VALUES ('23', '18', '3', '6', '4', '441.00', '4', 'Modi magni velit et.', '2019-06-04 01:33:26');
INSERT INTO `order_items` VALUES ('24', '19', '33', '96', '2', '4777.00', '2', 'Sint dolore voluptatem eos accusamus adipisci aut.', '2019-06-04 02:28:34');
INSERT INTO `order_items` VALUES ('25', '19', '28', '80', '4', '5720.00', '2', 'Sint dolore voluptatem eos accusamus adipisci aut.', '2019-06-04 02:28:34');
INSERT INTO `order_items` VALUES ('26', '20', '47', '137', '2', '4365.00', '5', 'Ipsam ducimus officia reiciendis aut eveniet voluptate.', '2019-06-02 14:10:17');
INSERT INTO `order_items` VALUES ('27', '20', '48', '140', '1', '3936.00', '5', 'Ipsam ducimus officia reiciendis aut eveniet voluptate.', '2019-06-02 14:10:17');
INSERT INTO `order_items` VALUES ('28', '21', '26', '74', '2', '7406.00', '1', 'Dolore autem eveniet velit ea ratione expedita voluptate.', '2019-06-13 04:57:59');
INSERT INTO `order_items` VALUES ('29', '22', '20', '58', '1', '4410.00', '5', 'Eligendi quaerat laboriosam ut.', '2019-06-03 19:24:14');
INSERT INTO `order_items` VALUES ('30', '22', '42', '122', '2', '6881.00', '5', 'Eligendi quaerat laboriosam ut.', '2019-06-03 19:24:14');
INSERT INTO `order_items` VALUES ('31', '22', '26', '76', '4', '3054.00', '5', 'Eligendi quaerat laboriosam ut.', '2019-06-03 19:24:14');
INSERT INTO `order_items` VALUES ('32', '23', '8', '21', '5', '6143.00', '2', 'Qui atque in error qui quia eius.', '2019-06-06 07:57:23');
INSERT INTO `order_items` VALUES ('33', '23', '53', '155', '5', '4884.00', '2', 'Qui atque in error qui quia eius.', '2019-06-06 07:57:23');
INSERT INTO `order_items` VALUES ('34', '23', '16', '45', '5', '6267.00', '2', 'Qui atque in error qui quia eius.', '2019-06-06 07:57:23');
INSERT INTO `order_items` VALUES ('35', '24', '48', '140', '2', '3936.00', '5', 'Qui hic voluptate quis nemo aspernatur voluptas.', '2019-06-07 07:20:20');
INSERT INTO `order_items` VALUES ('36', '24', '52', '154', '2', '9834.00', '5', 'Qui hic voluptate quis nemo aspernatur voluptas.', '2019-06-07 07:20:20');
INSERT INTO `order_items` VALUES ('37', '25', '51', '151', '3', '4945.00', '4', 'Voluptas velit eaque est sapiente velit deleniti.', '2019-06-11 14:46:25');
INSERT INTO `order_items` VALUES ('38', '25', '57', '167', '1', '6796.00', '4', 'Voluptas velit eaque est sapiente velit deleniti.', '2019-06-11 14:46:25');
INSERT INTO `order_items` VALUES ('39', '25', '60', '176', '2', '9453.00', '4', 'Voluptas velit eaque est sapiente velit deleniti.', '2019-06-11 14:46:25');
INSERT INTO `order_items` VALUES ('40', '26', '37', '107', '4', '4894.00', '4', 'Expedita laboriosam molestiae voluptates quia aut omnis illum iure.', '2019-06-06 15:43:27');
INSERT INTO `order_items` VALUES ('41', '26', '38', '111', '5', '5812.00', '4', 'Expedita laboriosam molestiae voluptates quia aut omnis illum iure.', '2019-06-06 15:43:27');
INSERT INTO `order_items` VALUES ('42', '27', '2', '3', '2', '9650.00', null, null, null);
INSERT INTO `order_items` VALUES ('43', '27', '38', '112', '3', '766.00', null, null, null);
INSERT INTO `order_items` VALUES ('44', '27', '58', '170', '2', '8568.00', null, null, null);
INSERT INTO `order_items` VALUES ('45', '28', '4', '10', '3', '8654.00', '2', 'Veniam qui magnam temporibus placeat praesentium corporis ea.', '2019-06-05 03:43:07');
INSERT INTO `order_items` VALUES ('46', '28', '17', '49', '4', '8875.00', '2', 'Veniam qui magnam temporibus placeat praesentium corporis ea.', '2019-06-05 03:43:07');
INSERT INTO `order_items` VALUES ('47', '29', '23', '67', '2', '6915.00', '5', 'Aliquid facilis quam eveniet aut.', '2019-06-13 04:39:09');
INSERT INTO `order_items` VALUES ('48', '29', '59', '175', '4', '9402.00', '5', 'Aliquid facilis quam eveniet aut.', '2019-06-13 04:39:09');
INSERT INTO `order_items` VALUES ('49', '29', '27', '78', '5', '8187.00', '5', 'Aliquid facilis quam eveniet aut.', '2019-06-13 04:39:09');
INSERT INTO `order_items` VALUES ('50', '30', '26', '76', '4', '3054.00', '1', 'Necessitatibus vel minima assumenda porro dolorem sapiente consequuntur.', '2019-05-31 19:03:59');
INSERT INTO `order_items` VALUES ('51', '30', '33', '96', '1', '4777.00', '1', 'Necessitatibus vel minima assumenda porro dolorem sapiente consequuntur.', '2019-05-31 19:03:59');
INSERT INTO `order_items` VALUES ('52', '31', '26', '75', '4', '8422.00', '5', 'Consequatur expedita quos molestias.', '2019-06-11 13:58:41');
INSERT INTO `order_items` VALUES ('53', '32', '32', '94', '1', '28.00', '1', 'Et qui necessitatibus ea magnam molestiae.', '2019-06-11 19:35:15');
INSERT INTO `order_items` VALUES ('54', '32', '11', '31', '1', '5777.00', '1', 'Et qui necessitatibus ea magnam molestiae.', '2019-06-11 19:35:15');
INSERT INTO `order_items` VALUES ('55', '33', '21', '61', '5', '1879.00', '3', 'Dicta dolores eligendi alias eius.', '2019-06-09 00:06:20');
INSERT INTO `order_items` VALUES ('56', '33', '5', '11', '3', '5906.00', '3', 'Dicta dolores eligendi alias eius.', '2019-06-09 00:06:20');
INSERT INTO `order_items` VALUES ('57', '33', '41', '121', '5', '2499.00', '3', 'Dicta dolores eligendi alias eius.', '2019-06-09 00:06:20');
INSERT INTO `order_items` VALUES ('58', '34', '45', '133', '4', '3277.00', null, null, null);
INSERT INTO `order_items` VALUES ('59', '34', '5', '13', '5', '4672.00', null, null, null);
INSERT INTO `order_items` VALUES ('60', '34', '32', '92', '2', '2232.00', null, null, null);
INSERT INTO `order_items` VALUES ('61', '35', '57', '168', '3', '4434.00', null, null, null);
INSERT INTO `order_items` VALUES ('62', '35', '32', '93', '3', '2490.00', null, null, null);
INSERT INTO `order_items` VALUES ('63', '36', '1', '1', '5', '9699.00', '5', 'Dolorem reiciendis error quibusdam iure.', '2019-06-11 13:37:52');
INSERT INTO `order_items` VALUES ('64', '36', '54', '158', '3', '2682.00', '5', 'Dolorem reiciendis error quibusdam iure.', '2019-06-11 13:37:52');
INSERT INTO `order_items` VALUES ('65', '36', '4', '8', '2', '9877.00', '5', 'Dolorem reiciendis error quibusdam iure.', '2019-06-11 13:37:52');
INSERT INTO `order_items` VALUES ('66', '37', '20', '58', '3', '4410.00', null, null, null);
INSERT INTO `order_items` VALUES ('67', '37', '1', '1', '1', '9699.00', null, null, null);
INSERT INTO `order_items` VALUES ('68', '37', '1', '1', '4', '9699.00', null, null, null);
INSERT INTO `order_items` VALUES ('69', '38', '50', '147', '1', '7127.00', '3', 'Libero sed nam qui autem voluptatem nemo distinctio.', '2019-05-28 11:18:50');
INSERT INTO `order_items` VALUES ('70', '38', '28', '82', '2', '7983.00', '3', 'Libero sed nam qui autem voluptatem nemo distinctio.', '2019-05-28 11:18:50');
INSERT INTO `order_items` VALUES ('71', '39', '33', '97', '1', '4789.00', '2', 'Omnis sunt explicabo at est quae numquam aut.', '2019-06-06 18:48:14');
INSERT INTO `order_items` VALUES ('72', '39', '23', '67', '4', '6915.00', '2', 'Omnis sunt explicabo at est quae numquam aut.', '2019-06-06 18:48:14');
INSERT INTO `order_items` VALUES ('73', '39', '4', '8', '4', '9877.00', '2', 'Omnis sunt explicabo at est quae numquam aut.', '2019-06-06 18:48:14');
INSERT INTO `order_items` VALUES ('74', '40', '59', '173', '2', '8475.00', null, null, null);
INSERT INTO `order_items` VALUES ('75', '40', '41', '120', '4', '8293.00', null, null, null);
INSERT INTO `order_items` VALUES ('76', '40', '42', '122', '4', '6881.00', null, null, null);
INSERT INTO `order_items` VALUES ('77', '41', '53', '155', '4', '4884.00', '5', 'Nesciunt aperiam aut nesciunt necessitatibus sit nesciunt nihil.', '2019-06-01 09:47:55');
INSERT INTO `order_items` VALUES ('78', '42', '1', '1', '5', '9699.00', '5', 'Incidunt illo vel dignissimos rerum.', '2019-06-05 12:31:44');
INSERT INTO `order_items` VALUES ('79', '42', '45', '131', '2', '200.00', '5', 'Incidunt illo vel dignissimos rerum.', '2019-06-05 12:31:44');
INSERT INTO `order_items` VALUES ('80', '42', '34', '99', '5', '1660.00', '5', 'Incidunt illo vel dignissimos rerum.', '2019-06-05 12:31:44');
INSERT INTO `order_items` VALUES ('81', '43', '17', '48', '3', '7988.00', '5', 'Qui nihil dicta architecto odit nihil voluptas.', '2019-06-12 02:19:09');
INSERT INTO `order_items` VALUES ('82', '44', '21', '61', '5', '1879.00', '4', 'Aut nesciunt sed repudiandae odio voluptatibus.', '2019-05-22 23:04:53');
INSERT INTO `order_items` VALUES ('83', '44', '18', '51', '3', '7768.00', '4', 'Aut nesciunt sed repudiandae odio voluptatibus.', '2019-05-22 23:04:53');
INSERT INTO `order_items` VALUES ('84', '44', '40', '118', '5', '9392.00', '4', 'Aut nesciunt sed repudiandae odio voluptatibus.', '2019-05-22 23:04:53');
INSERT INTO `order_items` VALUES ('85', '45', '22', '62', '3', '9677.00', '2', 'Rem aut temporibus quos deleniti praesentium consequatur corporis.', '2019-06-12 12:09:20');
INSERT INTO `order_items` VALUES ('86', '45', '12', '32', '5', '3742.00', '2', 'Rem aut temporibus quos deleniti praesentium consequatur corporis.', '2019-06-12 12:09:20');
INSERT INTO `order_items` VALUES ('87', '45', '1', '1', '4', '9699.00', '2', 'Rem aut temporibus quos deleniti praesentium consequatur corporis.', '2019-06-12 12:09:20');
INSERT INTO `order_items` VALUES ('88', '46', '37', '108', '5', '4095.00', '3', 'Placeat culpa libero debitis autem aut repudiandae consequatur.', '2019-06-08 10:51:26');
INSERT INTO `order_items` VALUES ('89', '46', '33', '97', '2', '4789.00', '3', 'Placeat culpa libero debitis autem aut repudiandae consequatur.', '2019-06-08 10:51:26');
INSERT INTO `order_items` VALUES ('90', '46', '13', '37', '5', '5913.00', '3', 'Placeat culpa libero debitis autem aut repudiandae consequatur.', '2019-06-08 10:51:26');
INSERT INTO `order_items` VALUES ('91', '47', '44', '130', '4', '4358.00', '2', 'Voluptates alias quae dolores magnam.', '2019-06-02 07:16:37');
INSERT INTO `order_items` VALUES ('92', '48', '58', '171', '1', '862.00', '3', 'Voluptatem suscipit quia assumenda quod recusandae.', '2019-05-28 17:12:40');
INSERT INTO `order_items` VALUES ('93', '48', '49', '143', '1', '888.00', '3', 'Voluptatem suscipit quia assumenda quod recusandae.', '2019-05-28 17:12:40');
INSERT INTO `order_items` VALUES ('94', '49', '20', '58', '1', '4410.00', '5', 'Magnam eligendi dolorem corrupti atque pariatur nam mollitia.', '2019-06-06 03:33:31');
INSERT INTO `order_items` VALUES ('95', '50', '39', '115', '1', '1895.00', '1', 'Ut voluptas maiores et enim sed.', '2019-06-01 18:09:49');
INSERT INTO `order_items` VALUES ('96', '50', '4', '10', '4', '8654.00', '1', 'Ut voluptas maiores et enim sed.', '2019-06-01 18:09:49');
INSERT INTO `order_items` VALUES ('97', '51', '19', '55', '2', '3732.00', '3', 'Pariatur laborum deserunt nam esse aut fugiat sed.', '2019-06-10 17:46:35');
INSERT INTO `order_items` VALUES ('98', '51', '57', '167', '5', '6796.00', '3', 'Pariatur laborum deserunt nam esse aut fugiat sed.', '2019-06-10 17:46:35');
INSERT INTO `order_items` VALUES ('99', '52', '36', '105', '4', '2149.00', '5', 'Magnam occaecati ut dignissimos.', '2019-05-26 11:37:28');
INSERT INTO `order_items` VALUES ('100', '52', '32', '94', '4', '28.00', '5', 'Magnam occaecati ut dignissimos.', '2019-05-26 11:37:28');
INSERT INTO `order_items` VALUES ('101', '52', '40', '118', '2', '9392.00', '5', 'Magnam occaecati ut dignissimos.', '2019-05-26 11:37:28');
INSERT INTO `order_items` VALUES ('102', '53', '36', '105', '3', '2149.00', null, null, null);
INSERT INTO `order_items` VALUES ('103', '53', '56', '166', '5', '5561.00', null, null, null);
INSERT INTO `order_items` VALUES ('104', '54', '47', '139', '1', '6118.00', '1', 'Et ea mollitia amet doloribus quo dolorem asperiores.', '2019-05-24 05:31:58');
INSERT INTO `order_items` VALUES ('105', '54', '14', '38', '4', '3324.00', '1', 'Et ea mollitia amet doloribus quo dolorem asperiores.', '2019-05-24 05:31:58');
INSERT INTO `order_items` VALUES ('106', '55', '41', '120', '4', '8293.00', null, null, null);
INSERT INTO `order_items` VALUES ('107', '55', '5', '11', '2', '5906.00', null, null, null);
INSERT INTO `order_items` VALUES ('108', '56', '29', '84', '1', '3369.00', '5', 'Quibusdam vel excepturi aut.', '2019-06-11 10:49:26');
INSERT INTO `order_items` VALUES ('109', '57', '37', '107', '1', '4894.00', '2', 'Accusamus non non et et.', '2019-06-05 18:45:53');
INSERT INTO `order_items` VALUES ('110', '57', '3', '7', '2', '3437.00', '2', 'Accusamus non non et et.', '2019-06-05 18:45:53');
INSERT INTO `order_items` VALUES ('111', '57', '17', '49', '1', '8875.00', '2', 'Accusamus non non et et.', '2019-06-05 18:45:53');
INSERT INTO `order_items` VALUES ('112', '58', '33', '96', '5', '4777.00', null, null, null);
INSERT INTO `order_items` VALUES ('113', '58', '42', '123', '1', '744.00', null, null, null);
INSERT INTO `order_items` VALUES ('114', '59', '37', '109', '1', '7650.00', '3', 'Et sit voluptates quae et dolorem impedit esse.', '2019-05-30 09:40:35');
INSERT INTO `order_items` VALUES ('115', '59', '52', '153', '3', '8911.00', '3', 'Et sit voluptates quae et dolorem impedit esse.', '2019-05-30 09:40:35');
INSERT INTO `order_items` VALUES ('116', '60', '50', '147', '1', '7127.00', '2', 'Sequi totam commodi aut et.', '2019-06-10 14:14:04');
INSERT INTO `order_items` VALUES ('117', '60', '27', '77', '4', '9322.00', '2', 'Sequi totam commodi aut et.', '2019-06-10 14:14:04');
INSERT INTO `order_items` VALUES ('118', '61', '60', '178', '3', '7320.00', '1', 'Inventore quia veritatis numquam dolore tempora et.', '2019-06-12 03:28:53');
INSERT INTO `order_items` VALUES ('119', '61', '35', '103', '2', '2587.00', '1', 'Inventore quia veritatis numquam dolore tempora et.', '2019-06-12 03:28:53');
INSERT INTO `order_items` VALUES ('120', '61', '31', '90', '2', '9705.00', '1', 'Inventore quia veritatis numquam dolore tempora et.', '2019-06-12 03:28:53');
INSERT INTO `order_items` VALUES ('121', '62', '54', '158', '2', '2682.00', null, null, null);
INSERT INTO `order_items` VALUES ('122', '63', '40', '116', '2', '5430.00', '5', 'Sit laudantium modi consequatur aut.', '2019-06-13 07:59:56');
INSERT INTO `order_items` VALUES ('123', '64', '20', '58', '1', '4410.00', '2', 'Modi totam sequi odio autem ipsa tenetur.', '2019-06-09 22:22:52');
INSERT INTO `order_items` VALUES ('124', '64', '45', '132', '3', '3774.00', '2', 'Modi totam sequi odio autem ipsa tenetur.', '2019-06-09 22:22:52');
INSERT INTO `order_items` VALUES ('125', '65', '52', '152', '1', '9034.00', null, null, null);
INSERT INTO `order_items` VALUES ('126', '65', '25', '73', '5', '5636.00', null, null, null);
INSERT INTO `order_items` VALUES ('127', '65', '6', '15', '3', '4529.00', null, null, null);
INSERT INTO `order_items` VALUES ('128', '66', '50', '147', '5', '7127.00', '4', 'Est asperiores beatae soluta dolor molestias vero omnis.', '2019-06-01 07:55:43');
INSERT INTO `order_items` VALUES ('129', '66', '26', '76', '2', '3054.00', '4', 'Est asperiores beatae soluta dolor molestias vero omnis.', '2019-06-01 07:55:43');
INSERT INTO `order_items` VALUES ('130', '67', '1', '1', '4', '9699.00', '1', 'Velit architecto voluptas quibusdam excepturi.', '2019-06-13 08:50:24');
INSERT INTO `order_items` VALUES ('131', '68', '54', '160', '1', '877.00', '5', 'Autem aut non laboriosam sunt.', '2019-06-06 12:47:37');
INSERT INTO `order_items` VALUES ('132', '69', '9', '25', '4', '4954.00', null, null, null);
INSERT INTO `order_items` VALUES ('133', '70', '42', '123', '5', '744.00', '1', 'Veniam sunt et iste ut illo quae.', '2019-06-07 16:40:08');
INSERT INTO `order_items` VALUES ('134', '70', '55', '162', '5', '8727.00', '1', 'Veniam sunt et iste ut illo quae.', '2019-06-07 16:40:08');
INSERT INTO `order_items` VALUES ('135', '71', '55', '161', '1', '2929.00', '1', 'Provident nihil quos architecto corrupti illo numquam.', '2019-06-13 08:15:25');
INSERT INTO `order_items` VALUES ('136', '71', '47', '137', '5', '4365.00', '1', 'Provident nihil quos architecto corrupti illo numquam.', '2019-06-13 08:15:25');
INSERT INTO `order_items` VALUES ('137', '71', '43', '127', '1', '3160.00', '1', 'Provident nihil quos architecto corrupti illo numquam.', '2019-06-13 08:15:25');
INSERT INTO `order_items` VALUES ('138', '72', '29', '83', '3', '6611.00', null, null, null);
INSERT INTO `order_items` VALUES ('139', '73', '6', '14', '1', '5459.00', '1', 'Alias itaque sed eaque doloremque consequatur.', '2019-05-21 12:34:49');
INSERT INTO `order_items` VALUES ('140', '73', '45', '133', '3', '3277.00', '1', 'Alias itaque sed eaque doloremque consequatur.', '2019-05-21 12:34:49');
INSERT INTO `order_items` VALUES ('141', '73', '61', '180', '3', '5898.00', '1', 'Alias itaque sed eaque doloremque consequatur.', '2019-05-21 12:34:49');
INSERT INTO `order_items` VALUES ('142', '74', '52', '154', '1', '9834.00', '3', 'Magni dolor repudiandae esse explicabo laudantium.', '2019-06-12 20:15:00');
INSERT INTO `order_items` VALUES ('143', '74', '58', '171', '5', '862.00', '3', 'Magni dolor repudiandae esse explicabo laudantium.', '2019-06-12 20:15:00');
INSERT INTO `order_items` VALUES ('144', '75', '54', '159', '3', '7533.00', '3', 'Repudiandae est quia a iusto assumenda autem.', '2019-06-03 00:54:58');
INSERT INTO `order_items` VALUES ('145', '76', '48', '142', '1', '3421.00', null, null, null);
INSERT INTO `order_items` VALUES ('146', '76', '32', '93', '5', '2490.00', null, null, null);
INSERT INTO `order_items` VALUES ('147', '76', '17', '47', '5', '5865.00', null, null, null);
INSERT INTO `order_items` VALUES ('148', '77', '49', '145', '3', '444.00', null, null, null);
INSERT INTO `order_items` VALUES ('149', '77', '27', '79', '4', '1354.00', null, null, null);
INSERT INTO `order_items` VALUES ('150', '77', '61', '179', '1', '3318.00', null, null, null);
INSERT INTO `order_items` VALUES ('151', '78', '55', '161', '5', '2929.00', '1', 'Quia distinctio est in ut voluptates provident quos.', '2019-06-12 11:03:25');
INSERT INTO `order_items` VALUES ('152', '79', '38', '110', '2', '2597.00', '4', 'Autem fuga esse praesentium est et molestias.', '2019-06-11 13:12:33');
INSERT INTO `order_items` VALUES ('153', '80', '55', '161', '1', '2929.00', '4', 'Laudantium voluptatem quia fugit aut ullam repellat.', '2019-06-07 00:50:38');
INSERT INTO `order_items` VALUES ('154', '80', '52', '152', '3', '9034.00', '4', 'Laudantium voluptatem quia fugit aut ullam repellat.', '2019-06-07 00:50:38');
INSERT INTO `order_items` VALUES ('155', '81', '42', '123', '1', '744.00', null, null, null);
INSERT INTO `order_items` VALUES ('156', '81', '61', '181', '3', '2561.00', null, null, null);
INSERT INTO `order_items` VALUES ('157', '81', '10', '26', '3', '2799.00', null, null, null);
INSERT INTO `order_items` VALUES ('158', '82', '15', '42', '3', '8377.00', '3', 'Rem omnis aut sunt facilis aspernatur voluptatem error nulla.', '2019-05-27 14:22:59');
INSERT INTO `order_items` VALUES ('159', '82', '27', '78', '3', '8187.00', '3', 'Rem omnis aut sunt facilis aspernatur voluptatem error nulla.', '2019-05-27 14:22:59');
INSERT INTO `order_items` VALUES ('160', '82', '37', '108', '5', '4095.00', '3', 'Rem omnis aut sunt facilis aspernatur voluptatem error nulla.', '2019-05-27 14:22:59');
INSERT INTO `order_items` VALUES ('161', '83', '27', '79', '1', '1354.00', '4', 'Ut porro et aut dolor.', '2019-06-09 07:20:00');
INSERT INTO `order_items` VALUES ('162', '84', '58', '170', '2', '8568.00', '5', 'Laborum explicabo ea dolore quos harum qui accusantium.', '2019-06-10 23:27:55');
INSERT INTO `order_items` VALUES ('163', '85', '33', '96', '5', '4777.00', '5', 'Quis ducimus ad voluptatem sapiente voluptatibus.', '2019-06-06 21:24:55');
INSERT INTO `order_items` VALUES ('164', '86', '4', '8', '1', '9877.00', null, null, null);
INSERT INTO `order_items` VALUES ('165', '86', '35', '103', '2', '2587.00', null, null, null);
INSERT INTO `order_items` VALUES ('166', '86', '5', '13', '5', '4672.00', null, null, null);
INSERT INTO `order_items` VALUES ('167', '87', '7', '18', '2', '6649.00', '3', 'Ex aliquid eos ea laboriosam qui.', '2019-06-12 11:17:34');
INSERT INTO `order_items` VALUES ('168', '88', '10', '26', '1', '2799.00', '5', 'Iusto est quibusdam officiis et at quia omnis.', '2019-06-05 03:06:22');
INSERT INTO `order_items` VALUES ('169', '88', '24', '70', '2', '3036.00', '5', 'Iusto est quibusdam officiis et at quia omnis.', '2019-06-05 03:06:22');
INSERT INTO `order_items` VALUES ('170', '89', '46', '134', '2', '4191.00', '5', 'Quos ut et iste facilis.', '2019-06-05 15:53:04');
INSERT INTO `order_items` VALUES ('171', '89', '41', '121', '1', '2499.00', '5', 'Quos ut et iste facilis.', '2019-06-05 15:53:04');
INSERT INTO `order_items` VALUES ('172', '89', '55', '162', '2', '8727.00', '5', 'Quos ut et iste facilis.', '2019-06-05 15:53:04');
INSERT INTO `order_items` VALUES ('173', '90', '9', '24', '3', '5449.00', null, null, null);
INSERT INTO `order_items` VALUES ('174', '90', '43', '127', '4', '3160.00', null, null, null);
INSERT INTO `order_items` VALUES ('175', '90', '38', '111', '4', '5812.00', null, null, null);
INSERT INTO `order_items` VALUES ('176', '91', '54', '158', '5', '2682.00', '1', 'Voluptatum rerum sed assumenda voluptatum aut corrupti.', '2019-05-25 17:36:27');
INSERT INTO `order_items` VALUES ('177', '91', '11', '29', '3', '933.00', '1', 'Voluptatum rerum sed assumenda voluptatum aut corrupti.', '2019-05-25 17:36:27');
INSERT INTO `order_items` VALUES ('178', '91', '40', '117', '4', '5348.00', '1', 'Voluptatum rerum sed assumenda voluptatum aut corrupti.', '2019-05-25 17:36:27');
INSERT INTO `order_items` VALUES ('179', '92', '18', '52', '2', '3580.00', '2', 'Minus aperiam quis qui voluptatem.', '2019-06-06 14:00:03');
INSERT INTO `order_items` VALUES ('180', '92', '32', '93', '1', '2490.00', '2', 'Minus aperiam quis qui voluptatem.', '2019-06-06 14:00:03');
INSERT INTO `order_items` VALUES ('181', '92', '23', '67', '4', '6915.00', '2', 'Minus aperiam quis qui voluptatem.', '2019-06-06 14:00:03');
INSERT INTO `order_items` VALUES ('182', '93', '6', '15', '1', '4529.00', '1', 'Accusamus dolor error aperiam ratione nesciunt.', '2019-05-31 00:10:48');
INSERT INTO `order_items` VALUES ('183', '93', '26', '75', '4', '8422.00', '1', 'Accusamus dolor error aperiam ratione nesciunt.', '2019-05-31 00:10:48');
INSERT INTO `order_items` VALUES ('184', '93', '50', '147', '5', '7127.00', '1', 'Accusamus dolor error aperiam ratione nesciunt.', '2019-05-31 00:10:48');
INSERT INTO `order_items` VALUES ('185', '94', '54', '158', '2', '2682.00', null, null, null);
INSERT INTO `order_items` VALUES ('186', '94', '37', '107', '2', '4894.00', null, null, null);
INSERT INTO `order_items` VALUES ('187', '95', '20', '58', '5', '4410.00', '4', 'Voluptatem veritatis laboriosam ipsa voluptates.', '2019-05-26 10:39:30');
INSERT INTO `order_items` VALUES ('188', '95', '36', '104', '3', '2544.00', '4', 'Voluptatem veritatis laboriosam ipsa voluptates.', '2019-05-26 10:39:30');
INSERT INTO `order_items` VALUES ('189', '96', '44', '128', '1', '1854.00', '3', 'Asperiores rem excepturi suscipit in et rerum ut.', '2019-06-10 15:31:53');
INSERT INTO `order_items` VALUES ('190', '97', '33', '96', '1', '4777.00', '1', 'Exercitationem eos qui enim commodi.', '2019-05-26 18:16:17');
INSERT INTO `order_items` VALUES ('191', '98', '9', '23', '5', '7201.00', '5', 'Iure at quia non quaerat voluptas ipsa quia.', '2019-06-04 12:54:01');
INSERT INTO `order_items` VALUES ('192', '98', '18', '50', '1', '8152.00', '5', 'Iure at quia non quaerat voluptas ipsa quia.', '2019-06-04 12:54:01');
INSERT INTO `order_items` VALUES ('193', '98', '38', '112', '1', '766.00', '5', 'Iure at quia non quaerat voluptas ipsa quia.', '2019-06-04 12:54:01');
INSERT INTO `order_items` VALUES ('194', '99', '23', '67', '3', '6915.00', null, null, null);
INSERT INTO `order_items` VALUES ('195', '99', '60', '177', '1', '871.00', null, null, null);
INSERT INTO `order_items` VALUES ('196', '100', '19', '53', '3', '5955.00', '3', 'Alias quo velit vitae vel.', '2019-06-07 09:57:48');
INSERT INTO `order_items` VALUES ('197', '100', '42', '123', '4', '744.00', '3', 'Alias quo velit vitae vel.', '2019-06-07 09:57:48');
INSERT INTO `order_items` VALUES ('198', '101', '56', '165', '4', '1916.00', '5', 'Porro deserunt consequuntur quibusdam ducimus optio.', '2019-06-06 05:17:58');
INSERT INTO `order_items` VALUES ('199', '101', '55', '162', '2', '8727.00', '5', 'Porro deserunt consequuntur quibusdam ducimus optio.', '2019-06-06 05:17:58');
INSERT INTO `order_items` VALUES ('200', '102', '40', '116', '4', '5430.00', null, null, null);
INSERT INTO `order_items` VALUES ('201', '102', '8', '20', '3', '1752.00', null, null, null);
INSERT INTO `order_items` VALUES ('202', '103', '44', '130', '1', '4358.00', '1', 'Dolore rerum aut provident non illo.', '2019-05-28 16:55:51');
INSERT INTO `order_items` VALUES ('203', '103', '55', '161', '5', '2929.00', '1', 'Dolore rerum aut provident non illo.', '2019-05-28 16:55:51');
INSERT INTO `order_items` VALUES ('204', '103', '26', '76', '3', '3054.00', '1', 'Dolore rerum aut provident non illo.', '2019-05-28 16:55:51');
INSERT INTO `order_items` VALUES ('205', '104', '3', '6', '2', '441.00', null, null, null);
INSERT INTO `order_items` VALUES ('206', '104', '19', '53', '5', '5955.00', null, null, null);
INSERT INTO `order_items` VALUES ('207', '105', '45', '131', '5', '200.00', '2', 'Laborum laudantium vero et necessitatibus quo doloribus temporibus.', '2019-06-07 20:51:29');
INSERT INTO `order_items` VALUES ('208', '105', '13', '37', '5', '5913.00', '2', 'Laborum laudantium vero et necessitatibus quo doloribus temporibus.', '2019-06-07 20:51:29');
INSERT INTO `order_items` VALUES ('209', '105', '55', '163', '4', '2364.00', '2', 'Laborum laudantium vero et necessitatibus quo doloribus temporibus.', '2019-06-07 20:51:29');
INSERT INTO `order_items` VALUES ('210', '106', '30', '86', '5', '8285.00', '4', 'Praesentium ut quia voluptate illum doloremque.', '2019-06-05 11:51:46');
INSERT INTO `order_items` VALUES ('211', '106', '17', '48', '3', '7988.00', '4', 'Praesentium ut quia voluptate illum doloremque.', '2019-06-05 11:51:46');
INSERT INTO `order_items` VALUES ('212', '106', '57', '167', '5', '6796.00', '4', 'Praesentium ut quia voluptate illum doloremque.', '2019-06-05 11:51:46');
INSERT INTO `order_items` VALUES ('213', '107', '25', '73', '2', '5636.00', '4', 'Inventore officiis velit tempore.', '2019-06-11 08:49:46');
INSERT INTO `order_items` VALUES ('214', '107', '5', '13', '4', '4672.00', '4', 'Inventore officiis velit tempore.', '2019-06-11 08:49:46');
INSERT INTO `order_items` VALUES ('215', '108', '29', '84', '4', '3369.00', '5', 'Iste sed aut accusamus dolorem beatae.', '2019-06-07 10:14:47');
INSERT INTO `order_items` VALUES ('216', '108', '32', '93', '4', '2490.00', '5', 'Iste sed aut accusamus dolorem beatae.', '2019-06-07 10:14:47');
INSERT INTO `order_items` VALUES ('217', '109', '38', '111', '2', '5812.00', null, null, null);
INSERT INTO `order_items` VALUES ('218', '109', '2', '3', '2', '9650.00', null, null, null);
INSERT INTO `order_items` VALUES ('219', '109', '10', '28', '1', '710.00', null, null, null);
INSERT INTO `order_items` VALUES ('220', '110', '50', '148', '4', '2979.00', '5', 'Quidem sit perferendis ea sed.', '2019-06-10 06:07:50');
INSERT INTO `order_items` VALUES ('221', '111', '12', '34', '1', '2468.00', '3', 'Amet impedit fugiat molestiae.', '2019-06-03 18:42:01');
INSERT INTO `order_items` VALUES ('222', '111', '4', '8', '2', '9877.00', '3', 'Amet impedit fugiat molestiae.', '2019-06-03 18:42:01');
INSERT INTO `order_items` VALUES ('223', '112', '4', '10', '2', '8654.00', '3', 'Saepe illum laboriosam dicta porro quis culpa nam.', '2019-06-11 00:42:32');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单流水号',
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON 格式的收货地址',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '订单备注',
  `paid_at` datetime DEFAULT NULL COMMENT '支付时间',
  `coupon_code_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付平台订单号',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '退款状态',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款单号',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否关闭',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否评价',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '物流状态',
  `ship_data` text COLLATE utf8mb4_unicode_ci COMMENT '物流数据',
  `extra` text COLLATE utf8mb4_unicode_ci COMMENT '其他额外的数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '20190515031643349779', '1', '{\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u897f\\u6e56\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c659\\u53f7\",\"zip\":16000,\"contact_name\":\"\\u82d7\\u6d77\\u71d5\",\"contact_phone\":\"18269739375\"}', '9803.00', '物流快点', '2019-05-16 18:57:31', null, 'alipay', '201905168522', 'pending', null, '0', '0', 'pending', null, null, '2019-05-15 03:16:43', '2019-05-15 03:16:43');
INSERT INTO `orders` VALUES ('2', '20190515061007399987', '1', '{\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u897f\\u6e56\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c659\\u53f7\",\"zip\":16000,\"contact_name\":\"\\u82d7\\u6d77\\u71d5\",\"contact_phone\":\"18269739375\"}', '9803.00', null, '2019-06-04 18:54:21', null, 'wechat', '201905168552', 'pending', null, '0', '1', 'pending', null, null, '2019-05-15 06:10:07', '2019-06-04 10:55:07');
INSERT INTO `orders` VALUES ('3', '20190515100633920619', '1', '{\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u897f\\u6e56\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c659\\u53f7\",\"zip\":16000,\"contact_name\":\"\\u82d7\\u6d77\\u71d5\",\"contact_phone\":\"18269739375\"}', '7288.00', null, '2019-06-05 18:04:01', null, 'wechat', '201905168572', 'pending', null, '0', '1', 'pending', null, null, '2019-05-15 10:06:33', '2019-06-05 10:05:11');
INSERT INTO `orders` VALUES ('4', '20190515100839383903', '1', '{\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u897f\\u6e56\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c659\\u53f7\",\"zip\":16000,\"contact_name\":\"\\u82d7\\u6d77\\u71d5\",\"contact_phone\":\"18269739375\"}', '9803.00', null, '2019-06-05 18:15:26', null, 'alipay', '201906168748', 'applied', null, '0', '0', 'received', null, '', '2019-05-15 10:08:39', '2019-06-12 07:31:54');
INSERT INTO `orders` VALUES ('7', '20190516042934816291', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c912\\u53f7\",\"zip\":215600,\"contact_name\":\"\\u4e54\\u7433\",\"contact_phone\":\"13181739249\"}', '4529.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-05-16 04:29:34', '2019-05-16 04:29:34');
INSERT INTO `orders` VALUES ('8', '20190516042939610896', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c912\\u53f7\",\"zip\":215600,\"contact_name\":\"\\u4e54\\u7433\",\"contact_phone\":\"13181739249\"}', '4529.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-05-16 04:29:40', '2019-05-16 04:29:40');
INSERT INTO `orders` VALUES ('9', '20190516043113758948', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c912\\u53f7\",\"zip\":215600,\"contact_name\":\"\\u4e54\\u7433\",\"contact_phone\":\"13181739249\"}', '4529.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-05-16 04:31:13', '2019-05-16 04:31:13');
INSERT INTO `orders` VALUES ('10', '20190516061640465721', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c21\\u53f7\",\"zip\":807500,\"contact_name\":\"\\u5ec9\\u51ef\",\"contact_phone\":\"13937878575\"}', '1357.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-05-16 06:16:40', '2019-05-16 06:16:40');
INSERT INTO `orders` VALUES ('11', '20190613075839016092', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c21\\u53f7\",\"zip\":807500,\"contact_name\":\"\\u5ec9\\u51ef\",\"contact_phone\":\"13937878575\"}', '800.63', null, null, '7', null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-06-13 07:58:39', '2019-06-13 07:58:39');
INSERT INTO `orders` VALUES ('12', '20190613081646313131', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c21\\u53f7\",\"zip\":807500,\"contact_name\":\"\\u5ec9\\u51ef\",\"contact_phone\":\"13937878575\"}', '862.00', null, null, '2', null, null, 'pending', null, '0', '0', 'pending', null, null, '2019-06-13 08:16:46', '2019-06-13 08:16:46');
INSERT INTO `orders` VALUES ('13', '20190613085204847876', '27', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c24\\u8857\\u9053\\u7b2c917\\u53f7\",\"zip\":463300,\"contact_name\":\"\\u9976\\u6587\\u541b\",\"contact_phone\":\"13516427777\"}', '15451.00', 'Qui asperiores quaerat autem commodi vero autem.', '2019-06-05 16:23:00', null, 'alipay', 'cd6d1e0d-061f-35ea-937d-c616866e3332', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5f69\\u8679\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"d7d1b6eb-ede7-31d2-ae97-cebdf783fbdd\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('14', '20190613085204144211', '39', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c425\\u53f7\",\"zip\":446700,\"contact_name\":\"\\u9ec4\\u6625\\u6885\",\"contact_phone\":\"18613107149\"}', '45154.00', 'Sequi facere incidunt quia eum dolores.', '2019-06-08 13:59:34', null, 'alipay', '492ac94c-7144-333f-a3f6-ce0f491d034d', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u60e0\\u6d3e\\u56fd\\u9645\\u516c\\u53f8\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"bec060ee-4615-314c-92a0-379937c2a876\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('15', '20190613085204651321', '48', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c10\\u8857\\u9053\\u7b2c52\\u53f7\",\"zip\":642300,\"contact_name\":\"\\u5201\\u5b66\\u660e\",\"contact_phone\":\"14596307496\"}', '28020.00', 'Ipsa voluptatem laborum similique distinctio non.', '2019-06-09 19:39:28', null, 'wechat', '643b2603-0b8d-363f-ad4f-4e3593c6580a', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u8bfa\\u4f9d\\u66fc\\u8f6f\\u4ef6\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3fc806fb-2103-3105-a55c-11ca9ccdb866\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('16', '20190613085204014018', '34', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c885\\u53f7\",\"zip\":734600,\"contact_name\":\"\\u4e50\\u5efa\\u660e\",\"contact_phone\":\"15080666609\"}', '12577.48', 'Aliquam ex tenetur quisquam nam.', '2019-06-05 08:18:20', '22', 'alipay', 'e47e6ec0-310d-3c68-8072-8a9654dc7fe9', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('17', '20190613085204802486', '29', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c84\\u8857\\u9053\\u7b2c984\\u53f7\",\"zip\":798800,\"contact_name\":\"\\u8042\\u5229\",\"contact_phone\":\"15949666516\"}', '4143.46', 'Qui error assumenda nihil animi non fuga.', '2019-06-02 03:37:02', '27', 'wechat', '7b3f483d-8b72-34ac-ae6c-d84afe888b71', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c3d4e58d-7b29-3091-91b5-de295704e656\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('18', '20190613085204740845', '34', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c63\\u8857\\u9053\\u7b2c567\\u53f7\",\"zip\":198000,\"contact_name\":\"\\u5e84\\u654f\\u9759\",\"contact_phone\":\"17094051898\"}', '1040.76', 'Quis dolorum asperiores repellat aut.', '2019-05-23 17:06:05', '7', 'wechat', 'ba488fb9-4963-3b17-be25-7ab5b29ae4fe', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5170\\u91d1\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b0dcafcb-967f-3c7c-a9bc-c544b1d77c89\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:05');
INSERT INTO `orders` VALUES ('19', '20190613085204478949', '31', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c49\\u8857\\u9053\\u7b2c208\\u53f7\",\"zip\":75800,\"contact_name\":\"\\u827e\\u7ffc\",\"contact_phone\":\"17737057875\"}', '32434.00', 'Dolorum libero debitis dolores ipsum.', '2019-05-15 23:03:15', null, 'alipay', 'b5440142-9b5e-3f7b-9df7-f55b62ea877c', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u4e2d\\u5efa\\u521b\\u4e1a\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6da5e2c8-9715-30a2-8e72-23b1be36697c\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('20', '20190613085204760356', '80', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c617\\u53f7\",\"zip\":248800,\"contact_name\":\"\\u8fde\\u6b63\\u8c6a\",\"contact_phone\":\"18749321163\"}', '12666.00', 'Ipsa perspiciatis ipsam quam fuga aliquam blanditiis atque.', '2019-05-25 10:01:47', null, 'alipay', 'f18196a3-997c-3bcd-8de2-cee3791c52ee', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('21', '20190613085204761409', '89', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c49\\u8857\\u9053\\u7b2c267\\u53f7\",\"zip\":145200,\"contact_name\":\"\\u82a6\\u5fd7\\u5f3a\",\"contact_phone\":\"17002651827\"}', '14812.00', 'Ex accusantium facere in rerum harum.', '2019-06-10 23:45:43', null, 'wechat', 'c5483ea9-3328-3577-b3bc-c1c9636f5768', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u5408\\u8054\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f83a7027-40fe-31ae-9f57-be5e797fb90c\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('22', '20190613085204572889', '17', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c58\\u8857\\u9053\\u7b2c981\\u53f7\",\"zip\":741900,\"contact_name\":\"\\u8ba1\\u79c0\\u82f1\",\"contact_phone\":\"15526389679\"}', '26741.44', 'Voluptatem eveniet vel eligendi mollitia.', '2019-06-01 01:36:21', '31', 'wechat', '23d8b5ed-4f6a-3629-b0d8-17008acc9739', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u65b9\\u6b63\\u79d1\\u6280\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0a9d2d1d-e22f-3298-8244-728836ebb50c\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('23', '20190613085204391082', '93', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c1\\u8857\\u9053\\u7b2c787\\u53f7\",\"zip\":667300,\"contact_name\":\"\\u5b97\\u52c7\",\"contact_phone\":\"18378114580\"}', '86470.00', 'Voluptatem molestias maxime placeat enim dicta rem.', '2019-06-05 16:46:23', null, 'wechat', '223eb387-62d2-3324-83ab-22ba5b3b1491', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a11e67f3-1be4-3424-b167-f38a34e766ba\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('24', '20190613085204662085', '22', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c62\\u8857\\u9053\\u7b2c535\\u53f7\",\"zip\":366900,\"contact_name\":\"\\u795d\\u79c0\\u6885\",\"contact_phone\":\"17175022305\"}', '27540.00', 'Id et et saepe fuga rem vel.', '2019-05-30 06:52:24', null, 'wechat', '72a3fd36-6ca1-345e-beed-7e0de13d8f61', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u53cc\\u654f\\u7535\\u5b50\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"4a6a0b58-5644-3660-83a0-0ac27c78c582\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('25', '20190613085204990266', '71', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c964\\u53f7\",\"zip\":141400,\"contact_name\":\"\\u90a2\\u6ce2\",\"contact_phone\":\"13235963900\"}', '23916.83', 'Corrupti asperiores occaecati voluptatum voluptatem in pariatur placeat.', '2019-05-15 09:05:05', '7', 'wechat', '4ba5660a-7d6e-37ce-94ab-706b887b1adf', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u83ca\\u98ce\\u516c\\u53f8\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8495c5f0-bca6-3578-ac48-c86fc75c08c6\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('26', '20190613085204167500', '88', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c700\\u53f7\",\"zip\":317200,\"contact_name\":\"\\u77bf\\u6587\\u5a1f\",\"contact_phone\":\"15123021198\"}', '48636.00', 'Expedita inventore et voluptatibus error.', '2019-05-19 22:06:40', null, 'alipay', 'cbb6cef5-4e20-35fa-afc1-7d6501c56cad', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u521b\\u6c47\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"279e1238-13ed-377b-97cb-496b3ab4652e\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('27', '20190613085204202031', '79', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c83\\u8857\\u9053\\u7b2c158\\u53f7\",\"zip\":174800,\"contact_name\":\"\\u82a6\\u6885\",\"contact_phone\":\"18237597794\"}', '38734.00', 'Omnis omnis ut nobis quasi incidunt consequuntur odio.', '2019-06-09 19:20:21', null, 'wechat', '2a724f96-9402-35bf-bc6c-b8fa24498778', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('28', '20190613085204180623', '7', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c56\\u53f7\",\"zip\":501600,\"contact_name\":\"\\u9c81\\u52c7\",\"contact_phone\":\"15024759688\"}', '30731.00', 'Impedit blanditiis qui voluptas sed accusantium non.', '2019-06-03 18:56:44', '1', 'wechat', '51b312eb-8b39-353d-85c0-3e6668ef0db4', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('29', '20190613085204402069', '86', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c24\\u8857\\u9053\\u7b2c917\\u53f7\",\"zip\":463300,\"contact_name\":\"\\u9976\\u6587\\u541b\",\"contact_phone\":\"13516427777\"}', '92373.00', 'Asperiores laboriosam aliquam modi officiis tenetur et.', '2019-06-13 01:58:45', null, 'alipay', 'dc5ad7e5-013d-30cf-89cc-7dbea41b3ef2', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('30', '20190613085204381612', '88', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c288\\u53f7\",\"zip\":736900,\"contact_name\":\"\\u5168\\u82ac\",\"contact_phone\":\"13253075373\"}', '14953.84', 'Totam eligendi ea reprehenderit qui voluptate eveniet.', '2019-05-14 12:56:22', '31', 'alipay', '348fb926-22d4-3098-94f5-bfcb77509566', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u60e0\\u6d3e\\u56fd\\u9645\\u516c\\u53f8\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"bc085094-4a73-3b60-94a2-0a5879f42733\"}', '[]', '2019-06-13 08:52:04', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('31', '20190613085205565364', '76', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c66\\u8857\\u9053\\u7b2c396\\u53f7\",\"zip\":761600,\"contact_name\":\"\\u535e\\u6dd1\\u5170\",\"contact_phone\":\"18727214229\"}', '33688.00', 'Alias perspiciatis ratione excepturi qui repellat quaerat.', '2019-06-08 05:54:07', null, 'alipay', '87eb446e-5589-3ae9-9ab1-841c44adf95a', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f85130b6-47c6-3117-a91f-7ab81af0f6c7\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('32', '20190613085205317248', '9', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c2\\u8857\\u9053\\u7b2c261\\u53f7\",\"zip\":217900,\"contact_name\":\"\\u6587\\u6b22\",\"contact_phone\":\"18599391644\"}', '4295.70', 'Ut amet consectetur consectetur debitis mollitia ratione sed.', '2019-05-31 06:19:00', '21', 'wechat', 'e79810ed-fd67-3702-85b1-0169af8242e1', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('33', '20190613085205355930', '62', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c63\\u8857\\u9053\\u7b2c567\\u53f7\",\"zip\":198000,\"contact_name\":\"\\u5e84\\u654f\\u9759\",\"contact_phone\":\"17094051898\"}', '39608.00', 'Autem accusantium mollitia culpa non delectus magni.', '2019-05-22 03:26:06', null, 'alipay', '97bf4316-7b08-36ed-bb9e-d1f6e687df38', 'success', 'e82d1c05abc843a8a5da5b1abfdbccb8', '0', '1', 'delivered', '{\"express_company\":\"\\u51cc\\u4e91\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"15f8769f-f0b1-372a-bd15-b45dca401003\"}', '{\"refund_reason\":\"Consequatur corrupti natus reiciendis molestiae temporibus architecto.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('34', '20190613085205761576', '2', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c56\\u53f7\",\"zip\":501600,\"contact_name\":\"\\u9c81\\u52c7\",\"contact_phone\":\"15024759688\"}', '20875.32', 'Eligendi accusantium voluptatem praesentium odit facere.', '2019-05-22 00:04:11', '5', 'alipay', '4bacae4f-c67a-33ae-97b0-d15794d990cc', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u9e3f\\u777f\\u601d\\u535a\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6de01ba3-7838-319f-b2ef-30c988af8898\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:06');
INSERT INTO `orders` VALUES ('35', '20190613085205095090', '50', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c885\\u53f7\",\"zip\":734600,\"contact_name\":\"\\u4e50\\u5efa\\u660e\",\"contact_phone\":\"15080666609\"}', '18279.36', 'Reprehenderit recusandae magnam culpa cum consequatur molestiae sit.', '2019-06-02 19:06:18', '31', 'alipay', 'fbe0671a-f6de-3b4c-88e1-f713d45c9f52', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('36', '20190613085205318593', '96', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c52\\u8857\\u9053\\u7b2c201\\u53f7\",\"zip\":808000,\"contact_name\":\"\\u6797\\u7389\\u534e\",\"contact_phone\":\"17055510144\"}', '76295.00', 'Illum et laudantium qui cumque.', '2019-06-08 05:51:51', null, 'alipay', 'ba7c2c85-d39f-3aad-b5c0-f26b9560e611', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u56db\\u901a\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"2bf49181-fc12-3dd4-895c-6304fa3761bc\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('37', '20190613085205876980', '87', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c39\\u8857\\u9053\\u7b2c851\\u53f7\",\"zip\":563600,\"contact_name\":\"\\u9676\\u79c0\\u73cd\",\"contact_phone\":\"18832312976\"}', '61725.00', 'Labore distinctio est voluptatem praesentium sequi.', '2019-05-24 15:49:01', null, 'wechat', '65187edc-5fb7-3619-87e7-1d033446a76c', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u6cf0\\u9e92\\u9e9f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9239ed94-e009-3c9c-9185-533ad20810bd\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('38', '20190613085205637900', '63', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c16\\u8857\\u9053\\u7b2c3\\u53f7\",\"zip\":852700,\"contact_name\":\"\\u90d1\\u5609\",\"contact_phone\":\"13703994582\"}', '23093.00', 'Est officiis est et aperiam.', '2019-05-23 08:03:39', null, 'alipay', 'fcc68bcf-3712-3799-99db-ac109bffe2b2', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u65f6\\u7a7a\\u76d2\\u6570\\u5b57\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9de87f6a-f061-39d3-bbd2-6a63a9097bad\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('39', '20190613085205097311', '58', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c355\\u53f7\",\"zip\":775800,\"contact_name\":\"\\u690d\\u5fd7\\u8bda\",\"contact_phone\":\"17079497125\"}', '71957.00', 'Eligendi qui vel nihil tempore ullam illo quaerat aperiam.', '2019-06-03 23:53:48', null, 'alipay', 'af75595e-881d-3706-8b07-b4fe0180ce25', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('40', '20190613085205509055', '13', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c901\\u53f7\",\"zip\":322600,\"contact_name\":\"\\u5c91\\u56fd\\u5e86\",\"contact_phone\":\"13451367516\"}', '77646.00', 'Et expedita laudantium quis non.', '2019-06-07 14:48:32', null, 'wechat', '41e9f8a9-f687-3b26-8ffb-d761628ca920', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u83ca\\u98ce\\u516c\\u53f8\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"150fd35c-1c90-3020-8bec-ff47ac821f9a\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('41', '20190613085205260591', '48', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c27\\u8857\\u9053\\u7b2c334\\u53f7\",\"zip\":573400,\"contact_name\":\"\\u94f6\\u4eae\",\"contact_phone\":\"15798093648\"}', '19536.00', 'Ducimus occaecati rem labore aperiam quo dolores.', '2019-05-31 08:56:07', null, 'wechat', '7c3dfa76-db1e-3fd1-9a7e-ea96c76ee624', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6602\\u6b4c\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f92f022b-e045-3e0c-b19b-f68aaf1785a7\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('42', '20190613085205190705', '30', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c24\\u8857\\u9053\\u7b2c797\\u53f7\",\"zip\":461200,\"contact_name\":\"\\u7eaa\\u4e3d\\u4e3d\",\"contact_phone\":\"15233809850\"}', '35460.90', 'Exercitationem soluta eveniet voluptas aut rerum ipsum.', '2019-06-04 16:07:48', '27', 'alipay', '02c0727d-4071-39c2-b936-5aa0c0647407', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('43', '20190613085205485030', '21', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c67\\u8857\\u9053\\u7b2c121\\u53f7\",\"zip\":225500,\"contact_name\":\"\\u9633\\u5b66\\u660e\",\"contact_phone\":\"18970534381\"}', '23964.00', 'Quia incidunt enim cumque temporibus est debitis.', '2019-06-09 21:35:41', null, 'wechat', '83aa1674-b20a-3a3e-b65d-acf5cd801f67', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u534e\\u8fdc\\u8f6f\\u4ef6\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"dbd77afc-138e-380c-ae76-206cfe3da20a\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('44', '20190613085205154327', '100', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c56\\u53f7\",\"zip\":501600,\"contact_name\":\"\\u9c81\\u52c7\",\"contact_phone\":\"15024759688\"}', '58947.66', 'Et qui a temporibus deserunt.', '2019-05-19 07:32:36', '21', 'alipay', 'b4531aa7-b980-38ac-9256-13e0d0aee364', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('45', '20190613085205162938', '76', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c28\\u8857\\u9053\\u7b2c91\\u53f7\",\"zip\":587400,\"contact_name\":\"\\u4fdd\\u658c\",\"contact_phone\":\"13701472289\"}', '86537.00', 'Maxime sit qui maxime sequi ut ullam.', '2019-06-11 03:17:55', null, 'wechat', '297b4b5b-19f4-34c6-88e5-c12316caacb6', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f1e85501-a5cf-3ce1-a450-884251a0bf85\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('46', '20190613085205345516', '36', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c912\\u53f7\",\"zip\":215600,\"contact_name\":\"\\u4e54\\u7433\",\"contact_phone\":\"13181739249\"}', '29809.00', 'Qui dolores cupiditate et voluptatum illum eos.', '2019-05-24 22:08:27', '1', 'alipay', 'f22e0c74-6e8c-3c47-9a81-a8346aeeb93a', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u56db\\u901a\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"14d1ff7d-f90c-3303-a3db-316030d1c558\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('47', '20190613085205032367', '71', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c84\\u8857\\u9053\\u7b2c58\\u53f7\",\"zip\":418300,\"contact_name\":\"\\u5ed6\\u6842\\u73cd\",\"contact_phone\":\"18102264143\"}', '17432.00', 'Quia in dolore impedit excepturi nisi laborum.', '2019-05-30 07:52:20', null, 'wechat', '7b5e5393-e5c4-3d27-879c-db3c8c25eac8', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u601d\\u4f18\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b3edb95e-1457-3fdc-a8b0-1a78cfa18017\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('48', '20190613085205092627', '69', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c481\\u53f7\",\"zip\":92400,\"contact_name\":\"\\u71d5\\u5e06\",\"contact_phone\":\"18977582250\"}', '1032.50', 'Inventore aspernatur reiciendis aut et.', '2019-05-18 03:01:36', '7', 'wechat', '20fd1183-c2ba-3774-8272-797bc7c76d60', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u9e3f\\u777f\\u601d\\u535a\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"fca4e453-294d-3ac5-988d-2e2504f17998\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('49', '20190613085205063653', '72', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c17\\u8857\\u9053\\u7b2c211\\u53f7\",\"zip\":208400,\"contact_name\":\"\\u989c\\u6587\",\"contact_phone\":\"15631725392\"}', '3263.40', 'Veritatis accusamus ea ipsam incidunt officia quo dolorem nihil.', '2019-05-21 07:22:06', '21', 'alipay', 'edb3b1a1-a46e-3f7c-b6c0-1f62876de96c', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6d66\\u534e\\u4f17\\u57ce\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8bd7bc10-e9f0-30e5-b9c6-fb5f51786ec6\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('50', '20190613085205571157', '85', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c936\\u53f7\",\"zip\":621900,\"contact_name\":\"\\u8c08\\u6dd1\\u5170\",\"contact_phone\":\"18571660767\"}', '36511.00', 'Enim qui tempora id debitis amet.', '2019-05-25 10:40:03', null, 'alipay', 'b797ead1-b7b4-3b6d-81bd-db6f74a3c002', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u98de\\u5229\\u4fe1\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"bf4e1eba-dd76-31fe-a4ea-04ab69ef5c66\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('51', '20190613085205833511', '90', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c6\\u8857\\u9053\\u7b2c673\\u53f7\",\"zip\":84700,\"contact_name\":\"\\u4f5f\\u654f\",\"contact_phone\":\"17054751096\"}', '20722.00', 'Nesciunt et est et consectetur eum quia.', '2019-06-08 04:51:35', '1', 'wechat', 'fec99dc9-d3b7-31bc-bc8e-43eebc69bfaa', 'success', '733624ce49ca4658b6fd5278175c9c10', '0', '1', 'received', '{\"express_company\":\"\\u65b0\\u683c\\u6797\\u8010\\u7279\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"32bda2cc-0f29-30ce-9ff7-bdd32ae72131\"}', '{\"refund_reason\":\"Consequatur qui ea est consequatur fuga pariatur velit.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('52', '20190613085205371885', '42', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c23\\u8857\\u9053\\u7b2c987\\u53f7\",\"zip\":215400,\"contact_name\":\"\\u5e84\\u5b81\",\"contact_phone\":\"15854780927\"}', '27492.00', 'Necessitatibus ut cumque doloribus velit ut laudantium facere.', '2019-05-18 18:51:00', null, 'alipay', 'd46feb44-1543-31f9-a712-bafa17d3e4f8', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('53', '20190613085205365531', '80', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c964\\u53f7\",\"zip\":141400,\"contact_name\":\"\\u90a2\\u6ce2\",\"contact_phone\":\"13235963900\"}', '17126.00', 'Dignissimos qui et tenetur vel voluptas atque.', '2019-05-29 22:25:52', '1', 'alipay', '2964e6fa-6a38-38cd-a6fa-ed982e003d90', 'success', 'fdc6bcef37484ec99c7691d52023465d', '0', '0', 'received', '{\"express_company\":\"\\u8054\\u8f6f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b5c57bea-9140-3778-be87-80c36a9743df\"}', '{\"refund_reason\":\"Doloribus libero quis atque provident dolor.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('54', '20190613085205432106', '62', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c423\\u53f7\",\"zip\":428200,\"contact_name\":\"\\u6817\\u51b0\\u51b0\",\"contact_phone\":\"13080370787\"}', '19414.00', 'Quia aperiam voluptatem et totam qui dolorem.', '2019-05-20 02:48:44', null, 'alipay', 'af3432b4-9e41-3cb5-b20b-b718a3cbb379', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:07');
INSERT INTO `orders` VALUES ('55', '20190613085205825756', '56', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c87\\u8857\\u9053\\u7b2c58\\u53f7\",\"zip\":148800,\"contact_name\":\"\\u6851\\u971e\",\"contact_phone\":\"13286533995\"}', '44984.00', 'Beatae cupiditate ipsam pariatur explicabo eius.', '2019-05-23 11:29:15', null, 'alipay', 'cf47ff28-54da-3724-8ca4-bc6c694f3e98', 'success', '7d800ff4a3c8484b80437def4bbf61fe', '0', '0', 'pending', null, '{\"refund_reason\":\"Assumenda ducimus qui voluptatem.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('56', '20190613085205846676', '57', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c329\\u53f7\",\"zip\":723600,\"contact_name\":\"\\u82a6\\u5b81\",\"contact_phone\":\"18925433106\"}', '2493.06', 'Doloribus ullam qui reiciendis deleniti dolor blanditiis.', '2019-05-24 22:34:25', '21', 'alipay', 'e7b7ab85-a93c-3e18-b719-68e32fbc37a6', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('57', '20190613085205285292', '57', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c120\\u53f7\",\"zip\":615800,\"contact_name\":\"\\u4e01\\u632f\\u56fd\",\"contact_phone\":\"17081030892\"}', '20643.00', 'Sed repellat illo dolores.', '2019-06-04 16:57:46', null, 'wechat', '2ae394f9-3978-32b9-ae0c-c754538fba1b', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('58', '20190613085205208212', '36', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c67\\u53f7\",\"zip\":828200,\"contact_name\":\"\\u5ec9\\u5229\",\"contact_phone\":\"18849839106\"}', '24629.00', 'Quibusdam ad culpa expedita.', '2019-06-01 02:25:53', null, 'wechat', 'd3bb9070-3819-3ffb-9e7c-c11a3a8b490e', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u7ef4\\u65fa\\u660e\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"25a40b46-0e0d-38de-a325-bff43b750f30\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('59', '20190613085205407689', '83', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c96\\u8857\\u9053\\u7b2c593\\u53f7\",\"zip\":145700,\"contact_name\":\"\\u5b81\\u6797\",\"contact_phone\":\"15569192590\"}', '34383.00', 'Ex enim mollitia mollitia magnam.', '2019-05-29 21:59:30', null, 'wechat', '1b6381e6-c451-3134-91c4-2112d0c8d8ee', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u98de\\u5229\\u4fe1\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"437c09f6-ad3d-32eb-970a-34f734911625\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('60', '20190613085205782423', '33', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c81\\u8857\\u9053\\u7b2c260\\u53f7\",\"zip\":246800,\"contact_name\":\"\\u83ab\\u71d5\",\"contact_phone\":\"17110350120\"}', '44415.00', 'Repudiandae distinctio quis velit et sit laudantium quidem.', '2019-05-28 06:13:49', null, 'wechat', '2a9015e4-2617-3bf3-8450-1d9af3c8ae5e', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"abf6c0c5-38f8-3d78-b911-de2060585161\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('61', '20190613085205803222', '41', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c601\\u53f7\",\"zip\":88400,\"contact_name\":\"\\u5b5f\\u745e\",\"contact_phone\":\"15866548965\"}', '46544.00', 'Odit sed non consequatur voluptatem corrupti quis excepturi consectetur.', '2019-05-23 10:03:05', null, 'alipay', 'd8b3f706-737e-3685-b0f6-12d8ed8aff93', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('62', '20190613085205130348', '98', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c50\\u8857\\u9053\\u7b2c593\\u53f7\",\"zip\":612000,\"contact_name\":\"\\u6c60\\u6dd1\\u534e\",\"contact_phone\":\"13908131154\"}', '3164.76', 'Et consequatur corporis dolores quisquam beatae eum.', '2019-05-24 07:25:54', '7', 'alipay', '13384b72-58e7-3bb2-bbc8-44b263b3d00e', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('63', '20190613085205496172', '99', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c81\\u8857\\u9053\\u7b2c78\\u53f7\",\"zip\":143800,\"contact_name\":\"\\u738b\\u8f89\",\"contact_phone\":\"13036314591\"}', '10860.00', 'Possimus qui aut vitae et id.', '2019-05-23 14:01:38', null, 'alipay', 'a5d59c9c-42c4-311e-9b96-d5d12f968fc0', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u51cc\\u9896\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"bf182b99-5dcc-30e2-9db1-b866b055c61f\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('64', '20190613085205168165', '31', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c500\\u53f7\",\"zip\":141200,\"contact_name\":\"\\u9648\\u519b\",\"contact_phone\":\"17014254333\"}', '15732.00', 'Quibusdam et dolorum maiores nesciunt.', '2019-06-07 16:11:42', null, 'wechat', '5dc0ce60-9643-3c06-9ba9-f41e3288ee04', 'success', '8d06a8c8d5f344ddbf7a40381c67bc92', '0', '1', 'pending', null, '{\"refund_reason\":\"Et qui velit sit explicabo ad.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('65', '20190613085205104247', '64', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c84\\u8857\\u9053\\u7b2c723\\u53f7\",\"zip\":731400,\"contact_name\":\"\\u9ad8\\u5fd7\\u6587\",\"contact_phone\":\"13451133384\"}', '50801.00', 'Et unde ex et laudantium voluptates.', '2019-06-05 04:49:25', null, 'wechat', 'b69adbae-8187-3f51-a415-9df01bd9f309', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u5408\\u8054\\u7535\\u5b50\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6eee2e3c-4bf8-3b30-b980-821d1d0ee8e4\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('66', '20190613085205012281', '50', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c553\\u53f7\",\"zip\":248800,\"contact_name\":\"\\u4ef2\\u65b0\\u534e\",\"contact_phone\":\"18984463470\"}', '41743.00', 'Molestiae eligendi rerum non id.', '2019-05-23 18:25:45', null, 'wechat', 'bd81b3d1-927e-3033-94da-79ba85c0bbc2', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u65b0\\u683c\\u6797\\u8010\\u7279\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"651c68eb-7ad9-3502-bf34-3153ed610ec0\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('67', '20190613085205892093', '12', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c433\\u53f7\",\"zip\":705500,\"contact_name\":\"\\u6b27\\u9633\\u5a55\",\"contact_phone\":\"15145962655\"}', '38796.00', 'Dolore ratione eius ad dicta pariatur cum eum ipsam.', '2019-06-13 08:50:19', null, 'alipay', 'b1995deb-2029-3ff8-ba4d-945ca918a7f2', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u592a\\u6781\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b56a1d00-b57f-3cf1-80df-37d16cbaec88\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('68', '20190613085205123979', '38', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c44\\u8857\\u9053\\u7b2c200\\u53f7\",\"zip\":531100,\"contact_name\":\"\\u8212\\u6bc5\",\"contact_phone\":\"18322785487\"}', '438.50', 'Dolor quod delectus commodi sint.', '2019-05-16 15:34:39', '1', 'alipay', 'b6125352-52da-3751-87ee-b1ef6d7735b3', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6570\\u5b57100\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b1a19d4c-e510-31ba-8390-79ac829d48fa\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('69', '20190613085205953448', '37', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c44\\u8857\\u9053\\u7b2c200\\u53f7\",\"zip\":531100,\"contact_name\":\"\\u8212\\u6bc5\",\"contact_phone\":\"18322785487\"}', '19816.00', 'Reiciendis est corrupti iure expedita pariatur.', '2019-05-22 13:59:54', null, 'alipay', '24a9195d-0000-3265-95e3-37bad7949ea9', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u56fd\\u8baf\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"841d9994-bed1-3e05-bfda-2edb4418528c\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('70', '20190613085205938725', '21', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c34\\u8857\\u9053\\u7b2c484\\u53f7\",\"zip\":811700,\"contact_name\":\"\\u51b7\\u5fd7\\u65b0\",\"contact_phone\":\"17189777805\"}', '47355.00', 'Unde voluptas nostrum velit magni perferendis cupiditate.', '2019-05-23 06:33:37', null, 'alipay', 'f31daa39-9251-3197-aa60-6357c97e55c5', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('71', '20190613085205955486', '76', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c34\\u8857\\u9053\\u7b2c484\\u53f7\",\"zip\":811700,\"contact_name\":\"\\u51b7\\u5fd7\\u65b0\",\"contact_phone\":\"17189777805\"}', '27914.00', 'Animi ut numquam occaecati quasi maiores est nesciunt.', '2019-06-05 21:39:13', null, 'alipay', 'a6683115-da2f-3e68-a03e-61783b0421d6', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('72', '20190613085205370114', '51', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c715\\u53f7\",\"zip\":678400,\"contact_name\":\"\\u66f2\\u5efa\\u660e\",\"contact_phone\":\"15884094821\"}', '19833.00', 'Sint quia cupiditate vel quisquam.', '2019-05-31 21:50:16', null, 'wechat', 'da5837bd-e2b0-3ed6-ab8c-30a29ce160b1', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9aea8161-6649-3dd5-94b2-382278382164\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('73', '20190613085205897263', '5', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c35\\u8857\\u9053\\u7b2c211\\u53f7\",\"zip\":135400,\"contact_name\":\"\\u7cdc\\u7476\",\"contact_phone\":\"17849659673\"}', '19460.56', 'Illo quibusdam nulla sunt voluptatum blanditiis quia earum.', '2019-05-19 06:37:28', '7', 'alipay', '78e15a06-fd9e-3496-8461-b7026767405a', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('74', '20190613085205575196', '64', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c21\\u53f7\",\"zip\":807500,\"contact_name\":\"\\u5ec9\\u51ef\",\"contact_phone\":\"13937878575\"}', '12588.16', 'Alias qui voluptates reprehenderit optio quidem et pariatur.', '2019-05-21 08:12:37', '22', 'wechat', 'e5d36e19-69f3-3a7b-b0fa-ed2e06fd98b0', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('75', '20190613085205810947', '38', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c37\\u8857\\u9053\\u7b2c428\\u53f7\",\"zip\":754900,\"contact_name\":\"\\u6797\\u6d01\",\"contact_phone\":\"18779213519\"}', '13333.41', 'Totam saepe eos eius harum magni repudiandae ducimus.', '2019-06-01 00:22:29', '7', 'wechat', 'fcf07615-2966-3cb2-a47f-f16439359c36', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u56fe\\u9f99\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"d50a64bd-e43a-3bd0-b8a6-3b2dcb61cae8\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('76', '20190613085205087977', '31', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c59\\u8857\\u9053\\u7b2c995\\u53f7\",\"zip\":381500,\"contact_name\":\"\\u5173\\u79c0\\u534e\",\"contact_phone\":\"13967483511\"}', '45196.00', 'Quaerat quia labore magni a qui omnis nemo.', '2019-06-07 05:32:47', null, 'alipay', '6a694eb8-a7d0-3cf2-8c29-bf8978c9de30', 'success', 'f8f6d3bbf72143ed99a9901c4c661863', '0', '0', 'delivered', '{\"express_company\":\"\\u4e5d\\u65b9\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"af36cb5c-91a5-3bed-94d8-0ba0feb6e22a\"}', '{\"refund_reason\":\"Aperiam id hic sunt numquam quo.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:08');
INSERT INTO `orders` VALUES ('77', '20190613085205759111', '65', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c35\\u8857\\u9053\\u7b2c211\\u53f7\",\"zip\":135400,\"contact_name\":\"\\u7cdc\\u7476\",\"contact_phone\":\"17849659673\"}', '5033.00', 'Ut accusamus ipsa natus fuga atque autem.', '2019-05-18 13:18:20', '1', 'wechat', '92b10e50-b520-3f07-adb9-3d1c411d5cb1', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u521b\\u4ebf\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f5be3933-f913-349c-95dd-995e2877c17a\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('78', '20190613085205332913', '66', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c23\\u8857\\u9053\\u7b2c987\\u53f7\",\"zip\":215400,\"contact_name\":\"\\u5e84\\u5b81\",\"contact_phone\":\"15854780927\"}', '10837.30', 'Cupiditate autem quas neque blanditiis temporibus perspiciatis.', '2019-06-12 05:29:26', '21', 'alipay', '4b067cc9-ed45-3208-a293-da7f86c3ea09', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('79', '20190613085205589848', '15', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c1\\u8857\\u9053\\u7b2c245\\u53f7\",\"zip\":446100,\"contact_name\":\"\\u90ac\\u7ffc\",\"contact_phone\":\"15979560693\"}', '5194.00', 'Rerum exercitationem reiciendis qui nisi.', '2019-05-19 14:02:19', null, 'wechat', '880b879c-49cd-3a30-a036-ebb78f88f92d', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6d66\\u534e\\u4f17\\u57ce\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a8567bbb-1d64-385d-a5c3-d6642004b9b1\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('80', '20190613085205047205', '88', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c51\\u53f7\",\"zip\":473700,\"contact_name\":\"\\u90a2\\u96f7\",\"contact_phone\":\"14507935293\"}', '30031.00', 'Iusto in dolorem et quia molestias provident.', '2019-06-06 15:32:45', null, 'alipay', 'e45e2cf7-d612-3628-a127-fb7c0553e978', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u540c\\u5174\\u4e07\\u70b9\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"fc02fcbd-2bbc-3500-83e2-f9142d071f2b\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('81', '20190613085205329796', '26', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c33\\u8857\\u9053\\u7b2c921\\u53f7\",\"zip\":122000,\"contact_name\":\"\\u5c60\\u83b9\",\"contact_phone\":\"18789905870\"}', '16824.00', 'Id et et reprehenderit dolor omnis.', '2019-06-10 05:44:45', null, 'alipay', 'bbad90b5-8273-3d39-862a-13672bcc78e9', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u826f\\u8bfa\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9260a37c-1680-3b5b-a94c-4970ef1fa623\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('82', '20190613085205612848', '35', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c620\\u53f7\",\"zip\":624200,\"contact_name\":\"\\u845b\\u6587\\u541b\",\"contact_phone\":\"15599627117\"}', '62448.63', 'Iure maiores itaque at quis tempore.', '2019-05-18 15:09:22', '22', 'alipay', '78e928b5-2996-386c-aee5-3c5042a172d9', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u826f\\u8bfa\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e2bfc976-9fe4-3962-8e91-6f4d7e4a71b9\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('83', '20190613085205322295', '84', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c59\\u8857\\u9053\\u7b2c972\\u53f7\",\"zip\":83900,\"contact_name\":\"\\u690d\\u7ea2\",\"contact_phone\":\"13293380463\"}', '1001.96', 'Laborum quod voluptatibus officiis qui.', '2019-06-02 18:54:53', '21', 'wechat', 'a85bf0e9-4210-326b-acc2-5865822a4f49', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u4e07\\u8fc5\\u7535\\u8111\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f20739d7-f471-3c58-9788-3214d3b8d1c7\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('84', '20190613085205898470', '68', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c844\\u53f7\",\"zip\":481900,\"contact_name\":\"\\u82b1\\u6842\\u82f1\",\"contact_phone\":\"14705664631\"}', '17136.00', 'Ducimus consequatur consequuntur odit assumenda sit.', '2019-05-16 02:55:47', null, 'alipay', '6f3cf112-ebb8-3f62-b4d5-36405f67f28b', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u592a\\u6781\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"57d1ce9f-69ab-3b7d-a45e-7609c33365e6\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('85', '20190613085205976310', '10', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c0\\u8857\\u9053\\u7b2c415\\u53f7\",\"zip\":254700,\"contact_name\":\"\\u5bab\\u5a77\",\"contact_phone\":\"18653395782\"}', '23885.00', 'Iure consequatur est est.', '2019-05-27 22:51:36', null, 'wechat', 'd1ac0304-ba12-3a70-8ef3-da66aa13e890', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u7ef4\\u6d9b\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0c312a04-5a38-382a-ab55-2cd48f042e0a\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('86', '20190613085205166761', '85', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c120\\u53f7\",\"zip\":615800,\"contact_name\":\"\\u4e01\\u632f\\u56fd\",\"contact_phone\":\"17081030892\"}', '38411.00', 'Mollitia molestiae nemo earum voluptatem.', '2019-06-03 12:11:32', null, 'alipay', '025c7dfa-a647-37c8-9176-daa66b53f8d1', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u65b0\\u683c\\u6797\\u8010\\u7279\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"af18595a-1715-39de-a9c0-1d22ca974473\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('87', '20190613085205852868', '56', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c66\\u8857\\u9053\\u7b2c396\\u53f7\",\"zip\":761600,\"contact_name\":\"\\u535e\\u6dd1\\u5170\",\"contact_phone\":\"18727214229\"}', '13298.00', 'Porro rem et corrupti dolor excepturi nihil quaerat.', '2019-06-03 00:59:12', null, 'wechat', 'd8d8b0e6-6e0b-362c-b047-907052abf786', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u60e0\\u6d3e\\u56fd\\u9645\\u516c\\u53f8\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f6edab3b-0204-3d07-890d-4efd2846f360\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('88', '20190613085205445056', '80', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c84\\u8857\\u9053\\u7b2c58\\u53f7\",\"zip\":418300,\"contact_name\":\"\\u5ed6\\u6842\\u73cd\",\"contact_phone\":\"18102264143\"}', '7895.19', 'Repellendus consequatur nulla quos aut ut non dolorem.', '2019-05-15 21:14:40', '22', 'wechat', '1c3ab1a3-8746-30d4-8b6a-a07c8b26a834', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u51cc\\u4e91\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"2e3b01ba-363e-340c-9a85-05d440a01e49\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('89', '20190613085205885136', '23', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c50\\u8857\\u9053\\u7b2c593\\u53f7\",\"zip\":612000,\"contact_name\":\"\\u6c60\\u6dd1\\u534e\",\"contact_phone\":\"13908131154\"}', '28335.00', 'Omnis dolorem velit amet cum.', '2019-05-31 12:19:14', null, 'wechat', '601d54b3-a82d-3fd8-9e8f-9a6573f8ca7d', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('90', '20190613085205851783', '35', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c845\\u53f7\",\"zip\":644500,\"contact_name\":\"\\u5468\\u5b81\",\"contact_phone\":\"18766425424\"}', '52235.00', 'Quo quia vel doloremque consequatur in.', '2019-06-01 23:21:26', null, 'wechat', 'c76bdb4a-d761-39d9-889c-69ed6954e86b', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('91', '20190613085205136799', '13', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c33\\u8857\\u9053\\u7b2c833\\u53f7\",\"zip\":584400,\"contact_name\":\"\\u535c\\u7545\",\"contact_phone\":\"17198488596\"}', '37601.00', 'Molestias omnis deleniti laudantium non.', '2019-05-14 23:05:56', null, 'wechat', '53ac3291-5edf-30a2-8e67-32183081cc00', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('92', '20190613085205102974', '54', '{\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u897f\\u6e56\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c659\\u53f7\",\"zip\":16000,\"contact_name\":\"\\u82d7\\u6d77\\u71d5\",\"contact_phone\":\"18269739375\"}', '37310.00', 'Rem qui voluptatem esse.', '2019-06-05 17:07:44', null, 'wechat', '07d16513-bdcb-3290-b1be-5a6ab53b289c', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u53cc\\u654f\\u7535\\u5b50\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8696bb4c-d44a-3753-b327-551e567a766a\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:09');
INSERT INTO `orders` VALUES ('93', '20190613085205250987', '43', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c29\\u53f7\",\"zip\":804900,\"contact_name\":\"\\u4f55\\u71d5\",\"contact_phone\":\"17188220934\"}', '73852.00', 'Ut rerum eaque sit hic.', '2019-05-30 23:45:29', null, 'wechat', 'f9ac0d56-e052-36e7-9c17-01b28d84d705', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('94', '20190613085205342258', '4', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c87\\u8857\\u9053\\u7b2c58\\u53f7\",\"zip\":148800,\"contact_name\":\"\\u6851\\u971e\",\"contact_phone\":\"13286533995\"}', '15152.00', 'Laudantium aliquam laudantium delectus mollitia earum voluptatem et.', '2019-06-03 21:02:06', null, 'alipay', 'c7914371-af7a-38ef-9c3f-a63a2837794d', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u5de8\\u5965\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"48bc65fa-d01d-3b97-9c5a-ce09c17f161c\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('95', '20190613085205360296', '74', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c45\\u8857\\u9053\\u7b2c806\\u53f7\",\"zip\":351300,\"contact_name\":\"\\u8a79\\u5fd7\\u65b0\",\"contact_phone\":\"18115699289\"}', '29682.00', 'Ut tempora aut vero hic ut.', '2019-05-17 02:44:40', null, 'wechat', 'c25eb5de-0d9d-337b-8f4c-c476e1adf647', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u96e8\\u6797\\u6728\\u98ce\\u8ba1\\u7b97\\u673a\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8cf5f793-c5b1-320c-a9ea-89b5a003fdb6\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('96', '20190613085205998036', '91', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c28\\u8857\\u9053\\u7b2c91\\u53f7\",\"zip\":587400,\"contact_name\":\"\\u4fdd\\u658c\",\"contact_phone\":\"13701472289\"}', '927.00', 'Deserunt autem saepe dolore autem magnam.', '2019-06-02 03:18:40', '1', 'alipay', 'abf7382e-710b-3f70-9b9a-b840b6d364fb', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u65f6\\u523b\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ec32b909-3bca-3bb0-9454-7cfbd2d5ccd5\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('97', '20190613085205462434', '87', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c39\\u8857\\u9053\\u7b2c844\\u53f7\",\"zip\":404000,\"contact_name\":\"\\u949f\\u5a55\",\"contact_phone\":\"14755564444\"}', '4777.00', 'Ut rerum quia sunt ex sit.', '2019-05-15 15:21:27', null, 'alipay', '30fdf2b4-c604-3639-b488-af672f98ca10', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('98', '20190613085205825786', '27', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c37\\u8857\\u9053\\u7b2c330\\u53f7\",\"zip\":25400,\"contact_name\":\"\\u82df\\u79c0\\u534e\",\"contact_phone\":\"13534833622\"}', '44923.00', 'Magnam aperiam qui veniam sed ut dignissimos nihil.', '2019-05-30 06:33:23', null, 'alipay', '16744d40-c641-3977-a4ae-6b261fceb4a3', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u534e\\u6cf0\\u901a\\u5b89\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"dcdbc6d6-be1d-3b6d-af3d-eb3d696d0ef0\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('99', '20190613085205853643', '86', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c628\\u53f7\",\"zip\":717100,\"contact_name\":\"\\u7fc1\\u4eae\",\"contact_phone\":\"18317358094\"}', '21616.00', 'Sint ut qui nulla tempore quae odit.', '2019-06-11 13:03:07', null, 'alipay', 'a7eaaf6a-f3fe-3014-b10c-62a789cf116d', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"MBP\\u8f6f\\u4ef6\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e32a4667-2d2d-3a3c-b6cf-312b71f7bc01\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('100', '20190613085205230678', '11', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c71\\u8857\\u9053\\u7b2c835\\u53f7\",\"zip\":617200,\"contact_name\":\"\\u6885\\u5fd7\\u52c7\",\"contact_phone\":\"17677251024\"}', '20841.00', 'Quia nihil voluptatem nemo occaecati.', '2019-06-05 20:07:08', null, 'wechat', 'aab18693-1e0a-36fc-99fa-838b93d53d92', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('101', '20190613085205869689', '47', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c59\\u8857\\u9053\\u7b2c649\\u53f7\",\"zip\":712900,\"contact_name\":\"\\u59ec\\u5a1c\",\"contact_phone\":\"18815508682\"}', '25118.00', 'Quis sit occaecati est nulla laboriosam iste.', '2019-06-04 02:29:05', null, 'alipay', '554b90d8-f1ca-3973-b824-c14dd033ed7c', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6d66\\u534e\\u4f17\\u57ce\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"bfd648d5-d115-3ab8-a1e9-cdcfcf0f62b9\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('102', '20190613085205185187', '6', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c500\\u53f7\",\"zip\":141200,\"contact_name\":\"\\u9648\\u519b\",\"contact_phone\":\"17014254333\"}', '16725.12', 'Aut eum aut et voluptatem.', '2019-05-27 05:17:22', '27', 'wechat', 'b4d834e1-6bf1-3881-8c92-f5580fbb1e40', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('103', '20190613085205749791', '12', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c18\\u8857\\u9053\\u7b2c150\\u53f7\",\"zip\":691900,\"contact_name\":\"\\u8fdf\\u6842\\u9999\",\"contact_phone\":\"17090106682\"}', '28165.00', 'Perspiciatis autem dignissimos nesciunt veniam.', '2019-05-28 07:01:37', null, 'wechat', '9c85bbb9-a8d7-318f-9513-3eec7a688bef', 'success', '1184f92a4b5940269521e5f92277b7e0', '0', '1', 'received', '{\"express_company\":\"\\u6602\\u6b4c\\u4fe1\\u606f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"7d48ac34-db2f-30ba-875c-8ff403b2d389\"}', '{\"refund_reason\":\"Facilis a molestiae incidunt dolores.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('104', '20190613085205280819', '52', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c28\\u8857\\u9053\\u7b2c91\\u53f7\",\"zip\":587400,\"contact_name\":\"\\u4fdd\\u658c\",\"contact_phone\":\"13701472289\"}', '22686.18', 'Nihil asperiores rem aut vel odit.', '2019-05-14 10:59:13', '21', 'wechat', 'aa5697bb-ff70-3b6c-99b4-18e672dd38ce', 'success', '1ee138e52c3c430d951ecc0d345446ce', '0', '0', 'received', '{\"express_company\":\"\\u4fe1\\u8bda\\u81f4\\u8fdc\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9044816e-4507-358e-b301-60bc798760b4\"}', '{\"refund_reason\":\"Tenetur nobis et voluptatem dolor aut.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('105', '20190613085205284196', '66', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c33\\u8857\\u9053\\u7b2c522\\u53f7\",\"zip\":192800,\"contact_name\":\"\\u8f9c\\u6587\\u5a1f\",\"contact_phone\":\"17641696655\"}', '40021.00', 'Blanditiis a neque iusto molestiae in quia molestiae voluptates.', '2019-06-07 14:30:25', null, 'wechat', 'cc07624b-9e9a-3029-8521-cf66b9a05d45', 'success', '67e94d6df4784eea957a7c81f9919958', '0', '1', 'delivered', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8c3a581f-fe74-3d6f-be1b-40414d9bb256\"}', '{\"refund_reason\":\"Non non molestiae aut maxime iste.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('106', '20190613085205406737', '93', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c44\\u8857\\u9053\\u7b2c200\\u53f7\",\"zip\":531100,\"contact_name\":\"\\u8212\\u6bc5\",\"contact_phone\":\"18322785487\"}', '99369.00', 'Repudiandae id sit delectus corrupti ab dolor.', '2019-05-29 01:39:34', null, 'wechat', '89927817-e19e-3911-9ce1-0136a222e34f', 'success', '19cd648797a5465981b57f8796ee7630', '0', '1', 'delivered', '{\"express_company\":\"\\u96e8\\u6797\\u6728\\u98ce\\u8ba1\\u7b97\\u673a\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"adacad4e-926e-31a6-ab53-58896c7d5130\"}', '{\"refund_reason\":\"Molestias laborum animi aut repellendus.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('107', '20190613085205719726', '100', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c50\\u8857\\u9053\\u7b2c55\\u53f7\",\"zip\":183000,\"contact_name\":\"\\u621a\\u5fd7\\u5f3a\",\"contact_phone\":\"15806718046\"}', '29960.00', 'Nihil eveniet nemo atque sunt adipisci quia dolorem.', '2019-06-04 16:10:15', null, 'alipay', '9d12bb5c-2f4c-3abf-b207-8c30950dbaad', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"cc18af35-8568-3768-b141-2ad43ace0076\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('108', '20190613085205321688', '34', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c2\\u8857\\u9053\\u7b2c261\\u53f7\",\"zip\":217900,\"contact_name\":\"\\u6587\\u6b22\",\"contact_phone\":\"18599391644\"}', '23436.00', 'Ea architecto omnis velit aut voluptas.', '2019-05-26 20:38:41', null, 'alipay', 'a256c2e3-e332-3c5d-a1d8-2f460eab6ea0', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u826f\\u8bfa\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ed10538b-b33b-38b8-a68a-3e1dfee4d9da\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('109', '20190613085205928658', '97', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c27\\u8857\\u9053\\u7b2c596\\u53f7\",\"zip\":422300,\"contact_name\":\"\\u90ac\\u6b63\\u8bda\",\"contact_phone\":\"14708425104\"}', '19613.08', 'Consequatur eum aperiam sapiente sunt.', '2019-05-24 03:32:30', '27', 'wechat', '373b7b77-7186-3fd4-9bd1-bf37fd9865e5', 'pending', null, '0', '0', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('110', '20190613085205149479', '14', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c0\\u8857\\u9053\\u7b2c661\\u53f7\",\"zip\":781500,\"contact_name\":\"\\u6731\\u4f1f\",\"contact_phone\":\"18935453306\"}', '10605.24', 'Ut autem quia quam neque.', '2019-06-08 21:58:17', '22', 'wechat', 'd261fa5d-fe2e-3a82-af18-9ddf095cad20', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u60e0\\u6d3e\\u56fd\\u9645\\u516c\\u53f8\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6e2b6ee0-b3de-36fb-82de-aa9258909c79\"}', '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('111', '20190613085205382929', '102', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c1\\u8857\\u9053\\u7b2c787\\u53f7\",\"zip\":667300,\"contact_name\":\"\\u5b97\\u52c7\",\"contact_phone\":\"18378114580\"}', '22222.00', 'Voluptatem impedit excepturi enim dicta at aut eaque.', '2019-06-03 00:24:41', null, 'alipay', 'f5738f35-5451-3131-8946-e64845fdd8d6', 'pending', null, '0', '1', 'pending', null, '[]', '2019-06-13 08:52:05', '2019-06-13 08:52:10');
INSERT INTO `orders` VALUES ('112', '20190613085205445961', '83', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c33\\u8857\\u9053\\u7b2c522\\u53f7\",\"zip\":192800,\"contact_name\":\"\\u8f9c\\u6587\\u5a1f\",\"contact_phone\":\"17641696655\"}', '10211.72', 'Nostrum impedit ex alias ad voluptatem.', '2019-05-24 08:19:34', '7', 'wechat', 'fe081e42-7cf1-3e8e-aace-cd754d18b90b', 'success', 'dcf49f3c1d284be889833db7a70a2efb', '0', '1', 'pending', null, '{\"refund_reason\":\"Est et maxime error nam.\"}', '2019-06-13 08:52:05', '2019-06-13 08:52:10');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU 名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU 描述',
  `price` decimal(10,2) NOT NULL COMMENT 'SKU 价格',
  `stock` int(10) unsigned NOT NULL COMMENT 'SKU 库存',
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', '银色256GB', 'iPhone XS Max 支持双卡双待', '9699.00', '150', '1', '2019-05-10 02:52:35', '2019-05-10 03:02:53');
INSERT INTO `product_skus` VALUES ('2', 'nam', 'Voluptas officiis quibusdam officia minus sit vel tempora.', '7288.00', '78289', '2', '2019-05-10 08:34:51', '2019-05-15 10:06:33');
INSERT INTO `product_skus` VALUES ('3', 'dolorum', 'Natus et est nihil eos eos provident.', '9650.00', '84665', '2', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('4', 'deleniti', 'Cupiditate id et ut.', '371.00', '4652', '2', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('5', 'quas', 'Ea exercitationem fugit ipsam.', '9803.00', '36922', '3', '2019-05-10 08:34:51', '2019-05-15 10:08:39');
INSERT INTO `product_skus` VALUES ('6', 'dolor', 'Aut maiores saepe quia aut maiores alias voluptatibus.', '441.00', '19132', '3', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('7', 'dolor', 'Magni earum quaerat accusamus molestiae quaerat.', '3437.00', '18836', '3', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('8', 'accusantium', 'Perspiciatis quidem facilis cum autem consequatur et.', '9877.00', '35169', '4', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('9', 'quam', 'Perferendis voluptas maxime numquam et repudiandae.', '6493.00', '21849', '4', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('10', 'et', 'Provident quia et eligendi.', '8654.00', '1577', '4', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('11', 'quos', 'Totam tempora laboriosam id harum aliquam eos cupiditate.', '5906.00', '2515', '5', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('12', 'est', 'Ut labore illo eum illo non perferendis nemo.', '7539.00', '12381', '5', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('13', 'animi', 'Dicta voluptatem sint minima libero.', '4672.00', '85118', '5', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('14', 'porro', 'In consequatur dolorem sunt quos minus qui autem.', '5459.00', '22832', '6', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('15', 'dolores', 'Illo in accusantium omnis.', '4529.00', '69883', '6', '2019-05-10 08:34:51', '2019-05-16 04:31:13');
INSERT INTO `product_skus` VALUES ('16', 'commodi', 'Porro dolor similique dolore alias reprehenderit vero sit.', '6935.00', '49126', '6', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('17', 'eos', 'Aliquam illo sapiente ut rem ad maxime culpa.', '623.00', '97030', '7', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('18', 'est', 'Similique neque repudiandae assumenda minus nihil.', '6649.00', '66486', '7', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('19', 'consectetur', 'Vero voluptas dignissimos odit.', '7156.00', '56963', '7', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('20', 'aliquid', 'Et enim delectus iste molestias.', '1752.00', '73912', '8', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('21', 'dolore', 'Voluptatum nostrum et ipsam voluptatibus sed molestias.', '6143.00', '51888', '8', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('22', 'dolor', 'Reiciendis corrupti aspernatur dicta.', '718.00', '12487', '8', '2019-05-10 08:34:51', '2019-05-10 08:34:51');
INSERT INTO `product_skus` VALUES ('23', 'dolor', 'Maiores est nihil eos quisquam.', '7201.00', '17715', '9', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('24', 'dolores', 'Et praesentium voluptatem ipsa atque aut.', '5449.00', '40793', '9', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('25', 'qui', 'Nisi consectetur molestiae quisquam velit expedita voluptate.', '4954.00', '57478', '9', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('26', 'officia', 'Fuga ut placeat et tempora et aperiam.', '2799.00', '32766', '10', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('27', 'placeat', 'Quidem assumenda veritatis provident dolorem.', '127.00', '37305', '10', '2019-05-10 08:34:52', '2019-06-13 08:16:46');
INSERT INTO `product_skus` VALUES ('28', 'itaque', 'Ut consectetur eaque impedit quia dolores accusamus.', '710.00', '32174', '10', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('29', 'temporibus', 'Ad amet alias illo qui delectus qui.', '933.00', '65399', '11', '2019-05-10 08:34:52', '2019-06-13 08:16:46');
INSERT INTO `product_skus` VALUES ('30', 'suscipit', 'Ipsam optio nemo harum et voluptas ut.', '755.00', '65224', '11', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('31', 'quisquam', 'Autem quia repellat non et quod.', '5777.00', '32218', '11', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('32', 'officia', 'Qui et eveniet accusantium sed distinctio eveniet.', '3742.00', '17272', '12', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('33', 'consectetur', 'Necessitatibus consequuntur et eum nihil eos velit sit.', '9820.00', '31126', '12', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('34', 'distinctio', 'Esse est et sequi sunt.', '2468.00', '43275', '12', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('35', 'quas', 'Placeat blanditiis ipsum ut.', '7611.00', '29664', '13', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('36', 'iusto', 'Quas et et molestias quas sed nulla ab.', '3200.00', '40164', '13', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('37', 'dolorem', 'Beatae dolorem in totam autem explicabo.', '5913.00', '10468', '13', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('38', 'perspiciatis', 'Quia totam sequi quia quos molestias ut sed sit.', '3324.00', '35985', '14', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('39', 'maiores', 'Mollitia dolorem error inventore nostrum ipsum ut qui.', '9460.00', '34888', '14', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('40', 'nam', 'Ex sit labore facilis commodi velit et.', '4575.00', '43822', '14', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('41', 'culpa', 'Rerum sit consequuntur quos eos saepe autem.', '8995.00', '83738', '15', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('42', 'doloribus', 'Eveniet quia reprehenderit quisquam sapiente odit impedit.', '8377.00', '47403', '15', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('43', 'ut', 'Minima magni amet eos enim dolor magnam ea.', '720.00', '14930', '15', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('44', 'impedit', 'Distinctio ipsam perspiciatis molestiae nostrum qui perspiciatis.', '1357.00', '463', '16', '2019-05-10 08:34:52', '2019-06-13 07:58:39');
INSERT INTO `product_skus` VALUES ('45', 'maiores', 'Suscipit nihil quasi fugiat.', '6267.00', '37210', '16', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('46', 'eaque', 'Reiciendis voluptas dolore quis eaque tempore nulla ut rerum.', '3061.00', '62960', '16', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('47', 'porro', 'Corporis nesciunt rerum aut amet voluptate assumenda nostrum.', '5865.00', '71199', '17', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('48', 'itaque', 'Illo perferendis error porro quisquam itaque harum cupiditate.', '7988.00', '89593', '17', '2019-05-10 08:34:52', '2019-05-10 08:34:52');
INSERT INTO `product_skus` VALUES ('49', 'odio', 'Voluptas consequatur quia sed enim.', '8875.00', '60408', '17', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('50', 'blanditiis', 'Eius voluptas aut facere impedit unde consequatur et iure.', '8152.00', '41310', '18', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('51', 'dicta', 'Quia voluptatem et eveniet sit.', '7768.00', '82249', '18', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('52', 'aut', 'Nihil ut ut dolorem ab laborum.', '3580.00', '23503', '18', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('53', 'incidunt', 'Omnis aut delectus asperiores quidem reprehenderit omnis quia.', '5955.00', '70812', '19', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('54', 'eum', 'Ea explicabo soluta dolores quia.', '1079.00', '78213', '19', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('55', 'dolorem', 'Nisi omnis tenetur sit ut.', '3732.00', '79040', '19', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('56', 'quia', 'Doloribus iure ab aut qui expedita.', '8092.00', '95674', '20', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('57', 'aut', 'Quis dignissimos sunt aspernatur ut et.', '5516.00', '78935', '20', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('58', 'rerum', 'Asperiores ipsam et modi illo cupiditate laudantium.', '4410.00', '52376', '20', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('59', 'delectus', 'Temporibus adipisci cumque ut ut.', '7106.00', '90287', '21', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('60', 'qui', 'Quo impedit voluptate accusantium quam est.', '4169.00', '3862', '21', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('61', 'eum', 'Vero rerum sunt modi eum maxime eos ut.', '1879.00', '10250', '21', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('62', 'ut', 'Autem tenetur magni nam.', '9677.00', '32877', '22', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('63', 'sint', 'Neque inventore necessitatibus perspiciatis.', '8757.00', '21752', '22', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('64', 'at', 'Eaque consectetur temporibus ut quidem autem.', '5046.00', '70703', '22', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('65', 'explicabo', 'Quisquam soluta exercitationem deleniti.', '9799.00', '95073', '23', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('66', 'sit', 'Nobis dolor maxime expedita sequi deleniti sed.', '1575.00', '31410', '23', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('67', 'animi', 'Ratione similique molestiae et omnis.', '6915.00', '34219', '23', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('68', 'ut', 'Vel autem magni harum porro qui provident.', '9325.00', '4020', '24', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('69', 'fuga', 'Quaerat maxime consequatur saepe molestias cum.', '8952.00', '6736', '24', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('70', 'sit', 'Voluptatibus ipsa nostrum fugit at.', '3036.00', '26612', '24', '2019-05-10 08:34:53', '2019-05-10 08:34:53');
INSERT INTO `product_skus` VALUES ('71', 'id', 'Quaerat laborum placeat nisi odit et.', '2359.00', '47458', '25', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('72', 'quod', 'Iure labore alias asperiores repellat a cumque dignissimos.', '4718.00', '26930', '25', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('73', 'impedit', 'Fugiat neque nam dignissimos tempore occaecati placeat.', '5636.00', '81625', '25', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('74', 'ipsam', 'Quod iste alias et beatae nihil.', '7406.00', '57270', '26', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('75', 'itaque', 'Aliquam eum provident voluptatem animi repudiandae placeat consequatur.', '8422.00', '49509', '26', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('76', 'illo', 'Et quam itaque dignissimos consequuntur.', '3054.00', '28591', '26', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('77', 'ut', 'Laudantium eius perspiciatis repellat delectus dolorem ad sit.', '9322.00', '13447', '27', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('78', 'aut', 'Iusto quidem sequi et omnis autem.', '8187.00', '74374', '27', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('79', 'porro', 'Ut quia omnis voluptas velit molestias.', '1354.00', '52098', '27', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('80', 'suscipit', 'Incidunt quia et enim non.', '5720.00', '75352', '28', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('81', 'quia', 'Qui id est voluptatem maxime et aliquid.', '1469.00', '95422', '28', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('82', 'placeat', 'Enim est laudantium at iure.', '7983.00', '9580', '28', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('83', 'et', 'Iure saepe suscipit quo reprehenderit voluptatum et ut blanditiis.', '6611.00', '11996', '29', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('84', 'perspiciatis', 'Dolorem reiciendis mollitia labore ut.', '3369.00', '59549', '29', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('85', 'praesentium', 'Debitis quas provident et.', '2027.00', '61657', '29', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('86', 'aliquid', 'Autem rerum dolorem voluptatem sed cumque.', '8285.00', '81525', '30', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('87', 'quae', 'Velit aspernatur quod quam quam.', '7372.00', '2814', '30', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('88', 'possimus', 'Officiis nisi neque laudantium veritatis quia necessitatibus.', '2224.00', '79510', '30', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('89', 'qui', 'In sint occaecati atque debitis optio.', '6107.00', '52561', '31', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('90', 'optio', 'Aut et quasi enim repellendus ratione nulla sit.', '9705.00', '94159', '31', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('91', 'voluptatem', 'Libero dolor consectetur sit iure occaecati non.', '7562.00', '67188', '31', '2019-05-10 08:34:54', '2019-05-10 08:34:54');
INSERT INTO `product_skus` VALUES ('92', 'beatae', 'Quidem sit et recusandae corrupti excepturi.', '2232.00', '5928', '32', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('93', 'dolorum', 'Harum enim quis aperiam ipsa rem.', '2490.00', '40016', '32', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('94', 'eligendi', 'Tempore et nisi sed provident est est laborum ex.', '28.00', '28647', '32', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('95', 'necessitatibus', 'Assumenda quo facere animi quia quas.', '4167.00', '75524', '33', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('96', 'quibusdam', 'Repellendus neque repellendus in ab.', '4777.00', '10804', '33', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('97', 'omnis', 'In dolorem facere velit odio enim voluptatem natus.', '4789.00', '83725', '33', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('98', 'nihil', 'Sit ut sit nesciunt esse optio nesciunt recusandae sed.', '8445.00', '25694', '34', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('99', 'excepturi', 'Ut ipsum veritatis dolorem quia.', '1660.00', '36706', '34', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('100', 'modi', 'Beatae nostrum voluptatem fuga eligendi.', '5242.00', '45595', '34', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('101', 'dicta', 'Tempora sit mollitia harum aspernatur debitis voluptatibus totam.', '5343.00', '50659', '35', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('102', 'et', 'Sint natus necessitatibus blanditiis voluptatem.', '3510.00', '58064', '35', '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `product_skus` VALUES ('103', 'libero', 'Repellat assumenda eius quia ab exercitationem aut consequatur vel.', '2587.00', '42561', '35', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('104', 'cupiditate', 'Impedit provident laborum vitae ut.', '2544.00', '71421', '36', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('105', 'doloribus', 'Molestiae qui quis quod quidem.', '2149.00', '31198', '36', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('106', 'placeat', 'Quas saepe molestiae hic rerum quia aperiam.', '5072.00', '48931', '36', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('107', 'labore', 'Eaque harum voluptatem velit sed vero.', '4894.00', '61198', '37', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('108', 'eum', 'Molestias voluptatibus quisquam sint alias occaecati.', '4095.00', '4018', '37', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('109', 'ut', 'Placeat recusandae enim qui corrupti modi molestiae.', '7650.00', '7003', '37', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('110', 'asperiores', 'Laboriosam iste repellat nostrum possimus corrupti perferendis quia.', '2597.00', '5869', '38', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('111', 'iste', 'Placeat voluptate sed enim et debitis eum ab.', '5812.00', '92895', '38', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('112', 'nihil', 'Voluptate dolor veritatis provident illum ex.', '766.00', '75548', '38', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('113', 'et', 'Illo expedita delectus doloribus qui et.', '5165.00', '79710', '39', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('114', 'et', 'Velit enim laboriosam voluptas veniam.', '7057.00', '50773', '39', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('115', 'optio', 'Sunt quae amet impedit non amet.', '1895.00', '34961', '39', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('116', 'cupiditate', 'Consequatur est quam culpa rerum ipsam quis.', '5430.00', '76889', '40', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('117', 'dolores', 'Eveniet voluptatem et non repudiandae omnis accusamus quia.', '5348.00', '48965', '40', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('118', 'iusto', 'Magni incidunt non a quam et id et.', '9392.00', '57929', '40', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('119', 'sit', 'Sint rerum omnis dignissimos ipsum voluptas voluptates eius.', '3948.00', '22640', '41', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('120', 'fugiat', 'Dolorem culpa sed vel consequuntur assumenda.', '8293.00', '67134', '41', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('121', 'enim', 'Odio sunt recusandae nam accusamus id quidem laborum.', '2499.00', '58683', '41', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('122', 'consequuntur', 'Rerum voluptas aut porro voluptas omnis.', '6881.00', '27171', '42', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('123', 'eos', 'Ut voluptatem porro quia magni vel officia aperiam.', '744.00', '39271', '42', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('124', 'itaque', 'Eos fugit occaecati quasi est explicabo corrupti sed qui.', '9583.00', '43750', '42', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('125', 'architecto', 'Hic molestiae nam labore ex ut.', '7298.00', '78716', '43', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('126', 'sit', 'Enim dolor ea illo cumque.', '6540.00', '51415', '43', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('127', 'rerum', 'Mollitia quia non vel consequatur quaerat est ut.', '3160.00', '4429', '43', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('128', 'et', 'Consequuntur eos voluptatum dolor sunt adipisci.', '1854.00', '74876', '44', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('129', 'consequatur', 'Excepturi tenetur impedit qui maiores ad et.', '5438.00', '85786', '44', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('130', 'aut', 'Dolor repellendus distinctio sint maxime.', '4358.00', '31162', '44', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('131', 'delectus', 'Cumque hic maiores enim ex.', '200.00', '45600', '45', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('132', 'at', 'Libero excepturi dolores a quasi dolores.', '3774.00', '54148', '45', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('133', 'tempore', 'Ratione debitis sint ut non nulla.', '3277.00', '7926', '45', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('134', 'error', 'Est nostrum assumenda quas dignissimos minima voluptatem.', '4191.00', '77197', '46', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('135', 'reiciendis', 'Aut perferendis officiis velit.', '8423.00', '47519', '46', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('136', 'esse', 'Iste atque impedit eos quas.', '7658.00', '70437', '46', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('137', 'quod', 'Voluptatem autem unde ipsam similique temporibus sunt.', '4365.00', '26003', '47', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('138', 'dignissimos', 'Illum architecto qui provident voluptatem autem.', '5745.00', '46678', '47', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('139', 'nulla', 'Placeat repudiandae reiciendis quibusdam inventore.', '6118.00', '12001', '47', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('140', 'velit', 'Et quas cumque neque beatae ea.', '3936.00', '28099', '48', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('141', 'sint', 'Nam et mollitia quas facilis.', '767.00', '86930', '48', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('142', 'voluptate', 'Voluptatem dolorum assumenda veniam ut delectus.', '3421.00', '85543', '48', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('143', 'id', 'Quam itaque itaque ut velit sit.', '888.00', '1373', '49', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('144', 'consectetur', 'Aliquam fuga iste qui fugit dolores et.', '344.00', '51424', '49', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('145', 'repellat', 'Nihil sit saepe voluptatum tempore itaque quod reprehenderit.', '444.00', '25974', '49', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('146', 'voluptatem', 'Vitae nemo unde explicabo rerum.', '2918.00', '55597', '50', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('147', 'tempore', 'Vitae corporis quisquam tenetur facilis voluptatem praesentium.', '7127.00', '42252', '50', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('148', 'est', 'Aut placeat voluptatibus reprehenderit inventore facilis quia in.', '2979.00', '81881', '50', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('149', 'quia', 'A facere sit non autem itaque ab.', '8631.00', '86674', '51', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('150', 'asperiores', 'Quis consequatur ipsam nihil impedit architecto.', '5621.00', '45842', '51', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('151', 'ut', 'Magnam expedita ea ipsum delectus.', '4945.00', '44236', '51', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('152', 'minima', 'Ut reprehenderit et qui et numquam.', '9034.00', '66602', '52', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('153', 'soluta', 'Est autem quis a tempore et.', '8911.00', '94832', '52', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('154', 'error', 'Iure ipsa consequatur odio qui dolorem.', '9834.00', '41247', '52', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('155', 'delectus', 'Officia ea dolore debitis distinctio sint modi delectus.', '4884.00', '25682', '53', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('156', 'corporis', 'Alias officia quasi quo modi.', '3153.00', '31775', '53', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('157', 'enim', 'Nemo aperiam quo ipsa omnis vitae quos.', '4124.00', '86247', '53', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('158', 'molestias', 'Nihil ipsum aut error non natus.', '2682.00', '95091', '54', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('159', 'quod', 'Et aut quod eum qui quaerat quas.', '7533.00', '11147', '54', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('160', 'aperiam', 'Et qui voluptatum eaque consequatur dolores et et sit.', '877.00', '24393', '54', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('161', 'distinctio', 'Veniam aut et rem.', '2929.00', '9208', '55', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('162', 'deserunt', 'Ipsam ut consequuntur assumenda.', '8727.00', '65073', '55', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('163', 'sunt', 'Laudantium omnis rerum expedita impedit architecto voluptatem in.', '2364.00', '25123', '55', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('164', 'facilis', 'Odit quas tempore ipsum ex explicabo repellat et laudantium.', '4531.00', '18766', '56', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('165', 'ab', 'Voluptas itaque aut qui quis nulla.', '1916.00', '35872', '56', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('166', 'sed', 'Temporibus ipsum voluptas praesentium maiores autem dolores.', '5561.00', '83463', '56', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('167', 'qui', 'Consequatur incidunt consequuntur delectus officia porro quia aliquam.', '6796.00', '62307', '57', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('168', 'cumque', 'Nobis dolore qui vel velit laborum.', '4434.00', '66223', '57', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('169', 'repudiandae', 'Qui quos omnis in reiciendis.', '2478.00', '78781', '57', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('170', 'in', 'Dolores quod excepturi sunt fugit et rerum eum magni.', '8568.00', '38037', '58', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('171', 'facere', 'Rerum alias dolor vero nesciunt nostrum in repellat iste.', '862.00', '55726', '58', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('172', 'et', 'Sit recusandae ea eius et minus consequuntur illum.', '9241.00', '29019', '58', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('173', 'illum', 'Reiciendis consequatur et rem cupiditate quod.', '8475.00', '55778', '59', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('174', 'ab', 'Et dolorem voluptatem ut qui et qui eligendi.', '7007.00', '97737', '59', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('175', 'aperiam', 'Deserunt et et aut qui placeat eligendi accusantium voluptatem.', '9402.00', '29168', '59', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('176', 'et', 'Blanditiis hic explicabo voluptatum fugit rem accusamus id.', '9453.00', '12324', '60', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('177', 'minima', 'Sint quis odit eos sint.', '871.00', '55517', '60', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('178', 'nihil', 'Perspiciatis ipsa eos et culpa.', '7320.00', '16761', '60', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('179', 'ipsa', 'Veniam fugiat optio modi consequatur.', '3318.00', '50992', '61', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('180', 'voluptatem', 'Quaerat officiis vel quos tempore.', '5898.00', '89433', '61', '2019-06-13 08:52:02', '2019-06-13 08:52:02');
INSERT INTO `product_skus` VALUES ('181', 'aliquam', 'Assumenda commodi quia consequatur aliquid a eveniet.', '2561.00', '14534', '61', '2019-06-13 08:52:02', '2019-06-13 08:52:02');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品详情',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图片文件路径',
  `on_sale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '在售',
  `rating` double(8,2) NOT NULL DEFAULT '5.00' COMMENT '评分',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数量',
  `price` decimal(10,2) NOT NULL COMMENT 'SKU 最低价格',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'iPhone XS Max', '<p>Apple iPhone XS Max (A2104) 256GB 银色 移动联通电信4G手机 双卡双待</p>', 'images/0ace3ed19582dbe6.jpg', '1', '3.25', '23', '6', '9699.00', '2019-05-10 02:52:35', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('2', 'quos', 'Aspernatur dolore laborum eius dolorem adipisci sed consequatur.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.00', '5', '3', '371.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('3', 'id', 'Saepe nobis minima aut soluta nulla non praesentium.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.67', '11', '6', '441.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('4', 'et', 'Tempore ducimus eos quae modi quidem eveniet reprehenderit possimus.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.67', '19', '8', '6493.00', '2019-05-10 08:34:50', '2019-06-13 08:52:10');
INSERT INTO `products` VALUES ('5', 'tempore', 'Autem ab quia iure eaque deleniti quis illo.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '3.50', '19', '5', '4672.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('6', 'quisquam', 'Rem ipsam animi temporibus maxime officiis repudiandae.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '1.33', '6', '4', '4529.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('7', 'dolore', 'Voluptas dolores molestiae ut dolorem sit.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '3.00', '2', '1', '623.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('8', 'in', 'Nisi asperiores at minima rerum et voluptas.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '2.00', '11', '3', '718.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('9', 'cupiditate', 'Aut eum delectus nulla voluptatem.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '5.00', '12', '3', '4954.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('10', 'aut', 'Necessitatibus maxime quia nemo exercitationem voluptatem omnis ipsum.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '5.00', '5', '3', '127.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('11', 'quam', 'Labore quis quia sit iste vero rerum.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '1.00', '4', '2', '755.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('12', 'optio', 'Nostrum nulla nisi qui autem beatae.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.50', '6', '2', '2468.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('13', 'quis', 'Sed tempore corrupti aut.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.67', '14', '3', '3200.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('14', 'aut', 'Excepturi omnis enim reiciendis culpa earum sapiente.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '1.00', '4', '1', '3324.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('15', 'minus', 'Officia laborum accusantium repellat blanditiis labore.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '3.00', '3', '1', '720.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('16', 'amet', 'Enim deleniti voluptatum in quo molestiae.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '2.00', '9', '2', '1357.00', '2019-05-10 08:34:50', '2019-06-13 08:52:10');
INSERT INTO `products` VALUES ('17', 'quae', 'Voluptates labore voluptatem temporibus nesciunt officiis rerum hic.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.25', '16', '5', '5865.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('18', 'aut', 'Numquam similique adipisci officiis quia amet est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '3.67', '6', '3', '3580.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('19', 'occaecati', 'Id temporibus laboriosam qui voluptas voluptate nisi.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '3.33', '13', '4', '1079.00', '2019-05-10 08:34:50', '2019-06-13 08:52:10');
INSERT INTO `products` VALUES ('20', 'et', 'Qui et ipsam delectus quia atque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '4.00', '11', '5', '4410.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('21', 'excepturi', 'Magnam ex nam numquam minus.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '3.50', '10', '2', '1879.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('22', 'quo', 'Qui aut animi voluptatem voluptatibus velit quibusdam voluptas voluptates.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '2.00', '3', '1', '5046.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('23', 'facere', 'Laborum qui perspiciatis voluptatem consequuntur est ipsa.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '3.00', '13', '4', '1575.00', '2019-05-10 08:34:50', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('24', 'pariatur', 'Consectetur alias suscipit rem eum non.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '5.00', '2', '1', '3036.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('25', 'accusantium', 'Fuga et saepe autem vitae sint dolor.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '4.00', '7', '2', '2359.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('26', 'rem', 'Commodi non omnis aspernatur est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.57', '23', '7', '3054.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('27', 'animi', 'Quisquam atque ullam molestiae itaque nihil.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '3.50', '17', '5', '1354.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('28', 'accusamus', 'Blanditiis ab eos ipsum quidem sit numquam soluta.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '2.50', '9', '3', '1469.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('29', 'fugiat', 'Possimus quidem aut error dolores facere neque aut.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '5.00', '8', '3', '2027.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('30', 'architecto', 'Quibusdam non soluta sit commodi facilis autem.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '4.00', '5', '1', '2224.00', '2019-05-10 08:34:51', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('31', 'tempora', 'Quo quae cupiditate dolorem quia.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.50', '4', '2', '6107.00', '2019-05-10 08:34:51', '2019-06-13 08:52:10');
INSERT INTO `products` VALUES ('32', 'repudiandae', 'Sint in quis fuga officiis libero hic.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.25', '20', '7', '28.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('33', 'aut', 'Adipisci aut consequatur cum dolor fugiat et distinctio.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '2.33', '17', '7', '4167.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('34', 'velit', 'Expedita qui cumque dolorem autem.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '5.00', '5', '1', '1660.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('35', 'dolorum', 'Veniam sunt necessitatibus officia sunt culpa quam.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '1.00', '4', '2', '2587.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('36', 'quod', 'Numquam est dolores repudiandae aliquam est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '4.50', '10', '3', '2149.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('37', 'temporibus', 'Eum expedita rerum delectus officia.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.00', '18', '6', '4095.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('38', 'autem', 'Ut consequatur sed quos.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '4.33', '17', '6', '766.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('39', 'pariatur', 'Reiciendis harum est totam et qui quas.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '1.00', '1', '1', '1895.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('40', 'dolor', 'Provident facere officia accusantium.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '3.75', '19', '6', '5348.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('41', 'repellat', 'Laborum et consequatur dolore ratione veniam ipsam maxime.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '4.00', '14', '4', '2499.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('42', 'libero', 'Quia molestiae excepturi iusto asperiores est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '3.00', '17', '6', '744.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('43', 'saepe', 'Minima animi est et omnis.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '1.00', '5', '2', '3160.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('44', 'similique', 'Mollitia ducimus eligendi expedita aut aut aliquam debitis.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.00', '6', '3', '1854.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('45', 'optio', 'Ipsum veritatis placeat quam exercitationem ea eaque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.50', '17', '5', '200.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('46', 'est', 'Cupiditate et odit occaecati quos ipsum.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '5.00', '2', '1', '4191.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('47', 'hic', 'Velit quaerat et quidem est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '2.33', '8', '3', '4365.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('48', 'velit', 'Fugiat optio cumque dolorem.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '5.00', '4', '3', '767.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('49', 'dolorem', 'Expedita quod sint cum dolore voluptatem.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '3.00', '7', '3', '344.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('50', 'modi', 'Quia quo beatae porro sed ea error.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '3.00', '16', '5', '2918.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('51', 'quia', 'Nisi est ut aut voluptas nesciunt doloremque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '4.00', '3', '1', '4945.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('52', 'aut', 'Sapiente est accusamus quos aut.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.75', '10', '5', '8911.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('53', 'nisi', 'In fugit officiis est a suscipit voluptate et.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '3.50', '9', '2', '3153.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('54', 'dolor', 'Iusto doloremque ea eveniet non dolor error.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.50', '16', '6', '877.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('55', 'dolor', 'Delectus placeat dolores iusto tenetur sunt perferendis.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.50', '25', '8', '2364.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('56', 'qui', 'Aut incidunt aut magni earum ad non.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '5.00', '12', '3', '1916.00', '2019-06-13 08:52:01', '2019-06-13 08:52:10');
INSERT INTO `products` VALUES ('57', 'amet', 'Sit dolores unde sit quo.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.67', '14', '4', '2478.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('58', 'libero', 'Praesentium minima laboriosam aliquid odit est.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.67', '10', '4', '862.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('59', 'quis', 'Qui necessitatibus nam aut nihil.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '5.00', '6', '2', '7007.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('60', 'nisi', 'Qui aut dolores quod est deserunt.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '2.50', '6', '3', '871.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');
INSERT INTO `products` VALUES ('61', 'enim', 'Cum sint consequuntur voluptatem voluptatem ducimus.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '1.00', '7', '3', '2561.00', '2019-06-13 08:52:01', '2019-06-13 08:52:11');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体地址',
  `zip` int(10) unsigned NOT NULL COMMENT '邮编',
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人电话',
  `last_used_at` datetime DEFAULT NULL COMMENT '最后一次使用时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '浙江省', '杭州市', '西湖区', '第45街道第659号', '16000', '苗海燕', '18269739375', '2019-05-15 10:08:39', '2019-05-07 10:28:29', '2019-05-15 10:08:39');
INSERT INTO `user_addresses` VALUES ('2', '1', '北京市', '市辖区', '东城区', '第61街道第912号', '215600', '乔琳', '13181739249', '2019-05-16 04:31:13', '2019-05-07 10:29:03', '2019-05-16 04:31:13');
INSERT INTO `user_addresses` VALUES ('3', '1', '广东省', '深圳市', '福田区', '第42街道第21号', '807500', '廉凯', '13937878575', '2019-06-13 08:16:46', '2019-05-07 10:29:03', '2019-06-13 08:16:46');
INSERT INTO `user_addresses` VALUES ('4', '1', '江苏省', '苏州市', '相城区', '第22街道第251号', '534600', '舒正诚', '17073704698', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('5', '1', '河北省', '石家庄市', '长安区', '第64街道第572号', '148200', '姚翼', '17653550339', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('6', '1', '江苏省', '苏州市', '相城区', '第71街道第970号', '361600', '柏浩', '13651554541', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('7', '2', '河北省', '石家庄市', '长安区', '第40街道第377号', '334700', '商芳', '17008518845', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('8', '3', '北京市', '市辖区', '东城区', '第40街道第291号', '163000', '潘文彬', '13505450597', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('9', '3', '江苏省', '苏州市', '相城区', '第51街道第747号', '304600', '邸秀芳', '17091612167', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('10', '3', '北京市', '市辖区', '东城区', '第1街道第231号', '218300', '程淑兰', '13563963444', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('11', '4', '江苏省', '苏州市', '相城区', '第68街道第715号', '678400', '曲建明', '15884094821', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('12', '4', '江苏省', '南京市', '浦口区', '第57街道第456号', '774200', '莫建国', '14536066298', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('13', '5', '北京市', '市辖区', '东城区', '第75街道第851号', '258600', '明馨予', '18075447246', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('14', '6', '江苏省', '南京市', '浦口区', '第0街道第415号', '254700', '宫婷', '18653395782', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('15', '6', '江苏省', '苏州市', '相城区', '第46街道第960号', '293200', '翟楼', '17077661375', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('16', '7', '江苏省', '南京市', '浦口区', '第28街道第244号', '426300', '曲峰', '13962003893', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('17', '8', '江苏省', '南京市', '浦口区', '第63街道第513号', '785600', '来捷', '17089390060', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('18', '8', '河北省', '石家庄市', '长安区', '第86街道第682号', '663600', '熊哲', '18682795832', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('19', '8', '北京市', '市辖区', '东城区', '第75街道第56号', '501600', '鲁勇', '15024759688', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('20', '9', '江苏省', '苏州市', '相城区', '第7街道第208号', '423400', '刘建平', '17003664243', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('21', '9', '广东省', '深圳市', '福田区', '第73街道第628号', '717100', '翁亮', '18317358094', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('22', '10', '江苏省', '苏州市', '相城区', '第7街道第185号', '702200', '符兵', '14561961321', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('23', '10', '江苏省', '苏州市', '相城区', '第37街道第330号', '25400', '苟秀华', '13534833622', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('24', '10', '广东省', '深圳市', '福田区', '第84街道第984号', '798800', '聂利', '15949666516', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('25', '11', '江苏省', '南京市', '浦口区', '第30街道第404号', '666000', '饶斌', '18726600089', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('26', '12', '河北省', '石家庄市', '长安区', '第65街道第165号', '403600', '时帆', '15071455179', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('27', '12', '北京市', '市辖区', '东城区', '第81街道第753号', '714500', '倪红霞', '17186265224', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('28', '13', '江苏省', '南京市', '浦口区', '第33街道第921号', '122000', '屠莹', '18789905870', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('29', '14', '广东省', '深圳市', '福田区', '第10街道第52号', '642300', '刁学明', '14596307496', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('30', '15', '河北省', '石家庄市', '长安区', '第91街道第51号', '473700', '邢雷', '14507935293', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('31', '16', '北京市', '市辖区', '东城区', '第93街道第180号', '162200', '袁涛', '13528903864', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('32', '17', '河北省', '石家庄市', '长安区', '第16街道第3号', '852700', '郑嘉', '13703994582', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('33', '18', '江苏省', '南京市', '浦口区', '第37街道第428号', '754900', '林洁', '18779213519', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('34', '18', '广东省', '深圳市', '福田区', '第0街道第661号', '781500', '朱伟', '18935453306', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('35', '19', '江苏省', '苏州市', '相城区', '第2街道第707号', '144700', '佟翼', '13558549383', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('36', '19', '北京市', '市辖区', '东城区', '第82街道第89号', '535500', '吴畅', '13853750463', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('37', '19', '北京市', '市辖区', '东城区', '第82街道第247号', '154900', '庞旭', '13029358776', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('38', '20', '北京市', '市辖区', '东城区', '第58街道第981号', '741900', '计秀英', '15526389679', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('39', '20', '江苏省', '苏州市', '相城区', '第87街道第520号', '458700', '汪毅', '17053155080', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('40', '21', '广东省', '深圳市', '福田区', '第38街道第368号', '851200', '练博涛', '18702060830', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('41', '21', '北京市', '市辖区', '东城区', '第30街道第288号', '736900', '全芬', '13253075373', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('42', '21', '北京市', '市辖区', '东城区', '第71街道第890号', '386700', '齐欣', '17710352304', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('43', '22', '北京市', '市辖区', '东城区', '第35街道第18号', '111900', '周静', '18492459163', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('44', '22', '江苏省', '苏州市', '相城区', '第81街道第545号', '471400', '谷龙', '13552585792', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('45', '23', '江苏省', '苏州市', '相城区', '第3街道第41号', '792100', '仲婷', '13351909160', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('46', '24', '江苏省', '苏州市', '相城区', '第9街道第113号', '228700', '邬珺', '15508668370', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('47', '24', '广东省', '深圳市', '福田区', '第59街道第995号', '381500', '关秀华', '13967483511', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('48', '24', '江苏省', '苏州市', '相城区', '第39街道第851号', '563600', '陶秀珍', '18832312976', null, '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `user_addresses` VALUES ('49', '25', '河北省', '石家庄市', '长安区', '第19街道第110号', '813800', '冀静', '14736738406', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('50', '25', '江苏省', '苏州市', '相城区', '第24街道第797号', '461200', '纪丽丽', '15233809850', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('51', '25', '河北省', '石家庄市', '长安区', '第62街道第320号', '644400', '成凤英', '18807536554', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('52', '26', '江苏省', '苏州市', '相城区', '第61街道第901号', '322600', '岑国庆', '13451367516', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('53', '26', '江苏省', '南京市', '浦口区', '第99街道第500号', '141200', '陈军', '17014254333', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('54', '27', '河北省', '石家庄市', '长安区', '第29街道第477号', '295700', '苏宁', '18305386583', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('55', '27', '北京市', '市辖区', '东城区', '第45街道第854号', '695000', '管建国', '17198821265', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('56', '28', '江苏省', '苏州市', '相城区', '第41街道第637号', '261900', '郭文', '15627605266', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('57', '28', '江苏省', '苏州市', '相城区', '第59街道第972号', '83900', '植红', '13293380463', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('58', '29', '广东省', '深圳市', '福田区', '第70街道第481号', '92400', '燕帆', '18977582250', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('59', '30', '广东省', '深圳市', '福田区', '第64街道第135号', '12500', '窦丽华', '17186207743', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('60', '30', '广东省', '深圳市', '福田区', '第63街道第567号', '198000', '庄敏静', '17094051898', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('61', '30', '河北省', '石家庄市', '长安区', '第29街道第25号', '742600', '张嘉', '15094365675', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('62', '31', '河北省', '石家庄市', '长安区', '第84街道第723号', '731400', '高志文', '13451133384', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('63', '32', '广东省', '深圳市', '福田区', '第56街道第6号', '741900', '郎爱华', '18530633273', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('64', '33', '北京市', '市辖区', '东城区', '第79街道第120号', '615800', '丁振国', '17081030892', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('65', '34', '河北省', '石家庄市', '长安区', '第21街道第486号', '638100', '郝欢', '13063138546', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('66', '35', '广东省', '深圳市', '福田区', '第6街道第673号', '84700', '佟敏', '17054751096', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('67', '35', '北京市', '市辖区', '东城区', '第72街道第787号', '251000', '谢瑞', '15318834064', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('68', '36', '江苏省', '南京市', '浦口区', '第93街道第680号', '463100', '刘捷', '17005157664', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('69', '37', '河北省', '石家庄市', '长安区', '第96街道第479号', '551400', '纪桂芝', '15778474769', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('70', '38', '河北省', '石家庄市', '长安区', '第27街道第596号', '422300', '邬正诚', '14708425104', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('71', '38', '江苏省', '南京市', '浦口区', '第53街道第570号', '458500', '盖雪梅', '18652763062', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('72', '38', '广东省', '深圳市', '福田区', '第47街道第804号', '724400', '台晧', '14744861255', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('73', '39', '北京市', '市辖区', '东城区', '第27街道第5号', '647400', '乐瑶', '17050970622', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('74', '40', '江苏省', '南京市', '浦口区', '第33街道第481号', '386700', '盖健', '15904128753', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('75', '40', '广东省', '深圳市', '福田区', '第81街道第281号', '753200', '欧阳佳', '13488412015', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('76', '41', '江苏省', '南京市', '浦口区', '第61街道第29号', '804900', '何燕', '17188220934', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('77', '42', '北京市', '市辖区', '东城区', '第70街道第845号', '644500', '周宁', '18766425424', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('78', '42', '江苏省', '南京市', '浦口区', '第14街道第67号', '828200', '廉利', '18849839106', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('79', '43', '北京市', '市辖区', '东城区', '第35街道第211号', '135400', '糜瑶', '17849659673', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('80', '43', '北京市', '市辖区', '东城区', '第84街道第360号', '614400', '牟桂香', '13379843101', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('81', '44', '北京市', '市辖区', '东城区', '第83街道第847号', '242800', '练利', '17626880585', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('82', '45', '江苏省', '南京市', '浦口区', '第97街道第451号', '277800', '柴丽华', '17791174995', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('83', '45', '北京市', '市辖区', '东城区', '第27街道第334号', '573400', '银亮', '15798093648', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('84', '45', '北京市', '市辖区', '东城区', '第90街道第688号', '221800', '吴军', '18921275965', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('85', '46', '江苏省', '南京市', '浦口区', '第46街道第733号', '724600', '符嘉', '13960653742', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('86', '47', '河北省', '石家庄市', '长安区', '第71街道第688号', '478700', '罗依琳', '18728275108', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('87', '47', '河北省', '石家庄市', '长安区', '第73街道第433号', '705500', '欧阳婕', '15145962655', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('88', '48', '江苏省', '南京市', '浦口区', '第61街道第617号', '248800', '连正豪', '18749321163', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('89', '48', '江苏省', '苏州市', '相城区', '第46街道第299号', '616600', '龚慧', '15028577228', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('90', '49', '河北省', '石家庄市', '长安区', '第17街道第211号', '208400', '颜文', '15631725392', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('91', '49', '广东省', '深圳市', '福田区', '第50街道第579号', '341900', '苑海燕', '17080807775', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('92', '50', '江苏省', '南京市', '浦口区', '第29街道第505号', '334200', '管瑞', '15100878630', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('93', '51', '江苏省', '苏州市', '相城区', '第33街道第833号', '584400', '卜畅', '17198488596', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('94', '51', '江苏省', '南京市', '浦口区', '第49街道第208号', '75800', '艾翼', '17737057875', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('95', '52', '北京市', '市辖区', '东城区', '第95街道第996号', '221900', '车文', '18688994462', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('96', '52', '江苏省', '南京市', '浦口区', '第38街道第329号', '723600', '芦宁', '18925433106', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('97', '52', '江苏省', '南京市', '浦口区', '第8街道第399号', '765300', '彭莹', '13003025612', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('98', '53', '广东省', '深圳市', '福田区', '第55街道第593号', '313500', '连刚', '17821768408', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('99', '53', '北京市', '市辖区', '东城区', '第39街道第856号', '524100', '杨正平', '14596419001', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('100', '54', '广东省', '深圳市', '福田区', '第84街道第593号', '607800', '党林', '17074518157', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('101', '54', '江苏省', '苏州市', '相城区', '第36街道第192号', '362200', '郑欢', '15253884290', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('102', '54', '江苏省', '南京市', '浦口区', '第49街道第570号', '604100', '谌斌', '15073022240', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('103', '55', '广东省', '深圳市', '福田区', '第45街道第423号', '428200', '栗冰冰', '13080370787', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('104', '56', '广东省', '深圳市', '福田区', '第41街道第225号', '436000', '田晨', '17088219232', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('105', '56', '河北省', '石家庄市', '长安区', '第0街道第463号', '393800', '艾文君', '17819675006', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('106', '56', '江苏省', '南京市', '浦口区', '第24街道第917号', '463300', '饶文君', '13516427777', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('107', '57', '河北省', '石家庄市', '长安区', '第17街道第911号', '543200', '祝正豪', '15003347139', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('108', '57', '河北省', '石家庄市', '长安区', '第81街道第260号', '246800', '莫燕', '17110350120', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('109', '58', '北京市', '市辖区', '东城区', '第36街道第936号', '621900', '谈淑兰', '18571660767', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('110', '59', '北京市', '市辖区', '东城区', '第15街道第620号', '624200', '葛文君', '15599627117', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('111', '59', '北京市', '市辖区', '东城区', '第81街道第78号', '143800', '王辉', '13036314591', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('112', '60', '北京市', '市辖区', '东城区', '第72街道第793号', '482500', '井琳', '15860455754', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('113', '60', '江苏省', '南京市', '浦口区', '第14街道第506号', '178200', '晏健', '13799432899', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('114', '60', '北京市', '市辖区', '东城区', '第17街道第390号', '803000', '曲桂花', '15148349597', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('115', '61', '广东省', '深圳市', '福田区', '第49街道第267号', '145200', '芦志强', '17002651827', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('116', '61', '北京市', '市辖区', '东城区', '第58街道第866号', '72700', '木怡', '17080732622', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('117', '62', '广东省', '深圳市', '福田区', '第59街道第538号', '56300', '祁宁', '13862472902', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('118', '62', '江苏省', '南京市', '浦口区', '第50街道第593号', '612000', '池淑华', '13908131154', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('119', '63', '广东省', '深圳市', '福田区', '第79街道第751号', '633200', '颜国庆', '18793550850', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('120', '63', '江苏省', '苏州市', '相城区', '第87街道第58号', '148800', '桑霞', '13286533995', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('121', '64', '北京市', '市辖区', '东城区', '第44街道第200号', '531100', '舒毅', '18322785487', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('122', '64', '广东省', '深圳市', '福田区', '第33街道第213号', '27000', '杨晶', '18013858800', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('123', '64', '北京市', '市辖区', '东城区', '第22街道第553号', '288600', '官秀芳', '18276163239', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('124', '65', '江苏省', '苏州市', '相城区', '第86街道第231号', '68600', '倪萍', '13488730110', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('125', '66', '北京市', '市辖区', '东城区', '第18街道第150号', '691900', '迟桂香', '17090106682', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('126', '66', '河北省', '石家庄市', '长安区', '第66街道第396号', '761600', '卞淑兰', '18727214229', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('127', '66', '广东省', '深圳市', '福田区', '第16街道第217号', '808800', '洪冰冰', '15586084165', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('128', '67', '江苏省', '南京市', '浦口区', '第99街道第352号', '674700', '何翼', '18495796102', null, '2019-06-13 08:52:00', '2019-06-13 08:52:00');
INSERT INTO `user_addresses` VALUES ('129', '68', '河北省', '石家庄市', '长安区', '第84街道第58号', '418300', '廖桂珍', '18102264143', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('130', '68', '广东省', '深圳市', '福田区', '第59街道第726号', '426100', '季勇', '18459966648', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('131', '68', '江苏省', '南京市', '浦口区', '第7街道第738号', '836900', '郎捷', '17899346815', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('132', '69', '北京市', '市辖区', '东城区', '第64街道第894号', '61800', '刘涛', '17072011425', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('133', '69', '江苏省', '苏州市', '相城区', '第98街道第885号', '734600', '乐建明', '15080666609', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('134', '69', '北京市', '市辖区', '东城区', '第73街道第486号', '162600', '乐秀珍', '17096965025', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('135', '70', '广东省', '深圳市', '福田区', '第32街道第251号', '247900', '糜帆', '18971626748', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('136', '70', '北京市', '市辖区', '东城区', '第4街道第188号', '743000', '孔学明', '18204767231', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('137', '71', '江苏省', '苏州市', '相城区', '第14街道第95号', '486700', '习亮', '17149554602', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('138', '71', '北京市', '市辖区', '东城区', '第23街道第987号', '215400', '庄宁', '15854780927', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('139', '71', '北京市', '市辖区', '东城区', '第81街道第965号', '183000', '丁春梅', '13804928934', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('140', '72', '江苏省', '南京市', '浦口区', '第50街道第55号', '183000', '戚志强', '15806718046', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('141', '72', '广东省', '深圳市', '福田区', '第34街道第484号', '811700', '冷志新', '17189777805', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('142', '72', '河北省', '石家庄市', '长安区', '第96街道第593号', '145700', '宁林', '15569192590', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('143', '73', '江苏省', '南京市', '浦口区', '第70街道第601号', '88400', '孟瑞', '15866548965', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('144', '74', '江苏省', '南京市', '浦口区', '第45街道第306号', '448300', '桑志强', '18409185740', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('145', '74', '北京市', '市辖区', '东城区', '第32街道第12号', '347400', '葛怡', '15130594240', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('146', '74', '北京市', '市辖区', '东城区', '第6街道第378号', '586900', '文小红', '17016849136', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('147', '75', '河北省', '石家庄市', '长安区', '第32街道第5号', '501300', '房颖', '17097160480', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('148', '75', '河北省', '石家庄市', '长安区', '第39街道第421号', '172300', '韩莉', '18040548505', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('149', '76', '河北省', '石家庄市', '长安区', '第79街道第425号', '446700', '黄春梅', '18613107149', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('150', '76', '江苏省', '南京市', '浦口区', '第44街道第930号', '797300', '僧嘉', '17183389261', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('151', '77', '河北省', '石家庄市', '长安区', '第1街道第245号', '446100', '邬翼', '15979560693', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('152', '77', '江苏省', '苏州市', '相城区', '第30街道第619号', '36700', '阎丹', '15091880627', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('153', '78', '北京市', '市辖区', '东城区', '第1街道第787号', '667300', '宗勇', '18378114580', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('154', '78', '广东省', '深圳市', '福田区', '第83街道第158号', '174800', '芦梅', '18237597794', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('155', '79', '河北省', '石家庄市', '长安区', '第71街道第276号', '311900', '单丽', '13636987396', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('156', '79', '河北省', '石家庄市', '长安区', '第74街道第203号', '597700', '董平', '15041094227', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('157', '79', '河北省', '石家庄市', '长安区', '第14街道第978号', '412400', '丁志强', '14571600934', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('158', '80', '江苏省', '苏州市', '相城区', '第1街道第795号', '501400', '周文', '13710767842', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('159', '80', '江苏省', '南京市', '浦口区', '第62街道第535号', '366900', '祝秀梅', '17175022305', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('160', '80', '北京市', '市辖区', '东城区', '第12街道第950号', '137400', '简浩', '17080979428', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('161', '81', '江苏省', '南京市', '浦口区', '第10街道第113号', '795000', '江旭', '14577237584', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('162', '81', '江苏省', '南京市', '浦口区', '第28街道第91号', '587400', '保斌', '13701472289', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('163', '81', '北京市', '市辖区', '东城区', '第48街道第900号', '86300', '巫洪', '15506552387', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('164', '82', '河北省', '石家庄市', '长安区', '第16街道第209号', '531500', '穆桂芝', '17076604878', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('165', '83', '北京市', '市辖区', '东城区', '第20街道第180号', '805600', '焦佳', '13055030648', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('166', '84', '广东省', '深圳市', '福田区', '第24街道第458号', '395800', '贺秀荣', '18489964088', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('167', '85', '江苏省', '苏州市', '相城区', '第59街道第649号', '712900', '姬娜', '18815508682', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('168', '85', '河北省', '石家庄市', '长安区', '第12街道第98号', '644600', '翟娟', '13876964599', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('169', '85', '河北省', '石家庄市', '长安区', '第57街道第507号', '171200', '贾淑珍', '17081879222', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('170', '86', '江苏省', '苏州市', '相城区', '第29街道第377号', '611800', '邱雷', '18545772721', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('171', '86', '广东省', '深圳市', '福田区', '第12街道第948号', '744400', '樊晨', '17097056815', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('172', '86', '河北省', '石家庄市', '长安区', '第88街道第33号', '364200', '聂杨', '13382919050', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('173', '87', '江苏省', '苏州市', '相城区', '第52街道第201号', '808000', '林玉华', '17055510144', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('174', '88', '江苏省', '南京市', '浦口区', '第67街道第121号', '225500', '阳学明', '18970534381', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('175', '88', '江苏省', '苏州市', '相城区', '第77街道第968号', '433500', '欧正诚', '15823259243', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('176', '88', '北京市', '市辖区', '东城区', '第88街道第712号', '362200', '温建明', '18062282251', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('177', '89', '江苏省', '苏州市', '相城区', '第85街道第426号', '67500', '卢鹏', '17630726235', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('178', '89', '河北省', '石家庄市', '长安区', '第25街道第18号', '835300', '黎文娟', '15867022992', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('179', '90', '江苏省', '南京市', '浦口区', '第2街道第261号', '217900', '文欢', '18599391644', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('180', '90', '广东省', '深圳市', '福田区', '第23街道第80号', '247600', '单斌', '17027080199', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('181', '90', '河北省', '石家庄市', '长安区', '第22街道第524号', '134400', '沿毅', '15518276540', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('182', '91', '江苏省', '苏州市', '相城区', '第18街道第769号', '856700', '古静', '18531375109', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('183', '91', '河北省', '石家庄市', '长安区', '第71街道第835号', '617200', '梅志勇', '17677251024', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('184', '91', '江苏省', '南京市', '浦口区', '第6街道第935号', '127800', '银凤英', '18643361077', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('185', '92', '江苏省', '南京市', '浦口区', '第45街道第806号', '351300', '詹志新', '18115699289', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('186', '93', '广东省', '深圳市', '福田区', '第7街道第546号', '547900', '章志勇', '13308451037', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('187', '93', '河北省', '石家庄市', '长安区', '第65街道第856号', '456600', '文洁', '17019300556', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('188', '93', '江苏省', '南京市', '浦口区', '第28街道第758号', '412500', '周兵', '13559004873', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('189', '94', '广东省', '深圳市', '福田区', '第97街道第881号', '646600', '池鹏程', '18584246226', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('190', '94', '江苏省', '南京市', '浦口区', '第22街道第700号', '317200', '瞿文娟', '15123021198', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('191', '94', '江苏省', '苏州市', '相城区', '第73街道第551号', '191000', '谌志强', '15274049239', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('192', '95', '北京市', '市辖区', '东城区', '第40街道第218号', '213000', '蒋秀兰', '15909265631', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('193', '95', '江苏省', '苏州市', '相城区', '第50街道第392号', '408500', '隋伦', '13077811131', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('194', '96', '河北省', '石家庄市', '长安区', '第75街道第745号', '664400', '边凯', '13058832180', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('195', '96', '江苏省', '南京市', '浦口区', '第85街道第52号', '708100', '牟珺', '17082143841', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('196', '97', '广东省', '深圳市', '福田区', '第33街道第522号', '192800', '辜文娟', '17641696655', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('197', '97', '江苏省', '南京市', '浦口区', '第73街道第964号', '141400', '邢波', '13235963900', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('198', '97', '江苏省', '南京市', '浦口区', '第59街道第110号', '276300', '康梅', '14574774026', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('199', '98', '广东省', '深圳市', '福田区', '第39街道第844号', '404000', '钟婕', '14755564444', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('200', '98', '江苏省', '苏州市', '相城区', '第70街道第355号', '775800', '植志诚', '17079497125', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('201', '99', '河北省', '石家庄市', '长安区', '第91街道第553号', '248800', '仲新华', '18984463470', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('202', '100', '广东省', '深圳市', '福田区', '第69街道第769号', '195000', '洪静', '15223878156', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('203', '100', '广东省', '深圳市', '福田区', '第47街道第202号', '664300', '植云', '18994286320', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('204', '101', '广东省', '深圳市', '福田区', '第44街道第113号', '56300', '邓正平', '14524080872', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');
INSERT INTO `user_addresses` VALUES ('205', '102', '江苏省', '苏州市', '相城区', '第15街道第844号', '481900', '花桂英', '14705664631', null, '2019-06-13 08:52:01', '2019-06-13 08:52:01');

-- ----------------------------
-- Table structure for user_favorite_products
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES ('2', '1', '1', '2019-05-13 03:14:07', '2019-05-13 03:14:07');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'leo', '1131920105@qq.com', '2019-05-07 07:53:59', '$2y$10$2tkExf10Zzers8/Yv7du/uGxrd07bfZNXkHelNPobp4pTK5HlW7qK', '1kFc4VL7VjGm5C26ltav6eEXLgWQrPsJLaAagNjCDUqK4IbOwTgkPTckAsYs', '2019-05-07 07:35:18', '2019-05-07 07:53:59');
INSERT INTO `users` VALUES ('2', 'shenhengxin', 'info@sosomedia.hk', '2019-05-07 07:55:56', '$2y$10$bmwA0FLq7fYZLILiJolqae6GzC3PIW1Qa38EdocfD6b8mO5g5EHXG', null, '2019-05-07 07:55:34', '2019-05-07 07:55:56');
INSERT INTO `users` VALUES ('3', '詹雷', 'ratione.qui@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IK2nXPsANr', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('4', '景金凤', 'et.ipsam@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'slQK6Igfyx', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('5', '嵺淑珍', 'dculpa@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MfNQAPhlOZ', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('6', '岑浩', 'cimpedit@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'piuZWbRzo2', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('7', '董正诚', 'et_beatae@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nn7yGw3los', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('8', '奚楠', 'qui_consequatur@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'z0ara9Yspc', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('9', '路玲', 'veritatis.explicabo@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kuSKCipGwX', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('10', '牛金凤', 'non78@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pKvZqAbi5T', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('11', '覃海燕', 'iure.temporibus@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'soIB9KxT4v', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('12', '宗冰冰', 'pariatur45@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uysZGI1Noe', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('13', '毕彬', 'ut.exercitationem@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'I5uKNCuJPa', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('14', '陆翔', 'alias.recusandae@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PGaZXB8mwg', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('15', '熊波', 'mqui@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '75PRl5q7G5', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('16', '巩楠', 'xbeatae@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZQWixnBDNi', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('17', '武文', 'voluptatem_perspiciatis@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TV8TkHomGc', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('18', '阳建国', 'rvoluptatum@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xCffNVJgDy', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('19', '柳岩', 'et.beatae@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fudqw44JYK', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('20', '郝桂兰', 'berror@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kNCvDlonp7', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('21', '周利', 'aut_vitae@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '52YOw9qPGp', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('22', '娄嘉', 'benim@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BsFRmUHIUF', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('23', '胡洁', 'est.veniam@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eq7mawPHv1', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('24', '钟淑英', 'quo_et@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ENb5CmAqEu', '2019-06-13 08:51:58', '2019-06-13 08:51:58');
INSERT INTO `users` VALUES ('25', '梁子安', 'sint84@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'b1KhRu5HJy', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('26', '甄毅', 'facere25@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VvVqoM86g1', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('27', '强华', 'quaerat_id@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'baes95Zb1S', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('28', '牛哲彦', 'aut45@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Oa98vg7pcO', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('29', '匡文君', 'iure26@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iyINf3uL4X', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('30', '王秀英', 'ducimus.sapiente@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8cmp8BspRx', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('31', '欧宁', 'facilis_voluptate@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FQNhBCQuEO', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('32', '孔鑫', 'dtempora@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hsM5TNNBnR', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('33', '鲍兰英', 'alias07@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IatQyc0n8w', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('34', '苗智渊', 'qui_rerum@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lp6Sym5LNa', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('35', '钱利', 'atque_recusandae@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'op4fo1gLBd', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('36', '辛欣', 'enim.et@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CLAEbenWpe', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('37', '余正平', 'deum@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wQqgLhtQWZ', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('38', '卜志明', 'modi.illum@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GCeM5sO2Jm', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('39', '吴玉珍', 'ex_et@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YaPequrWx7', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('40', '瞿利', 'lvoluptatibus@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LyOXwtuDNW', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('41', '栗飞', 'in.ut@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Gnro8w3DZj', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('42', '扬帆', 'voluptatem_rerum@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JnXGXeIhK9', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('43', '辜楼', 'ut68@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'F9lI5lG5r9', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('44', '耿玉兰', 'et_quas@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7o7TqBlbwT', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('45', '银璐', 'iste.et@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kbLBQIHm0W', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('46', '鲁志强', 'magni.quibusdam@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tfx8jVWJBd', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('47', '华智敏', 'sed.et@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eZbEeIuBlb', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('48', '郜红', 'ktotam@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bdqgYrQ7Gi', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('49', '彭洪', 'quasi.corporis@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LBR4B7QDoP', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('50', '殷桂荣', 'nmodi@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OkGsQTUpgb', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('51', '成岩', 'praesentium.ut@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fcOQZSsWAN', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('52', '盛冰冰', 'officiis60@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Os3VgKo250', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('53', '章瑜', 'zminima@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YFig7HB2zL', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('54', '冼建', 'lexcepturi@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NsPCowm6Yw', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('55', '郜全安', 'saepe09@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zhWDgAdaxI', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('56', '李学明', 'sunt25@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KKTPQ6BcHt', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('57', '党欢', 'doloremque40@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zR6IkGYJvm', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('58', '林丽娟', 'et_doloremque@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eepFO6jN9p', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('59', '罗春梅', 'inventore_excepturi@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EP7fAkWNLv', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('60', '常婷婷', 'et.earum@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'n9rmx4r9YW', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('61', '迟丽娟', 'ktempora@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Icibu6Fqee', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('62', '成芬', 'voluptatem_culpa@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NuSrkQ2Dfj', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('63', '虞丹', 'quia.quia@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PRbbDVl6wy', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('64', '古利', 'eius75@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '93dhVdeTrx', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('65', '阳晨', 'ut_fuga@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2YfFFvNo4r', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('66', '申志勇', 'repellat.et@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S3XPdICHpS', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('67', '李学明', 'placeat_rerum@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JaVPBLi2Uz', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('68', '欧玲', 'repellat_labore@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1t4x5Y7i4H', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('69', '苑玲', 'fugit.illo@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '34E45FuVDN', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('70', '霍磊', 'iusto_autem@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3Z44oPUO0W', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('71', '栗玉梅', 'maxime47@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KOyXiClSl4', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('72', '钟桂荣', 'ab_consequatur@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2bo8sKlqEz', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('73', '僧利', 'xnon@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BIijLa3FQf', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('74', '贺晨', 'bqui@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ps0ptxIdx3', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('75', '童正业', 'jconsequuntur@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k5KEBGAuAG', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('76', '房建军', 'perspiciatis_consequuntur@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wzxHcPhgfQ', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('77', '巫楠', 'impedit_sit@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VIN3295sZ4', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('78', '梅正豪', 'hsaepe@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rNiVCAnXdD', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('79', '巩勇', 'consequuntur_dolores@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CZHXjscEFz', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('80', '艾文', 'rut@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Co07Z8baj4', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('81', '和宁', 'xcorrupti@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vnXoVXODJD', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('82', '马平', 'eum35@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rFlmNiX1oZ', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('83', '畅昱然', 'erem@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wZS31kMts2', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('84', '司小红', 'aut63@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P0kO79uJbg', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('85', '傅正诚', 'accusantium_reprehenderit@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QHOzlK0kPq', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('86', '屈磊', 'nesciunt87@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h7gHxZpDuG', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('87', '蔡博涛', 'est.sint@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cgJBZCD1M8', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('88', '潘晨', 'bdistinctio@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ts6vuW4T26', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('89', '连志诚', 'uearum@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HhpEBYY73Y', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('90', '易桂珍', 'autem60@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bTn3aulJvJ', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('91', '练丹', 'tnumquam@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1zX5eVD78I', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('92', '戴凯', 'veniam.fugit@example.com', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c6WNCFGgCL', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('93', '曾玲', 'placeat.neque@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xGKPEPcNDE', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('94', '俞杰', 'eos24@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RK0fBYjvKw', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('95', '殷智渊', 'aut.dolorem@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CEIrYPkPZS', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('96', '林志新', 'yvoluptatibus@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0RUn3qCnb0', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('97', '柏玲', 'ex_facere@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'II5Elezv33', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('98', '柴欢', 'quia_deleniti@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ja1HZRMqZW', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('99', '谷凯', 'incidunt80@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'um0jlgjS3N', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('100', '洪建国', 'velit_sequi@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zHi1qd18jV', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('101', '关帅', 'mollitia.ut@example.org', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xsYq9yeyMF', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
INSERT INTO `users` VALUES ('102', '丁文', 'ex_esse@example.net', '2019-06-13 08:51:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '00JL1E1O0Q', '2019-06-13 08:51:59', '2019-06-13 08:51:59');
