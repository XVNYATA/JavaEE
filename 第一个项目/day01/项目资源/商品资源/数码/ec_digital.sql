#用户表
CREATE TABLE EC_USER(
	ID INT PRIMARY KEY AUTO_INCREMENT,      #id
	LOGIN_NAME VARCHAR(50) UNIQUE,		#登录名
	PASSWORD VARCHAR(50),			#密码
	NAME VARCHAR(50),			#用户名
	SEX INT DEFAULT 1,			#性别: 1男 2女
	EMAIL VARCHAR(50),			#邮箱
	PHONE VARCHAR(20),			#手机号码
	ADDRESS VARCHAR(255),			#地址
	ROLE INT DEFAULT 1,			#用户权限
	CREATE_DATE DATETIME,			#创建日期
	DISABLED TINYINT(1) DEFAULT '0',	#是否已经禁用（0表示未禁用，1表示已经禁用——删除）
	ACTIVE VARCHAR(255)			#激活码
);	

# 物品类型表
CREATE TABLE EC_ARTICLE_TYPE(
	CODE VARCHAR(100) PRIMARY KEY NOT NULL,	#CODE编号
	NAME VARCHAR(50) UNIQUE,		#物品类型
	REMARK VARCHAR(200)			#类型描述
);

# 物品表
CREATE TABLE EC_ARTICLE(
	ID INT PRIMARY KEY AUTO_INCREMENT,	#id
	TITLE VARCHAR(200),			#物品名称
	SUPPLIER VARCHAR(20),			#供应商|作者
	PRICE DOUBLE,				#价格
    DISCOUNT DOUBLE,				#折扣
	LOCALITY VARCHAR(300),			#产地|出版社
	PUTAWAY_DATE DATETIME,			#上架日期
	STORAGE INT,				#库存
	IMAGE VARCHAR(200),			#物品封面
	DESCRIPTION VARCHAR(500),		#物品描述
	TYPE_CODE VARCHAR(100),			#物品类型
	CREATE_DATE DATETIME,			#创建日期
	DISABLED tinyint(1) DEFAULT '0',	#是否已经禁用（0表示未禁用，1表示已经禁用——删除）
	CONSTRAINT FK_ARTICLE_TYPE FOREIGN KEY (TYPE_CODE) REFERENCES EC_ARTICLE_TYPE(CODE)
);

#订单表
CREATE TABLE EC_ORDER(
	ID INT PRIMARY KEY AUTO_INCREMENT,	#ID
	ORDER_CODE VARCHAR(20) UNIQUE,		#订单编号
	CREATE_DATE DATETIME,			#下单时间
	SEND_DATE DATETIME,				#发货时间
	STATUS VARCHAR(6),			#发货状态
	AMOUNT DOUBLE,				#订单总金额
	USER_ID INT,				#用户编号
	CONSTRAINT FK_USER_ORDER FOREIGN KEY (USER_ID) REFERENCES EC_USER(ID)
);

#订单明细表
CREATE TABLE EC_ORDER_ITEM(
	ORDER_ID INT,			#订单编号
	ARTICLE_ID INT,			#物品编号
	ORDER_NUM INT,			#购买数量
	PRIMARY KEY(ORDER_ID, ARTICLE_ID),
	CONSTRAINT FK_ORDER_ITEM_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES EC_ORDER(ID),
	CONSTRAINT FK_ORDER_ITEM_ARTICLE_ID FOREIGN KEY (ARTICLE_ID) REFERENCES EC_ARTICLE(ID)
);

ALTER TABLE EC_ARTICLE MODIFY STORAGE INT DEFAULT 100;

# 用户信息
insert into `ec_user` (`LOGIN_NAME`, `PASSWORD`, `NAME`, `SEX`, `EMAIL`, `PHONE`, `ADDRESS`, `ROLE`, `CREATE_DATE`) values('admin','123456','管理员','1','test@163.com','18998665678','珠江新城','2',NOW());
insert into `ec_user` (`LOGIN_NAME`, `PASSWORD`, `NAME`, `SEX`, `EMAIL`, `PHONE`, `ADDRESS`, `ROLE`, `CREATE_DATE`) values('test1','123456','张小棠','1','test1@163.com','13487890989','天河车陂','1',NOW());


# 物品类型信息
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0001','手机','手机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010001','----苹果','苹果');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010002','----华为','华为');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010003','----诺基亚','诺基亚');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010004','----联想','联想');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010005','----魅族','魅族');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010006','----索尼','索尼');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010007','----三星','三星');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010008','----HTC','HTC');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010009','----摩托罗拉','摩托罗拉');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0002','对讲机','对讲机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020001','----手台','手台');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020002','----车台','车台');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0003','手机配件','手机配件');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030001','----手机电池','手机电池');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030002','----蓝牙耳机','蓝牙耳机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030003','----充电器/数据线','充电器/数据线');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030004','----手机耳机','手机耳机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030005','----手机贴膜','手机贴膜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030006','----手机保护套','手机保护套');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030007','----iPhone配件','iPhone配件');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0004','数码相机','数码相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040001','----准专业机','准专业机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040002','----防水相机','防水相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040003','----中长焦相机','中长焦相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040004','----自拍相机','自拍相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040005','----胶片相机','胶片相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0005','单反相机','单反相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050001','----入门级','入门级');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050002','----中高级','中高级');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050003','----专业级','专业级');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050004','----大师级','大师级');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0006','摄相机','摄相机');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060001','----家用','家用');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060002','----准专业','准专业');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060003','----专业级摄像机','专业级');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0007','单电/微单相机','单电/微单');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070001','----机身','机身');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070002','----定焦套装','定焦套装');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070003','----变焦套装','变焦套装');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070004','----双镜头套装','双镜头套装');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0008','镜头','镜头');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0009','滤镜','滤镜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0010','单反配件','单反配件');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0011','读卡器','读卡器');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0012','存储卡','存储卡');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0013','移动电源','移动电源');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0014','数码包','数码包');

# 物品信息
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('1',' 苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM 全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','iPhone 5 16G版','4899','苹果（APPLE）iPhone 5 16G版 3G手机（白色）','2013-04-01','100','20130401_1_0001_1.jpg','\r\n苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM\r\n全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('2',' 苹果（APPLE）iPhone 5 16G版 3G手机（黑色）WCDMA/GSM 全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','iPhone 5 16G版','4899','苹果（APPLE）iPhone 5 16G版 ','2013-04-01','100','20130401_1_0001_2.jpg','苹果（APPLE）iPhone 5 16G版 3G手机（黑色）WCDMA/GSM\r\n全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('3',' 苹果（APPLE）iPhone 4 8G版 3G手机（黑色）WCDMA/GSM 月末促销，支持升级iOS6，更多新体验！选择“购机返话费版”有惊喜！ ','苹果iPhone 4 8G版 3G手机','2899','苹果（APPLE）iPhone 4 8G版 3G手机(黑色)','2013-04-01','100','20130401_1_0001_3.jpg','苹果（APPLE）iPhone 4 8G版 3G手机（黑色）WCDMA/GSM\r\n月末促销，支持升级iOS6，更多新体验！选择“购机返话费版”有惊喜！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('4',' 苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM 月末促销，依旧出色的iPhone！可升级iOS6系统！选择“特价返话费版”有惊喜！','iPhone 4 8G版','2899','苹果（APPLE）iPhone 4 8G版 3G手机(白色)','2013-04-01','100','20130401_1_0001_4.jpg','苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM\r\n月末促销，依旧出色的iPhone！可升级iOS6系统！选择“特价返话费版”有惊喜！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('5',' 苹果（APPLE）iPhone 4S 16G版 3G手机（白色）WCDMA/GSM 经典的4S，值得拥有！ ','iPhone 4S 16G版','4199','苹果（APPLE）iPhone 4S 16G版 3G手机(白色)','2013-04-01','100','20130401_1_0001_5.jpg','苹果（APPLE）iPhone 4S 16G版 3G手机（白色）WCDMA/GSM\r\n经典的4S，值得拥有！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('6',' 苹果（APPLE）iPhone 4S 16G版 3G手机（黑色）WCDMA/GSM 经典的4S，值得拥有！ ','iPhone 4S 16G版','4199',' 苹果（APPLE）iPhone 4S 16G版 3G手机（黑色）','2013-04-01','100','20130401_1_0001_6.jpg','苹果（APPLE）iPhone 4S 16G版 3G手机（黑色）WCDMA/GSM\r\n经典的4S，值得拥有！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('7','苹果（APPLE）iPhone 5 16G版 3G手机（白色）电信版','电信版','4799','电信版','2013-04-01','100','20130401_1_0001_7.jpg','苹果（APPLE）iPhone 5 16G版 3G手机（白色）电信版','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('8','苹果（APPLE）iPhone 5 16G版 3G手机（黑色）电信版','电信版','4799','电信版','2013-04-01','100','20130401_1_0001_8.jpg','苹果（APPLE）iPhone 5 16G版 3G手机（黑色）电信版','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('9','苹果（APPLE）iPhone 4S 16G版 3G手机（白色）电信版','电信版','4299','电信版','2013-04-01','100','20130401_1_0001_9.jpg','苹果（APPLE）iPhone 4S 16G版 3G手机（白色）电信版','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('10',' 苹果（APPLE）iPhone 5 32G版 3G手机（白色）WCDMA/GSM 全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','iPhone 5 32G版','5799','iPhone 5 32G版','2013-04-01','100','20130401_1_0001_10.jpg','苹果（APPLE）iPhone 5 32G版 3G手机（白色）WCDMA/GSM\r\n全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机 ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('11','苹果（APPLE）iPhone 4S 16G版 3G手机（黑色）电信版 ','电信版','4249','电信版','2013-04-01','100','20130401_1_0001_11.jpg','苹果（APPLE）iPhone 4S 16G版 3G手机（黑色）电信版 ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('12',' 苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM 购机送话费 价格超给力！购机最高返5800元话费，iPhone就是要配联通3G！ ','联通','4749','联通','2013-04-01','100','20130401_1_0001_12.jpg','苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM 购机送话费\r\n价格超给力！购机最高返5800元话费，iPhone就是要配联通3G！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('13',' 苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM 购机送费 价格超给力！购机最高返5800元话费，iPhone就是要配联通3G！ ','联通','2799','联通','2013-04-01','100','20130401_1_0001_13.jpg','苹果（APPLE）iPhone 4 8G版 3G手机（白色）WCDMA/GSM 购机送费\r\n价格超给力！购机最高返5800元话费，iPhone就是要配联通3G！ ','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('14','苹果（APPLE）iPhone 5 16G版 3G手机（白色）存费送机 北京电信特价版(189及以上套餐）','北京电信','4588','北京电信','2013-04-01','100','20130401_1_0001_14.jpg','苹果（APPLE）iPhone 5 16G版 3G手机（白色）存费送机 北京电信特价版(189及以上套餐）','00010001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('15',' 三星（SAMSUNG）GT-I9268 3G手机（白色）TD-SCDMA/GSM 移动版 限时特促！全新Android 4.1，4.65寸炫丽屏！1.5Ghz双核CPU，1280*720分辨率！ ','三星','2599','三星','2013-04-01','100','20130401_1_0007_1.jpg','三星（SAMSUNG）GT-I9268 3G手机（白色）TD-SCDMA/GSM 移动版\r\n限时特促！全新Android 4.1，4.65寸炫丽屏！1.5Ghz双核CPU，1280*720分辨率！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('16',' 三星（SAMSUNG）Galaxy S3 I9308 3G手机 (云石白) TD-SCDMA/GSM 限时特促：3498元！Android 4.0，1.4Ghz极速四核！移动用户无需换号，直接尊享3G网络！ ','三星','3498','三星','2013-04-01','100','20130401_1_0007_2.jpg','三星（SAMSUNG）Galaxy S3 I9308 3G手机 (云石白) TD-SCDMA/GSM\r\n限时特促：3498元！Android 4.0，1.4Ghz极速四核！移动用户无需换号，直接尊享3G网络！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('17',' 三星 Galaxy Note II N7102 32G版 3G手机（云石白）WCDMA/GSM 双卡双待双通 5.5寸高清炫丽屏，1.6GHZ四核处理器，32GB内存，Android4.1智能系统','三星','4768','三星','2013-04-01','100','20130401_1_0007_3.jpg','三星 Galaxy Note II N7102 32G版 3G手机（云石白）WCDMA/GSM 双卡双待双通\r\n5.5寸高清炫丽屏，1.6GHZ四核处理器，32GB内存，Android4.1智能系统~ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('18',' 三星（SAMSUNG）Galaxy Note II N7108 3G手机（白色）TD-SCDMA/GSM 送移动电源！1.6GHz四核，5.5寸大屏，支持WCDMA国际漫游！移动用户无需换号，直接尊享3G网络！ ','三星','4499','三星','2013-04-01','100','20130401_1_0007_4.jpg','三星（SAMSUNG）Galaxy Note II N7108 3G手机（白色）TD-SCDMA/GSM\r\n送移动电源！1.6GHz四核，5.5寸大屏，支持WCDMA国际漫游！移动用户无需换号，直接尊享3G网络！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('19','三星 Galaxy SIII I9300 3G手机（云石白）WCDMA/GSM','三星','3598','三星','2013-04-01','100','20130401_1_0007_5.jpg','三星 Galaxy SIII I9300 3G手机（云石白）WCDMA/GSM','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('20',' 三星 Galaxy Note II N7100 3G手机（白色）WCDMA/GSM 5.5寸高清炫丽屏，1.6GHZ四核处理器，多任务处理窗口，Android4.1智能系统','三星','4198','三星','2013-04-01','100','20130401_1_0007_6.jpg','三星 Galaxy Note II N7100 3G手机（白色）WCDMA/GSM\r\n5.5寸高清炫丽屏，1.6GHZ四核处理器，多任务处理窗口，Android4.1智能系统','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('21',' 三星 I9082 3G手机（雅白色）WCDMA/GSM 双卡双待单通 直降促销，1.2G双核处理器，5寸电容触屏，800万摄像头，Android 4.1 双卡双待手机~ ','三星','2498','三星','2013-04-01','100','20130401_1_0007_7.jpg','三星 I9082 3G手机（雅白色）WCDMA/GSM 双卡双待单通\r\n直降促销，1.2G双核处理器，5寸电容触屏，800万摄像头，Android 4.1 双卡双待手机~ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('22',' 三星（SAMSUNG）S7568 3G手机（白色）TD-SCDMA/GSM 送手机套+贴膜！Android 4.0 ，1GHz极速CPU！4.0英寸WVGA绚丽宽屏！移动用户无需换号，尊享3G网络！ ','三星','999','三星','2013-04-01','100','20130401_1_0007_8.jpg','三星（SAMSUNG）S7568 3G手机（白色）TD-SCDMA/GSM\r\n送手机套+贴膜！Android 4.0 ，1GHz极速CPU！4.0英寸WVGA绚丽宽屏！移动用户无需换号，尊享3G网络！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('23',' 三星 I8160 3G手机（白色）WCDMA/GSM 双核Android智能手机~ ','三星','1368','三星','2013-04-01','100','20130401_1_0007_9.jpg','三星 I8160 3G手机（白色）WCDMA/GSM\r\n双核Android智能手机~ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('24',' 三星（SAMSUNG）Galaxy S3 I9308 3G手机 (青玉蓝) TD-SCDMA/GSM 限时特促：3498元！Android 4.0，1.4Ghz极速四核！移动用户无需换号，直接尊享3G网络！ ','三星','3498','三星','2013-04-01','100','20130401_1_0007_10.jpg','三星（SAMSUNG）Galaxy S3 I9308 3G手机 (青玉蓝) TD-SCDMA/GSM\r\n限时特促：3498元！Android 4.0，1.4Ghz极速四核！移动用户无需换号，直接尊享3G网络！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('25',' 三星（SAMSUNG）Galaxy Note I9228 3G手机（釉白）TD-SCDMA/GSM 5.3寸屏，1.4GHz双核，16G机身内存！移动用户无需换号，直接尊享3G网络！ ','三星','3299','三星','2013-04-01','100','20130401_1_0007_11.jpg','三星（SAMSUNG）Galaxy Note I9228 3G手机（釉白）TD-SCDMA/GSM\r\n5.3寸屏，1.4GHz双核，16G机身内存！移动用户无需换号，直接尊享3G网络！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('26',' 三星 Galaxy SIII I9300 3G手机（青玉蓝）WCDMA/GSM 惊爆价！卓然天成，为你而生，全球80% 3G用户的自然选择！ ','三星','3398','三星','2013-04-01','100','20130401_1_0007_12.jpg','三星 Galaxy SIII I9300 3G手机（青玉蓝）WCDMA/GSM\r\n惊爆价！卓然天成，为你而生，全球80% 3G用户的自然选择！ ','00010007','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('27',' HTC 新渴望VC（T328d）3G手机（黑色）CDMA2000/GSM 双模双待双通 1G主频，安卓4.0系统，500万像素，特有Beats音效！ ','HTC','1199','HTC','2013-04-01','100','20130401_1_0008_1.jpg','HTC 新渴望VC（T328d）3G手机（黑色）CDMA2000/GSM 双模双待双通\r\n1G主频，安卓4.0系统，500万像素，特有Beats音效！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('28',' HTC T528w（One SU）3G手机（锐意黑）WCDMA/GSM 双卡双待双通 4.3寸屏幕！Android 4.0!双核强劲动力！真纤薄机身！Beats 全场景音效！摄像时可以拍照！高品之选！ ','HTC','1788','HTC','2013-04-01','100','20130401_1_0008_2.jpg','HTC T528w（One SU）3G手机（锐意黑）WCDMA/GSM 双卡双待双通\r\n4.3寸屏幕！Android 4.0!双核强劲动力！真纤薄机身！Beats 全场景音效！摄像时可以拍照！高品之选！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('29',' HTC 新渴望V（T328w）3G手机（黑色）WCDMA/GSM 双卡双待单通 Android 4.0系统！4.0寸屏！全场景Beats音效！500万像素！鱼和熊掌不可兼得，时尚和品质在此可一起拥有！ ','HTC','1099','HTC','2013-04-01','100','20130401_1_0008_3.jpg','HTC 新渴望V（T328w）3G手机（黑色）WCDMA/GSM 双卡双待单通\r\nAndroid 4.0系统！4.0寸屏！全场景Beats音效！500万像素！鱼和熊掌不可兼得，时尚和品质在此可一起拥有！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('30',' HTC One XT（S720T）3G手机（睿丽黑）TD-SCDMA/GSM 2799元疯抢！1.5GHz强劲四核处理器，4.7寸1600万色SLCD2屏幕，800+130万双摄像头！ ','HTC','2799','HTC','2013-04-01','100','20130401_1_0008_4.jpg','HTC One XT（S720T）3G手机（睿丽黑）TD-SCDMA/GSM\r\n2799元疯抢！1.5GHz强劲四核处理器，4.7寸1600万色SLCD2屏幕，800+130万双摄像头！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('31',' HTC T329t 3G手机（珐琅黑）TD-SCDMA/GSM 春雷心动价，下单送耳机！1GHz双核处理器，4.0寸SLCD屏，1G RAM+4G ROM，移动用户无需换号即享3G网络！ ','HTC','1599','HTC','2013-04-01','100','20130401_1_0008_5.jpg','HTC T329t 3G手机（珐琅黑）TD-SCDMA/GSM\r\n春雷心动价，下单送耳机！1GHz双核处理器，4.0寸SLCD屏，1G RAM+4G ROM，移动用户无需换号即享3G网络！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('32',' HTC One SC（T528D）3G手机（灰色）CDMA2000/GSM 双模双待双通 4.3寸屏，安卓4.0系统，1G双核，Beats 音效，时尚品质在此可一起拥有！ ','HTC','1998','HTC','2013-04-01','100','20130401_1_0008_6.jpg','HTC One SC（T528D）3G手机（灰色）CDMA2000/GSM 双模双待双通\r\n4.3寸屏，安卓4.0系统，1G双核，Beats 音效，时尚品质在此可一起拥有！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('33',' HTC T528w（One SU）3G手机（菁英白）WCDMA/GSM 双卡双待双通 4.3寸屏幕！Android 4.0!双核强劲动力！真纤薄机身！Beats 全场景音效！摄像时可以拍照！高品之选！ ','HTC','1788','HTC','2013-04-01','100','20130401_1_0008_7.jpg','HTC T528w（One SU）3G手机（菁英白）WCDMA/GSM 双卡双待双通\r\n4.3寸屏幕！Android 4.0!双核强劲动力！真纤薄机身！Beats 全场景音效！摄像时可以拍照！高品之选！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('34',' HTC One SC（T528D）3G手机（白色）CDMA2000/GSM 双模双待双通 4.3寸屏，安卓4.0系统，1G双核，Beats 音效，时尚品质在此可一起拥有！ ','HTC','1998','HTC','2013-04-01','100','20130401_1_0008_8.jpg','HTC One SC（T528D）3G手机（白色）CDMA2000/GSM 双模双待双通\r\n4.3寸屏，安卓4.0系统，1G双核，Beats 音效，时尚品质在此可一起拥有！ ','00010008','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('35',' 摩托罗拉商用对讲机SMP268 清仓，底价出清，最后一批疯狂抢 ','摩托罗拉','269','摩托罗拉','2013-04-01','100','20130401_2_0001_1.jpg','摩托罗拉商用对讲机SMP268\r\n清仓，底价出清，最后一批疯狂抢 ','00020001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('36',' 摩托罗拉 T5 公众对讲机 7折疯抢，便携之王，最具性价比，出游首选，数量有限，先到先得。 ','摩托罗拉','399','摩托罗拉','2013-04-01','100','20130401_2_0001_2.jpg','摩托罗拉 T5 公众对讲机\r\n7折疯抢，便携之王，最具性价比，出游首选，数量有限，先到先得。 ','00020001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('37',' 松下（Panasonic） DMC-LX5GK 数码相机 黑色（1010万像素 3.0英寸液晶屏 3.8倍光学变焦 24mm广角） 【1999赔本攒吆喝-本周最后2天抢完即止】【徕卡镜头-单反画质-性价比之王限量抢】 ','松下','1999','松下','2013-04-01','100','20130401_4_0001_1.jpg','松下（Panasonic） DMC-LX5GK 数码相机 黑色（1010万像素 3.0英寸液晶屏 3.8倍光学变焦 24mm广角）\r\n【1999赔本攒吆喝-本周最后2天抢完即止】【徕卡镜头-单反画质-性价比之王限量抢】 ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('38',' 索尼（SONY） DSC-RX100 黑卡数码相机（2020万像素 3英寸液晶屏 F1.8光圈 1英寸Exmor CMOS） 送168元大礼包！1寸大底-专业卡片-挑战单反-轻装外拍-比拿单反更专业！ ','索尼','3799','索尼','2013-04-01','100','20130401_4_0001_2.jpg','索尼（SONY） DSC-RX100 黑卡数码相机（2020万像素 3英寸液晶屏 F1.8光圈 1英寸Exmor CMOS）\r\n送168元大礼包！1寸大底-专业卡片-挑战单反-轻装外拍-比拿单反更专业！ ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('39',' 三星（SAMSUNG） WB151 数码相机 黑色（1420万像素 3.0英寸屏 18倍光学变焦 24mm广角 内置4G卡） 【仅售998元！】【万人推荐超值18倍光变时尚小钢炮】【智能场景升级版】【内置4G卡+赠时尚相机包】 ','三星','998','三星','2013-04-01','100','20130401_4_0001_3.jpg','\r\n三星（SAMSUNG） WB151 数码相机 黑色（1420万像素 3.0英寸屏 18倍光学变焦 24mm广角 内置4G卡）\r\n【仅售998元！】【万人推荐超值18倍光变时尚小钢炮】【智能场景升级版】【内置4G卡+赠时尚相机包】 ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('40',' 富士（FUJIFILM） FinePix S4530 数码相机 黑色（1400万像素 30倍光变 3.0英寸液晶屏 24mm广角） 【1099史上惊爆价】【30倍长焦史上最低价-最强性价比一镜走天下】 ','富士','1099','富士','2013-04-01','100','20130401_4_0001_4.jpg','富士（FUJIFILM） FinePix S4530 数码相机 黑色（1400万像素 30倍光变 3.0英寸液晶屏 24mm广角）\r\n【1099史上惊爆价】【30倍长焦史上最低价-最强性价比一镜走天下】 ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('41',' 三星（SAMSUNG） WB151 数码相机 白色（1420万像素 3.0英寸屏 18倍光学变焦 24mm广角 内置4G卡） 【仅售998元！】【万人推荐超值18倍光变时尚小钢炮】【智能场景升级版】【内置4G卡+赠时尚相机包】 ','三星','998','三星','2013-04-01','100','20130401_4_0001_5.jpg','三星（SAMSUNG） WB151 数码相机 白色（1420万像素 3.0英寸屏 18倍光学变焦 24mm广角 内置4G卡）\r\n【仅售998元！】【万人推荐超值18倍光变时尚小钢炮】【智能场景升级版】【内置4G卡+赠时尚相机包】 ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('42',' 佳能（Canon） PowerShot G15 数码相机（1210万像素 1.8超大光圈 5倍光变 28mm广角） 单反备机！F1.8大光圈，不错过任何细节！ ','佳能','3699','佳能','2013-04-01','100','20130401_4_0001_6.jpg','佳能（Canon） PowerShot G15 数码相机（1210万像素 1.8超大光圈 5倍光变 28mm广角）\r\n单反备机！F1.8大光圈，不错过任何细节！ ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('43',' 佳能（Canon） Power Shot G1 X 数码相机（1430万像素 3.0英寸可旋转液晶屏 4倍光学变焦 28mm广角） 旗舰王者！叫板单反，无视微单！ ','佳能','4188','佳能','2013-04-01','100','20130401_4_0001_7.jpg','佳能（Canon） Power Shot G1 X 数码相机（1430万像素 3.0英寸可旋转液晶屏 4倍光学变焦 28mm广角）\r\n旗舰王者！叫板单反，无视微单！ ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('44',' 富士（FUJIFILM） FinePix X20 旁轴数码相机 银色 【机皇3.27预订再开】【全线升级-完美画质无限惊喜】【本次最后一批有首发礼物-预订最快5天内到货】 ','富士','3799','富士','2013-04-01','100','20130401_4_0001_8.jpg','富士（FUJIFILM） FinePix X20 旁轴数码相机 银色\r\n【机皇3.27预订再开】【全线升级-完美画质无限惊喜】【本次最后一批有首发礼物-预订最快5天内到货】 ','00040001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('45',' 捷波朗 EASYGO+ 易行 蓝牙耳机 黑色 蓝牙3.0,支持音乐,智能语音提示,同时待机两部手机 ','捷波朗','275','捷波朗','2013-04-01','100','20130401_3_0002_1.jpg','捷波朗 EASYGO+ 易行 蓝牙耳机 黑色\r\n蓝牙3.0,支持音乐,智能语音提示,同时待机两部手机 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('46','缤特力PRO Legend 蓝牙耳机 黑色','缤特力','668','缤特力PRO Legend 蓝牙耳机','2013-04-01','100','20130401_3_0002_2.jpg','缤特力PRO Legend 蓝牙耳机 黑色','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('47',' 索尼（SONY）MW600 蓝牙耳机 黑色 多点连接，可同时连接两部手机，双声道，语音控制，配备LED显示屏，FM radio收听功能，音乐与通话兼容！ ','索尼','399','索尼','2013-04-01','100','20130401_3_0002_3.jpg','索尼（SONY）MW600 蓝牙耳机 黑色\r\n多点连接，可同时连接两部手机，双声道，语音控制，配备LED显示屏，FM radio收听功能，音乐与通话兼容！ ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('48',' 乐歌 BT001 蓝牙耳机 黑色 立体声 高清音质 钢琴烤漆 金属质感 ','乐歌','129','乐歌','2013-04-01','100','20130401_3_0002_4.jpg','乐歌 BT001 蓝牙耳机 黑色\r\n立体声 高清音质 钢琴烤漆 金属质感 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('49',' 捷波朗 EXTREME2 超凡2 蓝牙耳机 白色 蓝牙3.0,全中文语音提示菜单,来电播报中文名字,双倍降低背景噪音,专利舒适耳塞 ','捷波朗','439','捷波朗','2013-04-01','100','20130401_3_0002_5.jpg','捷波朗 EXTREME2 超凡2 蓝牙耳机 白色\r\n蓝牙3.0,全中文语音提示菜单,来电播报中文名字,双倍降低背景噪音,专利舒适耳塞 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('50','缤特力ML20 蓝牙耳机 黑色','缤特力','218','缤特力ML20 蓝牙耳机','2013-04-01','100','20130401_3_0002_6.jpg','缤特力ML20 蓝牙耳机 黑色','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('51',' 诺基亚（NOKIA）BH-310 蓝牙耳机 白色 耳机一摘一戴之间，通话轻松切换,内置双麦克风，DSP减噪，音量自动调节，支持NFC,更能同时连接两部设备 ','诺基亚','299','诺基亚','2013-04-01','100','20130401_3_0002_7.jpg','诺基亚（NOKIA）BH-310 蓝牙耳机 白色\r\n耳机一摘一戴之间，通话轻松切换,内置双麦克风，DSP减噪，音量自动调节，支持NFC,更能同时连接两部设备 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('52',' 诺基亚（NOKIA）BH-111 蓝牙耳机 绿色 特价促销，返20元电子京?，活动随时结束！抢购迅速！ ','诺基亚','179','诺基亚','2013-04-01','100','20130401_3_0002_8.jpg','诺基亚（NOKIA）BH-111 蓝牙耳机 绿色\r\n特价促销，返20元电子京?，活动随时结束！抢购迅速！ ','00030002','2013-04-01');
