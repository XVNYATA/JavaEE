多表连接查询：
1. 笛卡尔连接
2. 内连接
3. 外连接
4. 自连接

SELECT * FROM scott.dept;  --4
SELECT * FROM scott.emp;   --14

笛卡尔连接
笛卡尔积在下列情况下产生：
    — 忽略了一个连接条件或者一个连接条件失效
    — 第一张表的所有行和第二张表的所有行连接，产生交集
为了避免笛卡尔积的产生，通常包含一个有效连接条件的WHERE子句。
-- 查询ename是SMITH的员工的信息，包括部门信息
SELECT *
FROM scott.emp,scott.dept
WHERE scott.emp.ename = 'SMITH';

-- 标准笛卡尔连接SQL
SELECT * FROM scott.dept CROSS JOIN scott.emp;


重点：多表连接查询时第一件事情就是告诉数据库 关联条件（外键）

内连接（等值连接）
两个表（或连接）中某一数据项相等的连接称为内连接。内连接的方式是在“设置表间关联关系”的界面中选择“=”，所以内连接又称为等值连接。连接的结果是形成一个新的数据表。
内连接的运算顺序是：
1.参与的数据表（或连接）中的每列与其它数据表（或连接）的列相匹配，形成临时数据表;
2.将满足数据项相等的记录从临时数据表中选择出来。

SELECT *
FROM scott.emp,scott.dept
WHERE scott.emp.deptno = scott.dept.deptno
AND scott.emp.ename = 'SMITH';

-- 使用别名简化查询
SELECT *
FROM scott.emp e ,scott.dept d
WHERE d.deptno = d.deptno
AND e.ename = 'SMITH';

SELECT e.*,d.dname,d.loc
FROM scott.emp e ,scott.dept d
WHERE d.deptno = d.deptno
AND e.ename = 'SMITH';


-- 标准内连接SQL
SELECT *
FROM scott.dept d INNER JOIN scott.emp e
ON d.deptno = e.deptno
AND e.ename = 'SMITH';


重点：连接n张表至少需要n-1个连接条件。例如：连接3张表至少要2个连接条件



外连接（非等值连接）
用于查询一张表在另一张表中没有关联数据的信息
外连接分为三种：
左外连接（LEFT OUTER JOIN）
右外连接（RIGHT OUTER JOIN）
全外连接（FULL OUTER JOIN）

-- 查询部门和员工的所有信息
SELECT * FROM scott.dept;  --4
SELECT * FROM scott.emp;   --14
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno = e.deptno;

-- 左外连接：+号在右边，左边的表的所有数据都要显示，如果右边表没有对应的数据，则补Null
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno = e.deptno(+);

-- 左外连接的标准SQL
SELECT *
FROM scott.dept d LEFT OUTER JOIN scott.emp e
ON d.deptno = e.deptno;

-- 右外连接：+号在左边，右边的表的所有数据都要显示，如果左边表没有对应的数据，则补Null
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno(+) = e.deptno;

SELECT *
FROM scott.dept d ,scott.emp e
WHERE e.deptno(+) = d.deptno;


-- 右外连接的标准SQL
SELECT *
FROM scott.dept d RIGHT OUTER JOIN scott.emp e
ON d.deptno = e.deptno;

SELECT *
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
ON d.deptno = e.deptno;

-- 全外连接：两张表的所有数据都要全部显示
SELECT *
FROM scott.dept d FULL OUTER JOIN scott.emp e
ON d.deptno = e.deptno;



自连接
自连接(self join)是SQL语句中经常要用的连接方式，
使用自连接可以将自身表的一个镜像当作另一个表来对待，
即将一张表看成多张表来做连接，从而能够得到一些特殊的数据。

SELECT * FROM scott.emp;   --14

例如：在emp中的每一个员工都有自己的mgr(经理)，
并且每一个经理自身也是公司的员工，自身也有自己的经理。
下面我们需要将每一个员工自己的名字和经理的名字都找出来。这时候我们该怎么做呢？
empno  ename  mgr  mgrname
7369   SMITH  7902  FORD

-- 复制一张表数据的最快方法,不复制表约束
CREATE TABLE tb_emp AS SELECT * FROM scott.emp;

SELECT * FROM tb_emp;

-- 多表连接查询员工和经理
SELECT e1.empno,e1.ename,e1.mgr,e2.ename
FROM scott.emp e1 ,tb_emp e2
WHERE e1.mgr = e2.empno 
AND e1.empno = '7369';

-- 自连接
SELECT e1.empno,e1.ename,e1.mgr,e2.ename
FROM scott.emp e1 ,scott.emp e2
WHERE e1.mgr = e2.empno 
AND e1.empno = '7369';


