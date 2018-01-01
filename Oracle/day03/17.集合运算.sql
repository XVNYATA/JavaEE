--从多个结果集中提取数据
select * from scott.dept;
select * from scott.emp;

--集合运算：从多个结果集中提取数据

-- UNION运算符从两个查询中返回消除重复之后的结果，类似distinct
-- 把两个结果集的数据合起来，然后干掉重复的
--10,20,30,40  两个查询中返回消除重复之后的结果
select deptno from scott.dept -- 4
UNION
select deptno from scott.emp;  -- 14

--UNION ALL返回两个查询的结果，其中包括重复的
-- 把两个结果集的数据合起来
--18
select deptno from scott.dept  --4
UNION ALL
select deptno from scott.emp;   --14

--返回两个查询中都出现的记录 10,20,30
-- 把两个结果集的数据合起来，然后干掉重复的，再找两个查询中都出现的记录
select deptno from scott.dept  --4
INTERSECT
select deptno from scott.emp;   --14

--判断数据存在第一查询的结果集,而不存在第二查询的数据集; 40
select deptno from scott.dept --4
MINUS
select deptno from scott.emp; --14



CREATE TABLE b (
  ID NUMBER NOT NULL,
  R2 varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;


insert  into b(ID,R2) values (2,'welcome');
insert  into b(ID,R2) values(3,'test');


CREATE TABLE r (
  ID NUMBER NOT NULL,
  R1 varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

insert  into r(ID,R1) values (1,'hello');
insert  into r(ID,R1) values (2,'world');


SELECT * FROM b;
SELECT * FROM r;


SELECT r.id,r.R1,nvl(b.R2,'null') FROM r , b WHERE r.id = b.id(+)
UNION 
SELECT b.id,nvl(r.R1,'null'),b.R2 FROM r ,b WHERE r.id(+) = b.id;

-- 标准sql
SELECT r.id,r.R1,b.R2 FROM r LEFT OUTER JOIN b ON r.id = b.id
UNION 
SELECT b.id,r.R1,b.R2 FROM r RIGHT OUTER JOIN b ON b.id = r.id;


-- 全外连接
SELECT r.id,b.id ,r.R1,b.R2 FROM r FULL OUTER JOIN b ON r.id = b.id;

SELECT nvl(r.id,b.id) AS ID ,r.R1,b.R2 FROM r FULL OUTER JOIN b ON r.id = b.id;
