SELECT * FROM tb_emp;
SELECT * FROM tb_prod;
SELECT * FROM tb_sales;

单表查询
1. 查询所有职员的所有信息

SELECT * FROM tb_emp;
 
2. 查询所有职员的姓名,电话,地址

 SELECT NAME,tel,address FROM tb_emp;

3. 查询所有女职员的详细信息

SELECT * FROM tb_emp WHERE sex = '女';
 
4. 查询年龄在24到26岁之间的职员的姓名,性别


SELECT NAME,sex,age FROM tb_emp WHERE age BETWEEN 24 AND 26;
 

5. 查询家住长沙的女职员的姓名,电话,地址

SELECT NAME,tel,address FROM tb_emp WHERE sex = '女' AND address LIKE '%长沙%';
 
6. 查询李云,孙一成,林笑的电话,地址

SELECT NAME,tel,address FROM tb_emp WHERE NAME IN('李云','孙一成','林笑');
 
7. 查询郴洲和株洲的职员的姓名,性别,年龄

SELECT NAME,sex,age,address FROM tb_emp WHERE address LIKE '%郴洲%'
OR address LIKE '%株洲%';

 
8. 查询家住长沙,年龄在25到28岁之间的男职员的姓名

SELECT NAME,sex,age,address
FROM tb_emp 
WHERE sex = '男'
AND age BETWEEN 25 AND 28
AND address LIKE '%长沙%';
 

9. 查询邮件地址为空的职员

SELECT * FROM tb_emp WHERE email IS NULL;


合计
1. 总共有多少个职员？

SELECT COUNT(*) FROM tb_emp;
 
3. 年龄最小的女职员的年龄

SELECT MIN(age) FROM tb_emp WHERE sex = '女';
 
7. 按性别统计职员的最大年龄和最小年龄

SELECT sex,MAX(age),MIN(age)
FROM tb_emp 
GROUP BY sex;
 

4. 笔记本单笔销售价值最高的单笔销售价值

SELECT MAX(s.pamount)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '笔记本';

 
5. 熊猫电视机的平均销售价格

SELECT SUM(s.pamount) / SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '电视机'
AND p.mark = '熊猫';
 
6. 紫光笔记本4月份的销售总额
 
SELECT SUM(s.pamount)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '笔记本'
AND p.mark = '紫光'
AND to_char(s.sdate,'mm') = '04';


分组与合计
1. 按类型,品牌统计商品的销售总数量,销售总数量,低于20的不统计

SELECT p.type,p.mark,SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
GROUP BY p.type,p.mark
HAVING SUM(s.pqty) >= 20;
 
2. 按品牌,规格统计笔记本的平均销售价格,按销售价格从高到低的顺序显示

SELECT p.mark,p.spec,SUM(s.pamount)/SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '笔记本'
GROUP BY p.mark,p.spec
ORDER BY SUM(s.pamount)/SUM(s.pqty) DESC;
 
3. 按姓名统计男职员3月份的销售总额,销售总额低于80000的不统计

SELECT e.name,SUM(s.pamount)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
AND e.sex = '男'
AND to_char(s.sdate,'mm') = '03'
GROUP BY e.name
HAVING SUM(s.pamount) > 80000;
 
 
5. 按姓名统计每个职员一共完成了多少笔销售业务

SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name;
 
6. 找出完成销售业务笔数最少的职员的姓名和他完成的业务数

-- 1.使用子查下和rownumm完成，如果有相同的，结果不正确
SELECT * FROM (
SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
ORDER BY COUNT(*)
 )
 WHERE ROWNUM = 1;
 
 -- 2. 使用having和子查询
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT COUNT FROM (
SELECT e.name,COUNT(*) AS COUNT
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
ORDER BY COUNT(*)
 )
 WHERE ROWNUM = 1
);

-- 3. 使用having和子查询
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) <= ALL
(
SELECT COUNT(*) AS COUNT
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
);

-- 4. 子查询中使用嵌套函数
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT min(COUNT(*))
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
);

-- 5. 
SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT min(COUNT(*))
FROM tb_sales s
GROUP BY s.eid
);

4. 找出销售总额最高的职员的姓名
 
SELECT e.name,SUM(s.pamount)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING SUM(s.pamount) = 
(
SELECT MAX(SUM(s.pamount))
FROM tb_sales s
GROUP BY s.eid
);



多表查询
1. 所有职员,所有商品的销售情况,
包括:职员姓名,商品类别,商品品牌,商品规格,销售数量,销售价值,销售时间,按销售时间从高到低排列

SELECT *
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid 
AND p.id = s.pid;

 

2. 笔记本4月份的销售情况,
包括:商品编号,商品品牌,商品规格,销售数量,销售价值,按销售数量从低到高排列

SELECT *
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '笔记本'
AND to_char(s.sdate,'mm') = '04';


3. 李云3月份的销售情况,包括:商品编号,商品品牌,商品规格,销售数量,销售价值
1.李云在tb_emp表，商品编号,商品品牌,商品规格在tb_prod表,销售数量,销售价值在tb_sales表
三张表连接,
2.找关联条件
3.找筛选条件

SELECT e.name,p.id,p.type AS 商品品牌,p.mark AS 商品规格,s.pqty AS 销售数量,s.pamount 销售价格
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid AND p.id = s.pid
AND e.name='李云'
AND to_char(s.sdate,'mm')='03';
 

4. 长虹29英寸纯平艺术电视机的销售情况,包括:销售数量,销售价值,销售时间

SELECT *
FROM tb_prod p ,tb_sales s
WHERE p.id = s.pid
AND p.type = '电视机'
AND p.mark = '长虹'
AND p.spec = '29英寸纯平艺术';
 
5. 长沙男职员4月份的销售情况,包括:职员姓名,商品类别,商品品牌,商品规格,销售数量,销售价值

 SELECT *
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid AND p.id = s.pid
AND e.sex = '男'
AND to_char(s.sdate,'mm') = '04'
AND address LIKE '%长沙%';

