drop database if exists `sxw`;
create database sxw;
use sxw;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `commentName` varchar(20) NOT NULL COMMENT '用户名',
  `content` varchar(200) NOT NULL COMMENT '用户评论的内容',
  `commentTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表评论的时间',
  `commentId` bigint(20) unsigned NOT NULL COMMENT '评论故事或者景点的编号',
  `commentType` varchar(10) NOT NULL COMMENT '评论类型，是评论故事还是景点',
  `state` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'admin', '你好', '2017-08-19 08:09:03', '99', 'story', '1');
INSERT INTO `comment` VALUES ('2', 'guest', 'Hello,World!', '2017-08-13 17:19:03', '1', 'view', '1');
INSERT INTO `comment` VALUES ('3', 'guest', '你好尚书圩！', '2017-08-17 13:29:09', '99', 'experience', '1');
INSERT INTO `comment` VALUES ('4', 'admin', '测试。', '2017-08-30 16:13:12', '4', 'view', '1');
INSERT INTO `comment` VALUES ('5', 'admin', '你的评论被我修改了。', '2017-08-30 13:36:29', '10', 'story', '1');
INSERT INTO `comment` VALUES ('6', 'admin', '很不错的活动。', '2017-08-30 23:08:27', '2', 'experience', '1');
INSERT INTO `comment` VALUES ('7', 'admin', 'hello', '2017-08-31 13:41:45', '5', 'experience', '1');
INSERT INTO `comment` VALUES ('8', 'guest', '很不错哦。', '2017-08-31 13:36:29', '5', 'experience', '1');
INSERT INTO `comment` VALUES ('11', 'guest', 'test', '2017-09-04 21:02:10', '4', 'view', '1');
INSERT INTO `comment` VALUES ('12', 'admin', 'test', '2017-09-07 15:08:42', '1', 'view', '1');
INSERT INTO `comment` VALUES ('13', 'guest', 'test2', '2017-09-07 15:31:07', '4', 'view', '1');
INSERT INTO `comment` VALUES ('14', 'guest', 'test2', '2017-09-07 15:32:19', '3', 'view', '1');
INSERT INTO `comment` VALUES ('15', 'guest', 'test3', '2017-09-07 17:26:05', '3', 'view', '1');
INSERT INTO `comment` VALUES ('16', 'guest', 'teststory.', '2017-09-07 17:36:56', '12', 'story', '1');
INSERT INTO `comment` VALUES ('17', 'guest', 'teststory2.', '2017-09-07 17:37:28', '12', 'story', '1');
INSERT INTO `comment` VALUES ('19', 'guest', 'test', '2017-09-11 13:11:02', '13', 'story', '1');
INSERT INTO `comment` VALUES ('20', 'guest', 'testComment.', '2017-09-22 15:05:40', '1', 'view', '1');
INSERT INTO `comment` VALUES ('23', 'guest', 'test2', '2017-09-22 15:56:00', '1', 'view', '1');
INSERT INTO `comment` VALUES ('24', 'guest', 'hello', '2017-09-22 15:57:01', '1', 'view', '1');
INSERT INTO `comment` VALUES ('25', 'guest', 'hello', '2017-09-22 13:36:29', '1', 'view', '1');
INSERT INTO `comment` VALUES ('26', 'guest', 'what', '2017-09-22 13:36:29', '1', 'view', '1');
INSERT INTO `comment` VALUES ('27', 'guest', 'test', '2017-09-22 16:53:53', '7', 'view', '1');
INSERT INTO `comment` VALUES ('28', 'guest', 'test', '2017-09-22 13:36:29', '4', 'view', '1');
INSERT INTO `comment` VALUES ('31', 'guest', 'test2', '2017-09-22 20:22:29', '6', 'experience', '1');
INSERT INTO `comment` VALUES ('32', 'guest', 'test2', '2017-09-22 20:22:39', '6', 'experience', '1');
INSERT INTO `comment` VALUES ('33', 'guest', 'test3', '2017-09-22 20:23:13', '6', 'experience', '1');
INSERT INTO `comment` VALUES ('34', 'guest', 'test5', '2017-09-22 20:23:20', '6', 'experience', '1');
INSERT INTO `comment` VALUES ('35', 'guest', 'test', '2017-09-22 20:24:30', '8', 'experience', '1');
INSERT INTO `comment` VALUES ('36', 'guest', '666', '2017-09-22 20:34:18', '13', 'story', '1');
INSERT INTO `comment` VALUES ('40', 'admin', 'hello', '2017-09-22 20:35:15', '13', 'story', '1');
INSERT INTO `comment` VALUES ('47', 'guest', '很美', '2017-09-26 22:51:58', '1', 'view', '1');

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '体验编号',
  `experTitle` varchar(20) NOT NULL COMMENT '体验标题',
  `content` text NOT NULL COMMENT '体验的内容',
  `imageUrl` varchar(200) NOT NULL COMMENT '封面图片路径',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加的时间',
  `type` varchar(20) NOT NULL COMMENT '短期长期活动',
  `display` varchar(2) NOT NULL,
  `browsingTimes` bigint(20) unsigned NOT NULL,
  `likes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES ('1', '竹间挖笋', '<p style=\"text-indent: 2em;\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em;\">竹是四君子之一，虽然这里的竹园比不上竹博园的壮观，但它绝对是竹子的小乐园，你不用怕迷路，这里你可以 可以尽情的观赏嬉戏。最有意思的是跟着当地的农民，背上我们为你们准备的小锄头大锄头，一起去挖笋， 可以是一个人，也可以是两个人，当然也可以是一家人。一起去感受大自然的美好。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"><img src=\"../upload/images/1504073378583011550.jpg\" title=\"1504073378583011550.jpg\" alt=\"zhu3.jpg\"/></span></p><p><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">挖冬笋小贴士:</p><ol class=\"wai list-paddingleft-2\" style=\"box-sizing: border-box; margin-right: auto; margin-bottom: 10px; margin-left: 90px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\"><li><p>了解竹林肥水足，阳光足，枝叶浓密，叶色深绿地方挖</p></li><li><p>要离竹根50至100厘米处挖</p></li><li><p>顺竹鞭挖</p></li><li><p>没有挖过的地方，观察地面水路痕迹</p><p><br/></p></li></ol><p><img src=\"../upload/images/1504073455710021372.jpg\" title=\"1504073455710021372.jpg\" class=\"photo2\"/><img src=\"../upload/images/1504073455763073371.jpg\" title=\"1504073455763073371.jpg\" class=\"photo3\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"><br/></span><br/></p>', '/upload/images/experience201709232237049836.jpg', '2017-08-30 12:03:55', 'shortterm', '1', '23', '0');
INSERT INTO `experience` VALUES ('2', '灶台做饭', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">土灶，是用泥土垒起来的灶台，后来，人们改用土砖、红砖建造，再用瓷砖嵌灶面，是庄户人家生活中不可缺少的燃具。土灶烧出来的饭菜特别香甜，尤其是喝上一碗用米汤煮成的锅巴粥，那更是别有一番滋味在心头。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">随着社会的发展，土灶渐渐退出了历史的舞台，现如今，乡下人&lt;除山区、贫困地区外&gt;做饭，大都和城里人一样使用电饭煲，煤气灶，有条件的地方还用上了天燃气灶具，很难看到乡村房顶上袅袅炊烟。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">在这里你可以再次体验到灶台的魅力，拾起灶台的回忆，吃到灶台烧出来的原汁原味的饭菜。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\"><br/></p><p><img src=\"../upload/images/1504073717209037771.jpg\" title=\"1504073717209037771.jpg\" alt=\"1504073717209037771.jpg\" class=\"img1\"/><img src=\"../upload/images/1504073717265074117.jpg\" title=\"1504073717265074117.jpg\" class=\"img2\"/></p><p><br/></p>', '/upload/images/experience201709232237293806.jpg', '2017-08-31 12:05:07', 'shortterm', '1', '28', '0');
INSERT INTO `experience` VALUES ('3', '环村骑行', '<p>&nbsp; &nbsp; &nbsp;&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\">为倡导低碳环保、健康休闲的生活方式,尚书圩村设立了多个自行车点，有各种各样的自行车， 几乎能满足所有人的骑行要求，这也是 体现尚书圩村休闲的一大特色。村里每过一定的时间就会举行一次全村参与的慢骑活动，感受骑行产生的乐趣， 理解健康休闲的生活理念。如果你来到这里，不妨也试一试慢骑，慢慢欣赏村里的一草一木，慢慢体味村里的文化 气息。真正理解慢生活的真谛。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"><br/></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"></span><img src=\"../upload/images/1506224830843000487.jpg\" title=\"1506224830843000487.jpg\" alt=\"ride3.jpg\" width=\"301\" height=\"300\" class=\"img1\"/><img src=\"../upload/images/1504073943242004550.jpg\" title=\"1504073943242004550.jpg\" alt=\"1504073943242004550.jpg\" width=\"300\" height=\"300\" class=\"img2\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgba(232, 229, 229, 0.247059);\"><br/></span><br/></p>', '/upload/images/experience201709232237574065.jpg', '2017-08-31 11:50:34', 'shortterm', '1', '27', '1');
INSERT INTO `experience` VALUES ('4', '采摘果蔬', '<p>&nbsp; &nbsp; &nbsp;&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">沿着近千米的爬满绿色藤蔓、挂满五彩瓜果的长廊散步，眼前是一片开心农场：各种蔬菜——红的番茄、绿的豆角、紫的茄子…绝对可以让你一饱眼福和口福！远处，漫山遍野盛开野花，在清晨的阳光照射下色彩斑斓，特别壮观！ 游客可以自主采摘果蔬，这些有机水果只要一洗净就可以当水果一样直接放心食用。这里有传统的农耕方式，更有现代化的种植模式。</span></p><p style=\"padding-top: 10px;\"><img src=\"../upload/images/1506246226632044306.jpg\" title=\"1506246226632044306.jpg\" alt=\"fruit1.jpg\" class=\"img4\"/></p>', '/upload/images/experience201709232238235187.jpg', '2017-08-11 17:47:19', 'shortterm', '1', '34', '0');
INSERT INTO `experience` VALUES ('5', '下地劳作', '<p style=\"text-indent:2em ;margin:0 0 10px\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em; \">来到尚书圩村，怎么能不体验下地劳作一番？虽然随着时代的发展，乡村也越来越现代化，但尚书圩村没有失去 农村的特性，村里还是有很多下地劳作经验丰富的农民，如果你想参加，他们很愿意当你们的老师兼导游， 教授你们一些耕作的小知识，让你们体验一下小时候的生活，让孩子们对书本上的理论知识有更加深刻的理解。</span></p><p style=\"text-indent:2em margin:0 0 10px\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; \"><br/></span></p><p><img src=\"../upload/images/1504074168140088198.jpg\" title=\"1504074168140088198.jpg\" alt=\"laodong1.jpg\" class=\"img4\"/></p>', '/upload/images/experience201709232238495626.jpg', '2017-09-29 17:14:52', 'shortterm', '1', '63', '0');
INSERT INTO `experience` VALUES ('6', '手工竹编', '<p><img src=\"../upload/images/1504074303999006999.jpg\" title=\"1504074303999006999.jpg\" alt=\"zhubian1.jpg\" width=\"730\" height=\"603\" class=\"img4\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em;margin: 0 0 10px;\"><br/></span></p><p style=\"text-indent:2em\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em;margin: 0 0 10px;\">传统竹编工艺有着悠久的历史，富含着中华民族劳动人民辛勤劳作的结晶，竹编工艺品分为细丝工艺品和粗丝竹编工艺品。 2008年6月7日，竹编经国务院批准列入第二批国家级非物质文化遗产名录。在这里你可以跟着老工艺人一起学习， 做一个简单的竹编品作为纪念品，这是非常有意义的，也可以培养孩子对竹编的兴趣。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em;margin: 0 0 10px;\"><br/></span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504074349865026529.jpg\" title=\"1504074349865026529.jpg\" alt=\"zhubian2.jpg\" width=\"687\" height=\"892\"/></p><p><br/></p>', '/upload/images/experience201709232239098000.jpg', '2017-09-20 12:06:36', 'shortterm', '1', '74', '1');
INSERT INTO `experience` VALUES ('7', '农村体验营', '<h4 style=\"box-sizing: border-box; margin: 10px auto; padding: 0px 0px 15px; font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 18px; border-bottom: 2px solid blue; white-space: normal; \"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span>介绍</h4><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; \">农村体验营就是让孩子们一起来到农村，体验农村生活，参加农业劳动，进行农村社会实践活动，通过\"体验式的劳动、活动、游戏\"的过程，从而达到激发孩子成长动力，健康快乐成长的目的；让孩子深入农村，参加农村劳动，感受农业劳动的艰苦辛劳，培养孩子养成热爱劳动，不怕苦不怕累的吃苦耐劳精神，以人为本，快乐体验；优化情感，注重效果；提升素质，激发潜力！</p><p><img src=\"../upload/images/1506226809381046652.jpg\" alt=\"long2.jpg\" class=\"conttext-img1\" title=\"1506226809381046652.jpg\"/><img src=\"../upload/images/1504074548310089966.jpg\" title=\"1504074548310089966.jpg\" alt=\"long3.jpg\" class=\"conttext-img2\"/></p><p style=\"text-align: center;\"><br/></p><h4 style=\"box-sizing: border-box; margin: 10px auto; padding: 0px 0px 15px; font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); font-size: 18px; border-bottom: 2px solid blue; white-space: normal;\">体验</h4><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\"><span style=\"box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>感性认识——学员离开喧嚣的城市，感受农村的自然美景，熟悉农村的生活环境，结识同龄的孩子，认识农民伯伯；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; \"><span style=\"box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>熟悉农村环境——让学员熟悉农村基地的房屋、驻地、环境、山峦，河流，农田，作物，在熟悉环境的基础上，强调安全意识和孩子的自身防范意识；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\"><span style=\"box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>认识农具和家畜——农家的锄头、镰刀、犁钯等农具，带孩子们认识熟悉喜爱农村猪、牛、马、羊、鸡、鸭、鹅等家畜家禽动物；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; \"><span style=\"box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>学习农村知识——熟悉农村季节变化、农作物的分类、栽培技术，作息时间、生活规律，农作物采摘时节与收获；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\"><span style=\"box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>访贫问苦—— 与农民伯伯、农村孩子结对交流、听农民讲故事，参观社会主义新农村，了解农村的变化和社会主义新农村建设。</p><p><img src=\"../upload/images/1504074616290013558.jpg\" title=\"1504074616290013558.jpg\" alt=\"long4.jpg\" class=\"conttext-img3\"/></p><p style=\"box-sizing: border-box; margin: 10px auto; padding: 0px 0px 15px; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; font-size: 18px; border-bottom: 2px solid blue;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">教育</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>吃苦精神——适度吃苦，吃得苦中苦，方为人上人；</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>心灵沟通——释放心灵的印记，重新树立人生目标；</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>感恩教育——在艰苦的劳动和磨练中让孩子感悟和体验父母的艰苦辛劳，学会感恩；</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>一封家书——唤起孩子感恩之心，在农村劳动体验之后，给父母一封感动的信。</span></p><p style=\"box-sizing: border-box; margin: 10px auto; padding: 0px 0px 15px; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; font-size: 18px; border-bottom: 2px solid blue;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">报名条件</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>孩子年龄必须在7-17岁</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>心灵沟通——释放心灵的印记，重新树立人生目标；</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px 0px 0px 25px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><span style=\"font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; box-sizing: border-box; margin: 0px 6px 1px auto; padding: 0px; display: inline-block; width: 10px; height: 10px; background: rgb(183, 219, 236); border-radius: 5px;\"></span>感恩教育——在艰苦的劳动和磨练中让孩子感悟和体验父母的艰苦辛劳，学会感恩；</span></p><p><br/></p>', '/upload/images/experience201709232239445423.jpg', '2017-08-23 12:27:07', 'longterm', '1', '8', '0');
INSERT INTO `experience` VALUES ('8', '尚书文化节', '<p style=\"text-align: center;\"><img src=\"../upload/images/1504074870183028453.png\" title=\"1504074870183028453.png\" alt=\"culture.png\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">尚书文化节是尚书圩挖掘深层次文化资源举办的节日，<span style=\"box-sizing: border-box; margin: 0px auto; padding: 0px; font-weight: 700;\"><em style=\"box-sizing: border-box; margin: 0px auto; padding: 0px;\">活动时间为6月到7月，</em></span>&nbsp;在这一节日中成人礼、尊师礼、开笔礼三大礼仪同步登场</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">参与的同学穿上传统服装，通过服制、礼器、音乐和笄礼等仪程参与，树立爱祖国、爱父母、爱师长的道德情怀和勤奋学习、奋发自强、履行使命的担当意识。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal;\">成人礼结束后，学子们经过九曲回廊桥、踏上求知路、登上状元山，参加尊师礼。在尊师礼上，学子们瞻仰尚书杨振普像，聆听尚书求学经历，并在文昌阁前叩拜孔师像、许下心愿。</p><p style=\"text-align: center;\"><img src=\"../upload/images/1504074931973099492.jpg\" title=\"1504074931973099492.jpg\" class=\"img1\"/><img src=\"../upload/images/1504074932022072164.jpg\" title=\"1504074932022072164.jpg\" class=\"img2\"/></p><p style=\"text-indent:2em\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-indent: 2em\">现在家长往往让孩子读好书，但忽视了道德教育，学生犯罪率逐年提升。通过这些古时候的礼仪礼节，让他们学会感恩立志，学会为国家担当，学会习练身体，更要知晓父母养育之恩，学会孝敬父母。让他有一个概念：从此你不再是小孩了。 这种教育力图在寓教于乐中传承中华传统文化，使一个人从思想认识上完成从童年到成年的人生飞跃，感知到人生的意义和责任，摆脱过去懵懂的状态。</span></p><p><br/></p>', '/upload/images/experience201709232240245466.jpg', '2017-08-31 12:16:58', 'longterm', '1', '8', '0');

-- ----------------------------
-- Table structure for experienceLikes
-- ----------------------------
DROP TABLE IF EXISTS `experienceLikes`;
CREATE TABLE `experienceLikes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动点赞编号',
  `experience_id` bigint(20) unsigned NOT NULL COMMENT '体验活动编号',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experienceLikes
-- ----------------------------
INSERT INTO `experienceLikes` VALUES ('2', '3', 'guest');
INSERT INTO `experienceLikes` VALUES ('5', '6', 'guest');

-- ----------------------------
-- Table structure for ipaddress
-- ----------------------------
DROP TABLE IF EXISTS `ipaddress`;
CREATE TABLE `ipaddress` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ip编号',
  `ipAddress` varchar(15) NOT NULL COMMENT 'IP地址',
  `location` varchar(50) NOT NULL COMMENT 'ip所在地区',
  `accessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipaddress
-- ----------------------------
INSERT INTO `ipaddress` VALUES ('1', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 14:36:47');
INSERT INTO `ipaddress` VALUES ('2', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-04 14:41:21');
INSERT INTO `ipaddress` VALUES ('3', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-04 14:41:27');
INSERT INTO `ipaddress` VALUES ('4', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 14:52:17');
INSERT INTO `ipaddress` VALUES ('5', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-09 14:52:22');
INSERT INTO `ipaddress` VALUES ('6', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-08 14:52:22');
INSERT INTO `ipaddress` VALUES ('7', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 14:52:46');
INSERT INTO `ipaddress` VALUES ('8', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-07 14:52:52');
INSERT INTO `ipaddress` VALUES ('9', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-07 14:52:53');
INSERT INTO `ipaddress` VALUES ('10', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 14:53:17');
INSERT INTO `ipaddress` VALUES ('11', '127.0.0.2', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-08 14:53:23');
INSERT INTO `ipaddress` VALUES ('12', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 17:05:02');
INSERT INTO `ipaddress` VALUES ('13', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-06 17:05:13');
INSERT INTO `ipaddress` VALUES ('15', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-05 17:15:36');
INSERT INTO `ipaddress` VALUES ('16', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 17:16:13');
INSERT INTO `ipaddress` VALUES ('17', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-05 17:16:17');
INSERT INTO `ipaddress` VALUES ('18', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 17:16:43');
INSERT INTO `ipaddress` VALUES ('19', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-06 17:23:18');
INSERT INTO `ipaddress` VALUES ('20', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-09 17:23:48');
INSERT INTO `ipaddress` VALUES ('21', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-10 17:24:19');
INSERT INTO `ipaddress` VALUES ('22', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-09 17:23:29');
INSERT INTO `ipaddress` VALUES ('23', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:43:44');
INSERT INTO `ipaddress` VALUES ('24', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:44:07');
INSERT INTO `ipaddress` VALUES ('25', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:44:33');
INSERT INTO `ipaddress` VALUES ('26', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:47:03');
INSERT INTO `ipaddress` VALUES ('27', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:47:15');
INSERT INTO `ipaddress` VALUES ('28', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:52:01');
INSERT INTO `ipaddress` VALUES ('29', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:53:12');
INSERT INTO `ipaddress` VALUES ('30', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:58:03');
INSERT INTO `ipaddress` VALUES ('31', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:58:26');
INSERT INTO `ipaddress` VALUES ('32', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 12:58:56');
INSERT INTO `ipaddress` VALUES ('33', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:00:32');
INSERT INTO `ipaddress` VALUES ('34', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:02');
INSERT INTO `ipaddress` VALUES ('35', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:12');
INSERT INTO `ipaddress` VALUES ('36', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:15');
INSERT INTO `ipaddress` VALUES ('37', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:27');
INSERT INTO `ipaddress` VALUES ('38', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:32');
INSERT INTO `ipaddress` VALUES ('39', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:44');
INSERT INTO `ipaddress` VALUES ('40', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:52');
INSERT INTO `ipaddress` VALUES ('41', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:01:59');
INSERT INTO `ipaddress` VALUES ('42', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:05:55');
INSERT INTO `ipaddress` VALUES ('43', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:06:52');
INSERT INTO `ipaddress` VALUES ('44', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:31:48');
INSERT INTO `ipaddress` VALUES ('45', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:32:07');
INSERT INTO `ipaddress` VALUES ('46', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:32:13');
INSERT INTO `ipaddress` VALUES ('47', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:32:38');
INSERT INTO `ipaddress` VALUES ('48', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:35:24');
INSERT INTO `ipaddress` VALUES ('49', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 13:35:30');
INSERT INTO `ipaddress` VALUES ('50', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:06:02');
INSERT INTO `ipaddress` VALUES ('51', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:06:44');
INSERT INTO `ipaddress` VALUES ('52', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:10');
INSERT INTO `ipaddress` VALUES ('53', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:15');
INSERT INTO `ipaddress` VALUES ('54', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:19');
INSERT INTO `ipaddress` VALUES ('55', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:23');
INSERT INTO `ipaddress` VALUES ('56', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:41');
INSERT INTO `ipaddress` VALUES ('57', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:11:46');
INSERT INTO `ipaddress` VALUES ('58', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 18:12:16');
INSERT INTO `ipaddress` VALUES ('59', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-11 21:48:18');
INSERT INTO `ipaddress` VALUES ('60', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:42:59');
INSERT INTO `ipaddress` VALUES ('61', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:43:37');
INSERT INTO `ipaddress` VALUES ('62', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:43:55');
INSERT INTO `ipaddress` VALUES ('63', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:05');
INSERT INTO `ipaddress` VALUES ('64', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:13');
INSERT INTO `ipaddress` VALUES ('65', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:19');
INSERT INTO `ipaddress` VALUES ('66', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:26');
INSERT INTO `ipaddress` VALUES ('67', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:31');
INSERT INTO `ipaddress` VALUES ('68', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:45');
INSERT INTO `ipaddress` VALUES ('69', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:52');
INSERT INTO `ipaddress` VALUES ('70', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:44:57');
INSERT INTO `ipaddress` VALUES ('71', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:45:03');
INSERT INTO `ipaddress` VALUES ('72', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:45:08');
INSERT INTO `ipaddress` VALUES ('73', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:45:27');
INSERT INTO `ipaddress` VALUES ('74', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:45:54');
INSERT INTO `ipaddress` VALUES ('75', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:46:59');
INSERT INTO `ipaddress` VALUES ('76', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:47:16');
INSERT INTO `ipaddress` VALUES ('77', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 20:53:16');
INSERT INTO `ipaddress` VALUES ('78', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:21:58');
INSERT INTO `ipaddress` VALUES ('79', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:22:11');
INSERT INTO `ipaddress` VALUES ('80', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:24:14');
INSERT INTO `ipaddress` VALUES ('81', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:27:01');
INSERT INTO `ipaddress` VALUES ('82', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:47:57');
INSERT INTO `ipaddress` VALUES ('83', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-13 21:54:08');
INSERT INTO `ipaddress` VALUES ('84', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 11:28:09');
INSERT INTO `ipaddress` VALUES ('85', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 11:48:42');
INSERT INTO `ipaddress` VALUES ('86', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 11:55:41');
INSERT INTO `ipaddress` VALUES ('87', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 11:55:53');
INSERT INTO `ipaddress` VALUES ('88', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:09:59');
INSERT INTO `ipaddress` VALUES ('89', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:11:35');
INSERT INTO `ipaddress` VALUES ('90', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:14:06');
INSERT INTO `ipaddress` VALUES ('91', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:34:29');
INSERT INTO `ipaddress` VALUES ('92', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:37:04');
INSERT INTO `ipaddress` VALUES ('93', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:37:07');
INSERT INTO `ipaddress` VALUES ('94', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:37:12');
INSERT INTO `ipaddress` VALUES ('95', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:37:32');
INSERT INTO `ipaddress` VALUES ('96', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:38:14');
INSERT INTO `ipaddress` VALUES ('97', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:38:33');
INSERT INTO `ipaddress` VALUES ('98', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:40:37');
INSERT INTO `ipaddress` VALUES ('99', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:40:56');
INSERT INTO `ipaddress` VALUES ('100', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 12:42:25');
INSERT INTO `ipaddress` VALUES ('101', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 13:36:56');
INSERT INTO `ipaddress` VALUES ('102', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 14:46:17');
INSERT INTO `ipaddress` VALUES ('103', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:07:49');
INSERT INTO `ipaddress` VALUES ('104', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:08:09');
INSERT INTO `ipaddress` VALUES ('105', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:08:28');
INSERT INTO `ipaddress` VALUES ('106', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:09:26');
INSERT INTO `ipaddress` VALUES ('107', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:09:30');
INSERT INTO `ipaddress` VALUES ('108', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:09:42');
INSERT INTO `ipaddress` VALUES ('109', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:09:45');
INSERT INTO `ipaddress` VALUES ('110', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:09:58');
INSERT INTO `ipaddress` VALUES ('111', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:10:05');
INSERT INTO `ipaddress` VALUES ('112', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:11:31');
INSERT INTO `ipaddress` VALUES ('113', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 18:15:21');
INSERT INTO `ipaddress` VALUES ('114', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 19:03:04');
INSERT INTO `ipaddress` VALUES ('115', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 19:03:37');
INSERT INTO `ipaddress` VALUES ('116', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 19:37:18');
INSERT INTO `ipaddress` VALUES ('117', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 19:45:45');
INSERT INTO `ipaddress` VALUES ('118', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-14 20:31:47');
INSERT INTO `ipaddress` VALUES ('119', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 12:02:09');
INSERT INTO `ipaddress` VALUES ('120', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 18:36:26');
INSERT INTO `ipaddress` VALUES ('121', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 22:46:45');
INSERT INTO `ipaddress` VALUES ('122', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 22:47:35');
INSERT INTO `ipaddress` VALUES ('123', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 22:47:48');
INSERT INTO `ipaddress` VALUES ('124', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-16 22:48:01');
INSERT INTO `ipaddress` VALUES ('125', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-17 12:36:02');
INSERT INTO `ipaddress` VALUES ('126', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-17 13:19:36');
INSERT INTO `ipaddress` VALUES ('127', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-17 15:14:36');
INSERT INTO `ipaddress` VALUES ('128', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:03:48');
INSERT INTO `ipaddress` VALUES ('129', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:05:35');
INSERT INTO `ipaddress` VALUES ('130', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:06:07');
INSERT INTO `ipaddress` VALUES ('131', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:06:50');
INSERT INTO `ipaddress` VALUES ('132', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:07:30');
INSERT INTO `ipaddress` VALUES ('133', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:09:48');
INSERT INTO `ipaddress` VALUES ('134', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:10:00');
INSERT INTO `ipaddress` VALUES ('135', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:10:10');
INSERT INTO `ipaddress` VALUES ('136', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:11:47');
INSERT INTO `ipaddress` VALUES ('137', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:12:00');
INSERT INTO `ipaddress` VALUES ('138', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:12:23');
INSERT INTO `ipaddress` VALUES ('139', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:13:25');
INSERT INTO `ipaddress` VALUES ('140', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:13:36');
INSERT INTO `ipaddress` VALUES ('141', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:13:55');
INSERT INTO `ipaddress` VALUES ('142', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:15:36');
INSERT INTO `ipaddress` VALUES ('143', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:29:04');
INSERT INTO `ipaddress` VALUES ('144', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:29:14');
INSERT INTO `ipaddress` VALUES ('145', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:34:48');
INSERT INTO `ipaddress` VALUES ('146', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:37:35');
INSERT INTO `ipaddress` VALUES ('147', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:39:30');
INSERT INTO `ipaddress` VALUES ('148', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:41:09');
INSERT INTO `ipaddress` VALUES ('149', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:41:12');
INSERT INTO `ipaddress` VALUES ('150', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:41:21');
INSERT INTO `ipaddress` VALUES ('151', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:41:35');
INSERT INTO `ipaddress` VALUES ('152', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:46:37');
INSERT INTO `ipaddress` VALUES ('153', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:52:06');
INSERT INTO `ipaddress` VALUES ('154', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:55:21');
INSERT INTO `ipaddress` VALUES ('155', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:55:28');
INSERT INTO `ipaddress` VALUES ('156', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:56:42');
INSERT INTO `ipaddress` VALUES ('157', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:58:05');
INSERT INTO `ipaddress` VALUES ('158', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:58:06');
INSERT INTO `ipaddress` VALUES ('159', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:58:34');
INSERT INTO `ipaddress` VALUES ('160', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 20:58:54');
INSERT INTO `ipaddress` VALUES ('161', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:03:00');
INSERT INTO `ipaddress` VALUES ('162', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:07:32');
INSERT INTO `ipaddress` VALUES ('163', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:23:15');
INSERT INTO `ipaddress` VALUES ('164', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:23:17');
INSERT INTO `ipaddress` VALUES ('165', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:24:06');
INSERT INTO `ipaddress` VALUES ('166', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:24:10');
INSERT INTO `ipaddress` VALUES ('167', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:24:26');
INSERT INTO `ipaddress` VALUES ('168', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:24:56');
INSERT INTO `ipaddress` VALUES ('169', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-19 21:25:02');
INSERT INTO `ipaddress` VALUES ('170', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 09:21:46');
INSERT INTO `ipaddress` VALUES ('171', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 09:25:50');
INSERT INTO `ipaddress` VALUES ('172', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 09:29:39');
INSERT INTO `ipaddress` VALUES ('173', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 10:20:38');
INSERT INTO `ipaddress` VALUES ('174', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 10:22:45');
INSERT INTO `ipaddress` VALUES ('175', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 10:22:59');
INSERT INTO `ipaddress` VALUES ('176', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 10:23:02');
INSERT INTO `ipaddress` VALUES ('177', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:19:39');
INSERT INTO `ipaddress` VALUES ('178', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:19:52');
INSERT INTO `ipaddress` VALUES ('179', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:38:05');
INSERT INTO `ipaddress` VALUES ('180', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:38:22');
INSERT INTO `ipaddress` VALUES ('181', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:38:25');
INSERT INTO `ipaddress` VALUES ('182', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:38:54');
INSERT INTO `ipaddress` VALUES ('183', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 11:39:23');
INSERT INTO `ipaddress` VALUES ('184', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 12:07:35');
INSERT INTO `ipaddress` VALUES ('185', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 12:07:52');
INSERT INTO `ipaddress` VALUES ('186', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 19:27:15');
INSERT INTO `ipaddress` VALUES ('187', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 19:27:37');
INSERT INTO `ipaddress` VALUES ('188', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 19:27:46');
INSERT INTO `ipaddress` VALUES ('189', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:47:03');
INSERT INTO `ipaddress` VALUES ('190', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:47:11');
INSERT INTO `ipaddress` VALUES ('191', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:48:06');
INSERT INTO `ipaddress` VALUES ('192', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:48:14');
INSERT INTO `ipaddress` VALUES ('193', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:49:55');
INSERT INTO `ipaddress` VALUES ('194', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:49:57');
INSERT INTO `ipaddress` VALUES ('195', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:50:16');
INSERT INTO `ipaddress` VALUES ('196', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 20:51:55');
INSERT INTO `ipaddress` VALUES ('197', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:00:56');
INSERT INTO `ipaddress` VALUES ('198', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:06:30');
INSERT INTO `ipaddress` VALUES ('199', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:06:53');
INSERT INTO `ipaddress` VALUES ('200', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:11:43');
INSERT INTO `ipaddress` VALUES ('201', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:11:59');
INSERT INTO `ipaddress` VALUES ('202', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:34:26');
INSERT INTO `ipaddress` VALUES ('203', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:34:41');
INSERT INTO `ipaddress` VALUES ('204', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:34:45');
INSERT INTO `ipaddress` VALUES ('205', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:34:49');
INSERT INTO `ipaddress` VALUES ('206', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:35:11');
INSERT INTO `ipaddress` VALUES ('207', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 21:35:22');
INSERT INTO `ipaddress` VALUES ('208', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 22:10:41');
INSERT INTO `ipaddress` VALUES ('209', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 22:10:42');
INSERT INTO `ipaddress` VALUES ('210', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 22:23:40');
INSERT INTO `ipaddress` VALUES ('211', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-20 22:23:43');
INSERT INTO `ipaddress` VALUES ('212', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 11:22:14');
INSERT INTO `ipaddress` VALUES ('213', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 11:22:48');
INSERT INTO `ipaddress` VALUES ('214', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 16:28:26');
INSERT INTO `ipaddress` VALUES ('215', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 20:44:30');
INSERT INTO `ipaddress` VALUES ('216', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 20:44:48');
INSERT INTO `ipaddress` VALUES ('217', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 21:03:34');
INSERT INTO `ipaddress` VALUES ('218', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:09:03');
INSERT INTO `ipaddress` VALUES ('219', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:09:13');
INSERT INTO `ipaddress` VALUES ('220', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:11:59');
INSERT INTO `ipaddress` VALUES ('221', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:12:01');
INSERT INTO `ipaddress` VALUES ('222', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:13:35');
INSERT INTO `ipaddress` VALUES ('223', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:13:47');
INSERT INTO `ipaddress` VALUES ('224', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:18:51');
INSERT INTO `ipaddress` VALUES ('225', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:18:53');
INSERT INTO `ipaddress` VALUES ('226', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:19:26');
INSERT INTO `ipaddress` VALUES ('227', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:23:30');
INSERT INTO `ipaddress` VALUES ('228', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-21 22:23:34');
INSERT INTO `ipaddress` VALUES ('229', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:34:09');
INSERT INTO `ipaddress` VALUES ('230', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:35:06');
INSERT INTO `ipaddress` VALUES ('231', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:35:12');
INSERT INTO `ipaddress` VALUES ('232', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:35:17');
INSERT INTO `ipaddress` VALUES ('233', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:35:33');
INSERT INTO `ipaddress` VALUES ('234', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:35:57');
INSERT INTO `ipaddress` VALUES ('235', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:36:20');
INSERT INTO `ipaddress` VALUES ('236', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:36:30');
INSERT INTO `ipaddress` VALUES ('237', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:36:32');
INSERT INTO `ipaddress` VALUES ('238', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:36:59');
INSERT INTO `ipaddress` VALUES ('239', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:37:07');
INSERT INTO `ipaddress` VALUES ('240', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:46:04');
INSERT INTO `ipaddress` VALUES ('241', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:46:14');
INSERT INTO `ipaddress` VALUES ('242', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:46:20');
INSERT INTO `ipaddress` VALUES ('243', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 12:46:40');
INSERT INTO `ipaddress` VALUES ('244', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 13:43:31');
INSERT INTO `ipaddress` VALUES ('245', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:27:43');
INSERT INTO `ipaddress` VALUES ('246', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:27:51');
INSERT INTO `ipaddress` VALUES ('247', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:27:59');
INSERT INTO `ipaddress` VALUES ('248', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:41:18');
INSERT INTO `ipaddress` VALUES ('249', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:50:39');
INSERT INTO `ipaddress` VALUES ('250', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:50:51');
INSERT INTO `ipaddress` VALUES ('251', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:52:44');
INSERT INTO `ipaddress` VALUES ('252', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:52:46');
INSERT INTO `ipaddress` VALUES ('253', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:52:53');
INSERT INTO `ipaddress` VALUES ('254', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 19:53:00');
INSERT INTO `ipaddress` VALUES ('255', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:36:19');
INSERT INTO `ipaddress` VALUES ('256', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:43:00');
INSERT INTO `ipaddress` VALUES ('257', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:43:02');
INSERT INTO `ipaddress` VALUES ('258', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:43:32');
INSERT INTO `ipaddress` VALUES ('259', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:43:41');
INSERT INTO `ipaddress` VALUES ('260', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:44:15');
INSERT INTO `ipaddress` VALUES ('261', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 20:48:15');
INSERT INTO `ipaddress` VALUES ('262', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 21:14:09');
INSERT INTO `ipaddress` VALUES ('263', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 21:21:31');
INSERT INTO `ipaddress` VALUES ('264', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 21:23:36');
INSERT INTO `ipaddress` VALUES ('265', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-22 21:23:51');
INSERT INTO `ipaddress` VALUES ('266', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 11:39:34');
INSERT INTO `ipaddress` VALUES ('267', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:20:47');
INSERT INTO `ipaddress` VALUES ('268', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:29:46');
INSERT INTO `ipaddress` VALUES ('269', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:38:56');
INSERT INTO `ipaddress` VALUES ('270', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:38:58');
INSERT INTO `ipaddress` VALUES ('271', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:39:01');
INSERT INTO `ipaddress` VALUES ('272', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:46:48');
INSERT INTO `ipaddress` VALUES ('273', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 12:53:50');
INSERT INTO `ipaddress` VALUES ('274', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 13:02:00');
INSERT INTO `ipaddress` VALUES ('275', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 13:03:37');
INSERT INTO `ipaddress` VALUES ('276', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 13:32:51');
INSERT INTO `ipaddress` VALUES ('277', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 13:53:44');
INSERT INTO `ipaddress` VALUES ('278', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:02:12');
INSERT INTO `ipaddress` VALUES ('279', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:02:36');
INSERT INTO `ipaddress` VALUES ('280', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:04:00');
INSERT INTO `ipaddress` VALUES ('281', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:10:15');
INSERT INTO `ipaddress` VALUES ('282', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:10:19');
INSERT INTO `ipaddress` VALUES ('283', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:10:25');
INSERT INTO `ipaddress` VALUES ('284', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:10:27');
INSERT INTO `ipaddress` VALUES ('285', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:14:53');
INSERT INTO `ipaddress` VALUES ('286', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:18:34');
INSERT INTO `ipaddress` VALUES ('287', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:20:16');
INSERT INTO `ipaddress` VALUES ('288', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 14:20:44');
INSERT INTO `ipaddress` VALUES ('289', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:27:04');
INSERT INTO `ipaddress` VALUES ('290', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:28:38');
INSERT INTO `ipaddress` VALUES ('291', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:28:55');
INSERT INTO `ipaddress` VALUES ('292', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:28:59');
INSERT INTO `ipaddress` VALUES ('293', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:29:01');
INSERT INTO `ipaddress` VALUES ('294', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:29:35');
INSERT INTO `ipaddress` VALUES ('295', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:29:43');
INSERT INTO `ipaddress` VALUES ('296', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:29:59');
INSERT INTO `ipaddress` VALUES ('297', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:30:01');
INSERT INTO `ipaddress` VALUES ('298', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:30:11');
INSERT INTO `ipaddress` VALUES ('299', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:32:45');
INSERT INTO `ipaddress` VALUES ('300', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:44:54');
INSERT INTO `ipaddress` VALUES ('301', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 15:45:03');
INSERT INTO `ipaddress` VALUES ('302', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:25:57');
INSERT INTO `ipaddress` VALUES ('303', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:26:03');
INSERT INTO `ipaddress` VALUES ('304', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:41:43');
INSERT INTO `ipaddress` VALUES ('305', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:42:17');
INSERT INTO `ipaddress` VALUES ('306', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:42:20');
INSERT INTO `ipaddress` VALUES ('307', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:42:22');
INSERT INTO `ipaddress` VALUES ('308', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:42:25');
INSERT INTO `ipaddress` VALUES ('309', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:42:32');
INSERT INTO `ipaddress` VALUES ('310', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:43:11');
INSERT INTO `ipaddress` VALUES ('311', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:43:29');
INSERT INTO `ipaddress` VALUES ('312', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:44:41');
INSERT INTO `ipaddress` VALUES ('313', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:44:46');
INSERT INTO `ipaddress` VALUES ('314', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 16:45:37');
INSERT INTO `ipaddress` VALUES ('315', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:51:46');
INSERT INTO `ipaddress` VALUES ('316', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:52:33');
INSERT INTO `ipaddress` VALUES ('317', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:52:35');
INSERT INTO `ipaddress` VALUES ('318', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:57:30');
INSERT INTO `ipaddress` VALUES ('319', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:58:24');
INSERT INTO `ipaddress` VALUES ('320', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 19:59:06');
INSERT INTO `ipaddress` VALUES ('321', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:01:22');
INSERT INTO `ipaddress` VALUES ('322', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:09:15');
INSERT INTO `ipaddress` VALUES ('323', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:09:45');
INSERT INTO `ipaddress` VALUES ('324', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:20:04');
INSERT INTO `ipaddress` VALUES ('325', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:26:55');
INSERT INTO `ipaddress` VALUES ('326', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:27:04');
INSERT INTO `ipaddress` VALUES ('327', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:27:08');
INSERT INTO `ipaddress` VALUES ('328', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:38:17');
INSERT INTO `ipaddress` VALUES ('329', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:38:28');
INSERT INTO `ipaddress` VALUES ('330', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:38:48');
INSERT INTO `ipaddress` VALUES ('331', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:38:55');
INSERT INTO `ipaddress` VALUES ('332', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:41:17');
INSERT INTO `ipaddress` VALUES ('333', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:49:42');
INSERT INTO `ipaddress` VALUES ('334', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:54:00');
INSERT INTO `ipaddress` VALUES ('335', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:54:12');
INSERT INTO `ipaddress` VALUES ('336', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:55:27');
INSERT INTO `ipaddress` VALUES ('337', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:55:32');
INSERT INTO `ipaddress` VALUES ('338', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:56:26');
INSERT INTO `ipaddress` VALUES ('339', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 20:59:47');
INSERT INTO `ipaddress` VALUES ('340', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:00:45');
INSERT INTO `ipaddress` VALUES ('341', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:07:25');
INSERT INTO `ipaddress` VALUES ('342', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:09:31');
INSERT INTO `ipaddress` VALUES ('343', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:12:12');
INSERT INTO `ipaddress` VALUES ('344', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:14:20');
INSERT INTO `ipaddress` VALUES ('345', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:38:51');
INSERT INTO `ipaddress` VALUES ('346', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:50:27');
INSERT INTO `ipaddress` VALUES ('347', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:52:16');
INSERT INTO `ipaddress` VALUES ('348', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:52:17');
INSERT INTO `ipaddress` VALUES ('349', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:53:04');
INSERT INTO `ipaddress` VALUES ('350', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:53:28');
INSERT INTO `ipaddress` VALUES ('351', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:54:08');
INSERT INTO `ipaddress` VALUES ('352', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:54:48');
INSERT INTO `ipaddress` VALUES ('353', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 21:54:51');
INSERT INTO `ipaddress` VALUES ('354', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:07:18');
INSERT INTO `ipaddress` VALUES ('355', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:12:33');
INSERT INTO `ipaddress` VALUES ('356', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:12:51');
INSERT INTO `ipaddress` VALUES ('357', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:20:53');
INSERT INTO `ipaddress` VALUES ('358', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:23:52');
INSERT INTO `ipaddress` VALUES ('359', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:24:22');
INSERT INTO `ipaddress` VALUES ('360', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:25:08');
INSERT INTO `ipaddress` VALUES ('361', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:25:18');
INSERT INTO `ipaddress` VALUES ('362', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:25:42');
INSERT INTO `ipaddress` VALUES ('363', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:26:48');
INSERT INTO `ipaddress` VALUES ('364', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:27:10');
INSERT INTO `ipaddress` VALUES ('365', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:57:50');
INSERT INTO `ipaddress` VALUES ('366', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:58:13');
INSERT INTO `ipaddress` VALUES ('367', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:58:52');
INSERT INTO `ipaddress` VALUES ('368', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 22:59:55');
INSERT INTO `ipaddress` VALUES ('369', '211.140.177.21', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 23:00:36');
INSERT INTO `ipaddress` VALUES ('370', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 23:01:44');
INSERT INTO `ipaddress` VALUES ('371', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-23 23:06:05');
INSERT INTO `ipaddress` VALUES ('372', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 01:03:54');
INSERT INTO `ipaddress` VALUES ('373', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 01:04:55');
INSERT INTO `ipaddress` VALUES ('374', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 01:07:13');
INSERT INTO `ipaddress` VALUES ('375', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 01:08:04');
INSERT INTO `ipaddress` VALUES ('376', '183.153.192.24', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 09:36:40');
INSERT INTO `ipaddress` VALUES ('377', '112.17.244.159', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 09:53:09');
INSERT INTO `ipaddress` VALUES ('378', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 09:59:57');
INSERT INTO `ipaddress` VALUES ('379', '220.181.132.192', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 10:00:12');
INSERT INTO `ipaddress` VALUES ('380', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:14:43');
INSERT INTO `ipaddress` VALUES ('381', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:15:03');
INSERT INTO `ipaddress` VALUES ('382', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:16:00');
INSERT INTO `ipaddress` VALUES ('383', '183.153.192.24', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:38:37');
INSERT INTO `ipaddress` VALUES ('384', '183.153.192.24', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:47:41');
INSERT INTO `ipaddress` VALUES ('385', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 11:50:52');
INSERT INTO `ipaddress` VALUES ('386', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:02:54');
INSERT INTO `ipaddress` VALUES ('387', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:06:20');
INSERT INTO `ipaddress` VALUES ('388', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:16:32');
INSERT INTO `ipaddress` VALUES ('389', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:18:09');
INSERT INTO `ipaddress` VALUES ('390', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:18:23');
INSERT INTO `ipaddress` VALUES ('391', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:18:29');
INSERT INTO `ipaddress` VALUES ('392', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:20:48');
INSERT INTO `ipaddress` VALUES ('393', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:21:42');
INSERT INTO `ipaddress` VALUES ('394', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:22:08');
INSERT INTO `ipaddress` VALUES ('395', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:22:56');
INSERT INTO `ipaddress` VALUES ('396', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:23:07');
INSERT INTO `ipaddress` VALUES ('397', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:24:37');
INSERT INTO `ipaddress` VALUES ('398', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:36:38');
INSERT INTO `ipaddress` VALUES ('399', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:56:13');
INSERT INTO `ipaddress` VALUES ('400', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:56:29');
INSERT INTO `ipaddress` VALUES ('401', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 12:56:33');
INSERT INTO `ipaddress` VALUES ('402', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 15:09:43');
INSERT INTO `ipaddress` VALUES ('403', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:03:10');
INSERT INTO `ipaddress` VALUES ('404', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:42:48');
INSERT INTO `ipaddress` VALUES ('405', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:43:24');
INSERT INTO `ipaddress` VALUES ('406', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:45:05');
INSERT INTO `ipaddress` VALUES ('407', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:45:10');
INSERT INTO `ipaddress` VALUES ('408', '211.140.177.19', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:48:35');
INSERT INTO `ipaddress` VALUES ('409', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 17:59:42');
INSERT INTO `ipaddress` VALUES ('410', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:26:22');
INSERT INTO `ipaddress` VALUES ('411', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:26:33');
INSERT INTO `ipaddress` VALUES ('412', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:30:45');
INSERT INTO `ipaddress` VALUES ('413', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:31:16');
INSERT INTO `ipaddress` VALUES ('414', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:31:21');
INSERT INTO `ipaddress` VALUES ('415', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:32:06');
INSERT INTO `ipaddress` VALUES ('416', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:33:30');
INSERT INTO `ipaddress` VALUES ('417', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:33:37');
INSERT INTO `ipaddress` VALUES ('418', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:33:55');
INSERT INTO `ipaddress` VALUES ('419', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:34:02');
INSERT INTO `ipaddress` VALUES ('420', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:36:17');
INSERT INTO `ipaddress` VALUES ('421', '122.226.131.132', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:36:32');
INSERT INTO `ipaddress` VALUES ('422', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:21');
INSERT INTO `ipaddress` VALUES ('423', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:25');
INSERT INTO `ipaddress` VALUES ('424', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:26');
INSERT INTO `ipaddress` VALUES ('425', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:28');
INSERT INTO `ipaddress` VALUES ('426', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:29');
INSERT INTO `ipaddress` VALUES ('427', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 20:46:31');
INSERT INTO `ipaddress` VALUES ('428', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 21:27:29');
INSERT INTO `ipaddress` VALUES ('429', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-24 21:27:42');
INSERT INTO `ipaddress` VALUES ('430', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:40:57');
INSERT INTO `ipaddress` VALUES ('431', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:41:13');
INSERT INTO `ipaddress` VALUES ('432', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:41:30');
INSERT INTO `ipaddress` VALUES ('433', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:41:46');
INSERT INTO `ipaddress` VALUES ('434', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:42:02');
INSERT INTO `ipaddress` VALUES ('435', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:42:12');
INSERT INTO `ipaddress` VALUES ('436', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:42:15');
INSERT INTO `ipaddress` VALUES ('437', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:44:08');
INSERT INTO `ipaddress` VALUES ('438', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 18:45:31');
INSERT INTO `ipaddress` VALUES ('439', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 19:32:46');
INSERT INTO `ipaddress` VALUES ('440', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 19:32:55');
INSERT INTO `ipaddress` VALUES ('441', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:12:05');
INSERT INTO `ipaddress` VALUES ('442', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:32:15');
INSERT INTO `ipaddress` VALUES ('443', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:32:34');
INSERT INTO `ipaddress` VALUES ('444', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:32:35');
INSERT INTO `ipaddress` VALUES ('445', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:32:45');
INSERT INTO `ipaddress` VALUES ('446', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:32:46');
INSERT INTO `ipaddress` VALUES ('447', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:17');
INSERT INTO `ipaddress` VALUES ('448', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:20');
INSERT INTO `ipaddress` VALUES ('449', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:37');
INSERT INTO `ipaddress` VALUES ('450', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:39');
INSERT INTO `ipaddress` VALUES ('451', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:42');
INSERT INTO `ipaddress` VALUES ('452', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:33:46');
INSERT INTO `ipaddress` VALUES ('453', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:47:22');
INSERT INTO `ipaddress` VALUES ('454', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:50:35');
INSERT INTO `ipaddress` VALUES ('455', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 20:50:45');
INSERT INTO `ipaddress` VALUES ('456', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 23:22:10');
INSERT INTO `ipaddress` VALUES ('457', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 23:22:18');
INSERT INTO `ipaddress` VALUES ('458', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 23:22:25');
INSERT INTO `ipaddress` VALUES ('459', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 23:22:27');
INSERT INTO `ipaddress` VALUES ('460', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-25 23:44:32');
INSERT INTO `ipaddress` VALUES ('461', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 15:59:13');
INSERT INTO `ipaddress` VALUES ('462', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 15:59:49');
INSERT INTO `ipaddress` VALUES ('463', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:00:39');
INSERT INTO `ipaddress` VALUES ('464', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:02:46');
INSERT INTO `ipaddress` VALUES ('465', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:05');
INSERT INTO `ipaddress` VALUES ('466', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:10');
INSERT INTO `ipaddress` VALUES ('467', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:29');
INSERT INTO `ipaddress` VALUES ('468', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:33');
INSERT INTO `ipaddress` VALUES ('469', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:41');
INSERT INTO `ipaddress` VALUES ('470', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:03:46');
INSERT INTO `ipaddress` VALUES ('471', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:04:55');
INSERT INTO `ipaddress` VALUES ('472', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:08:17');
INSERT INTO `ipaddress` VALUES ('473', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:35:58');
INSERT INTO `ipaddress` VALUES ('474', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:46:05');
INSERT INTO `ipaddress` VALUES ('475', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:46:21');
INSERT INTO `ipaddress` VALUES ('476', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:46:51');
INSERT INTO `ipaddress` VALUES ('477', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 16:50:42');
INSERT INTO `ipaddress` VALUES ('478', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:04:37');
INSERT INTO `ipaddress` VALUES ('479', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:04:42');
INSERT INTO `ipaddress` VALUES ('480', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:15:13');
INSERT INTO `ipaddress` VALUES ('481', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:19:22');
INSERT INTO `ipaddress` VALUES ('482', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:28:26');
INSERT INTO `ipaddress` VALUES ('483', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 17:33:46');
INSERT INTO `ipaddress` VALUES ('484', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:40:39');
INSERT INTO `ipaddress` VALUES ('485', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:41:28');
INSERT INTO `ipaddress` VALUES ('486', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:41:40');
INSERT INTO `ipaddress` VALUES ('487', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:44:31');
INSERT INTO `ipaddress` VALUES ('488', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:47:31');
INSERT INTO `ipaddress` VALUES ('489', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:48:57');
INSERT INTO `ipaddress` VALUES ('490', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:49:00');
INSERT INTO `ipaddress` VALUES ('491', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:49:15');
INSERT INTO `ipaddress` VALUES ('492', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:49:36');
INSERT INTO `ipaddress` VALUES ('493', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:49:39');
INSERT INTO `ipaddress` VALUES ('494', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:50:02');
INSERT INTO `ipaddress` VALUES ('495', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:50:05');
INSERT INTO `ipaddress` VALUES ('496', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:50:35');
INSERT INTO `ipaddress` VALUES ('497', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:51:46');
INSERT INTO `ipaddress` VALUES ('498', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:51:50');
INSERT INTO `ipaddress` VALUES ('499', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:54:31');
INSERT INTO `ipaddress` VALUES ('500', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:54:37');
INSERT INTO `ipaddress` VALUES ('501', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:54:41');
INSERT INTO `ipaddress` VALUES ('502', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 18:54:45');
INSERT INTO `ipaddress` VALUES ('503', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 19:03:41');
INSERT INTO `ipaddress` VALUES ('504', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 19:03:54');
INSERT INTO `ipaddress` VALUES ('505', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 19:04:43');
INSERT INTO `ipaddress` VALUES ('506', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 19:06:11');
INSERT INTO `ipaddress` VALUES ('507', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:21:52');
INSERT INTO `ipaddress` VALUES ('508', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:27:16');
INSERT INTO `ipaddress` VALUES ('509', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:29:22');
INSERT INTO `ipaddress` VALUES ('510', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:36:05');
INSERT INTO `ipaddress` VALUES ('511', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:48:17');
INSERT INTO `ipaddress` VALUES ('512', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:52:28');
INSERT INTO `ipaddress` VALUES ('513', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:52:30');
INSERT INTO `ipaddress` VALUES ('514', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:53:23');
INSERT INTO `ipaddress` VALUES ('515', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 21:55:57');
INSERT INTO `ipaddress` VALUES ('516', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:12:14');
INSERT INTO `ipaddress` VALUES ('517', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:12:21');
INSERT INTO `ipaddress` VALUES ('518', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:12:33');
INSERT INTO `ipaddress` VALUES ('519', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:12:45');
INSERT INTO `ipaddress` VALUES ('520', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:13:09');
INSERT INTO `ipaddress` VALUES ('521', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:13:57');
INSERT INTO `ipaddress` VALUES ('522', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:14:01');
INSERT INTO `ipaddress` VALUES ('523', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:17:55');
INSERT INTO `ipaddress` VALUES ('524', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:19:40');
INSERT INTO `ipaddress` VALUES ('525', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:46:12');
INSERT INTO `ipaddress` VALUES ('526', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:46:13');
INSERT INTO `ipaddress` VALUES ('527', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:47:59');
INSERT INTO `ipaddress` VALUES ('528', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-26 22:50:14');
INSERT INTO `ipaddress` VALUES ('529', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-27 05:46:02');
INSERT INTO `ipaddress` VALUES ('530', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-27 05:46:21');
INSERT INTO `ipaddress` VALUES ('531', '127.0.0.1', '未分配或者内网IP---内网IP-内网IP-内网IP', '2017-09-27 05:49:51');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞编号',
  `viewStory_id` bigint(20) unsigned NOT NULL COMMENT '景点故事编号',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES ('27', '5', 'guest');
INSERT INTO `likes` VALUES ('37', '3', 'guest');
INSERT INTO `likes` VALUES ('40', '4', 'guest');
INSERT INTO `likes` VALUES ('41', '12', 'admin');
INSERT INTO `likes` VALUES ('43', '13', 'admin');
INSERT INTO `likes` VALUES ('45', '7', 'guest');
INSERT INTO `likes` VALUES ('50', '1', 'guest');

-- ----------------------------
-- Table structure for orderActivity
-- ----------------------------
DROP TABLE IF EXISTS `orderActivity`;
CREATE TABLE `orderActivity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `userName` varchar(20) NOT NULL COMMENT '下单用户',
  `realName` varchar(10) NOT NULL COMMENT '真实姓名',
  `phoneNumber` bigint(20) unsigned NOT NULL COMMENT '手机号码',
  `activityType` varchar(30) NOT NULL COMMENT '体验活动类型',
  `checkInDate` varchar(10) NOT NULL COMMENT '体验日期',
  `review` varchar(1) NOT NULL COMMENT '待审核订单',
  `passOrNotPass` varchar(100) NOT NULL COMMENT '审核理由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderActivity
-- ----------------------------
INSERT INTO `orderActivity` VALUES ('2', 'guest', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('3', 'guest', '张三', '17858661723', '下地劳作', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('4', 'guest', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('5', 'guest', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('6', 'guest', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('7', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('8', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('9', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('10', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('11', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('12', 'admin', '胡晓磊', '17858661743', '竹间挖笋', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('14', 'test', '张三', '17856996369', '环村骑行', '2017-09-27', '1', ' ');
INSERT INTO `orderActivity` VALUES ('15', 'admin', '胡晓磊', '17858661743', '手工竹编', '2017-09-27', '1', ' ');

-- ----------------------------
-- Table structure for orderXiangJu
-- ----------------------------
DROP TABLE IF EXISTS `orderXiangJu`;
CREATE TABLE `orderXiangJu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `userName` varchar(20) NOT NULL COMMENT '下单用户',
  `realName` varchar(10) NOT NULL COMMENT '真实姓名',
  `phoneNumber` bigint(20) unsigned NOT NULL COMMENT '手机号码',
  `houseType` varchar(30) NOT NULL COMMENT '预定乡居类型',
  `checkInDate` varchar(10) NOT NULL COMMENT '入住日期',
  `checkOutDate` varchar(10) NOT NULL COMMENT '退房日期',
  `checkInNumber` int(10) unsigned NOT NULL COMMENT '入住人数',
  `requirement` varchar(20) DEFAULT NULL COMMENT '其他要求',
  `review` varchar(1) NOT NULL COMMENT '待审核订单',
  `passOrNotPass` varchar(100) NOT NULL COMMENT '审核理由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderXiangJu
-- ----------------------------
INSERT INTO `orderXiangJu` VALUES ('4', 'admin', '李四', '15965263696', '茅庐穹顶房', '2017-09-27', '2017-09-30', '6', '', '1', ' ');
INSERT INTO `orderXiangJu` VALUES ('5', 'admin', '张三', '15965263696', '绿色农居房', '2017-09-27', '2017-09-30', '6', '', '1', ' ');
INSERT INTO `orderXiangJu` VALUES ('6', 'admin', '李四', '15965263696', '茅庐穹顶房', '2017-09-27', '2017-09-30', '6', '', '1', ' ');
INSERT INTO `orderXiangJu` VALUES ('19', 'guest', '张三', '12345678909', '绿色农居房', '2017-09-27', '2017-09-29', '2', '', '0', ' ');
INSERT INTO `orderXiangJu` VALUES ('20', 'guest', '李四', '12345678907', '自然竹房', '2017-09-27', '2017-09-29', '2', '', '0', ' ');

-- ----------------------------
-- Table structure for replyComment
-- ----------------------------
DROP TABLE IF EXISTS `replyComment`;
CREATE TABLE `replyComment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复评论编号',
  `replyCommentUserName` varchar(20) NOT NULL COMMENT '回复评论用户',
  `parentCommentId` bigint(20) unsigned NOT NULL COMMENT '父评论的编号',
  `replyContent` varchar(200) NOT NULL COMMENT '回复内容',
  `commentTime` varchar(20) NOT NULL COMMENT '评论时间',
  `state` varchar(2) NOT NULL COMMENT '评论状态',
  `commentType` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replyComment
-- ----------------------------
INSERT INTO `replyComment` VALUES ('1', 'admin', '1', 'replytest', '2017-09-16', '1', 'view');
INSERT INTO `replyComment` VALUES ('2', 'admin', '2', 'replytest2', '2017-09-16', '1', 'view');
INSERT INTO `replyComment` VALUES ('6', 'guest', '20', 'test', '2017-09-22 16:49:13', '1', 'view');
INSERT INTO `replyComment` VALUES ('7', 'guest', '27', 'xlh', '2017-09-22 16:54:17', '1', 'view');
INSERT INTO `replyComment` VALUES ('8', 'guest', '29', 'testreply', '2017-09-22 20:19:05', '1', 'experience');
INSERT INTO `replyComment` VALUES ('9', 'guest', '35', 'hello', '2017-09-22 20:24:58', '1', 'experience');
INSERT INTO `replyComment` VALUES ('10', 'guest', '19', 'test', '2017-09-22 20:34:08', '1', 'story');
INSERT INTO `replyComment` VALUES ('11', 'admin', '36', 'test', '2017-09-22 20:35:55', '1', 'story');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `headImageUrl` varchar(200) NOT NULL COMMENT '头像地址',
  `sex` varchar(2) NOT NULL COMMENT '性别',
  `pwd` varchar(20) NOT NULL COMMENT '密码',
  `conninfo` varchar(60) NOT NULL COMMENT '联系方式',
  `introduce` text NOT NULL COMMENT '自我介绍',
  `ifadmin` varchar(2) NOT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '/upload/headImages/headImage1.jpg?t=640150452', '0', 'admin', '12345678910', '你好。世界！', '1');
INSERT INTO `users` VALUES ('2', 'guest', '/upload/headImages/default.jpg', '2', 'guest', '1234567891', 'Hello', '0');
INSERT INTO `users` VALUES ('3', 'guest1', '/upload/headImages/headImage3.jpg?t=623725651', '2', 'guest1', '12345678910', '你好。', '1');
INSERT INTO `users` VALUES ('4', 'test', '/upload/headImages/default.jpg', '0', 'test', '12345678910', 'Hello,World!', '0');

-- ----------------------------
-- Table structure for viewStory
-- ----------------------------
DROP TABLE IF EXISTS `viewStory`;
CREATE TABLE `viewStory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '景点编号',
  `user` varchar(20) NOT NULL COMMENT '发表故事的用户',
  `viewTitle` varchar(20) NOT NULL COMMENT '景点标题',
  `introduction` varchar(200) NOT NULL COMMENT '景点介绍',
  `content` text NOT NULL COMMENT '景点的内容',
  `browsingTimes` bigint(20) unsigned NOT NULL COMMENT '浏览次数',
  `likes` bigint(20) unsigned NOT NULL COMMENT '点赞次数',
  `imageUrl` varchar(200) NOT NULL COMMENT '封面图片路径',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加的时间',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `display` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewStory
-- ----------------------------
INSERT INTO `viewStory` VALUES ('1', 'admin', '尚书文化园', '尚书文化园座落于中心村区域，占地约40亩，是一个集观光游览、朝拜纪念、文化体验、学生教育、休闲娱乐等功能为一体的文化观光型景点...', '<p style=\"text-align:center\"><img src=\"../upload/images/1504078675753031431.jpg\" alt=\"1504078675753031431.jpg\"/></p><p style=\"text-indent: 30px;\"><span style=\"margin: 20px auto; padding: 0px; width: 735.438px; text-align: left; font-family: 微软雅黑,Verdana,&quot;Lantinghei SC&quot;,&quot;Hiragino Sans GB&quot;,&quot;Microsoft Yahei&quot;,Helvetica,arial,宋体,sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n &nbsp; &nbsp;进入尚书圩村，柏油路穿行于青青幽篁山间，绵延数十里的竹乡风情映入眼帘。车行山水间半小时，一座高约10米的花岗岩石牌坊耸立村口，石牌坊正中央镌刻&quot;尚书揽胜&quot;四个大字遒劲有力。穿过石牌坊前行数十米，眼前豁然开朗，处在半山坳的尚书圩村，层次分明地展现在眼前，层楼叠榭，景色雅致。</span></p><p style=\"text-indent:30px;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">尚书文化园座落于中心村区域，占地约40亩，是一个集观光游览、朝拜纪念、文化体验、学生教育、休闲娱乐等功能为一体的文化观光型景点。整个文化园座南朝北，背靠状元山，面向琵琶山。两山远观形如&quot;祖&quot;字，有&quot;吉祥之源&quot;之意。 &nbsp;</span></p><p style=\"margin: 20px auto; padding: 0px; width: 735.438px; text-align: left; font-family: 微软雅黑,Verdana,&quot;Lantinghei SC&quot;,&quot;Hiragino Sans GB&quot;,&quot;Microsoft Yahei&quot;,Helvetica,arial,宋体,sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://localhost:8888/sxw/themes/default/images/spacer.gif\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1506085294506022968.jpg\" title=\"1506085294506022968.jpg\" alt=\"j2.jpg\"/></p><p style=\"text-align:center\"><br/></p><p style=\"text-indent:30px;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">在入口的尚书阁，依次有九曲桥、金榜门、尚书文化展示馆等富有特色的文化建筑。展示馆内精美的蜡像和励志、传奇的故事，人文并茂，是你视觉和心灵的饕鬄盛宴。古时，读书人在金榜门前对着尚书像，点香祭拜、谢师感恩、许下心愿的习俗，直至今日，人们依然虔诚。顺着曲折、励志的&quot;求知路&quot;，可以直达文昌阁。文昌阁建在状元山的美女弦瀑布潭边，依山傍水，天时地利！文昌阁供奉的先师孔子、文曲星和文殊菩萨三尊塑像。据说，在这里，虔诚的祈祷，就会得到这他们的眷顾。</span></p><p style=\"text-align:center\"><img src=\"../upload/images/1506085369362013080.jpg\" title=\"1506085369362013080.jpg\" alt=\"j3.jpg\"/></p><p style=\"text-indent: 30px;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">拜过文昌阁，来到瀑布潭边，举头仰望，你就会感叹大自然的鬼斧神工！一条洁白哈达般的瀑布从状元山倾泻而下，宛若镶嵌在绿玉中的闪闪发光的钻石！顺着瀑布旁的台阶，登状元山，探寻瀑布源头，一览神秘的&quot;天井湖&quot;。领略过位于群山之巅的蓝宝石-&quot;天井湖&quot;后，海拔更高的状元山顶的状元阁就一定要去观膜一番了。状元阁前的状元廊，有着：&quot;走一走状元廊、高中状元就是我&quot;的说法，敲一敲廊前的&quot;状元钟&quot;便可&quot;一鸣天下知&quot;！村里计划在状元山顶修建一个观景台，到时，在这里就可以和朋友一起，一边品着状元山白茶，一边观赏乡村的美丽风光了！&gt;</span></p>', '316', '1', '/upload/images/viewStory201709232229242791.jpg', '2017-08-24 19:31:26', 'view', '1');
INSERT INTO `viewStory` VALUES ('2', 'admin', '状元山', '金榜题名...', '<p style=\"text-align:center\"><img src=\"../upload/images/1504079302440024641.jpeg\" title=\"1504079302440024641.jpeg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">有\"金榜题名\"的寓意</span></p><p><br/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504079302457082324.jpg\" title=\"1504079302457082324.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">也可当休闲爬爬山</span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504079302489016188.jpeg\" title=\"1504079302489016188.jpeg\" alt=\"1504079302489016188.jpeg\" width=\"630\" height=\"600\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">看看竹林，在竹笋冒出时，可挖挖</span></p>', '33', '0', '/upload/images/viewStory201709232231262282.jpg', '2017-08-24 10:15:30', 'view', '1');
INSERT INTO `viewStory` VALUES ('3', 'admin', '向日葵基地', '向日葵花海...', '<p style=\"text-align:center\"><img src=\"../upload/images/1504079530212088844.jpeg\" title=\"1504079530212088844.jpeg\" alt=\"j9.jpeg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">夏天是向日葵盛开的季节</span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504079561906017130.jpg\" title=\"1504079561906017130.jpg\" alt=\"1504079561906017130.jpg\" width=\"287\" height=\"251\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">前来的游客们可以尽情的去花海中拍照。</span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504079565842072131.jpg\" title=\"1504079565842072131.jpg\" alt=\"1504079565842072131.jpg\" width=\"440\" height=\"273\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', '99', '1', '/upload/images/viewStory201709232231539974.jpg', '2017-08-31 22:31:53', 'view', '1');
INSERT INTO `viewStory` VALUES ('4', 'admin', '开心农场', '农场欢乐...', '<p style=\"text-align: center;\"><img src=\"../upload/images/1504079716866086147.jpg\" title=\"1504079716866086147.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">我们的趣味摸鱼池，撩起裤腿，拿起渔网，享受在捕鱼的乐趣中。</span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504079716875002464.jpg\" title=\"1504079716875002464.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">摸鱼池旁边的是DIY教室，游客们可以自己做灯笼、绣香包。</span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504079716886091839.jpg\" title=\"1504079716886091839.jpg\"/></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504079716923024784.jpg\" title=\"1504079716923024784.jpg\"/></p><p><br/></p>', '150', '1', '/upload/images/viewStory201709232232173321.jpg', '2017-09-21 22:32:17', 'view', '1');
INSERT INTO `viewStory` VALUES ('5', 'admin', '瓜果长廊', '999米瓜果长廊，抬头可以看到长廊上爬有各种瓜果藤蔓...', '<p style=\"text-align: center;\"><img src=\"../upload/images/1504079858867028823.jpg\" title=\"1504079858867028823.jpg\" alt=\"1504079858867028823.jpg\" width=\"285\" height=\"143\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">999米瓜果长廊</span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504079858954016973.jpg\" title=\"1504079858954016973.jpg\" alt=\"1504079858954016973.jpg\" width=\"416\" height=\"133\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">抬头可以看到长廊上爬有各种瓜果藤蔓，有葫芦、南瓜，形态各异，玲琅满目。</span></span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504079858938048025.jpeg\" title=\"1504079858938048025.jpeg\"/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><br/></p><p><br/></p>', '30', '1', '/upload/images/viewStory201709232230189263.jpg', '2017-08-23 10:16:14', 'view', '1');
INSERT INTO `viewStory` VALUES ('6', 'admin', '美女弦瀑布', '来看看你美不美...', '<p style=\"text-align:center\"><img src=\"../upload/images/1504080076567099491.jpeg\" title=\"1504080076567099491.jpeg\" alt=\"1504080076567099491.jpeg\" width=\"359\" height=\"511\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">因瀑布前有一美女塑像而</span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504080147910087350.jpg\" title=\"1504080147910087350.jpg\" alt=\"1504080147910087350.jpg\" width=\"280\" height=\"169\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">来看看你美不美...</span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504080147980008214.jpg\" title=\"1504080147980008214.jpg\" alt=\"1504080147980008214.jpg\" width=\"281\" height=\"167\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span><br/></p><p><br/></p>', '55', '0', '/upload/images/viewStory201709232232423660.jpg', '2017-09-26 10:07:56', 'view', '1');
INSERT INTO `viewStory` VALUES ('7', 'admin', '白茶文化园', '安吉白茶（白叶茶）是一种珍罕的变异茶种，属于\"低温敏感型\"茶叶，其阈值约在23℃。茶树产\"白茶\"时间很短，通常仅一个月左右...', '<p style=\"text-align: center;\"><img src=\"../upload/images/viewStory201709222111089651.jpg\" alt=\"viewStory201709222111089651.jpg\"/></p><p style=\"text-indent:30px;\"><span style=\"background-color: rgb(255, 255, 255); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px;\">安吉白茶（白叶茶）是一种珍罕的变异茶种，属于\"低温敏感型\"茶叶，其阈值约在23℃。茶树产\"白茶\"时间很短，通常仅一个月左右。</span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504080291451066467.jpg\" title=\"1504080291451066467.jpg\" width=\"275\" height=\"222\" alt=\"1504080291451066467.jpg\"/></p><p style=\"text-indent:30px;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">以原产地浙江安吉为例，春季，因叶绿素缺失，在清明前萌发的嫩芽为白色安吉白茶加工安吉白茶加工。在谷雨前，色渐淡，多数呈玉白色。雨后至夏至前，逐渐转为白绿相间的花叶。至夏，芽叶恢复为全绿，与一般绿茶无异。正因为神奇的安吉白茶是在特定的白化期内采摘、加工和制作的，所以茶叶经瀹泡后，其叶底也呈现玉白色，这是安吉白茶特有的性状。</span></p><p style=\"text-align: center;\"><img src=\"../upload/images/1506085935310059017.jpg\" title=\"1506085935310059017.jpg\" alt=\"j24.jpg\"/></p><p><br/></p>', '70', '1', '/upload/images/viewStory201709222111089651.jpg', '2017-09-23 10:34:27', 'view', '1');
INSERT INTO `viewStory` VALUES ('8', 'admin', '状元山——我们要征服你', '就像这状元山，虽然高但是这里的人民总能征服它，同样我们也征服它了...', '<p style=\"text-align: center;\"><img src=\"../upload/images/1504079245571012993.jpeg\" alt=\"1504079245571012993.jpeg\"/></p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-align: left; font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);text-indent: 30px;\">今天是7月15日，是我们来到安吉的第四天，一大早我们所有人都整装待发，向着状元山进发。大家精神都很饱满，心情也有些激动，在队长的带领下，我们出发了。首先，大家来到了\"金榜题名\"的状元阁，虽然我们都已经参加过高考了，但是大家还是希望自己以后的道路能够顺利，所以大家都默默的进行了许愿。于是我们又向山上进发，经过一段蜿蜒曲折的阶梯，我们来到了文昌阁，来到了瀑布的最下面，虽然没有水，但是我们还是见证了自然的神奇。状元山虽然有点高，而且大家都不太锻炼所以好多人都觉得很累，但是我们最终还是坚持爬到山顶。在我们爬到半山腰的时候遇到了下山的两位老奶奶，于是我赶快上前去扶着老奶奶。老奶奶说她眼睛看不见了，但是还得背着好多菜籽去山下榨油。当我听到这个的时候，眼眶有点湿润了，奶奶年纪都这么大了，还得爬这么高的山，这么陡的山。住在山上的老奶奶们为了自己的家操劳了一辈子，奶奶们好辛苦。</p><p style=\"text-align:center\"><img src=\"../upload/images/1504079302457082324.jpg\" alt=\"1504079302457082324.jpg\"/></p><p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">最后，大家终于爬到了山顶，看到了不一样的风景。虽然这个过程很艰辛，困难重重，但是在大家的坚持努力下，我们成功了。今天我们体验了自然的美丽，又锻炼了自己身体。可是大家的锻炼还是很缺乏的，身体锻炼不够，这也是我们中国青少年普遍存在的问题，所以我们以后要多多锻炼身体，因为少年强，则中国强。我们是祖国的未来，民族的复兴也要靠我们来完成。</span></p><p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"../upload/images/1504079302489016188.jpeg\" alt=\"1504079302489016188.jpeg\" width=\"463\" height=\"600\"/></span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">来安吉的这么多天，我们感受到了这里村民的热情，也感受到了这里村民的勤劳，简朴与好学。就像这状元山，虽然高但是这里的人民总能征服它，同样我们也征服它了。</span></p><p><br/></p>', '17', '0', '/upload/images/viewStoryimage201708301643417124.jpeg', '2017-08-23 11:12:55', 'story', '1');
INSERT INTO `viewStory` VALUES ('9', 'admin', '尚书圩村', '尚书圩村位于孝源街道西北部，东邻皈山场村，南接白杨村，西邻上堡村，距离县城18公里...', '<p style=\"text-align: center;\"><img src=\"../upload/images/1504082756815092473.jpg\" title=\"1504082756815092473.jpg\"/></p><p style=\"text-align: center;\"><img src=\"../upload/images/1504082756869082415.jpg\" title=\"1504082756869082415.jpg\" width=\"662\" height=\"250\"/></p><p style=\"text-align: center;\"><img src=\"../upload/images/1506169963459010099.jpg\" title=\"1506169963459010099.jpg\" alt=\"j27.jpg\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">尚书圩村位于孝源街道西北部，东邻皈山场村，南接白杨村，西邻上堡村，距离县城18公里。中央领导人陈锡文、孙家正等曾前来该村视察。全村总面积5.94平方公里，其中耕地面积641亩，山林面积7200亩，其中毛竹林面积670亩，辖3个自然村，3个村民小组，有住户312户，总人口1085人，其中，党员55人。2013年，全村集体经营收入78万元，人均纯收入22456元。该村主导产业有毛竹、白茶等。该村先后获浙江省文明村、全国生态文化村、浙江省农村基层党风廉政建设示范村、浙江省非物质文化遗产旅游景区（民俗文化旅游村）、国家级AAA级景区等荣誉称号。该村以\"弘扬尚书文化，发展休闲经济\"为目标，2008年成功创建美丽乡村，走在了\"中国美丽乡村\"建设的前列，是安吉县首批美丽乡村\"精品示范村\"。近些年来，该村道路硬化9.2公里，绿化近1万平方米，建有公共厕所8处，集中式污水处理池4个，分散式污水处理池286个，90%以上农户建有统一的地埋式污水处理设施。该村建有村综合服务中心、村级劳动保障平台、文化公园、休闲长廊、篮球场、老年活动中心、DIY教室、摸鱼池等公共基础设施，以及文化大礼堂、文化展示馆、葵花园、瓜果长廊、文昌阁、状元阁、开心农场、美女弦瀑布等人文景观。该村深度挖掘尚书文化内涵，举办尚书文化节、尚书葵花文化节、金榜题名节、成人礼等大型文化活动，村文艺团队\"尚书花轿\"参加过第六届浙江省非物质文化遗产传统音乐舞蹈精品汇演、安吉县融杭活动等演出。同时，该村抓住机遇，巧借平台，促进村级经济转型升级，发展乡村休闲旅游，深化美丽乡村精品示范区建设和经营，闯出了一条\"因地制宜，自主创业，共同致富\"的经营之路。</span></p>', '67', '0', '/upload/images/viewStoryimage201708301646368569.jpg', '2017-08-23 10:41:39', 'story', '1');
INSERT INTO `viewStory` VALUES ('10', 'admin', '阳光向日葵-花田微电影', '虽已经不是向日葵盛开的时节，但开心农场的向日葵花田却丝毫不失美意', '<p style=\"text-align:center\"><br/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><img src=\"../upload/images/viewStoryimage201708301650134431.jpg\" alt=\"viewStoryimage201708301650134431.jpg\" title=\"viewStoryimage201708301650134431.jpg\" width=\"702\" height=\"299\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">7月13日上午8时，湖州师院社管学院安吉调研队摄影组到达皈山乡尚书村开心农场取景进行微电影拍摄工作。</span></p><p><br/></p><p style=\"text-align:center\"><img src=\"../upload/images/1506170079344018531.jpg\" title=\"1506170079344018531.jpg\" alt=\"j9.jpg\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">天朗气清，青山掩映，虽已经不是向日葵盛开的时节，但开心农场的向日葵花田却丝毫不失美意。调研队摄影组以此为背景拍摄了微电影中的重要剧情。微电影负责人表示：\"尚书村景色宜人，有较多适宜取景的场地，我们团队会尽力录入尚书村的特色风情\"、\"美丽的地方不应该被忽略，更不该被遗忘\"。</span></p><p><br/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504082918418084770.jpeg\" title=\"1504082918418084770.jpeg\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">据悉该调研团摄影组选取皈山乡尚书村部分幽美的山水风景为拍摄场地，以乡村爱情故事为题材，大力渲染皈山清丽风景与当地特色等，为皈山乡旅游业的发展做宣传，以达成本次调研团的目的之一。除此之外调研团队还将通过拍摄风景照等途径开展宣传工作。</span></p><p><br/></p>', '27', '0', '/upload/images/viewStoryimage201708301650134431.jpg', '2017-08-23 10:41:01', 'story', '1');
INSERT INTO `viewStory` VALUES ('11', 'admin', '亲近自然——呼吸乡土空气', '路边的花花草草，雨后更显娇艳，淳朴的乡村气息...', '<p style=\"text-align: center;\"><img src=\"../upload/images/viewStoryimage201708301654222004.jpg\" alt=\"viewStoryimage201708301654222004.jpg\" width=\"700\" height=\"520\" title=\"viewStoryimage201708301654222004.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">烟雾缭绕的青山绿水，天然氧吧。</span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083332704033869.jpg\" title=\"1504083332704033869.jpg\" width=\"700\" height=\"808\" alt=\"1504083332704033869.jpg\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083332723055047.jpg\" title=\"1504083332723055047.jpg\" width=\"700\" height=\"1168\" alt=\"1504083332723055047.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">路边的花花草草，雨后更显娇艳，淳朴的乡村气息.</span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083332741012260.jpg\" title=\"1504083332741012260.jpg\" width=\"720\" height=\"1152\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083332936054671.jpg\" title=\"1504083332936054671.jpg\" width=\"720\" height=\"1149\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083332955002026.jpg\" title=\"1504083332955002026.jpg\" width=\"724\" height=\"1144\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083333091027359.jpg\" title=\"1504083333091027359.jpg\" width=\"718\" height=\"1133\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083333101031513.jpg\" title=\"1504083333101031513.jpg\" width=\"709\" height=\"483\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', '8', '0', '/upload/images/viewStoryimage201708301654222004.jpg', '2017-08-23 16:57:58', 'story', '1');
INSERT INTO `viewStory` VALUES ('12', 'admin', '美丽尚书圩村游', '清明小长假，就想远离城市的喧闹，安静的找个小村落...', '<p style=\"text-align:center\"><img src=\"../upload/images/viewStoryimage201708301700018957.jpg\" alt=\"viewStoryimage201708301700018957.jpg\" width=\"689\" height=\"432\" title=\"viewStoryimage201708301700018957.jpg\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);text-indent: 30px;\">清明小长假，就想远离城市的喧闹，安静的找个小村落，带女儿住一晚，刚好女儿又想去Kitty猫乐园，就在安吉，于是就决定玩好后住一晚，走杭长高速自驾来此。尚书圩村（又称尚书村），位于安吉县皈山乡的美丽村庄，是浙皖西北交界处的一个小村落，村子不大，1000余村民日出而作日落而息，千百年来，一层又一层的现代元素不断影响着小山村，波澜不惊的生活开始了新的变迁，恬静悠闲的山水被赋予了新的生命，然而，不曾改变的是山里人对\"和谐振邦\"尚书文化的丰富和传承！喜欢这里，因为这个季节，这里有成片的油菜花；有成片的草籽花；有青山绿水；有郁郁竹林；有淡淡茶香。</span></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083689628025896.jpg\" title=\"1504083689628025896.jpg\" width=\"706\" height=\"1134\" alt=\"1504083689628025896.jpg\"/></p><p style=\"text-align: center\"><br/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083689637063090.jpg\" title=\"1504083689637063090.jpg\" width=\"718\" height=\"490\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083689655059111.jpg\" title=\"1504083689655059111.jpg\" width=\"723\" height=\"496\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083689770013632.jpg\" title=\"1504083689770013632.jpg\" width=\"700\" height=\"480\"/></p><p style=\"text-align:center\"><img src=\"../upload/images/1504083689911007087.jpg\" title=\"1504083689911007087.jpg\" width=\"719\" height=\"1139\"/></p><p><span style=\"font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span><br/></p><p><br/></p>', '93', '1', '/upload/images/viewStoryimage201708301700018957.jpg', '2017-08-27 10:39:51', 'story', '1');
INSERT INTO `viewStory` VALUES ('13', 'admin', '悠闲生活', '走慢点好吗？这满路的野花，我还没有看够呢...', '<p style=\"text-align:center\"><img src=\"../upload/images/viewStory201709231217589393.jpg\" alt=\"viewStory201709231217589393.jpg\"/></p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">走慢点好吗？这满路的野花，我还没有看够呢，我还有好多话要跟它们说，看它们多友善，笑容多迷人。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">你说这几天全都听我的，我说往东，你不往西；我说前进，你不后退。我只想你陪我一起走走看看。我走时，你跟着我走，我蹲时，你跟着我蹲；我累时，你让我靠着。俺开心了，今晚帮你做饭，不用你洗碗。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">你说你对花儿没兴趣，只是喜欢看我望着花儿时的甜笑。我说如果你是一朵花，我就天天对着你笑，你听后，马上将自己笑成一朵花，我忍不住吻向你可爱的脸……</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">亲爱的，把我们的爱情迁移来这里好吗？这里没有繁杂的工作，没有无谓的应酬，只有你和我。把我们的爱情种在山上田野上吧，让它漫山遍野地生长。把我们的爱情晾晒在蓝天白云下吧，让它轻松自然地飘扬。我们一起看花，一起钓鱼，一起煮饭，一起漫步在夕阳下晨曦下。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">我喜欢你孩子般的纯净笑容，像我刚认识你时一样。那时，没有世俗的尘染，没有势利的打扰。那时，我们的爱情像一朵花，每天绽放迷人的光彩，每天散发醉人的气息。其实，我们还是那么相爱，甚至比以前更离不开彼此。只是烦琐的生活、复杂的社会藏起了你的笑容。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">我靠在你的胸膛上，你拥着我的肩，脚下的野花偷看我娇媚的笑容，自愧不如地摇着头。当然了，有爱的女人最美，花花们就羡慕吧。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">我们收了几把青菜，手拉手，哼着熟悉的歌儿回家去。我们无视路人奇异的目光，像快乐的孩子。水龙头旁，我洗菜，你拿着盘子装菜；炉火旁，你炒菜，我在你背后环抱着你。我们一起煮出来的饭菜特别香。</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">夜里，没有电视，没有电脑。我们搬一张藤椅，坐在天台上。我坐在你的大腿上，一起看月亮数星星。你说那颗最亮的星星就是你眼中的我，永远照亮你回家的路。融融月色下，我们爱的呢喃是最美妙的音乐，唯你唯我听懂。美丽的夜晚，只想你停在此刻……</p><p style=\"margin: 20px auto; padding: 0px; width: 100%; text-indent: 30px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, &quot;Lantinghei SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, Helvetica, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: left;\">回忆着快乐的时光，心跟一些情景纠缠上了，感觉此时语言有点多余，或许美好的回忆最适宜在心中默念。那就不言语，在空白处一直想，尽情回味吧……</p><p style=\"text-align: center;\"><br/></p>', '60', '1', '/upload/images/viewStory201709231217589393.jpg', '2017-09-23 11:14:14', 'story', '1');

-- ----------------------------
-- Table structure for xiangju
-- ----------------------------
DROP TABLE IF EXISTS `xiangju`;
CREATE TABLE `xiangju` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '乡居编号',
  `roomTitle` varchar(30) NOT NULL COMMENT '房间类型',
  `feature` varchar(100) NOT NULL COMMENT '乡居特点',
  `imageUrl` text NOT NULL COMMENT '图片地址',
  `price` int(10) unsigned NOT NULL COMMENT '房间价格',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加的时间',
  `display` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiangju
-- ----------------------------
INSERT INTO `xiangju` VALUES ('1', '绿色农居房', '1. 玻璃采用双层中空玻璃，外墙用保温涂料\r\n2. 冬暖夏凉，与室外温度始终相差5摄氏度\r\n3. 安全舒适，绿色静谧\r\n', '/upload/images/xiangju201708301404115390.jpg;/upload/images/xiangju201708301404118898.jpg;/upload/images/xiangju201708301404113011.jpg;/upload/images/xiangju201708301404117617.jpg;/upload/images/xiangju201708301404111282.jpg;', '398', '2017-08-30 14:04:11', '1');
INSERT INTO `xiangju` VALUES ('2', '自然竹房', '1. 保温、隔音性能好\r\n2. 空气中都是自然的味道\r\n3. 适于居住，绿色静谧', '/upload/images/xiangju201708301404586484.jpg;/upload/images/xiangju201708301404581001.jpg;/upload/images/xiangju201708301404586147.jpg;/upload/images/xiangju201708301404585335.jpg;/upload/images/xiangju201708301404581582.jpg;', '298', '2017-08-30 14:04:58', '1');
INSERT INTO `xiangju` VALUES ('3', '茅庐穹顶房', '1. 房间造型别致\r\n2. 有茅草屋的装饰\r\n3. 复古有趣', '/upload/images/xiangju201708301405388305.jpg;/upload/images/xiangju201708301405383449.jpg;/upload/images/xiangju201708301405385423.jpg;/upload/images/xiangju201708301405384352.jpg;/upload/images/xiangju201708301405386720.jpg;', '498', '2017-08-30 14:05:38', '1');
