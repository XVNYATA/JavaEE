分组：GROUP BY
把该列具有相同值的多条记录当成一组记录处理，最后只输出一条记录。
分组函数忽略空值。
结果集隐式按升序排列,如果需要改变排序方式可以使用Order by 子句。

SELECT deptno FROM scott.emp;
-- 按照部门分组
SELECT deptno FROM scott.emp GROUP BY deptno;


GROUP BY 子句的真正作用在于与各种组函数配合使用。它用来对查询出来的数据进行分组。

SELECT deptno,COUNT(*) FROM scott.emp GROUP BY deptno;

SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp GROUP BY deptno;

-- 分组之后返回一条数据，但是ename有多条数据，无法显示
SELECT deptno,count(ename) FROM scott.emp GROUP BY deptno;


分组函数的重要规则：
（1）如果使用了分组函数，或者使用GROUP BY 的查询：
出现在SELECT列表中的字段，要么出现在组合函数里，要么出现在GROUP BY 子句中。
（2）GROUP BY 子句的字段可以不出现在SELECT列表当中。
（3）使用组函数可以不使用GROUP BY子句，此时所有的查询结果作为一组。


-- 查询部门信息，部门总工资低于9000的不显示
SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp 
GROUP BY deptno
HAVING SUM(sal) > 9000;


限定组的结果：HAVING子句
HAVING子句用来对分组后的结果再进行条件过滤。

HAVING与WHERE的区别：
where和having都是用于条件过滤
WHERE是在分组前进行条件过滤， HAVING子句是在分组后进行条件过滤，
WHERE子句中不能使用聚合函数，HAVING子句可以使用聚合函数。

总工资低于9000的不显示
SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp 
GROUP BY deptno
HAVING SUM(sal) > 9000
ORDER BY SUM(sal) DESC;


-- 关键字
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

