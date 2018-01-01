/**
软件开发过程:
1. 需求调研,与客户进行沟通
2. 需求分析，将现实工作中的动作模拟到计算机
   数据建模
3. 开发
4. 测试
5. 上线部署

从关系数据库的表中删除冗余信息的过程称为规范化，
是得到高效的关系型数据库表的逻辑结构最好和最容易的方法。

获得数据规范化的方法: 三范式

步骤1:
第一范式： 必须要有主键,并且每个属性值 都是不可再分的最小数据单位，则称R是第一范式的关系。
第二范式： 所有非主关键字都完全依赖于主关键字(通常用于联合主键)
第三范式： 非主关键字不能依赖于其他非主关键字（通常用于一个主键）

*/

-- 有N个班级，有N个学生，有N门课程
-- 一个班可以有多个学生，一个学生只能属于一个班，一个学生可以选修多门课程，一门课程可以被多个学生选修

CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(10)
);

INSERT INTO tb_clazz(ID,CODE)VALUES(1,'j1604');
INSERT INTO tb_clazz(ID,CODE)VALUES(2,'j1605');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL, 
sex CHAR(2) CHECK(sex='男' OR sex='女'),  
age INT CHECK (age > 18 AND age < 60),
email VARCHAR2(50) UNIQUE,
address VARCHAR2(100) DEFAULT '广州', 
iphone VARCHAR2(20),
clazz_id INT,
FOREIGN KEY (clazz_id) REFERENCES tb_clazz(ID)
)

INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(1,'jack','男',20,'jack@163.com','HK','18620000001',1);
INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(2,'mary','男',20,'mary@163.com','HK','18620000002',1);
INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(3,'tom','男',20,'tom@163.com','HK','18620000003',2);

CREATE TABLE tb_course(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
CREDIT VARCHAR2(18)
);

INSERT INTO tb_course(ID,NAME,CREDIT)VALUES(1,'JAVASE',5);
INSERT INTO tb_course(ID,NAME,CREDIT)VALUES(2,'JAVAEE',10);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
SELECT * FROM tb_course;
SELECT * FROM tb_student_course;


-- id为1的学生选择了JAVASE课程，怎么存储数据
/** id   name  clazz_id  course_id 
    1     jack   1        1
    
-- id为1的学生选择了JAVAEE课程，怎么存储数据
id   name  clazz_id  course_id   course_id2
    1     jack   1        1       2
-- id为1的学生选择了JAVASE课程，考试90分
id   name  clazz_id  course_id  grade 
    1     jack   1        1      90
    
/**
数据建模 
1. 根据三个范式
2. 分析实体之间的关系

一对一： 一个人只有一个身份证  唯一外键关联或者主键关联
一对多： 一个班级可以有多个学生    一个学生只属于一个班级 （clazz - student）
        关联： 一对多使用主外键关联，通常在多方（student）建立外键
多对多： 一个学生可以选择多门课程   一门课程可以被多个学生选修 （student - course）
          关联： 多对多通常使用中间表（再多建一张表存储）关联数据
                 通常中间表会有两张表的id作为联合主键，并且作为外键指向关联表
*/
CREATE TABLE tb_student_course(
student_id INT,
course_id INT,
grade INT,
PRIMARY KEY(student_id,course_id),
FOREIGN KEY(student_id) REFERENCES tb_student(ID),
FOREIGN KEY(course_id) REFERENCES tb_course(ID)
);

-- id为1的学生选择了JAVASE课程，怎么存储数据
/** student_id  course_id   grader
      1              1       90
    
-- id为1的学生选择了JAVAEE课程，怎么存储数据
   student_id  course_id   grader
      1              2       80
**/
INSERT INTO tb_student_course(student_id,course_id,grade) VALUES(1,1,90);
INSERT INTO tb_student_course(student_id,course_id,grade) VALUES(1,2,80);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
SELECT * FROM tb_course;
SELECT * FROM tb_student_course;

-- 查询“jack”的信息，包括班级，课程，分数

SELECT s.name,c.code,c2.name,sc.grade
FROM tb_clazz c,tb_student s,tb_course c2,tb_student_course sc
WHERE c.id = s.clazz_id
AND s.id = sc.student_id
AND c2.id = sc.course_id
AND s.name = 'jack';

/**
课堂练习：

1. 班级、学生、课程、中间表插入数据，jack最少选修2门课程
   查询‘jack’的详细信息，包括：
   班级名称、所选的课程，课程的学分和分数
   
   
2. 网上购书
书 : id，书名、出版社、出版时间、价格、作者、描述
用户：id， 姓名、地址、电话、email
订单: id , 编号code 

用户和订单是一对多。
订单和书籍是多对多
用户和书籍是多对多，但是用户和订单是有关联关系，所以不需要再多建中间表维护用户和书籍的关系
tb_user: id
tb_order:id   user_id
tb_book: id
tb_item: order_id,book_id,count


3. 书、用户、订单、中间表插入数据，jack最少购买2种，每种购买2本书
   查询“jack”的详细信息，包括：
   用户信息、订单信息、购买书籍名称、购买的数量
*/

CREATE TABLE tb_book(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
author VARCHAR2(18),
price NUMBER,
pree VARCHAR2(50),
remark VARCHAR2(100)
);
CREATE SEQUENCE s_tb_book;

INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'疯狂Java讲义','李刚',99,'电子工业出版社','好书');

INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'疯狂Android讲义','李刚',88,'电子工业出版社','好书');


INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'疯狂Ajax讲义','李刚',77,'电子工业出版社','好书');

CREATE TABLE tb_user(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
phone VARCHAR2(30) NOT NULL,
address VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE s_tb_user;

INSERT INTO tb_user(ID,NAME,phone,address) VALUES(s_tb_user.nextval,'jack','13902001235','天河车陂');


CREATE TABLE tb_order(
ID INT PRIMARY KEY,
CODE VARCHAR2(32) NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES tb_user(ID)
);

CREATE SEQUENCE s_tb_order;

INSERT INTO tb_order(ID,CODE,user_id) VALUES(s_tb_order.nextval,'uuid001',1);

CREATE TABLE tb_item(
order_id INT,
book_id INT,
COUNT INT,
PRIMARY KEY(order_id,book_id),
FOREIGN KEY (order_id) REFERENCES tb_order(ID),
FOREIGN KEY (book_id) REFERENCES tb_book(ID)
);

INSERT INTO tb_item(order_id,book_id,COUNT) VALUES(2,1,10);
INSERT INTO tb_item(order_id,book_id,COUNT) VALUES(2,2,5);


SELECT * FROM tb_book;
SELECT * FROM tb_user;
SELECT * FROM tb_order;
SELECT * FROM tb_item;

-- 查询“jack”的购买信息
SELECT u.name,o.code,b.name,b.price,i.count
FROM tb_user u,tb_book b,tb_order o,tb_item i
WHERE u.id = o.user_id
AND o.id = i.order_id
AND b.id = i.book_id
AND u.name = 'jack';


/**
一对一： 一个人只有一个身份证  唯一外键关联或者主键关联
*/
-- 唯一外键关联,需要多一个外键列维护关联关系 推荐使用
CREATE TABLE tb_card(
ID INT PRIMARY KEY,
CODE VARCHAR2(18)
);

INSERT INTO tb_card(ID,CODE) VALUES(1,'123456');

CREATE TABLE tb_person(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
card_id INT UNIQUE,
FOREIGN KEY (card_id) REFERENCES tb_card(ID)
);

INSERT INTO tb_person(ID,NAME,card_id) VALUES(1,'jack',1);


-- 主键关联
CREATE TABLE tb_card(
ID INT PRIMARY KEY,
CODE VARCHAR2(18)
);

INSERT INTO tb_card(ID,CODE) VALUES(1,'123456');

CREATE TABLE tb_person(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
FOREIGN KEY (ID) REFERENCES tb_card(ID)
);

INSERT INTO tb_person(ID,NAME) VALUES(1,'jack');







