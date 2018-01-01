select * from scott.dept;
--查询的结果称为 '结果集'

-- rownum 伪列  '结果集'中产生的序列
-- 在下面的结果集中deptno为20的rownum为2
select rownum ,deptno,dname,loc from scott.dept;

-- 在下面的结果集中deptno为20的rownum为1
select rownum ,deptno,dname,loc from scott.dept where deptno in(20,30);

select rownum ,deptno,dname,loc from scott.dept
where rownum =1 ; --查到1条数据

select rownum ,deptno,dname,loc from scott.dept
where rownum =2;  --查到0条数据

select rownum ,deptno,dname,loc from scott.dept
where rownum <3 ; --查到2条数据

select rownum ,deptno,dname,loc from scott.dept
where rownum >1;  --正常理解是查到3条数据,但是结果没有

select rownum ,deptno,dname,loc from scott.dept
where rownum >0 ; --4

/*
Oracle对rownum的处理，
rownum是在得到结果集的时候产生的，用于标记结果集中结果顺序的一个字段，
这个字段被称为“伪数列”，也就是事实上不存在的一个数列。
它的特点是按“顺序标记”，而且是“逐次递加”的，
换句话说就是只有存在rownum=1的记录，才可能存在rownum=2的记录。

假设我们的查询条件为rownum = 2，那么在查询出的第一条记录的时候，
oracle标记此条记录rownum为1，结果发现和rownum=2的条件不符，于是结果集为空
*/


select * from scott.emp WHERE ROWNUM <=3;

--利用rownum分页 
select rownum,empno,ename from scott.emp;

select empno,ename from scott.emp
WHERE ROWNUM BETWEEN 6 AND 10;


--查询emp中第5-10条
SELECT t.tid,empno ,ename from
(select ROWNUM AS tid ,empno ,ename from scott.emp )  t
where t.tid between 6 and 10;

--练习: 提取scott.dept中第3条-第4条记录
select * from scott.dept;
select deptno ,dname,loc from
(select rownum as tempid,deptno ,dname,loc from scott.dept )  t
where t.tempid between 3 and 4;



/**
oracle还提供了另外一个数列：rowid。
rowid和rownum不同，一般说来每一行数据对应一个rowid，而且是固定而且唯一的，
在这一行数据存入数据库的时候就确定了。可以理解成java对象中的内存地址.
可以利用rowid来查询记录，而且通过rowid查询记录是查询速度最快的查询方法.
(有谁能记住18位长度的rowid字符？)
rowid只有在表发生移动(比如表空间变化，数据导入/导出以后)，才会发生变化。
*/

select rowid ,deptno,dname,loc from scott.dept;

select deptno,dname,loc from scott.dept
where rowid = 'AAAMgxAAEAAAAAQAAA';

-- 面试题
--删除重复数据
drop table tb_test;
--删除重复数据
create table tb_test(
name varchar(18),
age number,
address VARCHAR2(18)
);
insert into tb_test(name,age,address) values('tom',22,'广州');
insert into tb_test(name,age,address) values('marry',23,'香港');
insert into tb_test(name,age,address) values('tom',22,'香港');
insert into tb_test(name,age,address) values('alice',22,'美国');
insert into tb_test(name,age,address) values('tom',22,'广州');
insert into tb_test(name,age,address) values('scott',18,'美国');
insert into tb_test(name,age,address) values('scott',18,'广州');

select * from tb_test;
/**
重复数据: tom  22 [3]  scott 18 [2]
1.删除所有重复数据
2.删除重复数据，但是保留一条(保留最大的rowid或者最小)
*/

DELETE FROM tb_test
WHERE NAME IN
(
SELECT NAME
FROM tb_test
GROUP BY NAME,age
HAVING COUNT(*) >1
)


--保留一条
--1.通过创建临时表
-- 注意：当字段比较多（name、age、sex，address、phone...），但是判断重复只是name和age字段，就不能使用distince了
create table tb_tmp as select distinct name,age from tb_test;
truncate table tb_test;--清空表记录
insert into tb_test(NAME,age) select NAME,age from tb_tmp;--将临时表中的数据插回来。

select * from tb_tmp;
select * from tb_test;


--查看tom的rowid
select rowid,name,age from tb_test where name = 'tom' AND age=22;

--2.这里max使用min也可以
delete from tb_test where rowid not in 
(SELECT MAX(ROWID) from tb_test  group by name, age);

delete from tb_test where rowid not in 
(select MIN(ROWID) from tb_test  group by name, age);



