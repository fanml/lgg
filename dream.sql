/*
Navicat MySQL Data Transfer

Source Server         : 39.107.95.152
Source Server Version : 50716
Source Host           : 39.107.95.152:3306
Source Database       : dream

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-06-04 21:17:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for injury
-- ----------------------------
DROP TABLE IF EXISTS `injury`;
CREATE TABLE `injury` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_parts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of injury
-- ----------------------------
INSERT INTO `injury` VALUES ('1', '头');
INSERT INTO `injury` VALUES ('2', '脖子');
INSERT INTO `injury` VALUES ('3', '肋骨');
INSERT INTO `injury` VALUES ('4', '肚子');
INSERT INTO `injury` VALUES ('5', '左大臂');
INSERT INTO `injury` VALUES ('6', '左小臂');
INSERT INTO `injury` VALUES ('7', '左手腕');
INSERT INTO `injury` VALUES ('8', '左手指');
INSERT INTO `injury` VALUES ('9', '右大臂');
INSERT INTO `injury` VALUES ('10', '右小臂');
INSERT INTO `injury` VALUES ('11', '右手腕');
INSERT INTO `injury` VALUES ('12', '右手指');
INSERT INTO `injury` VALUES ('13', '左大腿');
INSERT INTO `injury` VALUES ('14', '左膝盖');
INSERT INTO `injury` VALUES ('15', '左小腿');
INSERT INTO `injury` VALUES ('16', '左脚踝');
INSERT INTO `injury` VALUES ('17', '左脚');
INSERT INTO `injury` VALUES ('18', '右大腿');
INSERT INTO `injury` VALUES ('19', '右膝盖');
INSERT INTO `injury` VALUES ('20', '右小腿');
INSERT INTO `injury` VALUES ('21', '右脚踝');
INSERT INTO `injury` VALUES ('22', '右脚');
INSERT INTO `injury` VALUES ('23', '无');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `time` varchar(255) DEFAULT NULL COMMENT '操作时间',
  `object` varchar(255) DEFAULT NULL COMMENT '操作对象',
  `log_detaile` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `ip` varchar(255) DEFAULT NULL,
  `is_delete` int(10) unsigned zerofill DEFAULT '0000000001' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('51', 'ssll', '登陆', '2018/05/16 09:14:21', 'All', 'ssll在2018/05/16 09:14:21登陆系统', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('52', 'ssll', '查看', '2018/05/16 09:14:21', 'All', 'ssll在2018/05/16 09:14:21查看所有球队的GIS页面', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('53', 'ssll', '查看', '2018/05/16 09:14:29', '勇士队', 'ssll于2018/05/16 09:14:29查看勇士队当前赛季的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('54', 'ssll', '查看', '2018/05/16 09:14:40', '杜兰特', 'ssll在2018/05/16 09:14:40查看杜兰特的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('55', 'ssll', '查看', '2018/05/16 09:14:44', '杜兰特', 'ssll在2018/05/16 09:14:44查看杜兰特的综合评分', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('56', 'ssll', '查看', '2018/05/16 09:14:58', '勇士队', 'ssll在2018/05/16 09:14:58查看勇士队的发展历史', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('57', 'ssll', '查看', '2018/05/16 09:15:04', '勇士队', 'ssll于2018/05/16 09:15:04查看勇士队当前赛季的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('58', 'ssll', '查看', '2018/05/16 09:15:06', '勇士队', 'ssll于2018/05/16 09:15:06查看勇士队当前赛季的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('59', 'ssll', '查看', '2018/05/16 09:15:11', '勇士队', 'ssll在2018/05/16 09:15:11查看勇士队在2017-8-1至2018-8-1期间的赛程', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('60', ' ', '查看', '2018/05/16 09:19:48', '勇士队', ' 于2018/05/16 09:19:48查看勇士队当前赛季的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('61', ' ', '查看', '2018/05/16 09:19:50', '库里', ' 在2018/05/16 09:19:50查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('62', ' ', '查看', '2018/05/16 09:19:54', '库里', ' 在2018/05/16 09:19:54查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('63', ' ', '查看', '2018/05/16 09:19:55', '库里', ' 在2018/05/16 09:19:55查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('64', ' ', '查看', '2018/05/16 09:19:58', '库里', ' 在2018/05/16 09:19:58查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('65', ' ', '查看', '2018/05/16 09:20:04', '库里', ' 在2018/05/16 09:20:04查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000000');
INSERT INTO `log` VALUES ('66', 'ssll', '登陆', '2018/06/04 05:09:03', 'All', 'ssll在2018/06/04 05:09:03登陆系统', '0:0:0:0:0:0:0:1', '0000000001');
INSERT INTO `log` VALUES ('67', 'ssll', '查看', '2018/06/04 05:09:04', 'All', 'ssll在2018/06/04 05:09:04查看所有球队的GIS页面', '0:0:0:0:0:0:0:1', '0000000001');
INSERT INTO `log` VALUES ('68', 'ssll', '查看', '2018/06/04 05:09:11', '勇士队', 'ssll于2018/06/04 05:09:11查看勇士队当前赛季的详细信息', '0:0:0:0:0:0:0:1', '0000000001');
INSERT INTO `log` VALUES ('69', 'ssll', '查看', '2018/06/04 05:11:14', '库里', 'ssll在2018/06/04 05:11:14查看库里的详细信息', '0:0:0:0:0:0:0:1', '0000000001');

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `english_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL COMMENT '国籍',
  `experience` int(10) DEFAULT NULL COMMENT '进入NBA的年限',
  `player_img` varchar(50) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('1', '库里', 'stephen_curry', '后卫', '1.92', '86.2', '美国', '8', '1');
INSERT INTO `player` VALUES ('2', '汤姆森', 'klay_thompson', '后卫', '2.01', '97.5', '美国', '6', '2');
INSERT INTO `player` VALUES ('3', '杜兰特', 'kevin_durant', '前锋', '2.16', '108.9', '美国', '10', '3');
INSERT INTO `player` VALUES ('4', '格林', 'draymond_green', '前锋', '2.01', '104.3', '美国', '5', '4');
INSERT INTO `player` VALUES ('5', '麦基', 'javale_mcgee', '中锋', '2.13', '122.5', '美国', '9', '5');

-- ----------------------------
-- Table structure for player_season_detail
-- ----------------------------
DROP TABLE IF EXISTS `player_season_detail`;
CREATE TABLE `player_season_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `player_id` int(10) DEFAULT NULL COMMENT '对应play主键',
  `account` int(10) DEFAULT NULL COMMENT '赛季场均得分',
  `salary` decimal(8,2) DEFAULT NULL COMMENT '薪资',
  `team_id` int(10) DEFAULT NULL COMMENT '效力球队',
  `injury` varchar(255) DEFAULT NULL COMMENT '伤病情况',
  `img` varchar(255) DEFAULT NULL COMMENT '全身图片',
  `season` varchar(255) DEFAULT NULL COMMENT '赛季',
  `time` double DEFAULT NULL COMMENT '场均上场时间',
  `fire` double DEFAULT NULL COMMENT '场均出手',
  `block_shot` double DEFAULT NULL COMMENT '场均盖帽',
  `hit_rate` double DEFAULT NULL COMMENT '命中率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_season_detail
-- ----------------------------
INSERT INTO `player_season_detail` VALUES ('1', '1', '30', '4000.00', '1', '15,16', 'curryWarriors', '2016-2017', '30.5', '24.5', '0.2', '48.5');
INSERT INTO `player_season_detail` VALUES ('2', '1', '31', '5000.00', '1', '16', 'curryWarriors', '2017-2018', '31.5', '26.5', '0.15', '46.5');
INSERT INTO `player_season_detail` VALUES ('3', '3', '28', '2800.00', '1', '16', 'KevinDurantWarriors', '2016-2017', '32.5', '21', '2', '49');
INSERT INTO `player_season_detail` VALUES ('4', '3', '35', '3000.00', '23', '5,15,16', 'KevinDurantThunder', '2015-2016', '35', '22', '1.5', '50.2');
INSERT INTO `player_season_detail` VALUES ('5', '3', '31', '2600.00', '23', '23', 'KevinDurantThunder', '2014-2015', '41.25', '26', '1.8', '42.5');
INSERT INTO `player_season_detail` VALUES ('6', '3', '28', '2000.00', '23', '5', 'KevinDurantThunder', '2013-2014', '38.5', '24.5', '0.9', '46.2');
INSERT INTO `player_season_detail` VALUES ('7', '3', '26', '1800.00', '1', '1', 'KevinDurantWarriors', '2017-2018', '30.6', '20.5', '2.1', '44.4');

-- ----------------------------
-- Table structure for player_set
-- ----------------------------
DROP TABLE IF EXISTS `player_set`;
CREATE TABLE `player_set` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) DEFAULT NULL COMMENT '球员id集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_set
-- ----------------------------
INSERT INTO `player_set` VALUES ('1', '1,2,4,5,6');
INSERT INTO `player_set` VALUES ('2', '1,2,3,4,6,7,8');
INSERT INTO `player_set` VALUES ('3', '1,2,3,4,5');
INSERT INTO `player_set` VALUES ('4', '1,2,3,4,5');

-- ----------------------------
-- Table structure for player_user_review
-- ----------------------------
DROP TABLE IF EXISTS `player_user_review`;
CREATE TABLE `player_user_review` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `player_id` int(10) DEFAULT NULL COMMENT '对应player表的ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `grade` int(10) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_user_review
-- ----------------------------
INSERT INTO `player_user_review` VALUES ('1', '3', 'ssll', '1');
INSERT INTO `player_user_review` VALUES ('2', '4', null, '3');
INSERT INTO `player_user_review` VALUES ('3', '3', 'ssll', '3');
INSERT INTO `player_user_review` VALUES ('4', '3', null, '3');
INSERT INTO `player_user_review` VALUES ('5', '3', null, '1');
INSERT INTO `player_user_review` VALUES ('6', '2', 'ssll', '3');
INSERT INTO `player_user_review` VALUES ('7', '4', 'ssll', '3');
INSERT INTO `player_user_review` VALUES ('8', '2', 'ssll', '3');
INSERT INTO `player_user_review` VALUES ('9', '4', 'ssll', '1');
INSERT INTO `player_user_review` VALUES ('10', '1', 'ssll', '4');
INSERT INTO `player_user_review` VALUES ('11', '3', 'qqqqqq', '3');
INSERT INTO `player_user_review` VALUES ('12', '3', 'ssll', '4');
INSERT INTO `player_user_review` VALUES ('13', '3', 'ssll', '4');
INSERT INTO `player_user_review` VALUES ('14', '1', 'ssll', '3');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_team_id` int(10) DEFAULT NULL,
  `guest_team_id` int(10) DEFAULT NULL,
  `fixture` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1', '4', '1', '2018-03-16');
INSERT INTO `schedule` VALUES ('2', '3', '1', '2018-03-15');
INSERT INTO `schedule` VALUES ('3', '2', '1', '2018-03-14');

-- ----------------------------
-- Table structure for season_set
-- ----------------------------
DROP TABLE IF EXISTS `season_set`;
CREATE TABLE `season_set` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `season` varchar(50) DEFAULT NULL COMMENT '赛季2016-2017',
  `player_set_id` int(10) DEFAULT NULL COMMENT '球员集id',
  `champion` int(10) DEFAULT NULL COMMENT '是否是冠军',
  `description` varchar(255) DEFAULT NULL COMMENT '描述球队当前赛季',
  `season_set_id` int(10) DEFAULT NULL COMMENT '对应detail表中的ID',
  `wins` int(10) DEFAULT NULL COMMENT '球队本赛季胜场',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of season_set
-- ----------------------------
INSERT INTO `season_set` VALUES ('1', '2014-2015', '1', '1', '对战骑士4-1', '1', '60');
INSERT INTO `season_set` VALUES ('2', '2016-2017', '2', '1', '对战骑士4-3', '2', '73');
INSERT INTO `season_set` VALUES ('3', '2017-2018', '3', '1', '正在进行', '3', '64');
INSERT INTO `season_set` VALUES ('4', '2018-2019', '4', '1', '未开始', '4', '62');

-- ----------------------------
-- Table structure for secret_answer
-- ----------------------------
DROP TABLE IF EXISTS `secret_answer`;
CREATE TABLE `secret_answer` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `question_id` int(50) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`answer`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secret_answer
-- ----------------------------
INSERT INTO `secret_answer` VALUES ('1', 'fml', '2', '樊明亮啊');
INSERT INTO `secret_answer` VALUES ('2', 'xxxx', '2', 'fml');
INSERT INTO `secret_answer` VALUES ('3', 'xxxx', '2', '90kg');
INSERT INTO `secret_answer` VALUES ('4', 'xxxx', '2', 'no');
INSERT INTO `secret_answer` VALUES ('5', 'lll', '1', '');
INSERT INTO `secret_answer` VALUES ('6', 'lll', '1', '');
INSERT INTO `secret_answer` VALUES ('7', 'lll', '1', '');
INSERT INTO `secret_answer` VALUES ('8', 'ttt', '1', '儿子');
INSERT INTO `secret_answer` VALUES ('9', 'ttt', '2', 'fml');
INSERT INTO `secret_answer` VALUES ('10', 'ttt', '4', 'yes');
INSERT INTO `secret_answer` VALUES ('11', 'qqq', '1', '1');
INSERT INTO `secret_answer` VALUES ('12', 'qqq', '2', '2');
INSERT INTO `secret_answer` VALUES ('13', 'qqq', '3', '3');
INSERT INTO `secret_answer` VALUES ('14', 'ssll', '1', '儿子');
INSERT INTO `secret_answer` VALUES ('15', 'ssll', '2', '我');
INSERT INTO `secret_answer` VALUES ('16', 'ssll', '4', '臭');
INSERT INTO `secret_answer` VALUES ('17', 'ailin', '1', '大儿子');
INSERT INTO `secret_answer` VALUES ('18', 'ailin', '3', '98kg');
INSERT INTO `secret_answer` VALUES ('19', 'ailin', '4', '愁人');
INSERT INTO `secret_answer` VALUES ('20', 'qqqqqq', '2', '儿子');
INSERT INTO `secret_answer` VALUES ('21', 'qqqqqq', '1', '98kg');
INSERT INTO `secret_answer` VALUES ('22', 'qqqqqq', '5', '愁人');

-- ----------------------------
-- Table structure for secret_question
-- ----------------------------
DROP TABLE IF EXISTS `secret_question`;
CREATE TABLE `secret_question` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secret_question
-- ----------------------------
INSERT INTO `secret_question` VALUES ('1', '朱明宇是谁？');
INSERT INTO `secret_question` VALUES ('2', '朱明宇的爸爸是谁？');
INSERT INTO `secret_question` VALUES ('3', '朱明宇体重是多少？');
INSERT INTO `secret_question` VALUES ('4', '朱明宇脚臭么？');
INSERT INTO `secret_question` VALUES ('5', '朱明宇那脚是脚么？');
INSERT INTO `secret_question` VALUES ('6', '朱明宇为什么总扣脚呢？');

-- ----------------------------
-- Table structure for spider_img
-- ----------------------------
DROP TABLE IF EXISTS `spider_img`;
CREATE TABLE `spider_img` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `src` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spider_img
-- ----------------------------
INSERT INTO `spider_img` VALUES ('1', 'http://n.sinaimg.cn/www/index/12377app.png');
INSERT INTO `spider_img` VALUES ('2', 'http://n.sinaimg.cn/index/mid_article/images/ask.png');
INSERT INTO `spider_img` VALUES ('3', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228100818.jpg');
INSERT INTO `spider_img` VALUES ('4', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228100851.jpg');
INSERT INTO `spider_img` VALUES ('5', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228114704.png');
INSERT INTO `spider_img` VALUES ('6', 'http://www.sinaimg.cn/home/2018/0226/U996P30DT20180226104742.png');
INSERT INTO `spider_img` VALUES ('7', 'http://src.leju.com/imp/imp/deal/3e/a3/2/969e727a5389463d10bfd989d25_p24_mk24.jpg');
INSERT INTO `spider_img` VALUES ('8', 'http://i13.esfimg.com/imp/588258abdc8002937498975d221a67c5_osb2d811.jpg');
INSERT INTO `spider_img` VALUES ('9', 'http://src.house.sina.com.cn/imp/imp/deal/52/66/f/7b1153291a0f28f74c3f7463474_p24_mk24.jpg');
INSERT INTO `spider_img` VALUES ('10', 'http://n.sinaimg.cn/www/index/12377app.png');
INSERT INTO `spider_img` VALUES ('11', 'http://n.sinaimg.cn/index/mid_article/images/ask.png');
INSERT INTO `spider_img` VALUES ('12', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228100818.jpg');
INSERT INTO `spider_img` VALUES ('13', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228100851.jpg');
INSERT INTO `spider_img` VALUES ('14', 'http://www.sinaimg.cn/home/2018/0228/U996P30DT20180228114704.png');
INSERT INTO `spider_img` VALUES ('15', 'http://www.sinaimg.cn/home/2018/0226/U996P30DT20180226104742.png');
INSERT INTO `spider_img` VALUES ('16', 'http://src.leju.com/imp/imp/deal/92/2e/9/bd07ff487d40ad475f3e8738bfb_p24_mk24.jpg');
INSERT INTO `spider_img` VALUES ('17', 'http://i16.esfimg.com/imp/58c7a4b09ec00122ad5c29d17983719a_os0b4094.jpg');
INSERT INTO `spider_img` VALUES ('18', 'http://src.house.sina.com.cn/imp/imp/deal/32/aa/e/036473f8477c8dca26ee11f089c_p24_mk24.jpg');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `city_lng` double DEFAULT NULL,
  `city_lat` double DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `english_name` varchar(50) DEFAULT NULL,
  `detail_id` int(50) DEFAULT NULL COMMENT '对应teamDetailInformation',
  `city_information` varchar(300) DEFAULT NULL,
  `is_deleted` int(10) DEFAULT '0' COMMENT '默认为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '勇士队', '金州', '-117.47409', '33.41221', 'Warriors', 'Warriors', '1', '1946年费城筹建NBA球队，老板套用了一支老队的名字命名新队，1925年ABL费城篮球队曾起名“勇士”。1962年球队西迁后，球队改名为旧金山勇士，之后又再次更名为金州勇士，意味着这是一支代表全加州的球队。1971年该队搬到奥克兰。', '0');
INSERT INTO `team` VALUES ('2', '火箭队', '休斯顿', '-95.3698', '29.76042', 'Rockets', 'Rockets', '2', '火箭原先在圣地亚哥，1967年圣地亚哥火箭成了NBA的第12个成员。鉴于圣地亚哥地区航空事业日益发达，最终球迷投票决定，以“火箭”为名。1971年球队搬到休斯敦后，这个名字神奇般地依旧适用，显示出其超强的预见性，因为全美最著名的宇航中心就在休斯敦。', '0');
INSERT INTO `team` VALUES ('3', '湖人队', '洛杉矶', '-118.24368', '34.05223', 'L.A. Lakers', 'L.A. Lakers', '3', '原名明尼阿波利斯湖人，1947-1948赛季，明尼阿波利斯湖人是全美篮球联赛(NBL)的成员，之后该队又转入美国篮球协会(ABA)，也就是NBA的前身。“湖人”一词来源于明尼阿波利斯地区的一句俗话，称那是一片“拥有万湖的土地”。1960年该队搬入洛杉矶，更名洛杉矶湖人，尽管洛杉矶没有多少湖水，但球队名称依旧。', '0');
INSERT INTO `team` VALUES ('4', '快船队', '洛杉矶', '-118.23378', '34.04233', 'L.A. Clippers', 'L.A. Clippers', '4', '1978年布法罗勇敢者搬至圣地亚哥。7年前，NBA城市之一圣地亚哥流失了一支球队：火箭搬到了休斯敦。但圣地亚哥并不喜欢“勇敢者”这个名称，结果“快船”取而代之。新的队名源于圣地亚哥地区风景如画，尤其以海湾地区的游船著称。', '0');
INSERT INTO `team` VALUES ('5', '太阳队', '菲尼克斯', '-112.07403', '33.44837', 'Suns', 'Suns', '5', '1968年，28000多名球迷参加了给球队起名的活动。俱乐部希望球队名字，能够突出阿利桑那终年太阳普照的景象。最终塞林达提出的“太阳”，以其意义明确、表达直接而当选。', '0');
INSERT INTO `team` VALUES ('6', '马刺队', '圣安东尼奥', '-98.49362', '29.42412', 'Spurs', 'Spurs', '6', '1976年加盟NBA。球队最初成立在达拉斯，名为查巴拉斯。三年后，当这支球队搬迁到圣安东尼奥之后，俱乐部希望改名，“马刺”蕴涵着浓郁的美国西部风味，最终当选。', '0');
INSERT INTO `team` VALUES ('7', '热火队', '迈阿密', '-80.19179', '25.76167', 'Heat', 'Heat', '7', '1988年迈阿密成为NBA城市之一。俱乐部总经理布福曼称“热浪”最形象，因为一提到迈阿密，第一感觉就是扑面而来的热浪。', '0');
INSERT INTO `team` VALUES ('8', '骑士队', '克里夫兰', '-81.69436', '41.49932', 'Cavaliers', 'Cavaliers', '8', '1970年克里夫兰新成立了一支篮球队，在报纸上举行的起名有奖活动中，杰里·托姆科的“骑士”成为了获胜者。他在解释自己的灵感时称：“骑士代表的是一群勇敢无畏的人，不管最终命运如何，他们从不屈服投降。”', '0');
INSERT INTO `team` VALUES ('9', '猛龙队', '多伦多', '-79.38318', '43.65322', 'Raptors', 'Raptors', '9', '在NBA球队中，猛龙是一支相对年轻的球队。上世纪90年代，恐龙的形象被许多年轻人所接受。俱乐部在让球迷投票选择队名时，“猛龙”一下就赢得了年轻球迷的心。1994年5月15日，俱乐部宣布球队的名字为“猛龙”。', '0');
INSERT INTO `team` VALUES ('10', '奇才队', '华盛顿', '-77.03687', '38.90719', 'Wizards', 'Wizards', '10', '1946年，一支名叫“子弹”的篮球队在巴尔的摩建立。1996年俱乐部老板波林决定改掉这个带有暴力倾向的队名，最终决定启用“奇才”，它象征着无穷的能量、超强的威力，这也是波林对球队寄予的希望，希望那是一支拥有智慧和魔力的球队。', '0');
INSERT INTO `team` VALUES ('11', '步行者队', '印第安纳', '-86.1349', '40.26719', 'Pacers', 'Pacers', '11', '最初该队隶属于ABA联赛，一群投资者给球队起了这个名字。印第安纳律师里查德·廷克汉姆称，取这个名字主要因为印第安纳拥有全球最著名的赛车比赛地。步行者1976年加盟NBA，名字继续沿用。', '0');
INSERT INTO `team` VALUES ('12', '凯尔特人队', '波士顿', '-71.05888', '42.36008', 'Celtics', 'Celtics', '12', '球队创建于1946年。老板沃特·布朗创立了波士顿花园地区大公司，并亲自命名了球队的名称。布朗一眼就挑中了“凯尔特人”，理由是1914至1939年纽约就有出名的篮球队，就叫凯尔特土著人队。', '0');
INSERT INTO `team` VALUES ('13', '雄鹿队', '密尔沃基', '-87.90647', '43.0389', 'Bucks', 'Bucks', '13', '1968年，“雄鹿”成为了这支NBA新球队的名称。想出这个名称的球迷，获得大奖：一辆漂亮的跑车。威斯康辛州，土生土长的雄鹿时常出没。', '0');
INSERT INTO `team` VALUES ('14', '黄蜂队', '夏洛特', '-80.84312', '35.227', 'Hornets', 'Hornets', '14', '山猫是NBA新军，可能是因为山猫这种动物生命力非常顽强,而且爪子非常尖锐,象征着虽然是新军但拥有山猫一样的爪子,别人也不敢小瞧他们。后改名黄蜂', '0');
INSERT INTO `team` VALUES ('15', '76人队', '费城', '-75.16522', '39.95258', '76ers', '76ers', '15', '1949年入NBA。1963年更换了新老板之后，搬迁至费城。球队名字也改为76人，这是为了纪念1776年7月4日在费城独立厅里起草的《独立宣言》。', '0');
INSERT INTO `team` VALUES ('16', '魔术队', '奥兰多', '-81.37923', '28.53833', 'Magic', 'Magic', '16', '上世纪八十年代末，佛罗里达奥兰多为球队征集名字时，大多数球迷偏爱魔术和果汁这两个名字。1989年球队最终被命名为魔术，之所以使用这个名字是因为奥兰多是旅游胜地，当地人认为来到奥兰多就是来到梦幻之地。', '0');
INSERT INTO `team` VALUES ('17', '活塞队', '底特律', '-83.04575', '42.33142', 'Pistons', 'Pistons', '17', '最初这是一支位于风特威纳地区、属于NBL(美国篮球联赛)的球队。1957年球队搬至底特律，底特律在美国有汽车之都的美称，因此“活塞”两字依旧适用，但地名及活塞厂老板的名字，就消失了。', '0');
INSERT INTO `team` VALUES ('18', '尼克斯队', '纽约', '-74.00597', '40.71277', 'Knicks', 'Knicks', '18', '尼克斯旧货商是指当初那些流落纽约的荷兰人。漫长的几十年过去了，这个古老的名字保留了下来，只不过“尼克斯旧货商”缩短为“尼克斯”。', '0');
INSERT INTO `team` VALUES ('19', '老鹰队', '亚特兰大', '-84.38798', '33.74899', 'Hawks', 'Hawks', '19', '1946年，NBL联赛着手在沿密西西比河畔三座城市莫里纳、岩石岛、达文波特区域内，建造一支篮球队。', '0');
INSERT INTO `team` VALUES ('20', '公牛队', '芝加哥', '-87.62979', '41.87811', 'Bulls', 'Bulls', '20', '1966年公牛加盟NBA后，由俱乐部第一任老板迪克·克雷亲自定下此名。克雷说：“公牛不屈不饶、临危不惧，在篮球场上，还有什么比这种精神更宝贵？！”于是公牛成为了球队的名称，并一用就是半世纪。', '0');
INSERT INTO `team` VALUES ('21', '篮网队', '布鲁克林', '-73.94415', '40.67817', 'Nets', 'Nets', '21', '1967年ABA联赛中有一支球队叫新泽西美国人队，第二年，球队移到该州的科马克，改名纽约网队。篮网原本就是篮球赛中不可缺少的一部分。1976年网队加盟NBA，比赛地点有了更改，但名字不变。', '0');
INSERT INTO `team` VALUES ('22', '开拓者队', '波特兰', '-122.67648', '45.52306', 'Trail Blazers', 'Trail Blazers', '22', '1970年，波特兰篮球队以“开拓者”命名。俱乐部开创者格里克曼认为，这个名称既反映了美国西北部、太平洋海岸蜿蜒曲折的地形特征，同时也标志着该州首支职业球队的成立。', '0');
INSERT INTO `team` VALUES ('23', '雷霆队', '俄克拉荷马', '-97.09287', '35.00775', 'Thunder', 'Thunder', '23', '2008年9月3日早晨，随着俄克拉荷马的原超音速队召开新闻发布会，宣布了自己的新队名——雷霆。NBA最新的一支球队终于诞生，也代表着超音速告一段落。', '0');
INSERT INTO `team` VALUES ('24', '鹈鹕队', '新奥尔良', '-90.07153', '29.95106', 'Pelicans', 'Pelicans', '24', '在该队加盟NBA之前，篮球队原名为“夏洛特精神”。但北卡人一直不太接受这个名字。1988年俱乐部在球迷中间征集队名，最终“黄蜂”当选。这个名称还要追溯到革命战争时期，当时英国一个名叫查尔斯·康瓦利斯的将军，在其写给英国皇室的战争前线报告中写道：这里战争惨烈，宛如“一群蜜蜂在蜂窝里争斗”。后改名喂鹈鹕', '0');
INSERT INTO `team` VALUES ('25', '爵士队', '犹他', '-111.09373', '39.32098', 'Jazz', 'Jazz', '25', '1974年，NBA总部批准新奥尔良市筹建新球队。1979年该队迁至盐湖城，但他们依旧保留了原名。', '0');
INSERT INTO `team` VALUES ('26', '国王队', '萨克拉门托', '-121.49439', '38.58157', 'Kings', 'Kings', '26', '球队初建于1945年，当时是美国篮球联赛(NBL)一员。球队原名“罗切斯特皇家队”。1957年球队搬迁至辛辛纳提，1972年，为避免与堪萨斯的一支棒球队重名，改名为堪萨斯国王队。1985年球队搬到萨格拉门托后，保留了“国王”这个名称。', '0');
INSERT INTO `team` VALUES ('27', '森林狼队', '明尼苏达', '-94.68589', '46.72955', 'Timberwolves', 'Timberwolves', '27', '1989年森林狼加盟NBA，一场取名竞赛在球迷间展开，在“森林狼”和“北极光”两大热门中，俱乐部选中了前者。除了阿拉斯加，明尼苏达是全美唯一一个还有狼群出没的地方。最主要的，还从没有职业球队用过这个名称。', '0');
INSERT INTO `team` VALUES ('28', '独行侠队', '达拉斯', '-96.79698', '32.77666', 'Mavericks', 'Mavericks', '28', '这个名字同样诞生于球迷的起名有奖活动。1980年在达拉斯WBAP电台，经过一番较量，俱乐部执行委员会最终决定启用“小牛”，因为它与德州牛仔形象最为符合。后更名为独行侠', '0');
INSERT INTO `team` VALUES ('29', '掘金队', '丹佛', '-104.99025', '39.73923', 'Nuggets', 'Nuggets', '29', '1967年当球队还是ABA联赛成员时，球队名为丹佛火箭。同年，NBA里诞生了一支圣地亚哥火箭队(也就是如今的休斯敦火箭)。', '0');
INSERT INTO `team` VALUES ('30', '灰熊队', '孟菲斯', '-90.04898', '35.14953', 'Grizzlies', 'Grizzlies', '30', '灰熊队于1995年诞生，当时作为NBA海外扩张计划的一部分，主场设在加拿大的温哥华市，并以加拿大西部非常有代表性的动物“大灰熊”给球队命名，象征着篮球的力量。2001年，灰熊队迁回美国田纳西州孟菲斯市，更名为孟菲斯灰熊队。', '0');

-- ----------------------------
-- Table structure for team_detail_information
-- ----------------------------
DROP TABLE IF EXISTS `team_detail_information`;
CREATE TABLE `team_detail_information` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `boss_id` int(50) DEFAULT NULL COMMENT '老板ID',
  `trainer_id` int(50) DEFAULT NULL COMMENT '教练ID',
  `season_set_id` int(50) DEFAULT NULL COMMENT '赛季ID',
  `partition` varchar(10) DEFAULT NULL COMMENT '分区W/E',
  `is_deleted` int(10) DEFAULT NULL COMMENT '0/1',
  `detail_id` int(10) DEFAULT NULL COMMENT '描述id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_detail_information
-- ----------------------------
INSERT INTO `team_detail_information` VALUES ('1', '1', '1', '1', 'W', '0', '1');
INSERT INTO `team_detail_information` VALUES ('2', '1', '2', '2', 'W', '0', '1');
INSERT INTO `team_detail_information` VALUES ('6', '1', '2', '3', 'W', '0', '1');
INSERT INTO `team_detail_information` VALUES ('7', '1', '2', '4', 'W', '0', '1');

-- ----------------------------
-- Table structure for team_history
-- ----------------------------
DROP TABLE IF EXISTS `team_history`;
CREATE TABLE `team_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `history_detail` text COMMENT '球队历史描述',
  `interval` varchar(255) DEFAULT NULL COMMENT '历史区间',
  `team_id` int(10) DEFAULT NULL COMMENT '球队ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_history
-- ----------------------------
INSERT INTO `team_history` VALUES ('8', '   1949-50赛季， 勇士队加入NBA的首个赛季。在BAA的竞争对手NBL解散之后，6支幸存下来的球队加入了BAA，组成了有17支球队的新联盟NBA。一些BAA的球队并不愿和诸如希博伊根（Sheboygan），三城（Tri-Cities），安德森（Anderson）和滑铁卢（Waterloo）等毫无名气的球队组成联盟，结果就导致了这个赛季的赛程和季后赛体系的混乱。\r\n在这个赛季，随着队中主力福尔克斯的场均得分降至14.2分，勇士队的成绩也跌到26胜42负，落后分区榜首锡拉丘兹27场之多。萨多斯基在赛季进行了17场比赛后被交换到巴尔的摩。韦恩·加德纳挑起了人心涣散的勇士队，场均贡献13.5分。\r\n1950-51赛季，勇士成绩反弹以40胜26负的成绩成为东区冠军。随着乔·福尔克斯找回火力（场均18.7分）和保罗·阿里金每场9.8篮板的稳定贡献，以及安迪·菲利普联盟最佳的场均6.3助攻，勇士队最终在分区中领先于波士顿凯尔特人队。但勇士队杀进了季后赛后，被锡拉丘兹民族队3-0击败。\r\n    1951-52赛季，勇士队的战绩排在联盟第四位，而锡拉丘兹民族队排在第一。在季后赛中，勇士在首轮被锡拉丘兹民族队击败。队中保罗·阿里金为勇士队每场献上25.4分，超过乔治·麦肯成为联盟的得分王。安迪·菲利普在赛季末被选进NBA最佳第二阵容。', '1949年至1952年', '1');
INSERT INTO `team_history` VALUES ('9', '    1946-47赛季，来自肯塔基大学，身高6尺5的乔·福尔克斯以23.2分的场均得分摘取了的得分王头衔，比联盟的二号得分手鲍勃·费里克（Bob Feerick）多出了6.4分之多（当时的比赛得分都很低，作为冠军勇士全队的场均得分也只有68.6分）。\r\n    1947-48赛季勇士赢得东区冠军，常规战绩27-21，但在总决赛中输给了巴尔的摩子弹队。福尔克斯以22.1的场均得分再次领衔联盟，但得分王的头衔（以总得分算）却归于芝加哥的马克斯·扎斯洛夫斯基（1007分，场均21.0分）。费城的另一个突出人物是霍威·达拉末，场均得12.2分（全队第二）和2.5助攻（联盟第一）。\r\n    1948-49赛季，福尔克斯依然纵横联盟，场均砍下26.0分，包括在对阵印第安纳波利斯时单场拿下63分。然而，由于赛季前有4支国家篮球联盟（NBL）的球队跳槽到了BAA，一些新的天才球员也由此登陆了——包括乔治·迈肯，这位明尼阿波利斯湖人的能源之塔暴风般地杀进了BAA并以1698的总得分（场均28.3分）掠走了当年的得分王头衔。勇士的埃德·萨多斯基，以15.3分的场均得分排在联盟的第5位。尽管拥有两名顶尖射手，费城勇士的常规战绩仍只有28胜32负，并在季后赛首轮中败给了华盛顿国会队。', '1946年至1949年', '1');
INSERT INTO `team_history` VALUES ('10', ' 1952-53赛季，勇士队的常规赛成绩跌到联盟底部——12胜57负，落后第1名34个半胜场之多。但队中依旧存在亮点之处：尼尔·约翰斯顿以场均22.3分的得分在联盟中排名第1。福尔克斯和丹尼尔·芬恩也各自有场均11.9分。\r\n1952-53赛季，是勇士队三年沦落的第一年。在垫底联盟之后，勇士队在1953-54赛季并无多少起色，在东区排名第4，以29胜43负被拒于季后赛门外。尼尔·约翰斯顿仍以24.4分再夺联盟得分王。而勇士队的老板们制定了两条职业篮球的规则：24秒进攻限制和球队犯规罚球。这些改变使得比赛犯规减少，节奏更快，从而也更富有激情。\r\n    1954-55赛季，勇士队在常规赛中继续在东区排名第4，落后NBA冠军球队锡拉丘兹民族队10个胜场。勇士队在根本上就是一支两人球队，尼尔·约翰斯顿（1631分，场均22.7分）和保罗·阿里津（1512分，场均21.0）分列联盟得分榜第1、2名。\r\n    1955-56赛季，球队的命运开始急剧转变。埃迪·戈特里布将教练一职让与前球队后卫乔治·塞内斯基。随着联盟的平均得分迅速飙至99分每场，勇士队快速反弹，以12胜4负开局并最终在东区排名第一。在季后赛中勇士也所向披靡，夺下了球队的第2个总冠军 [8]  。勇士队在1955-56赛季NBA决赛中以4-1击败韦恩堡活塞队。队中的保罗·阿里金（场均24.2分）和尼尔·约翰斯顿（场均22.1分）各自在得分榜上排名第2和第3。治（Jack George）代表勇士参加了1956年的全明星赛。', '1952年至1956年', '1');
INSERT INTO `team_history` VALUES ('12', '1956-57赛季，勇士队将王冠拱手相让与波士顿凯尔特人，那个赛季在波士顿凯尔特人队有一个全面的天才球员名叫比尔·拉塞尔。1957-58赛季，勇士队的战绩在东区排名第三并在半决赛中以3-0击败锡拉丘兹民族队，但在分区决赛中，勇士队4-1再次输给了凯尔特人。\r\n    1958-59赛季，勇士队无法保持1956-57赛季的战绩，以32胜40负结束赛季。但队中保罗·阿里金仍以场均26.4分排在联盟得分榜的第2位。新加盟的威尔特·张伯伦在这个赛季取得场均37.6分和27.0篮板，在赛季末被选为年度最佳新秀并荣获MVP。\r\n    1959-60赛季，威尔特·张伯伦和保罗·阿里金，汤姆·戈拉以及盖伊·罗杰斯一起，带领勇士拿到49胜26负的成绩，在东区位于凯尔特人之后名列第二。勇士在季后赛中击败锡拉丘兹，但在东区决赛中以4-2不敌凯尔特人。\r\n1960-61赛季，威尔特·张伯伦再次成为联盟的得分王（场均38.4分），另外还摘下了联盟最高的27.2个篮板。尽管张伯伦极其辉煌，勇士队以11场的弱势不敌敌凯尔特人成为联盟常规赛第二名。在季后赛中，勇士队在东区半决赛中被锡拉丘兹民族队横扫出局。', '1956年至1961年', '1');
INSERT INTO `team_history` VALUES ('13', '1961-62赛季，威尔特·张伯伦创下NBA纪录的场均50.4分并掠下25.7个篮板。在1962年1月，还创下了8天内有3场比赛得62分的纪录。在宾夕法尼亚的赫尔谢对阵纽约时，张伯伦写下了联盟史上唯一一场的单人得分100纪录，63投36中并在罚球线上32罚28中1961-62赛季，张伯伦还创造总得分（4029分）超过总上场时间（3882分钟）的纪录。在这个赛季，勇士队依然无法扳倒凯尔特人，以落后11场结束赛季（连续3个赛季落后凯尔特人至少10个胜场）。勇士队在东区半决赛中击败锡拉丘兹民族队，但在东区决赛中3-4惜败给波士顿凯尔特人队，无缘总决赛。\r\n    1961-62赛季，勇士队将自己的主场驻地迁往美国西部。1962-63赛季，勇士队以Cow Palace作为主场，以鲍勃·费里克作为教练。队中的张伯伦仍是内线怪物，场均有44.8分和24.3篮板进帐并连续四个赛季在这两项主要技术统计上统率联盟。然而，球队竟然无法达到5成的胜率并被挡在了西部的季后赛门外。\r\n    1963-64赛季，球队在亚历克斯·汉纳的执教下，和张伯伦、汤姆·梅歇里、韦恩·海塔沃、盖伊·罗杰斯，艾尔·阿特尔斯、加里·菲利普斯和内特·瑟蒙德等人的带领下，以48胜32负的成绩排在西区第一。张伯伦以36.9分连续第五个赛季夺下联盟得分王。在季后赛中，勇士在7场制胜的系列赛中力压圣路易斯鹰取得西部冠军，但在总决赛中再次不敌凯尔特人，无缘联盟总冠军。\r\n1964-65赛季，勇士在3年之内的第二个低谷。1962-63赛季，球队的胜率只有38.8%，1963-64赛季，勇士队却杀进了总决赛；1964-65赛季，勇士队的战绩居然只有17胜63负，落后第1名32个胜场之多在联盟中垫底。', '1961年至1965年', '1');
INSERT INTO `team_history` VALUES ('14', '伯伦被交换至费城76人队，换回了康尼·迪尔金、保罗·纽曼、李·沙费尔以及一些现金。勇士队的内特·瑟蒙德的场均篮板排在了联盟的第3位（18.1个）；盖伊·罗杰斯则以7.2个助攻排在联盟第2位。勇士队在新秀里克·巴里的帮助下，以35胜45负的成绩排在分区第4，落后分区榜首湖人10个胜场。巴里在联盟得分榜上得名第4（25.7分），罚球命中率第2（86.2%），以及篮板第10（10.6个）。\r\n    1966-67赛季，勇士队继续攀升，以44胜37负的成绩排在西部第1。里克·巴里成长为联盟中的得分王（35.6分），霸占了张伯伦连续坐了7个赛季的宝座。然而张伯伦却带领费城76人队在1966-67赛季总决赛中击败勇士队，而勇士队再次与总冠军擦身而过。但是里克·巴里除了得分王的头衔之外，还获得1967年全明星赛MVP，在那次全明星赛中得到了38分；以及入选NBA第一阵容。\r\n    1967-68赛季，里克·巴里离开勇士队去ABA联盟打球。勇士队在球衣上印着“城市”（The City）字样，并在前面印上金门大桥的图案。虽然没有巴里的得分，但鲁迪·拉鲁索（21.8分），内特·瑟蒙德（20.5分），杰夫·穆林斯（18.9分），以及弗雷德·海策尔（19.0分）组成了令对手头疼的四人组，帮助勇士填补了失去巴里的空白。勇士获得43胜39负的成绩，排名西区第3。在西区的半决赛中，勇士队以4-2淘汰圣路易斯鹰队。但在决赛中被洛杉矶湖人队直落4场横扫出局。\r\n    1968-69赛季，勇士队取得41胜41负的成绩并进入了季后赛。内特·瑟蒙德以每场19.7个篮板排在联盟第2，并进入了NBA防守第一阵容。在季后赛中，球队在分区半决赛中以2-4再次输给湖人队。\r\n    1969-70赛季，球队最终只取得30胜52负的成绩，排在西区第6。杰夫·穆林斯以22.1分排在联盟第12位。球队头号篮板手和防守家的内特·瑟蒙德缺席39场比赛，但场均能得到21.9分。\r\n    1970-71赛季，在NBA重新分区后，勇士队被分至太平洋赛区，以41胜41负的成绩排在分区第2名。勇士队在新的西部半决赛中遭遇了密尔沃基雄鹿队，结果被5场淘汰出局。该赛季，杰夫·穆林斯场均得到20.8分，内特·瑟蒙德每场也有20.0分入帐并再次进入NBA防守第一队。', '1965年至1971年', '1');
INSERT INTO `team_history` VALUES ('15', '1971-72赛季，球队陷入麻烦之中，其入座率和球队收益很低，因此球队离开港口城市旧金山来到了奥克兰。为了吸引更多的球迷，球队改名为金州勇士队，甚至还在圣迭哥打了几场球。1971-72赛季，拉塞尔和穆林斯（21.5分）以及瑟蒙德（21.4分）并列为勇士的三大得分手。得分三人组用足够的分数把勇士队带到51胜31负，但这个成绩依然落后湖人队18场之多。在季后赛中，勇士队在西部半决赛以4-1输给密尔沃基雄鹿队。\r\n    1972-73赛季，里克·巴里根据法院的裁决回到了勇士队。回归后给勇士带来强大的先发阵容：巴里、穆林斯、瑟蒙德、拉塞尔以及场均得分11.8分的后卫，来自俄勒冈的吉姆·巴内特。在这个赛季，勇士队取得47胜35负的战绩，排名太平洋区第二。在季后赛中，勇士队击败连续第3年碰到雄鹿队，但西部决赛中1-4不敌洛杉矶湖人队。\r\n    1973-74赛季，球队取得44-38的战绩无缘季后赛，但队中的巴里入选了NBA第一阵容，他在得分上（25.1分）排名联盟第5，罚球命中率（89.9%）排第2，抢断（2.11）排第5，助攻（6.1）排第8。\r\n    1974-75赛季，勇士拆散重组，引入了全新的比赛风格。转变的结果震惊整个联盟，勇士队以48-34的成绩成为太平洋区的冠军，在该赛季的总决赛中横扫华盛顿子弹队赢得了总冠军 [8]  。队中的巴里场均献上30.6分（联盟第2），同时还在罚球命中率上领衔联盟（90.4%），6.2场均助攻也排到了联盟第6的位置。威尔克斯也有场均14.2分和8.2篮板的贡献，成为了该赛季的NBA最佳新秀。', '1971年至1975年', '1');
INSERT INTO `team_history` VALUES ('16', '\r\n    1975-76赛季，勇士队获得联盟常规赛的最佳战绩：59胜23负，并在西部半决赛中以4-2摧毁底特律活塞队。但在西部决赛中输给凤凰城太阳队。在这个赛季，球队中巴里再次入选NBA第1阵容，成为联盟最好的罚球手（92.3%），并在助攻方面以6.1个排名第5。威尔克斯场均17.8分，而令人激动的新秀古斯·威廉姆斯（Gus Williams）也有11.7分的进帐。\r\n    1976-77赛季，ABA被NBA吞并，给NBA联盟带来新的球队和球星。而勇士队却在该赛季缺兵少将，无力争夺冠军。勇士队在1976年的选秀中以第8顺位选中中锋罗伯特·帕里什。里克·巴里，菲尔·史密斯，贾马尔·威尔克斯和古斯·威廉姆斯在进攻上提供火力，而帕里什和克利福德·雷而组成内线防守铁墙。勇士以46胜36负的成绩落后湖人和开拓者，排名太平洋区第3。季后赛，勇士在3场2胜的首轮轻取底特律活塞，但在半决赛中，和湖人战满7场后遗憾落败出局。\r\n    1977-78赛季，勇士队中开始分崩离析，贾马尔·威尔克斯成为自由球员并加盟湖人队，古斯·威廉姆斯以同样的方式加入西雅图。同时勇士队签下了获得NBA防守二队的老兵E·C·科尔曼，最终勇士队以43胜39负的成绩结束赛季，连续7个赛季胜率超过50%，但勇士队在实力强劲的太平洋区中垫底，并以一个胜场之差失去季后赛资格。赛季结束后，里克·巴里以自由人的身份和休斯敦火箭队签约，成为两年来第3个离开勇士的头号得分手。\r\n    1978-79赛季，勇士队再没充足的火力来克服失利。菲尔·史密斯场均得到19.9分，罗伯特·帕里什继续有进步，为勇士队场均添上17.2分和12.1个篮板。罗伯特·帕里什在该赛季还创下破队史纪录的217个盖帽。约翰·卢卡斯，一位从火箭交换得来的火爆控卫，以场均9.3助攻排在联盟第2。三年级生卢卡斯、帕里什、新秀帕维斯·肖特和韦恩·库珀使得勇士成为联盟中最年轻的队伍，平均年龄24.3岁，球龄2.3年。年轻以及缺乏经验，使得勇士队的胜率跌破50.0%，38胜44负的成绩再次在太平洋区垫底。\r\n    1978-79赛季，拉开了勇士队接下来8年中7次胜率低于50%的序幕。勇士队在1979-80赛季崩溃，最终只取得了24胜58负的成绩，并列联盟倒数第2。约翰·卢卡斯以场均7.5助攻排在联盟第5，罗伯特·帕里什以10.9篮板排在第7。跟腱受伤的菲尔·史密斯缺席了31场比赛，甚至教练艾尔·阿特尔斯也在训练中也同样拉伤了跟腱并错失了最后21场比赛。而且勇士队在8场加时赛中竟然无一斩获，创下NBA的最衰纪录。', '1975年至1979年', '1');
INSERT INTO `team_history` VALUES ('17', '1980-81赛季，勇士队的成绩提高到39胜43负，但仍以一场之差错失季后赛。但并非所有的改变都能使得事情更好。在一场使球队在整个80年代都陷入困境之中的交易中，勇士把帕里什和1980年的首轮秀交给了波士顿，换回了他们的状元签和第13位签。勇士用这个头号签选中了乔·巴里·卡罗尔。这位7尺的中锋在接下来的6个赛季里场均得分从未低于17.0分（包括1982-83赛季的24.1分），然而帕里什却在凯尔特人拿下了三连冠，和拉里伯德，凯文麦克海尔等一起组成NBA历史上最好的锋线之一。勇士队还用菲尔·史密斯从圣迭哥得到了沃尔德·弗里以及一个未来选秀，又用韦恩·库珀从犹他得到伯纳德·金。金在1979-80赛季因伤缺席大多数比赛，该赛季他场均得到21.9分并获得了首个NBA年度最佳复出奖。\r\n    1981-82赛季，和1980-81赛季有一个相似的结局。球队提高6个胜场，45胜37负的成绩排名太平洋区第4，但还是以一场之差未能进入季后赛。伯纳德·金（23.2分）和弗里（22.9分）分别排在联盟的第8和第9位，这也是勇士自1960-61赛季张伯伦和保罗·阿里津以来，首次有两人得分排进联盟前10。 [11] \r\n', '1980年至1982年', '1');
INSERT INTO `team_history` VALUES ('18', '1982-83赛季，伯纳德·金抛下伤兵满营的勇士队，跳槽到纽约尼克斯队。这个赛季，勇士队的球员们因伤因病总共缺席了238场次，创下当时NBA的最高纪录。该赛季总共有多达19名的球员披过勇士球衣。球队磕磕撞撞地得到了30胜52负的成绩，排名太平洋区第5，落后湖人队28个胜场。贡献最多的是乔·巴里·卡罗尔，这是他职业生涯的最好一年（24.1得分，联盟第7）。帕维斯·肖特也有21.4分的进帐，连续4个赛季得分超过20\r\n    1983-84赛季，约翰·巴赫接管了勇士队担任主教练，同时58岁的他也成为当时NBA历史上最老的新教练。巴赫的到来结束了艾尔·阿特尔斯在勇士长达14年的统治。后者取得了557胜518负的总成绩，并带领球队在1975年获得NBA的总冠军，这也是勇士迁到西部湾区之后唯一的一个总冠军。\r\n    1983-84赛季，勇士队取得了37胜45负的成绩，在区内排名第5并落在季后赛之外。帕维斯·肖特，乔·巴里·卡罗尔和埃里克·弗洛伊德成为了球队的头几号得分手。\r\n    1984-85赛季，队中的乔·巴里·卡罗尔没有和勇士队签下合同，而选择去意大利打球。勇士队在压制对手命中率（53.6%）和得分（117.7分）方面均在联盟垫底，并以22胜60负的成绩和印第安纳步行者队并列联盟最差战绩。卡罗尔走后，拉里·史密斯一人承担了抢篮板的重任，以10.9的场均篮板排在联盟第6。\r\n1985-86赛季，勇士队的成绩有所提升，但仍以30胜52负的成绩在太平洋区垫底。而乔·巴里·卡罗尔从欧洲赶回来，场均献上21.2分；而1984-85赛季得来的特里·蒂格尔，场均也有14.2分的进帐。帕维斯·肖特再次以25.5分领先全队，而潜力巨大的新秀克里斯·穆林出赛55场，每场也有14.0分的收入，并在罚球命中率上以.896排名联盟第2。\r\n', '1982年至1986年', '1');
INSERT INTO `team_history` VALUES ('19', '\r\n    1986-87赛季，在1986年5月23日，吉姆·菲茨杰拉德和丹·芬南一起从弗兰克林·缪利手中买下勇士队，随即任命乔治·卡尔为主教练。在这个赛季，球队取得42胜40负的成绩并进入季后赛。在季后赛首轮，勇士落后犹他爵士队两场，随后直下三场翻盘，成为自1956年以来首支在5场3胜的比赛中落后两场翻盘的球队，但在西区半决赛中不敌洛杉矶湖人队。球队有一些不错的个人表现：乔·巴里·卡罗尔，平均每场21.2分；埃里克·弗洛伊德，以10.3助攻排名联盟第2。拉里·史密斯继续统治篮板，以11.5个排名第7。\r\n    1987-88赛季，球队从密尔沃基雄鹿队挖来唐·尼尔森当球队经理。尼尔森上任后立即进行了该赛季的最大交易，把卡罗尔和弗洛伊德送到休斯敦火箭队并换回了拉尔夫·桑普森和史蒂夫·哈里斯。但在这个赛季勇士队遭到伤病的重大袭击，球员缺席场次达到204场，球队先后使用了21个球员。在1988年3月23日，主帅卡尔辞职，由助理教练埃德·格雷高里顶替剩下的赛季。球队最终只有20胜62负的成绩。\r\n    1988-89赛季，勇士队取得43胜39负的成绩，比1987-88赛季有了23场的进步。勇士队在季后赛首轮中横扫犹他爵士队后，但在西部半决赛中5场负于凤凰城太阳队。\r\n    1989-90赛季，勇士队中满是跑轰手，球队以116.3的场均得分领衔联盟，并在罚球命中率上创下了球队纪录（80.9%），同时也创下NBA最少的的前场篮板纪录（11.2）。虽然球队仅有37胜45负的成绩，但球队的打球风格非常具有欣赏性，因此勇士队也创下球队有史以来最高的入座率，41个主场球票全部卖光。球队的前5名得分手：穆林、里奇蒙德、蒂格尔、新秀蒂姆·哈达威以及萨鲁纳斯·马休利奥尼斯全部都在6尺7或以下。穆林以25.1的得分领衔球队，在联盟中得分排名第7，命中率第11，罚球命中率第8。', '1986年至1990年', '1');
INSERT INTO `team_history` VALUES ('20', '1990-91赛季，哈达威、里奇蒙德、穆林组成了“跑轰TMC”（Run TMC）三人组，平均每场砍下了72.5分，并带领勇士拿到了9年来最好的成绩44胜38负。穆林得分排名联盟第8（25.7分），里奇蒙德第10（23.9），哈达威第11（22.9），球队的场均得分也是23年来的最高（116.6分）。勇士队在季后赛首轮中3-1的总分让中西区冠军圣安东尼奥马刺队尝到苦果。但在西部半决赛中以1-4不敌湖人队。\r\n    1991-92赛季，勇士队把TMC组合拆散，虽然这使得球队的爆发力少一些，于是主帅尼尔森把里奇蒙德和莱斯·杰普森送到萨克拉门托国王队并换回了新秀比利·欧文斯和一个1995年的次轮秀。尽管送走备受球迷喜爱的里奇蒙德，这次交换仍然带来更好的结果。勇士队在这个赛季的得分领衔联盟（118.7分），55胜27负的战绩列在太平洋区第2。但在季后赛首轮中0-4不敌西雅图超音速队。而勇士队的主帅尼尔森则当选该赛季的NBA最佳教练。\r\n    1992-93赛季，勇士队被伤病所困扰，球队总共有14名球员因伤病缺席了总共312场比赛。队中四个主要的火枪手：穆林，哈达威，马休利奥尼斯，以及欧文斯——同时上场打球的时间只有2分37秒。最终勇士队只得到34胜48负的成绩并无缘季后赛。\r\n    1993-94赛季，勇士队失去蒂姆·哈达威和萨鲁纳斯·马休利奥尼斯，而克里斯·穆林在这个赛季也缺席前20场比赛。但主帅唐·尼尔森还能把球队带到50胜，比1992-93赛季多16场。球队中新加盟的克里斯·韦伯成为NBA历史上首位得到1000分，500篮板，250助攻，150盖帽和75抢断的新秀。以场均17.5分，9.1篮板的表现成为当年的NBA最佳新秀。拉特里尔·斯普雷维尔的上场时间排名联盟第1，场均21.0分。他首次在全明星赛中亮相并入选了NBA第1阵容。但该赛季勇士依然遭受伤病困扰，并在季后赛首轮中被菲尼克斯太阳队横扫。', '1990年', '1');
INSERT INTO `team_history` VALUES ('21', '1994-95赛季，勇士队以26胜56负结束赛季，场均让对手得到111.1分在联盟垫底，同时也以18.3分钟就一次失误排在联盟榜首。1995年2月，唐·尼尔森因球队成绩不理想而辞职，由助理教练鲍勃·兰尼尔顶替上任。但该赛季令人高兴的是克里斯·加特林的命中率达到0.633，排名联盟第1。在这个赛季，勇士队的伤病依旧未能改善。总共有15名球员缺席325场比赛，这两项数据都创下了NBA之最。\r\n1995-96赛季，在年轻球员拉特雷尔·斯普雷维尔和新秀乔·史密斯的帮助下，勇士队获得了多10场的胜场。但球队仍只有36胜46负的成绩，第3次无法进入季后赛。\r\n1996-97赛季，勇士队因为奥克兰球馆全面翻新而把主场移到圣何塞，在这个临时主场艰难地拿到30胜52负的成绩。这个赛季是克里斯·穆林在勇士的最后一个赛季，这位前梦一队的成员是勇士队历史出场最多的球员。赛季在圣何塞结束后，主教练里克·阿德尔曼被辞退，他在勇士队的两个赛季里总成绩是66胜98负。代替里克·阿德尔曼的是PJ·卡莱西莫。\r\n在1989年选秀会上，勇士队选中蒂姆·哈达威，其与克里斯·穆林、米奇·里奇蒙德成为勇士队新的基石，组成名震一时的TMC三巨头，然而在竞争强度极高的联盟中，勇士队始终只能是季后赛的陪衬球队。在1997-98赛季，勇士队还搬进新的场馆，球队更换了新的教练、队服和队标。', '1994年至1998年', '1');
INSERT INTO `team_history` VALUES ('22', '\r\n     1999年至2006年，勇士队的变动不断，直到2006-07赛季，唐·尼尔森率领的金州勇士队依靠跑轰战术，在常规赛最后时刻爆发，搭上了季后赛的末班车。在季后赛首轮对阵常规赛全联盟第一的达拉斯小牛队时，勇士队利用拜伦·戴维斯、艾尔·哈林顿和杰森·理查德森的劲爆体能球员的进攻火力，以2-4的总分把小牛队淘汰出局。这一役让小牛队成为NBA史上胜率最高却在季后赛第一轮出局的球队，而勇士队则成为NBA历史上第三支第八种子球队晋级第二轮比赛，亦是于2003年NBA首轮改为七场四胜制后首支以第八种子击败第一种子的球队，创造了第三个“黑八奇迹”。\r\n    2010-11赛季开始前，唐·尼尔森向球队提交了辞呈，辞去了球队主教练的职位，然后基斯·斯马特接替了唐·尼尔森的位置。\r\n    2012-13赛季，2013年3月19日，勇士队在比赛中以93-72战胜黄蜂队，这是勇士队史上首次做到在连续两场客场比赛中都至少赢下对手20分 [13]  。2013年4月6日，勇士队对阵太阳队的比赛中以109-107取胜，标志着两队这个赛季前三次交手，勇士队都取得胜利。自1976-77赛季以来，勇士队从没在常规赛中横扫过太阳，通过这场比赛终于完成任务 [14]  。\r\n    2014-15赛季，在2014年12月17日勇士负灰熊的比赛中，勇士队（21-3）长达16场的连胜结束。克雷·汤普森拿下了22分，斯蒂芬·库里三分球10投仅1中，得19分、7个篮板和6次助攻 [15]  。\r\n最终勇士队在这个赛季以67胜15败排名西部联盟第一，拿下西部联盟第一种子。在季后赛中，先后战胜新奥尔良鹈鹕队（4-0）、孟菲斯灰熊队（4-2）、休斯敦火箭队（4-1），获得西部冠军晋级NBA决赛 [16]  ，与东部冠军克里夫兰骑士争夺NBA总冠军。 [17]  2015年6月17日，NBA总决赛第六场，勇士客场以105-97再胜骑士，总比分4-2夺取总冠军。这是勇士队在1974-75赛季以来的第一个冠军，也是勇士所有球员个人职业生涯的第一个总冠军。安德烈·伊戈达拉获得总决赛MVP。\r\n2015-16赛季，勇士队取得开季24连胜，创造历史最佳开局。同时，跨赛季的28连胜位列联盟历史第二位 [18]  。此外，勇士队还取得了常规赛跨赛季主场54连胜，刷新历史记录 [19]  。2016年4月4日，在对阵开拓者的比赛中，勇士单赛季三分命中数达到1000个，创NBA历史纪录 [20]  。常规赛收官战中，勇士以125-104战胜灰熊，常规赛战绩最终定格在73胜9负，打破了公牛在1995-96赛季创下的纪录（72胜10负），成为NBA历史单赛季常规赛战绩最好的球队 [4]  。季后赛中，勇士首轮4-1击败火箭、次轮4-1击败开拓者。西部决赛中，前四场比赛，勇士1-3落后雷霆，随后连赢三场实现逆转闯进总决赛。勇士成为NBA历史上第10支在1-3落后的情况下实现逆转的球队，也是第一次连续两年都有1-3落后的球队翻盘。 [21] \r\n    2016-17赛季，2016年7月4日，凯文·杜兰特宣布加盟勇士。 [22] \r\n    2017年5月23日，勇士129-115轻取马刺，以12连胜连续三年晋级总决赛。成为NBA历史上首支在单赛季季后赛取得12连胜的球队。 [23] \r\n    2017年6月13日，勇士回到主场和骑士展开总决赛第五场较量，最终他们以129-120击败对手，总比分4-1淘汰骑士，夺取2016-17赛季NBA总冠军。凯文·杜兰特在生涯第10个赛季终于收获生涯首冠。勇士以16胜1负的季后赛战绩，超越2000-01赛季的湖人（15胜1负），成为NBA历史上胜率最高的夺冠球队。同时，这是勇士最近三年里第2次夺冠，也是队史第5冠。', '2000至2017年', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_card` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('fml', '123456', '1', null, null, null, null);
INSERT INTO `users` VALUES ('lgg', '123456', '2', null, null, null, null);
INSERT INTO `users` VALUES ('樊明亮', '123456', '3', null, null, null, null);
INSERT INTO `users` VALUES ('zmy', '123456', '4', '123456789', '44444444', '11111', 'dsadsd');
INSERT INTO `users` VALUES ('fff', 'aaa', '5', 'aaaa', 'aaa', 'aaaa', 'aaa');
INSERT INTO `users` VALUES ('fff', 'aaa', '6', 'aaaa', 'aaa', 'aaaa', 'aaa');
INSERT INTO `users` VALUES ('lin', 'EDGM@MAMABDACFDLLG', '7', '210421199509043224', '18340858365', '1143760978@qq.com', '抚顺');
INSERT INTO `users` VALUES ('hhh', 'EDGM@MAMABDACFDLLG', '8', 'aaaaaaa', 'aaaaaaaa', 'aaaaaaaa', 'aaaaaaa');
INSERT INTO `users` VALUES ('ccc', 'EDGM@MAMABDACFDLLG', '9', 'aaaaaaaaaaa', 'aaaaaaaaaa', 'aaaaaaa', 'aaaaaaa');
INSERT INTO `users` VALUES ('hyd', '', '27', 'qweerty', '183456789', 'fanmingliang@bonc.com.cn', null);
INSERT INTO `users` VALUES ('xsl', '', '28', '123456', '183456789', 'fanmingliang@bonc.com.cn', null);
INSERT INTO `users` VALUES ('aaa', 'D@CDAL@GAAMAMCM', '29', '123456', '183456789', 'fanmingliang@bonc.com.cn', null);
INSERT INTO `users` VALUES ('zzz', 'EDGM@MAMABDACFDLLG', '30', '147852', '183456789', 'fanmingliang@bonc.com.cn', null);
INSERT INTO `users` VALUES ('xxx', 'GGCMADBLLAEACBMLC', '31', 'xxxxxx', '183456789', 'fanmingliang@bonc.com.cn', null);
INSERT INTO `users` VALUES ('yla', 'EDGM@MAMABDACFDLLG', '32', '210421199607251011', '183456789', '791808248@qq.com', null);
INSERT INTO `users` VALUES ('ssll', 'EDGM@MAMABDACFDLLG', '33', '210421199607251011', null, '791808248@qq.com', null);
INSERT INTO `users` VALUES ('ailin', 'LLEFBBFGADF@CDLAMDMGBG', '34', '210421111111111111', null, '791808248@qq.com', null);
INSERT INTO `users` VALUES ('qqqqqq', 'LLEFBBFGADF@CDLAMDMGBG', '35', '210245444444444444', null, '791808248@qq.com', null);
SET FOREIGN_KEY_CHECKS=1;
