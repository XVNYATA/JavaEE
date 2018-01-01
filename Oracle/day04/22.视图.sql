--创建用户时通过dba角色赋予权限，而不是手动赋予权限,则创建视图会报：没有权限
--解决方案：使用system用户登录，再给j1509赋予权限
grant create any table to j1604 with admin option;
grant create any view to j1604 with admin option;
grant select any table to j1604 with admin option;

--数据字典都是视图
SELECT * FROM User_Tables; -- view

SELECT * FROM scott.emp;  -- table

-- 同义字可以理解为表的别名，视图可以理解成sql语句的别名

--视图可以使复杂的查询变得简单
SELECT deptno ,count(*) ,
SUM(sal),AVG(sal) ,MAX(sal) ,MIN(sal) 
FROM scott.emp
GROUP BY deptno;


--创建简单视图(一个表)
CREATE VIEW v_deptinfo
AS
SELECT deptno AS 部门,count(*) 人数,SUM(sal) 总工资,AVG(sal) 平均工资,MAX(sal) 最高工资,MIN(sal) 最低工资
FROM scott.emp
GROUP BY deptno;


--使用视图
SELECT * FROM v_deptinfo;


--复杂视图(多个表)
CREATE VIEW v_info
AS
SELECT d.dname AS dname,d.loc AS loc,e.*
FROM scott.dept d,scott.emp e
WHERE d.deptno = e.deptno;

SELECT * FROM v_info;

--删除视图
DROP VIEW v_deptinfo;



--注意：可以通过视图操作表，但是不建议  
