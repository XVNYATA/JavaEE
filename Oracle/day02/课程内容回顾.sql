/**
课堂练习：
1. 创建一个班级表，编号、名称、班主任，插入5条数据。
2. 创建一个学生表，姓名，性别，年龄，地址，电话，插入50条数据。
3. 测试数据的插入、修改、删除和事物操作。
*/
CREATE TABLE tb_clazz(
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);

INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1603','Java就业班','谢老师');
INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1604','Java就业班','黄老师');
INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1605','Java基础班','李老师');

CREATE TABLE tb_student(
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30)
);

INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('jack','男',20,'广州','13902000001');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('rose','女',19,'广州','13902000002');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('tom','男',25,'香港','13902000003');


SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
