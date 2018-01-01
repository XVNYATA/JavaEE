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
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0001','护肤','护肤');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010001','----洁面','洁面');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010002','----化妆水','化妆水');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010003','----喷雾','喷雾');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010004','----美容液','美容液');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010005','----眼霜','眼霜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010006','----面膜','面膜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010007','----精华','精华');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010008','----精油','精油');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0002','彩妆','彩妆');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020001','----缷妆','缷妆');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020002','----隔离','隔离');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020003','----BB霜','BB霜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0003','香氛','香氛');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030001','----男士香水','男士香水');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030002','----女士香水','女士香水');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030003','----中性香水','中性香水');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0004','身体护理','身体护理');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040001','----洗发','洗发');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040002','----护发','护发');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040003','----沐浴','沐浴');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040004','----身体乳','身体乳');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040005','----护手霜','护手霜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0005','礼盒套装','礼盒套装');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050001','----护肤','护肤');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050003','----彩妆','彩妆');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050004','----旅行装','旅行装');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0006','母婴专区','母婴专区');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060001','----奶粉','奶粉');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060002','----纸尿裤','纸尿裤');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0007','男士专区','男士专区');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070002','----爽肤水','爽肤水');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070003','----面霜','面霜');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070004','----啫喱','啫喱');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070005','----男香','男香');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070007','----凝胶','凝胶');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0008','粉底','粉底');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0009','粉饼','粉饼');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0010','睫毛膏','睫毛膏');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0011','唇彩','唇彩');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0012','腮红','腮红');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0013','食品保健','食品保健');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0014','瘦身类','瘦身类');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0015','美容类','美容类');

# 物品信息
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('1','Cetaphil丝塔芙洗面奶(法国) 200ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ',' Cetaphil丝塔芙洗面奶','108',' 法国','2013-03-31','100','20130331_1_1.jpg','Cetaphil丝塔芙洗面奶(法国) 200ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('2','Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ','Cetaphil丝塔芙洁面乳 118ml','58','Cetaphil丝塔芙洁面乳','2013-03-31','100','20130331_1_2.jpg','Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('3','Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ','Cetaphil丝塔芙洁面乳 237ml','118','丝塔芙洁面乳 ','2013-03-31','100','20130331_1_3.jpg','Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('4','洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ','洗颜专科 柔澈泡沫洁面乳 120g','45','资生堂授权特供','2013-03-31','100','20130331_1_4.jpg','洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('5','Cetaphil丝塔芙洁面乳 591ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ','Cetaphil丝塔芙洁面乳 591ml','198','Cetaphil丝塔芙洁面乳','2013-03-31','100','20130331_1_5.jpg','Cetaphil丝塔芙洁面乳 591ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('6','欧莱雅 (L\'Oreal)清润 泡沫洁面膏 125ml 深层清洁 滋养肌肤 保持清新 ',' 欧莱雅清润 泡沫洁面膏','88','泡沫洁面膏','2013-03-31','100','20130331_1_6.jpg','欧莱雅 (L\'Oreal)清润 泡沫洁面膏 125ml 深层清洁 滋养肌肤 保持清新 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('7','比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ','比度克 抗痘控油洁面膏 ','38.9','比度克 (BeDook)抗痘控油洁面膏 60g','2013-03-31','100','20130331_1_7.jpg','比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('8','Mentholatum曼秀雷敦男士冰爽活炭洁面乳150ml 冰凉薄荷，深层洁净 保持皮肤滋润清爽，让脸部恢复光滑 早晚使用，倍感肌肤清爽柔润 ','曼秀雷敦男士冰爽活炭洁面乳','39.9','曼秀雷敦男士冰爽活炭洁面乳 150ml','2013-03-31','100','20130331_1_8.jpg','Mentholatum曼秀雷敦男士冰爽活炭洁面乳150ml 冰凉薄荷，深层洁净 保持皮肤滋润清爽，让脸部恢复光滑 早晚使用，倍感肌肤清爽柔润 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('9','凡茜仙人掌无s洗面奶 126ml两款包装随机发货! 无S配方 蕴含温和谷氨酸清洁因子 有效清洁皮肤表面及毛孔内油脂污垢 不刺激肌肤 ','凡茜仙人掌无s洗面奶','90','凡茜仙人掌无s洗面奶 126ml','2013-03-31','100','20130331_1_9.jpg','凡茜仙人掌无s洗面奶 126ml两款包装随机发货! 无S配方 蕴含温和谷氨酸清洁因子 有效清洁皮肤表面及毛孔内油脂污垢 不刺激肌肤 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('10','倩碧 (Clinique) 温和液体洁面皂 200ml 深层清洁，软化角质，丰富泡沫，清洗容易 温和无刺激，敏感肌肤也适用 滋润肌肤，去除干燥紧绷感 ','倩碧温和液体洁面皂','200','倩碧 (Clinique) 温和液体洁面皂 200ml','2013-03-31','100','20130331_1_10.jpg','倩碧 (Clinique) 温和液体洁面皂 200ml 深层清洁，软化角质，丰富泡沫，清洗容易 温和无刺激，敏感肌肤也适用 滋润肌肤，去除干燥紧绷感 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('11','欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml 温和亲肤 深层清洁 通透无暇 宛若新生 ',' 欧莱雅雪颜美白洁面膏','112',' 欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml','2013-03-31','100','20130331_1_11.jpg','欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml 温和亲肤 深层清洁 通透无暇 宛若新生 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('12','巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml 即刻净化皮肤，平滑皮肤，展现神采 含维生素C衍生物 + 抗氧化复合成分 即刻净化并深层清洁皮肤 增强皮肤自身防护能力 ','巴黎欧莱雅','39','巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml','2013-03-31','100','20130331_1_12.jpg','巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml 即刻净化皮肤，平滑皮肤，展现神采 含维生素C衍生物 + 抗氧化复合成分 即刻净化并深层清洁皮肤 增强皮肤自身防护能力 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('13','欧莱雅 (L\'Oreal)复颜洁面乳125ml','欧莱雅','125','欧莱雅 (L\'Oreal)复颜洁面乳125ml ','2013-03-31','100','20130331_1_13.jpg','欧莱雅 (L\'Oreal)复颜洁面乳125ml','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('14','露得清深层净化洗面乳100g（两支）（多款包装随机发货）','露得清深层净化洗面乳','48','露得清深层净化洗面乳100g（两支）','2013-03-31','100','20130331_1_14.jpg','露得清深层净化洗面乳100g（两支）（多款包装随机发货）','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('15','ZA姬芮洁面膏100g 蕴含维生素E按摩颗粒，洗脸同时达到按摩的效果 有效提升肌肤光彩、活力肌肤 深层清洁毛孔污垢，去除老化角质 ','Za姬芮洁面膏','39','Za姬芮洁面膏 100g','2013-03-31','100','20130331_1_15.jpg','ZA姬芮洁面膏100g 蕴含维生素E按摩颗粒，洗脸同时达到按摩的效果 有效提升肌肤光彩、活力肌肤 深层清洁毛孔污垢，去除老化角质 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('16','肌御坊竹炭皂?新汉方七白皂 125gx2 出黑头克星洗脸手工皂套组 竹炭吸黑头+新七白紧致美白 纳米级竹炭清洁因子，深入毛孔，吸出黑头 中药古方的七白提取，收敛毛孔，紧致美白 ',' 肌御坊竹炭皂','169',' 肌御坊竹炭皂?新汉方七白皂 125gx2 ','2013-03-31','100','20130331_1_16.jpg','肌御坊竹炭皂?新汉方七白皂 125gx2 出黑头克星洗脸手工皂套组 竹炭吸黑头+新七白紧致美白 纳米级竹炭清洁因子，深入毛孔，吸出黑头 中药古方的七白提取，收敛毛孔，紧致美白 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('17','佰草集平衡洁面乳 100ml 萃取中草药精华，从根本上改善肌肤干燥、过敏不适等症状 令干燥部位变得滋润，油腻部位变得爽适 性质温和，泡沫细腻，清洁保湿且使用后水嫩不紧绷 ','佰草集平衡洁面乳','60','佰草集平衡洁面乳 100ml','2013-03-31','100','20130331_1_17.jpg','佰草集平衡洁面乳 100ml 萃取中草药精华，从根本上改善肌肤干燥、过敏不适等症状 令干燥部位变得滋润，油腻部位变得爽适 性质温和，泡沫细腻，清洁保湿且使用后水嫩不紧绷 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('18','欧珀莱AUPRES柔润洁面膏 125g 洁面膏泡沫细腻 清除肌肤污垢和老旧角质 并有助于调节肌肤的水油平衡 ',' 欧珀莱','90',' 欧珀莱AUPRES柔润洁面膏 125g','2013-03-31','100','20130331_1_18.jpg','欧珀莱AUPRES柔润洁面膏 125g 洁面膏泡沫细腻 清除肌肤污垢和老旧角质 并有助于调节肌肤的水油平衡 ','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('19','相宜本草金缕梅控油净白洗颜泥100g','相宜本','35','相宜本草金缕梅控油净白洗颜泥 100g','2013-03-31','100','20130331_1_19.jpg','相宜本草金缕梅控油净白洗颜泥100g','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('20','欧莱雅男士控油炭爽抗黑头洁面膏100ml 两款包装随机发货.',' 欧莱雅','39',' 欧莱雅男士控油炭爽抗黑头洁面膏100ml','2013-03-31','100','20130331_1_20.jpg','欧莱雅男士控油炭爽抗黑头洁面膏100ml 两款包装随机发货.','00010001','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('21','巨型一号丝瓜水320ML 被誉为“传说中的不老神仙水” 能改善各种肌肤问题 美容教主“伊能静”都用的丝瓜水 ','巨型一号丝瓜水','120','巨型一号丝瓜水320ML','2013-03-31','100','20130331_2_1.jpg','巨型一号丝瓜水320ML 被誉为“传说中的不老神仙水” 能改善各种肌肤问题 美容教主“伊能静”都用的丝瓜水 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('22','欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml 清爽化水?喱，独特的柔肤水 温泉矿物精华，提高肌肤储水力 独特锁水配方，沛润超呼想像 清凉镇定，迅速渗入，不含油脂 ',' 欧莱雅 ','120',' 欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml','2013-03-31','100','20130331_2_2.jpg','欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml 清爽化水?喱，独特的柔肤水 温泉矿物精华，提高肌肤储水力 独特锁水配方，沛润超呼想像 清凉镇定，迅速渗入，不含油脂 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('23','雪肌精化妆水200ml KOSE排行榜第一名明星产品 让你的肌肤如雪般晶莹剔透 充分润泽，修复粗糙无光泽的肌肤纹理 ',' 雪肌精化妆水','380',' 雪肌精化妆水200ml','2013-03-31','100','20130331_2_3.jpg','雪肌精化妆水200ml KOSE排行榜第一名明星产品 让你的肌肤如雪般晶莹剔透 充分润泽，修复粗糙无光泽的肌肤纹理 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('24','欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml 隔离外界污染抗氧化抗衰老 使肌肤更鲜活水润 健康亮泽透出好气色 ','欧莱雅 ','135','欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml ','2013-03-31','100','20130331_2_4.jpg','欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml 隔离外界污染抗氧化抗衰老 使肌肤更鲜活水润 健康亮泽透出好气色 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('25','膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版） 两款包装随机发货 一步解决干燥、油腻、敏感、暗沉等多种肌肤问题 补水美白，控油清痘、舒缓排毒、镇静舒缓晒后肌肤 天然植物萃取让黑色素无处藏身 ','膜法世家1908','156','膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版）','2013-03-31','100','20130331_2_5.jpg','膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版） 两款包装随机发货 一步解决干燥、油腻、敏感、暗沉等多种肌肤问题 补水美白，控油清痘、舒缓排毒、镇静舒缓晒后肌肤 天然植物萃取让黑色素无处藏身 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('26','欧莱雅复颜清乳柔肤水175ml 有效抗皱 增强表皮防御能力 带给肌肤丝般光滑愉悦的感受 ','欧莱雅','160','欧莱雅复颜清乳柔肤水 175ml','2013-03-31','100','20130331_2_6.jpg','欧莱雅复颜清乳柔肤水175ml 有效抗皱 增强表皮防御能力 带给肌肤丝般光滑愉悦的感受 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('27','欧珀莱AUPRES均衡柔润水(滋润型) 150ml 丰润柔滑的均衡柔肤水，能迅速与肌肤融和 具有滋润和软化角质的功效 由内部产生滋润活力，缔造完美的肌肤 ','欧珀莱 ','100','欧珀莱 (AUPRES)均衡保湿系列柔润水(滋润型) 150ml ','2013-03-31','100','20130331_2_7.jpg','欧珀莱AUPRES均衡柔润水(滋润型) 150ml 丰润柔滑的均衡柔肤水，能迅速与肌肤融和 具有滋润和软化角质的功效 由内部产生滋润活力，缔造完美的肌肤 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('28','伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml(两款包装随机发货) 超赞的保湿力度 不含酒精，却含有丰富的保湿成分 补充胶原蛋白，皮肤紧致的保证 补充水份，提升肌肤自身的保湿能力 ','伊丽莎白雅顿','200','伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml','2013-03-31','100','20130331_2_8.jpg','伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml(两款包装随机发货) 超赞的保湿力度 不含酒精，却含有丰富的保湿成分 补充胶原蛋白，皮肤紧致的保证 补充水份，提升肌肤自身的保湿能力 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('29','欧莱雅(L\'Oreal)复颜清漾柔肤水175ml','欧莱雅','155','欧莱雅(L\'Oreal)复颜清漾柔肤水175ml','2013-03-31','100','20130331_2_9.jpg','欧莱雅(L\'Oreal)复颜清漾柔肤水175ml','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('30','雅漾活泉水喷雾300ml 保湿圣品，世界上最好的喷雾 肌肤享受活泉水SPA，轻松抗敏 适用范围广泛，各类人群均可使用 网上最受欢迎的喷雾，超多好评 ','雅漾 (Avene)','180','雅漾 (Avene)舒护活泉水 300ml','2013-03-31','100','20130331_2_10.jpg','雅漾活泉水喷雾300ml 保湿圣品，世界上最好的喷雾 肌肤享受活泉水SPA，轻松抗敏 适用范围广泛，各类人群均可使用 网上最受欢迎的喷雾，超多好评 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('31','倩碧 (Clinique)保湿洁肤水2号 200ml 全天然萃取精华，肌肤零负担。 温和清理皮层，促进肌肤自我更新。 长久保湿、二次清洁 ','倩碧 (Clinique)','190','倩碧 (Clinique)保湿洁肤水2号 200ml','2013-03-31','100','20130331_2_11.jpg','倩碧 (Clinique)保湿洁肤水2号 200ml 全天然萃取精华，肌肤零负担。 温和清理皮层，促进肌肤自我更新。 长久保湿、二次清洁 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('32','欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品 调整角质层至丰盈状态 缔造充满润泽的健美肌肤 提升弹力效果和丰盈的滋润效果 预防弹力阻碍因子的活动 怡人馨香，让护理倍感舒适 ',' 欧珀莱','160',' 欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品','2013-03-31','100','20130331_2_12.jpg','欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品 调整角质层至丰盈状态 缔造充满润泽的健美肌肤 提升弹力效果和丰盈的滋润效果 预防弹力阻碍因子的活动 怡人馨香，让护理倍感舒适 ','00010002','2013-03-31');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('33','谜尚(MISSHA)魅力嫩白 柔护霜SPF30+/PA+++ 21# 50ml 两款包装随机发货 同时代替防晒、隔离、遮瑕和粉底 完美遮瑕，带给肌肤清爽柔滑的使用感受 多种功效齐集一身，各种问题一瓶搞定 ','谜尚魅力嫩白柔护霜','168','谜尚魅力嫩白柔护霜SPF30+/PA+++ 50ml','2013-04-01','100','20130331_111_1.jpg','谜尚(MISSHA)魅力嫩白 柔护霜SPF30+/PA+++ 21# 50ml 两款包装随机发货 同时代替防晒、隔离、遮瑕和粉底 完美遮瑕，带给肌肤清爽柔滑的使用感受 多种功效齐集一身，各种问题一瓶搞定 ','00020001','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('34','伊丽莎白雅顿第五大道香水 30ml(多款包装随机发货) 婉约、柔和、温暖，是对第五大道永远都不会变得印象 独特瓶身设计, 显示现代都市生活精神 顶级香氛选材， 传达现代都会女性摩登时尚、自信活跃的风采 ',' 伊丽莎白雅顿','298',' 伊丽莎白雅顿 (Elizabeth Arden)第五大道香水 30ml','2013-04-01','100','20130331_333_1.jpg','伊丽莎白雅顿第五大道香水 30ml(多款包装随机发货) 婉约、柔和、温暖，是对第五大道永远都不会变得印象 独特瓶身设计, 显示现代都市生活精神 顶级香氛选材， 传达现代都会女性摩登时尚、自信活跃的风采 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('35','菲拉格慕 (Ferragamo)梦中彩虹香水 30ml，两款包装，随机发货。 仿佛阳光的照耀，唤起肌肤被温暖阳光包围所散发的香氛 外盒包装如此的引人入胜，犹如置身天堂般的光彩夺目 清新花果香调，优雅怡人 ','菲拉格慕','430','菲拉格慕 (Ferragamo)梦中彩虹香水 30ml','2013-04-01','100','20130331_333_2.jpg','菲拉格慕 (Ferragamo)梦中彩虹香水 30ml，两款包装，随机发货。 仿佛阳光的照耀，唤起肌肤被温暖阳光包围所散发的香氛 外盒包装如此的引人入胜，犹如置身天堂般的光彩夺目 清新花果香调，优雅怡人 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('36','兰蔻 (Lancome)奇迹香氛 30ml（两款包装随机发货) 味道甜美却不香腻 绝美灵感打造完美香氛 女人就是要展现个性 ','兰蔻 (Lancome)','500','兰蔻 (Lancome)奇迹香氛 30ml','2013-04-01','100','20130331_333_3.jpg','兰蔻 (Lancome)奇迹香氛 30ml（两款包装随机发货) 味道甜美却不香腻 绝美灵感打造完美香氛 女人就是要展现个性 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('37','范思哲 versace晶钻女用香水 30ml两款包装随机发货 瓶身设计恒久典雅，散发着清新优雅，如花芬芳的气息 精致典雅却又不失生动有趣的石榴香氛 澄澈透净的时尚水晶瓶衬托之下展现优雅妩媚的女性魅力 ','范思哲','430','范思哲 versace晶钻女用香水 30ml','2013-04-01','100','20130331_333_4.jpg','范思哲 versace晶钻女用香水 30ml两款包装随机发货 瓶身设计恒久典雅，散发着清新优雅，如花芬芳的气息 精致典雅却又不失生动有趣的石榴香氛 澄澈透净的时尚水晶瓶衬托之下展现优雅妩媚的女性魅力 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('38','伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml 香味清新雅淡而脱俗 撷取了了绿茶的治疗精华 提升了凉爽指数和清凉气味 ','伊丽莎白雅顿','210','伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml','2013-04-01','100','20130331_333_5.jpg','伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml 香味清新雅淡而脱俗 撷取了了绿茶的治疗精华 提升了凉爽指数和清凉气味 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('39','大卫杜夫冷水(女款)30ml，多款包装，随机发货。 即是Davidoff的得意之作，在欧美市场，它已成为香水线的主流产品 凝聚大自然中最重要的元素－水、清新空气及植物的芳香 冷水的造型十分简洁，柔婉的勾画了冷水美人的线条 ',' 大卫杜夫','320',' 大卫杜夫 (Davidoff)女士淡香水 30ml','2013-04-01','100','20130331_333_6.jpg','大卫杜夫冷水(女款)30ml，多款包装，随机发货。 即是Davidoff的得意之作，在欧美市场，它已成为香水线的主流产品 凝聚大自然中最重要的元素－水、清新空气及植物的芳香 冷水的造型十分简洁，柔婉的勾画了冷水美人的线条 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('40','玛亚科布(MarcJacobs)雏菊女士香水 100ml 极致奢华，赋予体验者无尽年轻、神秘感受 唯美的经典香调 设计灵感独一无二 ',' 玛亚科布','880',' 玛亚科布(MarcJacobs)雏菊女士香水 100ml','2013-04-01','100','20130331_333_7.jpg','玛亚科布(MarcJacobs)雏菊女士香水 100ml 极致奢华，赋予体验者无尽年轻、神秘感受 唯美的经典香调 设计灵感独一无二 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('41','克丽丝汀迪奥 (DIOR)真我香水 50ml 浓淡有致的花果香调 极其女性气质的表达 触及灵魂深处的馥郁 奢华金色瓶身 ','克丽丝汀迪奥','1040','克丽丝汀迪奥(DIOR)真我香水 50ml ','2013-04-01','100','20130331_333_8.jpg','克丽丝汀迪奥 (DIOR)真我香水 50ml 浓淡有致的花果香调 极其女性气质的表达 触及灵魂深处的馥郁 奢华金色瓶身 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('42','菲拉格慕蝶忆绽放女士香水 30ml，两款包装，随机发货。 清新的香调，掀起了新一波诱惑 震撼这个挑剔且要求品味与完美的时代 香味独特，香水瓶身的唯美设计 ','菲拉格慕','228','菲拉格慕 (Ferragamo)蝶忆绽放女士香水 30ml','2013-04-01','100','20130331_333_9.jpg','菲拉格慕蝶忆绽放女士香水 30ml，两款包装，随机发货。 清新的香调，掀起了新一波诱惑 震撼这个挑剔且要求品味与完美的时代 香味独特，香水瓶身的唯美设计 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('43','安娜苏 (Annasui)幻境绮缘淡香水 50ml 永远的紫色绮缘 让甜美的绮丽爱恋不断重现 迷蒙之间诠释着爱的呼唤 持续ANNA SUI香氛设计的浪漫理念 引领女孩们开启魔幻浪漫的绮丽童话 ','安娜苏','540','安娜苏 (Annasui)幻境绮缘淡香水 50ml','2013-04-01','100','20130331_333_10.jpg','安娜苏 (Annasui)幻境绮缘淡香水 50ml 永远的紫色绮缘 让甜美的绮丽爱恋不断重现 迷蒙之间诠释着爱的呼唤 持续ANNA SUI香氛设计的浪漫理念 引领女孩们开启魔幻浪漫的绮丽童话 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('44','克丽丝汀迪奥花漾甜心淡香水 50ml两款包装随机发货！ 气息温柔甜美 专为亚洲女性推出 低调奢华 ','克丽丝汀','830','克丽丝汀迪奥迪奥小姐花漾淡香水 50ml','2013-04-01','100','20130331_333_11.jpg','克丽丝汀迪奥花漾甜心淡香水 50ml两款包装随机发货！ 气息温柔甜美 专为亚洲女性推出 低调奢华 ','00030002','2013-04-01');
insert into `ec_article` (`ID`, `TITLE`, `SUPPLIER`, `PRICE`, `LOCALITY`, `PUTAWAY_DATE`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('45','浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml（两款包装随机发货） 若隐若现芳香诱惑，散发十足女人味 一首悦耳的旋律，引领你进入光韵的世界 呈现新世代女性柔美、愉悦、优雅而性感的个性 ','浪凡','428','浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml','2013-04-01','100','20130331_333_12.jpg','浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml（两款包装随机发货） 若隐若现芳香诱惑，散发十足女人味 一首悦耳的旋律，引领你进入光韵的世界 呈现新世代女性柔美、愉悦、优雅而性感的个性 ','00030002','2013-04-01');
