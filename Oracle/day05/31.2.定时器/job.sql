--������������ʱ��
declare   
  jobno number;   
begin   
  -- dbms_job.submit(job���,�����ĸ��洢���̣����ʱ��);
  dbms_job.submit(
    jobno,
    what => 'callbackpro;',   --firstproΪ�洢���̵�����
    Interval => 'TRUNC(sysdate,''mi'') + 1 / (24*60)'   --����ʱ����ÿ����
  );   
  commit;   
end;

--void ADD(STRING NAME,INT age);
--����.add('hello',18); 
--����.add(NAME=>'hello',age=>18);

select * from user_jobs;--�鿴��������  

select * from dba_jobs_running;--�鿴����ִ�еĵ�������  
  
select * from dba_jobs;--�鿴ִ����ĵ�������


--ɾ����������ʱ��    
begin   
  dbms_job.remove(181) ;
  commit;   
end; 


1�� ÿ����ִ��
Interval => TRUNC(sysdate,��mi��) + 1 / (24*60)
2�� ÿ�춨ʱִ��
���磺ÿ����賿2��ִ��
Interval => TRUNC(sysdate) + 1 +2 / (24)
3�� ÿ�ܶ�ʱִ��
���磺ÿ��һ�賿2��ִ��
Interval => TRUNC(next_day(sysdate,2))+2/24 --����һ,һ�ܵĵڶ���
4�� ÿ�¶�ʱִ��
���磺ÿ��1���賿2��ִ��
Interval =>TRUNC(LAST_DAY(SYSDATE))+1+2/24
5�� ÿ���ȶ�ʱִ��
����ÿ���ȵĵ�һ���賿2��ִ��
Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'Q') + 2/24
6�� ÿ���궨ʱִ��
���磺ÿ��7��1�պ�1��1���賿2��
Interval => ADD_MONTHS(trunc(sysdate,'yyyy'),6)+2/24
7�� ÿ�궨ʱִ��
���磺ÿ��1��1���賿2��ִ��
Interval =>ADD_MONTHS(trunc(sysdate,'yyyy'),12)+2/24
