/***
DDL(Data Definition Language):数据定义语言，定义对数据库对象(库、表、列、索引)的操作。
CREATE（创建）、DROP（删除）、ALTER（更新）、RENAME（重命名）、 TRUNCATE（截断）等

用户表
表结构： name，sex，age
数据：  jack，男，22

创建  表  表名(
列名[字段]  列类型(长度),
列名  列类型(长度),
列名  列类型(长度)  
);
注意：列和列之间用","隔开，最后一个列不需要","
*/
CREATE TABLE tb_person(
NAME VARCHAR2(18),
sex CHAR(3),
age INT
);

-- * 表示所有列
SELECT * FROM tb_person;

-- 如果表结构不符合实际情况,那么在建表后, 可以使用 alter table语句改变表结构, 例如增加列,改变列定义,删除列等. 

-- 修改  Alter
-- 增加两个字段address,phone
-- 更新  表   表名    添加 (列名  类型(长度))
ALTER TABLE tb_person ADD (address VARCHAR2(50),phone VARCHAR2(30));

-- 删除字段
-- 删除addresss，phone
-- 更新  表   表名    删除 (列名  类型(长度))
ALTER TABLE tb_person DROP (address,phone);

-- 修改字段的长度
-- 将address列的长度改成100
-- 更新  表   表名    修改 (列名  类型(长度))
ALTER TABLE tb_person MODIFY(address VARCHAR2(100));

-- 修改列名
-- 更新  表   表名    改名  列  旧列名 to 新列名
ALTER TABLE tb_person RENAME COLUMN phone TO iphone6S;

-- 修改表名
-- 改名   旧表名  to  新表名
RENAME  tb_person TO tb_user;
RENAME  tb_user TO tb_person;


-- 删除表  drop
-- 注意：drop table作用于表，一次将表数据和表结构全部删除。谨慎使用 
-- 删除  表  表名
DROP TABLE tb_person;


-- 截断表  TRUNCATE
-- 作用于表，一次将表中所有数据全部删除，但是保留表结构
TRUNCATE TABLE tb_person;

-- 注释  简单了解
-- 注释  on 表  表名  is  '自己的注释'
COMMENT  on table tb_person is '用户表';
COMMENT  on column tb_person.name is '姓名';

--  用户.表名[对象名]
-- 默认查询当前用户的表
SELECT * FROM tb_person;
SELECT * FROM j1601.tb_person;
SELECT * FROM scott.emp;


/**
数据字典主要有三种静态视图组成，每种应用在不同的范围中
DBA:所有方案中的对象
ALL:用户所能访问的所有对象
USER:在用户方案中的对象
*/
SELECT * FROM dba_tables;
SELECT * FROM all_tables;
SELECT * FROM user_tables;



