/**
Oracle中的对象： 表、序列、同义字
通过创建同义字（对象的另外一个名字）简化访问对象的操作
create synonym d_sum
for dept_sum_vu;
*/
select * FROM scott.emp;

--创建  同义字  同义字名  for  来源于那个表
create synonym tb_emp for scott.emp;

select * from tb_emp;

--删除
drop synonym tb_emp;

-- 注意：同义字可以删除原表数据,前提条件是有权限,不建议
DELETE FROM tb_emp;


-- 数据库链接
-- Database link
create database link link10
　　 connect to SYSTEM identified by orcl
　　 using '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.10.10)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
  )';
  
  
  --            表@数据库连接名
select * FROM scott.emp@link10;

create synonym tb_emp for scott.emp@link10;

select * from tb_emp;

-- 查询当前数据库的scott.dept表和10数据库的scott.emp表
SELECT * FROM scott.dept d,tb_emp e WHERE d.deptno = e.deptno;


