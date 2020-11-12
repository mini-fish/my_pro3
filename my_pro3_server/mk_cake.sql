#设置客户端连接服务器端的编码格式为utf8
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS mk_cake;
#创建数据库，设置编码为utf8
CREATE DATABASE mk_cake CHARSET=UTF8;
#进入数据库
USE mk_cake;

CREATE TABLE carousel (
  cid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO carousel(cid, src, title) VALUES
('1', 'img/index/carousel1.jpg', '轮播图片1'),
('2', 'img/index/carousel2.jpg', '轮播图片2');



CREATE TABLE flower (
  fid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO flower (fid, src, title,  price, href) VALUES
('1','img/list/2012527115160.jpg','12朵白玫瑰/浪漫','182','1'),
('2','img/list/2008121711464746.jpg','19朵粉玫瑰/浪漫与激情','213','2'),
('3','img/list/20090208110019937.gif','9朵白玫瑰/冬日恋歌','149','3'),
('4','img/list/20081030055750453.jpg','9朵红玫瑰/天使的祝福','182','4');

CREATE TABLE cake (
  cid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO cake (cid, src, title, price, href) VALUES
('1','img/list/20118232235400.gif','水果蛋糕/夜来香(8寸)','186','1'),
('2','img/list/20125211532560.jpg','欧式蛋糕/尊贵典雅','172','2'),
('3','img/list/20090313105524386.jpg','生日蛋糕/生肖蛋糕','198','3'),
('4','img/list/20090313105259168.jpg','生日蛋糕/寻梦园','198','4');


CREATE TABLE gift (
  gid int(11) NOT NULL PRIMARY KEY,
  src varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO gift (gid, src, title, price, href) VALUES
('1','img/list/20100630040546837.jpg','巧克力/德芙心语礼盒98G','148','1'),
('2','img/list/2011717233150.jpg','礼品/1.2米泰迪熊','213','2'),
('3','img/list/20116152143300.jpg','63cm围巾熊/生日礼物','152','3'),
('4','img/list/20090122040728484.jpg','巧克力/最美的你','187','4');


#表的结构 user
CREATE TABLE user (
  uid int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  uname varchar(32) DEFAULT NULL,
  upwd varchar(32) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  phone varchar(16) DEFAULT NULL,
  user_name varchar(16) DEFAULT NULL,
  gender tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#转存表中的数据 user

INSERT INTO user (uid, uname, upwd, email, phone, user_name, gender) VALUES
(NULL, 'xiaoming', '11111111', '1111@163.com', '18355556666', '小明', 1);

#鲜花详情页商品信息flower_details_info
CREATE TABLE flower_details_info (
  info_id int(11) NOT NULL PRIMARY KEY,
  fid int(11) NOT NULL,
  info_src varchar(128),
  info_title varchar(64),
  info_price_one decimal(10,2),
  info_price_two decimal(10,2),
  info_sales varchar(64),
  info_meterrials varchar(128),
  info_details varchar(64),
  info_number varchar(64),
  info_pack varchar(64),
  info_usage varchar(64),
  info_flowers varchar(128),
  info_explanation varchar(128),
  info_manner varchar(128),
  info_represent varchar(128)
);
INSERT INTO flower_details_info VALUES('1','1','/img/list/2012527115160.jpg','12朵白玫瑰/浪漫 ','182','188','已有(6370)人',' 12支白玫瑰,外围紫色勿忘我,香摈色纸衬里.','商品详情','DM10296','紫色绵纸外包圆形花束,紫色蝴蝶结','生日,爱情,祝福','爱，需要一点一滴的积累；情，需要每分每秒的坚持！我要用时间去积累对你的爱；用承诺去坚持对你的情！一生一世,情永不变...　　',NULL,'全国配送,鲜花是由当地花店专人送花上门，市区免费送花','白玫瑰代表：纯洁与高贵;12支白玫瑰花代表:圆满组合,心心相印 '),
('2','2','/img/list/2008121711464746.jpg','19朵粉玫瑰/浪漫与激情','213','236','已有(6149)人',' 19枝粉色超级玫瑰，米兰点缀','商品详情','DM10330','深紫红色皱纹纸圆形高档包装，黄色丝带打结','爱情,生日,祝福,纪念日,求婚','你在人世间茫茫寻觅期待的爱情，我在滚滚红尘遇见彼此的相牵，挚爱今生，非你不可…　　',NULL,'全国配送,鲜花是由当地花店专人送花上门，市区免费送花','19多代表：期待陪伴；粉玫瑰代表：爱的誓言、永远的爱； '),
('3','3','/img/list/20090208110019937.gif','9朵白玫瑰/冬日恋歌 ','149','181','已有(5336)人',' 9支白玫瑰，内衬紫色勿忘我和绿叶','商品详情','DM10646','深紫色皱纹纸包装，同色蝴蝶结束扎成圆形花束','爱情','如果你是美丽的海岸，我就是你脚下起伏的潮水，雪白的浪花里为你而唱的恋歌，五色的彩贝是为你而写的诗句。无论涨潮还是退潮，海与岸永远相连。　　',NULL,'全国配送,鲜花是由当地花店专人送花上门，市区免费送花','白玫瑰代表：纯洁与高贵;12支白玫瑰花代表:圆满组合,心心相印 '),
('4','4','/img/list/20081030055750453.jpg','9朵红玫瑰/天使的祝福 ','182','223','已有(3744)人',' 1枝多头百合，昆明红玫瑰9枝，配绿叶，满天星、黄莺点缀。','商品详情','DM10378','粉色手揉纸包装，外围粉色纱网，紫色蝴蝶结束扎.','生日,祝福,探病','你就像是一朵玫瑰,我愿化作玫瑰上的绿叶,永远伴随着你,呵护者你.愿你每日都拥有欢乐和幸福.　　',NULL,'全国配送,鲜花是由当地花店专人送花上门，市区免费送花','百合—— 顺利、心想事成、祝福 ');

