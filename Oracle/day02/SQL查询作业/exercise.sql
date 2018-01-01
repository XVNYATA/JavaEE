CREATE TABLE tb_Student(
  ID number  PRIMARY KEY, --学生编号
  NAME VARCHAR2(20) NOT NULL,--学生姓名
  Sex VARCHAR2(2) CHECK(Sex IN('男','女')) , --学生性别
  Age number, --学生年龄
  Address VARCHAR2(50) , --学生地址
  Tel VARCHAR2(30), --学生电话
  Email VARCHAR2(30)--学生邮箱
);


INSERT INTO tb_Student
VALUES
(1,'小强','男',20,'湖南省长沙市伍家岭江南苑9栋203号','0731-4230123','xq@sina.com');
INSERT INTO tb_Student
VALUES
(2,'李云','女',19,'湖南省长沙市东风路东风新村21栋502号','0731-4145268','ly@163.com');
INSERT INTO tb_Student
VALUES
(3,'鲁智深','男',30,'湖南省株洲市601厂宿舍15栋308号','0732-8342567',NULL);
INSERT INTO tb_Student
VALUES
(4,'张飞','男',28,'湖南省郴洲市人民医院20栋301号','0735-2245214',NULL);
INSERT INTO tb_Student
VALUES
(5,'翠花','女',21,'湖南省长沙市望月湖12栋403号','0731-8325124','ch@sina.com');


CREATE TABLE tb_Exam
(
  ID number ,         --学生编号
  NAME VARCHAR2(20) NOT NULL,                  --课程名称
  Score number CHECK(Score BETWEEN 0 AND 100),          --考试分数
  exam_date DATE,                      --考试时间
  PRIMARY KEY(ID,NAME),   --学生编号和课程名称做联合主键 
  CONSTRAINT tb_exam_fk FOREIGN KEY (id) REFERENCES tb_Student(id)
);

INSERT INTO tb_Exam VALUES(1,'C语言',78,to_date('2004-06-10','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(2,'C语言',90,to_date('2004-06-10','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(3,'C语言',0,NULL);
INSERT INTO tb_Exam VALUES(3,'VB',35,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(4,'VB',35,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(5,'VB',85,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(2,'网页编程',85,to_date('2004-08-20','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(3,'网页编程',85,NULL);



CREATE TABLE tb_Emp
(
   ID        number     PRIMARY KEY,--职员编号
   NAME    VARCHAR2(20)    NOT NULL,--职员姓名
   Sex        VARCHAR2(2)    NOT NULL    CHECK(sex IN ('男','女')),--职员性别                            
   Age        number    NOT NULL CHECK(age>=18),--职员年龄
   Address    VARCHAR2(50)    NOT NULL, --职员地址
   Tel        VARCHAR2(30)    NOT NULL,--职员电话
   Email    VARCHAR2(30)--职员邮箱
);


INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(1,'赵龙','男',25,'湖南省长沙市伍家岭江南苑9栋203号','0731-4230123');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(2,'李云','女',23,'湖南省长沙市东风路东风新村21栋502号','0731-4145268');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(3,'孙一成','男',24,'湖南省株洲市601厂宿舍15栋308号','0732-8342567');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(4,'林笑','男',27,'湖南省郴洲市人民医院20栋301号','0735-2245214');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(5,'卫晴','女',23,'湖南省长沙市望月湖12栋403号','0731-8325124');


CREATE TABLE tb_Prod
(
   ID        number     PRIMARY KEY,--商品编号
   TYPE    VARCHAR2(20)    NOT NULL,--商品类型
   Mark    VARCHAR2(20)    NOT NULL,--商品品牌
   Spec    VARCHAR2(20)--商品规格
);



INSERT INTO tb_prod VALUES(1,'电视机','长虹','29英寸纯平');

INSERT INTO tb_prod VALUES(2,'电视机','长虹','29英寸纯平艺术');

INSERT INTO tb_prod VALUES(3,'电视机','长虹','32英寸背投');

INSERT INTO tb_prod VALUES(4,'电视机','熊猫','29英寸纯平');

INSERT INTO tb_prod VALUES(5,'电视机','熊猫','29英寸纯平艺术');

INSERT INTO tb_prod VALUES(6,'电视机','熊猫','32英寸背投');

INSERT INTO tb_prod VALUES(7,'笔记本','联想','P4-1.8G');

INSERT INTO tb_prod VALUES(8,'笔记本','联想','P4-2.4G');

INSERT INTO tb_prod VALUES(9,'笔记本','紫光','P4-1.8G');

INSERT INTO tb_prod VALUES(10,'笔记本','紫光','P4-2.4G');


CREATE TABLE tb_Sales
(
   srNO        number     PRIMARY KEY,--记录编号
   eID        number    NOT NULL REFERENCES tb_emp(id),--职员编号
   pID        number    NOT NULL REFERENCES tb_prod(id),--商品编号
   pQty        number    NOT NULL CHECK(pqty>0),--销售数量
   pAmount    number        NOT NULL CHECK(pamount>0),--销售价值
   sDate    date    default sysdate --销售时间
);


INSERT INTO tb_sales VALUES(1,1,1,10,21000,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(2,1,2,5,20000,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(3,1,1,4,23500,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(4,1,5,4,16500,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(5,2,3,3,31000,to_date('2004-3-11','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(6,2,6,4,40000,to_date('2004-3-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(7,3,7,5,40000,to_date('2004-3-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(8,3,8,3,36000,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(9,4,9,6,41500,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(10,4,10,5,50000,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(11,1,1,10,21000,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(12,1,2,5,20000,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(13,1,4,12,23500,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(14,1,5,4,16500,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(15,2,3,3,31000,to_date('2004-4-11','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(16,2,6,4,40000,to_date('2004-4-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(17,3,7,5,40000,to_date('2004-4-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(18,3,8,3,36000,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(19,4,9,6,41500,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(20,4,10,5,50000,to_date('2004-4-14','yyyy-mm-dd'));


