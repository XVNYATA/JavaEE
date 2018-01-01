--创建调度任务定时器
declare   
  jobno number;   
begin   
  -- dbms_job.submit(job编号,调用哪个存储过程，间隔时间);
  dbms_job.submit(
    jobno,
    what => 'callbackpro;',   --firstpro为存储过程的名称
    Interval => 'TRUNC(sysdate,''mi'') + 1 / (24*60)'   --定义时间间隔每分钟
  );   
  commit;   
end;

--void ADD(STRING NAME,INT age);
--对象.add('hello',18); 
--对象.add(NAME=>'hello',age=>18);

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
