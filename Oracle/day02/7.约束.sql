SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- 数据完整性
-- 测试插入不正确数据
-- 非空
INSERT INTO tb_student(sex,age,address,phone) VALUES('女',25,'香港','13902000004');
-- 检查
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('mary','妖',250,'香港','13902000004');
-- 唯一
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('mary','女',25,'香港','13902000001');

/**
CHECK 检查约束
  -- NOT NULL 非空约束（特殊的检查约束）
UNIQUE KEY 唯一约束
PRIMARY KEY 主键约束
FOREIGN KEY 外键约束

创建约束分为两种：
1. 列级约束，直接在列后面写约束，数据库默认分配唯一的约束名称，例如SYS_C005943
2. 表级约束，在列创建完之后写约束，可以自定义约束名称
*/
-- 删除tb_student表，重新创建，增加约束
DROP TABLE tb_student;


CREATE TABLE tb_student(
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '男' OR sex='女'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE
);

INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('jack','男',20,'广州','13902000001');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('rose','女',19,'广州','13902000002');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('tom','男',25,'香港','13902000003');


/**
PRIMARY KEY 主键约束
为什么要有主键约束？
作用：用来唯一确定一行记录

（1）主键是表中唯一确定一行数据的字段，主键从功能上看相当于非空且唯一
（2）一个表中只允许一个主键
（3）主键字段可以是单字段或者是多字段的组合
（4）当建立主键约束时，Oracle为主键创建对应的索引
（5）现代数据库建模，建议一张表一定要有主键，并且主键应该和业务数据无关，建议使用自动增长的自然数。
*/
INSERT INTO tb_student(NAME,sex,age,address) VALUES('mary','女',25,'香港');
INSERT INTO tb_student(NAME,sex,age,address) VALUES('mary','女',25,'香港');

-- 删除其中一条name是mary的数据
-- 因为两条mary数据完全一致，无法唯一确定其中任何一条数据
DELETE FROM tb_student WHERE NAME = 'mary';

-- 再次建表，增加主键约束
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '男' OR sex='女'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE
);

INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(1,'jack','男',20,'广州','13902000001');
INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(2,'rose','女',19,'广州','13902000002');
INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(3,'tom','男',25,'香港','13902000003');
INSERT INTO tb_student(id,NAME,sex,age,address) VALUES(4,'mary','女',25,'香港');
INSERT INTO tb_student(id,NAME,sex,age,address) VALUES(5,'mary','女',25,'香港');




/**
FOREIGN KEY 外键约束
为什么要有外键约束？

格式 FOREIGN KEY (外键列名) REFERENCES 主表(参照列)
作用：外键是构建于一个表的两个字段或者两个表的两个字段之间的关系，解决数据冗余（多余）问题。
例如：通过clazz_id字段将tb_claz表和tb_student表关联起来。

clazz_id INT REFERENCES tb_clazz(ID) 

外键要注意的问题：
1.子(从)表[tb_student]外键列[clazz_id]的值必须在父(主)表[tb_clazz]参照列[id]值的范围内，
或者为空（也可以加非空约束，强制不允许为空）。

2.外键[clazz_id]参照的只能是主表[tb_clazz]主键或者唯一键，
保证子表记录可以准确定位到被参照的记录。

3.当主表[tb_clazz]的记录被子表[tb_student]参照时，主表记录不允许被删除。

4.建表时可以增加以下设置：
（1）ON DELETE CASCADE:当父表中的行被删除的时候，同时删除在子表中依靠的行

clazz_id INT REFERENCES tb_clazz(ID)  ON DELETE CASCADE

（2）ON DELETE SET NULL:将依靠的外键值转换为空值

clazz_id INT REFERENCES tb_clazz(ID)  ON SET NULL

*/

-- 以下会产生数据冗余情况
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '男' OR sex='女'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
c_code VARCHAR2(18),
c_name VARCHAR2(18),
c_bzr VARCHAR2(18)
);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(1,'jack','男',20,'广州','13902000001','j1604','Java就业班','黄老师');
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(2,'rose','女',19,'广州','13902000002','j1604','Java就业班','黄老师');
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(3,'tom','男',25,'香港','13902000003','j1604','Java就业班','黄老师');



-- 使用外键解决数据冗余问题
CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);

INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(1,'j1603','Java就业班','谢老师');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1604','Java就业班','黄老师');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(3,'j1605','Java基础班','李老师');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
-- clazz_id 参照 tb_clazz表的id
clazz_id INT REFERENCES tb_clazz(ID)             
);

INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id) 
VALUES(1,'jack','男',20,'广州','13902000001',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(2,'rose','女',19,'广州','13902000002',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(3,'tom','男',25,'香港','13902000003',2);
 
 -- 1.子(从)表[tb_student]外键列[clazz_id]的值必须在父(主)表[tb_clazz]参照列[id]值的范围内，
 -- 没有班级id为7的班级，下面的数据不允许插入
 INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(4,'mary','男',25,'香港','13902000004',7);
 
 
 -- 2.外键[clazz_id]参照的只能是主表[tb_clazz]主键或者唯一键，
-- 保证子表记录可以准确定位到被参照的记录。
CREATE TABLE tb_clazz(
ID INT ,
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1603','Java就业班','谢老师');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1604','Java就业班','黄老师');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1605','Java基础班','李老师');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT             
);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id) 
VALUES(1,'jack','男',20,'广州','13902000001',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(2,'rose','女',19,'广州','13902000002',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(3,'tom','男',25,'香港','13902000003',2);
-- 反证法： 由于id为2的班级有多个，无法准确定位。

-- 3.当主表[tb_clazz]的记录被子表[tb_student]参照时，主表记录不允许被删除。
DELETE FROM tb_clazz WHERE ID = 2;

-- 解决方案
-- (1) 先删除子表关联数据，再删除主表数据
DELETE FROM tb_student WHERE clazz_id = 2;
-- (2) 先修改子表关联数据，再删除主表数据
UPDATE tb_student SET clazz_id = 1 WHERE clazz_id = 2;
-- (3) 先将子表关联数据设置为null（前题是该字段允许为null），再删除主表数据
UPDATE tb_student SET clazz_id = NULL WHERE clazz_id = 2;

/**
4.建表时可以增加以下设置：
（1）ON DELETE CASCADE:当父表中的行被删除的时候，同时删除在子表中依靠的行
     等同于解决方案（1）
clazz_id INT REFERENCES tb_clazz(ID)  ON DELETE CASCADE

（2）ON DELETE SET NULL:将依靠的外键值转换为空值
等同于解决方案（3）
clazz_id INT REFERENCES tb_clazz(ID)  ON SET NULL
*/
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT REFERENCES tb_clazz(ID) ON DELETE SET NULL            
);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
