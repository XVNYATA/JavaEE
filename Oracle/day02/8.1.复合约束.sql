/**
当定义约束的时候, 不仅可以基于单列定义约束,也可以基于多列定义复合约束.

通常复合约束常用于主键约束和唯一键约束。

注意, 复合约束只能在表级中定义.

*/
-- 报表
-- id   年    月
--  1   2016  1
--  2   2016  2
-- 3    2016  1
-- 唯一键复合约束
CREATE TABLE tb_ropt(
ID INT PRIMARY KEY,
YEAR CHAR(4),
MONTH CHAR(2),
CONTENT VARCHAR2(18),
--  将年，月做成唯一键
UNIQUE(YEAR,MONTH)
);

INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(1,'2016','1');
INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(2,'2016','2');
-- 违反唯一约束条件
INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(3,'2016','1');


-- 主键复合约束
CREATE TABLE tb_ropt(
YEAR CHAR(4),
MONTH CHAR(2),
CONTENT VARCHAR2(18),
--  将年，月做成联合主键
PRIMARY KEY(YEAR,MONTH)
);

INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','1');
INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','2');
-- 违反唯一约束条件
INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','1');
