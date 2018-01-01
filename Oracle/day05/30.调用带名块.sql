/**********1. �洢���� **************************************/
BEGIN
   --hellopro();
   --addclazzpro();
   saveclazzpro('j1609');
END;

SELECT * FROM tb_clazz;

CREATE SEQUENCE s_clazz;


/**
�洢���̵�����:
1.(����)������Ҫִ�е�sql���д�ɴ洢���̣��洢�����ݿ⣬�������ִ��Ч�ʡ�
2.�洢�������������������������ϵȸ��ӵ�ҵ�������

�������洢����  
�����������ݿ⿪�������У��洢�����������������ϣ����ݽӿ�,���ݱ��ݵȹ�����


*/

/**
���ݵ����б�
*/
create table tb_tran(
id number primary key,
account varchar2(18),  --�˻�
amount number,         --���
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

--���ݱ�
CREATE TABLE tb_back AS SELECT * FROM  tb_tran WHERE ID = 999;
-- �洢ÿ�������id�ı�
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


--������������ʱ��
declare   
  jobno number;   
begin   
  -- dbms_job.submit(job���,�����ĸ��洢���̣����ʱ��);
  dbms_job.submit(
    jobno,
    what => 'callback;',   --callbackΪ�洢���̵�����
    Interval => 'TRUNC(sysdate,''mi'') + 1 / (24*60)'   --����ʱ����ÿ����
  );   
  commit;   
end;

-- void ADD(STRING NAME,INT age);
-- ����.add('hello',18); 
-- ����.add(NAME=>'hello',age=>18);

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

-- ���̷��ز���ֵ�����û���
DECLARE
   v_name VARCHAR2(18):='jack';
BEGIN
  testout(v_name);
  dbms_output.put_line('v_name == ' || v_name);
END;

/**********2. ���� **************************************/
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

-- ����yearsal����
SELECT empno,ename,sal,yearsal(sal) FROM scott.emp;


SELECT empno,ename,sal,(sal+NVL(comm,0)) *12 FROM scott.emp;


-- �����Զ���fknvl����
 
SELECT empno,ename,sal,fknvl(comm,0) FROM scott.emp;


SELECT empno,ename,yearsal(sal+fknvl(comm,0)) AS ��н FROM scott.emp;



/**********3. �� ���˽⣬���Բ���д���룩 **************************************/

BEGIN
  fkutil.hellopro;
END;

SELECT fkutil.yearsal(12000) FROM dual;


/**********4. ������ **************************************/

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
