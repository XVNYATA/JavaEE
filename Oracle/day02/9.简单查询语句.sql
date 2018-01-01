SELECT * FROM scott.dept;
SELECT * FROM scott.emp;

-- 只查某个列
SELECT empno ,ename,sal FROM scott.emp;

SELECT语句中的算术表达式
对数值型数据列、变量、常量可以使用算数操作符创建表达式（+ -* /）
对日期型数据列、变量、常量可以使用部分算数操作符创建表达式（+ -）
运算符不仅可以在列和常量之间进行运算，也可以在多列之间进行运算。

SELECT empno ,ename,sal,sal * 12 FROM scott.emp;


运算符的优先级
乘法和除法的优先级高于加法和减法
同级运算的顺序是从左到右
表达式中使用括号可强行改变优先级的运算顺序

SELECT empno ,ename,sal,(sal+100) * 12 FROM scott.emp;



所有数据类型都支持null值
NULL值的使用
空值是指不可用、未分配的值
空值不等于零或空格
任意类型都可以支持空值
包括空值的任何算术表达式都等于空
字符串和null进行连接运算，得到也是null.

SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = 0;
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = '';
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = NULL;-- 查不到
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm IS NULL;
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm IS NOT NULL;


SELECT empno,ename,sal,comm,(sal + comm) * 12 FROM scott.emp;
-- 函数(理解成java的方法)
-- nvl(第一个参数，第二个参数)：如果第一个参数为null，返回第二个参数，否则返回第一个参数
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 FROM scott.emp;



定义字段的别名
改变列的标题头
用于表示计算结果的含义
作为列的别名

SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 AS 年薪 FROM scott.emp;
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 AS "年薪" FROM scott.emp;

SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12  年薪 FROM scott.emp;
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12  "年薪" FROM scott.emp;


重复记录
缺省情况下查询显示所有行,包括重复行
使用DISTINCT关键字可从查询结果中清除重复行
DISTINCT的作用范围是后面所有字段的组合

SELECT deptno FROM scott.emp;
SELECT DISTINCT deptno FROM scott.emp;
-- DISTINCT作用于后面所有字段，即DISTINCT(deptno,ename)
-- 如果DISTINCT只是作用于deptno，那么查询到3条数据，name会查到14条数据，如何显示？
SELECT DISTINCT deptno,ename FROM scott.emp;
SELECT job FROM scott.emp;
SELECT DISTINCT job FROM scott.emp;
SELECT  deptno,job FROM scott.emp;
SELECT DISTINCT deptno,job FROM scott.emp;


WHERE子句限制所选择的记录
使用WHERE子句限定返回的记录
WHERE子句必须出现在FROM 子句后

SELECT * FROM scott.emp WHERE deptno = 20;


WHERE中可以使用比较运算符：
=、>、>=、<、<=、<>

SELECT * FROM scott.emp WHERE sal >= 800 AND sal =< 1600;


其他比较运算符：
between .. and .. ：在两个值之间（包含）

SELECT * FROM scott.emp WHERE sal BETWEEN 800 AND 1600;


in(list) ：匹配所有列出的值

SELECT * FROM scott.emp WHERE deptno = 20 OR deptno = 30;
-- in执行时会拆分成一堆or
SELECT * FROM scott.emp WHERE deptno IN (20,30);


like：模糊查询，"%"表示匹配零或多个字符，“_”表示匹配单个字符

-- 查询ename是A开头的员工
SELECT * FROM scott.emp WHERE ename LIKE 'A%';
-- 查询ename是S结尾的员工
SELECT * FROM scott.emp WHERE ename LIKE '%S';
-- 查询ename包含S的员工
SELECT * FROM scott.emp WHERE ename LIKE '%S%';
SELECT * FROM scott.emp WHERE ename LIKE '%A%';

-- 查询第二个字母是A的
SELECT * FROM scott.emp WHERE ename LIKE '_A%';


is null：是空值
is not null：不是空值
逻辑运算符：
and：如果组合条件都是true，返回true，否则返回false
or：如果组合条件之一是true，返回true
not：取反


优先级规则：建议使用括号提高优先级
-- 先And 再or
SELECT ename, job, sal
FROM scott.emp
WHERE job='SALESMAN'
OR job='PRESIDENT'
AND sal>1500;

SELECT ename, job, sal
FROM scott.emp
WHERE (job='SALESMAN'
OR job='PRESIDENT')
AND sal>1500;

SELECT ename, job, sal
FROM scott.emp
WHERE job='SALESMAN'
OR (job='PRESIDENT'
AND sal>1500);


对结果集排序
查询语句执行的查询结果，数据是按插入顺序排列，但是实际上需要按某列的值大小排序排列
按某列排序采用order by 列名[desc],列名…
如果按多列排序，每列的asc，desc必须单独设定

关键字：order by
ASC 升序 默认   DESC 降序
注意：order by 必须出现在sql语句的最后一行

SELECT * FROM scott.emp ORDER BY sal;
SELECT * FROM scott.emp ORDER BY sal ASC;
SELECT * FROM scott.emp ORDER BY sal DESC;




