/**********1. 存储过程 **************************************/
BEGIN
   --hellopro();
   --addclazzpro();
   saveclazzpro('j1609');
END;

SELECT * FROM tb_clazz;

CREATE SEQUENCE s_clazz;


/**
存储过程的作用:
1.(银行)将经常要执行的sql语句写成存储过程，存储在数据库，可以提高执行效率。
2.存储过程真正的作用在于数据整合等复杂的业务操作。

第三个存储过程  
在真正的数据库开发领域当中，存储过程是用作数据整合，数据接口,数据备份等工作。


*/

/**
备份的银行表
*/
create table tb_tran(
id number primary key,
account varchar2(18),  --账户
amount number,         --金额
currdate date 
)
create sequence seq_tb_tran;

INSERT INTO tb_tran(id,account,amount,currdate)
VALUES(seq_tb_tran.nextval,'001',500,SYSDATE);
INSERT INTO tb_tran(id,account,amount,currdate)
VALUES(seq_tb_tran.nextval,'002',1500,SYSDATE);
INSERT INTO tb_tran(id,account,amount,currdate)
VALUES(seq_tb_tran.nextval,'003',5000,SYSDATE);
INSERT INTO tb_tran(id,account,amount,currdate)
VALUES(seq_tb_tran.nextval,'003',800,SYSDATE);

--备份表
CREATE TABLE tb_back AS SELECT * FROM  tb_tran WHERE ID = 999;
-- 存储每天的最大的id的表
CREATE TABLE tb_maxid(
maxid INT
);
INSERT INTO tb_maxid(maxid) VALUES(0);

SELECT * FROM tb_tran;
SELECT * FROM tb_back;
SELECT * FROM tb_maxid;

TRUNCATE TABLE tb_back;

BEGIN
  callback();
END;


--创建调度任务定时器
declare   
  jobno number;   
begin   
  -- dbms_job.submit(job编号,调用哪个存储过程，间隔时间);
  dbms_job.submit(
    jobno,
    what => 'callback;',   --callback为存储过程的名称
    Interval => 'TRUNC(sysdate,''mi'') + 1 / (24*60)'   --定义时间间隔每分钟
  );   
  commit;   
end;

-- void ADD(STRING NAME,INT age);
-- 对象.add('hello',18); 
-- 对象.add(NAME=>'hello',age=>18);

select * from user_jobs;--查看调度任务  

select * from dba_jobs_running;--查看正在执行的调度任务  
  
select * from dba_jobs;--查看执行完的调度任务


--删除调度任务定时器    
begin   
  dbms_job.remove(181) ;
  commit;   
end; 


1、 每分钟执行
Interval => TRUNC(sysdate,’mi’) + 1 / (24*60)
2、 每天定时执行
例如：每天的凌晨2点执行
Interval => TRUNC(sysdate) + 1 +2 / (24)
3、 每周定时执行
例如：每周一凌晨2点执行
Interval => TRUNC(next_day(sysdate,2))+2/24 --星期一,一周的第二天
4、 每月定时执行
例如：每月1日凌晨2点执行
Interval =>TRUNC(LAST_DAY(SYSDATE))+1+2/24
5、 每季度定时执行
例如每季度的第一天凌晨2点执行
Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'Q') + 2/24
6、 每半年定时执行
例如：每年7月1日和1月1日凌晨2点
Interval => ADD_MONTHS(trunc(sysdate,'yyyy'),6)+2/24
7、 每年定时执行
例如：每年1月1日凌晨2点执行
Interval =>ADD_MONTHS(trunc(sysdate,'yyyy'),12)+2/24

-- 过程返回参数值给调用环境
DECLARE
   v_name VARCHAR2(18):='jack';
BEGIN
  testout(v_name);
  dbms_output.put_line('v_name == ' || v_name);
END;

/**********2. 函数 **************************************/
BEGIN
  dbms_output.put_line(hellofun);
END;


DECLARE
  v_str VARCHAR2(18);
BEGIN
  v_str := hellofun;
  dbms_output.put_line(v_str);
END;


SELECT hellofun FROM dual;


SELECT empno,ename,sal,sal * 12 FROM scott.emp;

-- 调用yearsal函数
SELECT empno,ename,sal,yearsal(sal) FROM scott.emp;


SELECT empno,ename,sal,(sal+NVL(comm,0)) *12 FROM scott.emp;


-- 测试自定义fknvl函数
 
SELECT empno,ename,sal,fknvl(comm,0) FROM scott.emp;


SELECT empno,ename,yearsal(sal+fknvl(comm,0)) AS 年薪 FROM scott.emp;



/**********3. 包 （了解，可以不用写代码） **************************************/

BEGIN
  fkutil.hellopro;
END;

SELECT fkutil.yearsal(12000) FROM dual;


/**********4. 触发器 **************************************/

SELECT * FROM tb_tran;
SELECT * FROM tb_back;

TRUNCATE TABLE tb_back;

DELETE FROM tb_tran WHERE ID = 1;


SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
SELECT * FROM tb_student_course;

DELETE FROM tb_clazz WHERE ID = 1;



/*
DELETE FROM tb_student WHERE clazz_id = 1;

DELETE FROM tb_student_course WHERE student_id 
IN
(
       SELECT ID FROM tb_student WHERE clazz_id = 1
)*/
