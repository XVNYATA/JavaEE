-- 谁的工资比ALLEN高

SELECT * FROM scott.emp;

-- 查ALLEN的工资
SELECT sal FROM scott.emp WHERE ename = 'ALLEN';
-- 查工资比ALLEN高的
SELECT * FROM scott.emp WHERE sal > 1600;

-- 子查询
SELECT * FROM scott.emp WHERE sal > 
(
SELECT sal FROM scott.emp WHERE ename = 'ALLEN'
);


-- 子查询也可以用于查询结果集
SELECT * FROM 
(
   SELECT * FROM scott.emp     
) e,
(
  SELECT * FROM scott.dept
) d;


-- 注意： 单行子查询返回多行
SELECT * FROM scott.emp WHERE sal > 
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);

-- in 包含
SELECT * FROM scott.emp WHERE sal IN
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);


-- any 与子查询返回的每一个值比较  > any  大于最小的    < any 小于最大的
SELECT * FROM scott.emp WHERE sal > ANY
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);


-- all 与子查询返回的所有值比较  > all 大于最大的   < all  小于最小的
SELECT * FROM scott.emp WHERE sal > ALL
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);
