-- 创建数据库
CREATE DATABASE j1604;

-- 删除数据表
DROP DATABASE j1604;

-- 查看所有数据库
SHOW DATABASES;

-- 使用数据库
USE jss;
USE j1604;

-- 创建数据表
CREATE TABLE tb_student(
id INT PRIMARY KEY
)

-- 查询数据表
SELECT * FROM tb_student;		
-- 删除数据表
DROP TABLE tb_student;


/** MySQL 的语法 **/

-- 字符串 varchar (Oracle -> varchar2)
-- 字符 char
-- 数值 int\float\double (Oracle -> number)
-- 日期 date (精确到年月日)\ datetime （精确到时分秒）



/** Auto_increment 自动增长 **/
-- 自动增长一般是用在主键，一张表只能是有一个“自动增长”
CREATE TABLE tb_student(
id INT PRIMARY KEY AUTO_INCREMENT,
card VARCHAR(10)
)

SELECT * FROM tb_student;

-- 插入数据
INSERT INTO tb_student(card) VALUE ('123456');
INSERT INTO tb_student(card) VALUE ('Jss好帅');
INSERT INTO tb_student(card) VALUE ('Jss巨帅');

INSERT INTO tb_student(id,card) VALUE ('8','Jss巨帅');

INSERT INTO tb_student(card) VALUE ('Jss超级帅');
INSERT INTO tb_student(card) VALUE ('Jss就是帅');


/** 取值范围 **/ 
CREATE TABLE tb_person(
id INT PRIMARY KEY AUTO_INCREMENT,
-- 非空
NAME VARCHAR(10) NOT NULL,
-- 约束 选择
sex CHAR(2) CHECK (sex='男' OR sex='女'),
-- 约束 范围
age INT CHECK (age > 0 AND age < 100),
-- 默认值
address VARCHAR(10) DEFAULT '广州',
-- 唯一
email VARCHAR(20) UNIQUE,

clazz_id INT NOT NULL,
CONSTRAINT tb_student_fk FOREIGN KEY(clazz_id) REFERENCES tb_student(id)
)


微信：Jss_forever    QQ:908448029  不肥的童年 



SELECT * FROM tb_person;

INSERT INTO tb_person(NAME,sex,age,email,clazz_id) 
VALUES ('Jss','男',18,'zsfz_053@126.com',1);

INSERT INTO tb_person(NAME,sex,age,email,clazz_id) 
VALUES ('小泽','女',18,'xiaoze_053@126.com',2);

INSERT INTO tb_person(NAME,sex,age,address,email,clazz_id) 
VALUES ('小谢','女',18,'smallJapan','xiaoxie_053@126.com',3);


-- MySQL CHECK 是没用的

-- SQL 语句搞不定的话，那么就用 Java 代码来搞
-- JDBC 技术
INSERT INTO tb_person(NAME,sex,age,email,clazz_id) 
VALUES ('小花','妖',18,'xiaohua_053@126.com',8);

INSERT INTO tb_person(NAME,sex,age,email,clazz_id)
VALUES ('小东','女',118,'xiaodong_053@126.com',9);


/** 分页 limit **/
-- 第一个参数，起始行数
-- 第二个参数，显示行数
SELECT * FROM tb_person LIMIT 0,2;
SELECT * FROM tb_person LIMIT 2,2;
SELECT * FROM tb_person LIMIT 4,2;


-- pageIndex 当前页码 1	2 3
-- pageSize 显示行数  2
-- (pageIndex - 1)*pageSize, pageSize;
SELECT * FROM tb_person LIMIT 4,2;





