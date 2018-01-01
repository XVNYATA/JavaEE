select * from scott.dept;
select * from scott.emp;

-- dual 是 orcle提供的一个虚表 
SELECT LENGTH('hello') FROM dual;


--常用函数
--lower把大写转小写  upper 把小写转大写
select * from scott.emp where ename='smith';
select * from scott.emp where lower(ename)='smith';


select upper('helloworld') from dual;

select lower('HELLOWORLD') from dual;

--INITCAP使串中的所有单词的首字母变为大写 
select INITCAP('sql course') from dual;

--CONCAT 连接两个字符串;
select concat('Hello','World') from dual;

--取子字符串,从start开始,取count个
select substr('HelloWorld',1,5)  from dual;

--取子字符串,从4开始取到末尾
select substr('HelloWorld',4)  from dual;

--LENGTH 返回字符串的长度;
select length('HelloWorld')  from dual;

--INSTR(string,char) 在一个字符串中搜索指定的字符,返回发现指定的字符的位置,从1开始;
select INSTR('HelloWorld','l')  from dual;

--RPAD在列的右边粘贴字符 LPAD在列的左边粘贴字符
select RPAD(sal,8,'*') from scott.emp

select lpad(sal,8,'*') from scott.emp;

--TRIM删除首尾的空字符串
select trim('  HelloWorld  ') from dual;
select length('  HelloWorld  ') from dual;
select length(trim('  HelloWorld  ')) from dual;

--REPLACE('string','s1','s2')
--string 希望被替换的字符或变量 
--s1 需要被替换的字符串 s2 替换的字符串
select REPLACE('HelloWorld','ll','FF') from dual;

--数值函数 四舍五入
select Round(45.926,2) from dual;

--截断
select TRUNC(45.926,2) from dual;

--取模
select  MOD(1600,300)  from dual;

-- 查询系统时间
SELECT SYSDATE FROM dual;

--日期函数
create table tb_test(
currdate date
);

select * from tb_test;

insert into tb_test(currdate) values(sysdate); --插入当前日期

--将自定义日期格式字符串插入date类型的数据
insert into tb_test(currdate) values(to_date('2012-09-30','yyyy/mm/dd'));
insert into tb_test(currdate) values(to_date('2012-09-30 09:12:12','yyyy/mm/dd hh:mi:ss'));
--日期函数
--oracle的日期类型是date  默认是yyyy/mm/dd hh:mi:ss
select sysdate from dual;

--在日期上加上或减去一个数字结果仍为日期。
select sysdate+1 from dual;

--三个转换函数  to_date  to_char  to_number
--to_date(日期字符串, 格式） 
select to_date('2012-07-30 12:12:12','yyyy/mm/dd hh:mi:ss') from dual;
select to_date('2012-07-30','yyyy-mm-dd') from dual;

--to_char(日期,格式)  将日期转成字符
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'mm') from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
--将数字转成字符
select to_char(123) from dual;
select to_char(123.123) from dual;

--to_number(字符串)  将一个字符串的数字转成number类型
select to_number('123') from dual;
--不能将非数字的字符串转成number类型
select to_number('abc') from dual;


--两个日期相减返回日期之间相差的天数 
select sysdate - to_date('2016-07-14','yyyy-mm-dd') from dual;
select TRUNC(sysdate - to_date('2016-07-14','yyyy-mm-dd')) from dual;
select to_date('2016-07-16 14:27:00','yyyy-mm-dd hh24:mi:ss') - sysdate from dual;


--可以用数字除24来向日期中加上或减去小时。
select sysdate+2/24 from dual;
--可以用数字除24再除60来向日期中加入分钟
select sysdate+2/24/60 from dual;

--返回d1,d2之间月的数量，d1,d2可为字符串
select months_between(
 to_date('2012-02-28', 'yyyy-mm-dd'), 
 to_date('2011-07-28', 'yyyy-mm-dd')
) as months from dual;

--返回日期d加上3个月后的日期,3是整数。
 select add_months(sysdate,3) from dual;

--返回日期d后第一个星期几的日期
select next_day(sysdate,'星期二') from dual;
-- 国外周日是1,3指周二
select next_day(SYSDATE,3) from dual;

--返回d所在月最后一天的日期
select last_day(sysdate) from dual;

--得到下一小时 0分0秒
select trunc(sysdate+1/24,'hh') from dual;

--得到下一天  0时0分0秒
select sysdate+1 from dual;
select trunc(sysdate+1) from dual;

--得到下一月 1号0时0分0秒
select last_day(sysdate) from dual;
select trunc(last_day(sysdate)+1) from dual;

--得到下一年 1月1号0时0分0秒
select trunc(sysdate,'yyyy') from dual;
select add_months(trunc(sysdate,'yyyy'),12) from dual;

--默认按照 dd进行 4舍5入. 超过中午 12点就进入下一天.
select ROUND(SYSDATE) from dual;

-- 超过15号返回下一个月
select ROUND(SYSDATE,'mm')   from dual;

select ROUND(SYSDATE,'yyyy')  from dual;

--截断日期
select trunc(SYSDATE,'mm')   from dual;

select trunc(SYSDATE,'yyyy')  from dual;

-- 定时器
-- 每分钟执行
SELECT TRUNC(sysdate,'mi') + 1 /24/60 FROM dual;

-- 每天定时执行
-- 例如：每天的凌晨2点执行
SELECT TRUNC(sysdate) + 1 +2 / 24 FROM dual;

-- 每周定时执行
-- 例如：每周一凌晨2点执行
SELECT  TRUNC(next_day(sysdate,2))+2/24 FROM dual;

--4、 每月定时执行
--例如：每月1日凌晨2点执行
SELECT  TRUNC(LAST_DAY(SYSDATE))+1+2/24 FROM dual;

--5、 每季度定时执行
--例如每季度的第一天凌晨2点执行
SELECT  TRUNC(ADD_MONTHS(SYSDATE,3),'Q') + 2/24 FROM dual;

--6、 每年定时执行
--例如：每年1月1日凌晨2点
SELECT ADD_MONTHS(trunc(sysdate,'yyyy'),12)+2/24 FROM dual;


--通用函数完成一些功能
--nvl函数 如果第一个参数为null,则取第二个参数
select comm from scott.emp;
   select nvl(comm,0) from scott.emp;
    
  --使用0替换null的comm，计算年收入
  select ename,sal,comm,(sal + comm)*12 年收入 from scott.emp;
 select ename,sal,comm,(sal + nvl(comm,0))*12 年收入 from scott.emp;

--nvl2函数 如果第一个参数为null,则取第三个参数,否则取第二个参数
   select nvl2(comm,comm,0) from scott.emp;

  --nullif 相等返回NULL，不等返回expr1 
   select nullif(1,2) from dual;


-- 多行函数 


--case
select * from scott.emp;

select ename,job,sal AS 基本工资,
    case job 
            when 'SALESMAN' THEN  sal*0.9 
            when 'MANAGER' then sal*0.85
            when 'ANALYST' then sal+100
            when 'CLERK' then sal+200
    else sal end 
    as 实发工资  --别名
 from scott.emp ;
 
 -- decode函数
 select ename,job,sal AS 基本工资,
     decode( job, 'SALESMAN',   sal*0.9,
                'MANAGER',  sal*0.85,
                'ANALYST',  sal+100,
                'CLERK',  sal+200,
                'PRESIDENT',sal
           )as 实发工资  --别名
     from scott.emp;
     

create table tb_course(
name varchar2(18),
course varchar2(18),
grade number
)

INSERT INTO tb_course(NAME,course,grade) VALUES('tom','JDBC',20);
INSERT INTO tb_course(NAME,course,grade) VALUES('tom','Hibernate',50);
INSERT INTO tb_course(NAME,course,grade) VALUES('tom','Spring',80);
INSERT INTO tb_course(NAME,course,grade) VALUES('mary','JDBC',30);
INSERT INTO tb_course(NAME,course,grade) VALUES('mary','Hibernate',60);
INSERT INTO tb_course(NAME,course,grade) VALUES('mary','Spring',70);


-- 多表连接 
SELECT * FROM tb_course;
select distinct name from tb_course;
select name ,grade as JDBC from tb_course where course='JDBC';
select name,grade  as Hibernate from tb_course where course='Hibernate';
select name, grade  as Spring from tb_course  where course='Spring';


select T4.name,T1.JDBC,T2.Hibernate,T3.Spring 
from 
(select name ,grade as JDBC from tb_course where course='JDBC') T1,
(select name,grade  as Hibernate from tb_course where course='Hibernate') T2 ,
(select name, grade  as Spring from tb_course  where course='Spring') T3 ,
(select distinct name from tb_course) T4
where T4.name=T1.name and T4.name=T2.name and T4.name=T3.name ;

SELECT * FROM tb_course;
select 
    name,
    decode(course,'JDBC',grade,0) AS JDBC,
    decode(course,'Hibernate',grade,0) AS Hibernate,
    decode(course,'Spring',grade,0) AS  Spring
from 
    tb_course ;


--decode(column,value,cloumnvalue,default)
select 
    name,
    sum(decode(t.course,'JDBC',t.grade,0)) JDBC,
    sum(decode(t.course,'Hibernate',t.grade,0)) Hibernate,
    sum(decode(t.course,'Spring',t.grade,0)) Spring
from   tb_course t
group by  t.name;

SELECT * FROM tb_student s,tb_exam e WHERE s.id = e.id;
SELECT * FROM tb_exam ;

SELECT s.name ,
       SUM(DECODE(e.NAME,'C语言',e.score,0)) C语言,
       SUM(DECODE(e.NAME,'VB',e.score,0)) VB,
       SUM(DECODE(e.NAME,'网页编程',e.score,0)) 网页编程
FROM tb_exam e, tb_student s
WHERE e.id = s.id
GROUP BY s.name;





