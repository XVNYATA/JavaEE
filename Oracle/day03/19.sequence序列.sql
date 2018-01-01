CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(10)
);
INSERT INTO tb_clazz(ID,CODE) VALUES(1,'j1604');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL, 
sex CHAR(2) CHECK(sex='男' OR sex='女'),  
age INT CHECK (age > 18 AND age < 60),
email VARCHAR2(50) UNIQUE,
address VARCHAR2(100) DEFAULT '广州', 
iphone VARCHAR2(20),
clazz_id INT,
CONSTRAINTS tb_student_fk FOREIGN KEY (clazz_id) REFERENCES tb_clazz(ID)
)

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;


/**
Oracle中的对象： 表、序列
对象的特点：可以给其他对象使用，名字不能重复
序列  自动生成的唯一序列号 ，常用在主键自动生成
*/
CREATE  SEQUENCE  s_tb_student; 
/*
创建序列时，如果不指定其他，则默认从1开始，每次自动增长1，
最大数是999999999999999999999999999。
默认不循环。
create sequence S_TB_STUDENT
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;
*/


--1.创建   序列     序列名
CREATE SEQUENCE s_tb_student;

--3. 删除  序列   序列名
DROP SEQUENCE s_tb_student;

--2.使用序列,序列有两个属性currval，nextval
--必须要使用过序列(nextval),才能查询currval
--执行过nextval之后，该值就已经使用了
--查询当前值currval时，序列必须已经使用过
SELECT s_tb_student.currval FROM dual;
SELECT s_tb_student.nextval FROM dual;


--数据字典
SELECT * FROM user_sequences;

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- 使用序列

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Scott','男',22,'香港','scott@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Jack','男',22,'香港','jack@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Rose','男',22,'香港','rose@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(9,'Tom','男',22,'香港','tom@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Alice','女',22,'香港','alice@163.com',1);

--序列作为一个对象,可以给多个table使用 建议一张表使用一个序列

INSERT INTO tb_clazz(ID,CODE) VALUES(s_tb_student.nextval,'j1508');


/**
序列不会随着rollback回滚,下面这些情况时Sequence值可能产生间隙
回滚发生
序列被用于其他的表(不建议)  建议一张表使用一个序列
系统宕机
*/


