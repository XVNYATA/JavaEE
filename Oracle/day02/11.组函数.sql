组函数对一组值进行运算，并返回单个值。也叫聚合函数。
COUNT(*|列名)    统计行数
AVG(数值类型列名)  平均值
SUM (数值类型列名)  求和
MAX(列名)      最大值
MIN(列名)      最小值
组函数都会忽略NULL值。

SELECT * FROM scott.emp;   --14

例如：
SELECT COUNT(*) FROM scott.emp ;  -- 14
SELECT COUNT(comm) FROM scott.emp; -- 4 

SELECT SUM(sal) FROM scott.emp;   -- 29025
SELECT SUM(comm) FROM scott.emp;  -- 2200

SELECT SUM(sal)/COUNT(*) FROM scott.emp;
SELECT AVG(sal) FROM scott.emp;  --平均工资

SELECT MAX(sal) FROM scott.emp;   --最大工资
SELECT MIN(sal) FROM scott.emp;   --最小工资

-- 统计公司信息
SELECT count(*) 总人数,SUM(sal) AS 工资总额,MAX(sal) AS 最高工资,
  MIN(sal) AS 最低工资,AVG(sal) AS 平均工资
 FROM scott.emp;
 
-- 注意：组函数返回一个值，而ename返回14个值，如何显示
SELECT COUNT(*),ename FROM scott.emp;
