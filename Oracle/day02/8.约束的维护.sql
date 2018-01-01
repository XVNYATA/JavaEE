/**
创建约束分为两种：
1. 列级约束，直接在列后面写约束，数据库默认分配唯一的约束名称，例如SYS_C005943
2. 表级约束，在列创建完之后写约束，可以自定义约束名称
*/
DROP TABLE tb_student;

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '男' OR sex='女'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
-- clazz_id 参照 tb_clazz表的id,这种写法只是Oracle支持
clazz_id INT REFERENCES tb_clazz(ID)             
);

-- 数据字典
SELECT * FROM User_Constraints WHERE table_name = 'TB_STUDENT';
SELECT * FROM User_Cons_Columns WHERE table_name = 'TB_STUDENT';

-- 联合查询
SELECT c2.table_name,c2.column_name,c1.constraint_type
FROM User_Constraints c1 ,User_Cons_Columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = 'TB_STUDENT';


-- 表级约束 1 
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT ,
-- 创建约束
PRIMARY KEY(ID),
CHECK(NAME IS NOT NULL),
CHECK(sex = '男' OR sex = '女'),
CHECK(age > 15 AND age < 50),
UNIQUE(phone),
-- 外键(列)  参照 主表(列)
FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)
);

-- 表级约束 2
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT ,
-- 约束    约束名     约束类型(列)
CONSTRAINTS tb_student_pk PRIMARY KEY(ID),
CONSTRAINTS tb_student_n CHECK(NAME IS NOT NULL),
CONSTRAINTS tb_student_s CHECK(sex = '男' OR sex = '女'),
CONSTRAINTS tb_student_a CHECK(age > 15 AND age < 50),
CONSTRAINTS tb_student_u UNIQUE(phone),
-- 外键(列)  参照 主表(列)
CONSTRAINTS tb_student_fk FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)
);

/**
重点：推荐约束写法 外键做成表级约束，其他都写成列级约束
*/
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '男' OR sex='女'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
clazz_id INT,
CONSTRAINTS tb_student_fk FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)             
);

-- 建表之后创建约束，使用DDL
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT 
);

-- 注意：增加约束时如果表中已有的数据和约束有冲突，需要先搞定数据问题
-- 增加主键约束
ALTER TABLE tb_student ADD PRIMARY KEY(ID);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_pk PRIMARY KEY(ID);

-- 增加检查约束
ALTER TABLE tb_student ADD CHECK(sex = '男' AND sex = '女');
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_c CHECK(sex = '男' AND sex = '女');

-- 增加唯一约束
ALTER TABLE tb_student ADD UNIQUE(phone);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_u UNIQUE(phone);

-- 增加外键约束
ALTER TABLE tb_student ADD FOREIGN KEY(clazz_id) REFERENCES tb_clazz(ID);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_fk 
FOREIGN KEY(clazz_id) REFERENCES tb_clazz(ID);

-- 删除约束 DDL
ALTER TABLE tb_student DROP CONSTRAINTS tb_student_fk;

-- 如果需要修改约束，先删除，再重新创建

-- 禁用约束
alter table TB_STUDENT disable constraint TB_STUDENT_U;
  
-- 激活约束
alter table TB_STUDENT enable constraint TB_STUDENT_U;










