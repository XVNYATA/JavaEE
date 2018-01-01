select * from scott.dept;
select * from scott.emp;

-- dual �� orcle�ṩ��һ����� 
SELECT LENGTH('hello') FROM dual;


--���ú���
--lower�Ѵ�дתСд  upper ��Сдת��д
select * from scott.emp where ename='smith';
select * from scott.emp where lower(ename)='smith';


select upper('helloworld') from dual;

select lower('HELLOWORLD') from dual;

--INITCAPʹ���е����е��ʵ�����ĸ��Ϊ��д 
select INITCAP('sql course') from dual;

--CONCAT ���������ַ���;
select concat('Hello','World') from dual;

--ȡ���ַ���,��start��ʼ,ȡcount��
select substr('HelloWorld',1,5)  from dual;

--ȡ���ַ���,��4��ʼȡ��ĩβ
select substr('HelloWorld',4)  from dual;

--LENGTH �����ַ����ĳ���;
select length('HelloWorld')  from dual;

--INSTR(string,char) ��һ���ַ���������ָ�����ַ�,���ط���ָ�����ַ���λ��,��1��ʼ;
select INSTR('HelloWorld','l')  from dual;

--RPAD���е��ұ�ճ���ַ� LPAD���е����ճ���ַ�
select RPAD(sal,8,'*') from scott.emp

select lpad(sal,8,'*') from scott.emp;

--TRIMɾ����β�Ŀ��ַ���
select trim('  HelloWorld  ') from dual;
select length('  HelloWorld  ') from dual;
select length(trim('  HelloWorld  ')) from dual;

--REPLACE('string','s1','s2')
--string ϣ�����滻���ַ������ 
--s1 ��Ҫ���滻���ַ��� s2 �滻���ַ���
select REPLACE('HelloWorld','ll','FF') from dual;

--��ֵ���� ��������
select Round(45.926,2) from dual;

--�ض�
select TRUNC(45.926,2) from dual;

--ȡģ
select  MOD(1600,300)  from dual;

-- ��ѯϵͳʱ��
SELECT SYSDATE FROM dual;

--���ں���
create table tb_test(
currdate date
);

select * from tb_test;

insert into tb_test(currdate) values(sysdate); --���뵱ǰ����

--���Զ������ڸ�ʽ�ַ�������date���͵�����
insert into tb_test(currdate) values(to_date('2012-09-30','yyyy/mm/dd'));
insert into tb_test(currdate) values(to_date('2012-09-30 09:12:12','yyyy/mm/dd hh:mi:ss'));
--���ں���
--oracle������������date  Ĭ����yyyy/mm/dd hh:mi:ss
select sysdate from dual;

--�������ϼ��ϻ��ȥһ�����ֽ����Ϊ���ڡ�
select sysdate+1 from dual;

--����ת������  to_date  to_char  to_number
--to_date(�����ַ���, ��ʽ�� 
select to_date('2012-07-30 12:12:12','yyyy/mm/dd hh:mi:ss') from dual;
select to_date('2012-07-30','yyyy-mm-dd') from dual;

--to_char(����,��ʽ)  ������ת���ַ�
select to_char(sysdate,'yyyy') from dual;
select to_char(sysdate,'mm') from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
--������ת���ַ�
select to_char(123) from dual;
select to_char(123.123) from dual;

--to_number(�ַ���)  ��һ���ַ���������ת��number����
select to_number('123') from dual;
--���ܽ������ֵ��ַ���ת��number����
select to_number('abc') from dual;


--�������������������֮���������� 
select sysdate - to_date('2016-07-14','yyyy-mm-dd') from dual;
select TRUNC(sysdate - to_date('2016-07-14','yyyy-mm-dd')) from dual;
select to_date('2016-07-16 14:27:00','yyyy-mm-dd hh24:mi:ss') - sysdate from dual;


--���������ֳ�24���������м��ϻ��ȥСʱ��
select sysdate+2/24 from dual;
--���������ֳ�24�ٳ�60���������м������
select sysdate+2/24/60 from dual;

--����d1,d2֮���µ�������d1,d2��Ϊ�ַ���
select months_between(
 to_date('2012-02-28', 'yyyy-mm-dd'), 
 to_date('2011-07-28', 'yyyy-mm-dd')
) as months from dual;

--��������d����3���º������,3��������
 select add_months(sysdate,3) from dual;

--��������d���һ�����ڼ�������
select next_day(sysdate,'���ڶ�') from dual;
-- ����������1,3ָ�ܶ�
select next_day(SYSDATE,3) from dual;

--����d���������һ�������
select last_day(sysdate) from dual;

--�õ���һСʱ 0��0��
select trunc(sysdate+1/24,'hh') from dual;

--�õ���һ��  0ʱ0��0��
select sysdate+1 from dual;
select trunc(sysdate+1) from dual;

--�õ���һ�� 1��0ʱ0��0��
select last_day(sysdate) from dual;
select trunc(last_day(sysdate)+1) from dual;

--�õ���һ�� 1��1��0ʱ0��0��
select trunc(sysdate,'yyyy') from dual;
select add_months(trunc(sysdate,'yyyy'),12) from dual;

--Ĭ�ϰ��� dd���� 4��5��. �������� 12��ͽ�����һ��.
select ROUND(SYSDATE) from dual;

-- ����15�ŷ�����һ����
select ROUND(SYSDATE,'mm')   from dual;

select ROUND(SYSDATE,'yyyy')  from dual;

--�ض�����
select trunc(SYSDATE,'mm')   from dual;

select trunc(SYSDATE,'yyyy')  from dual;

-- ��ʱ��
-- ÿ����ִ��
SELECT TRUNC(sysdate,'mi') + 1 /24/60 FROM dual;

-- ÿ�춨ʱִ��
-- ���磺ÿ����賿2��ִ��
SELECT TRUNC(sysdate) + 1 +2 / 24 FROM dual;

-- ÿ�ܶ�ʱִ��
-- ���磺ÿ��һ�賿2��ִ��
SELECT  TRUNC(next_day(sysdate,2))+2/24 FROM dual;

--4�� ÿ�¶�ʱִ��
--���磺ÿ��1���賿2��ִ��
SELECT  TRUNC(LAST_DAY(SYSDATE))+1+2/24 FROM dual;

--5�� ÿ���ȶ�ʱִ��
--����ÿ���ȵĵ�һ���賿2��ִ��
SELECT  TRUNC(ADD_MONTHS(SYSDATE,3),'Q') + 2/24 FROM dual;

--6�� ÿ�궨ʱִ��
--���磺ÿ��1��1���賿2��
SELECT ADD_MONTHS(trunc(sysdate,'yyyy'),12)+2/24 FROM dual;


--ͨ�ú������һЩ����
--nvl���� �����һ������Ϊnull,��ȡ�ڶ�������
select comm from scott.emp;
   select nvl(comm,0) from scott.emp;
    
  --ʹ��0�滻null��comm������������
  select ename,sal,comm,(sal + comm)*12 ������ from scott.emp;
 select ename,sal,comm,(sal + nvl(comm,0))*12 ������ from scott.emp;

--nvl2���� �����һ������Ϊnull,��ȡ����������,����ȡ�ڶ�������
   select nvl2(comm,comm,0) from scott.emp;

  --nullif ��ȷ���NULL�����ȷ���expr1 
   select nullif(1,2) from dual;


-- ���к��� 


--case
select * from scott.emp;

select ename,job,sal AS ��������,
    case job 
            when 'SALESMAN' THEN  sal*0.9 
            when 'MANAGER' then sal*0.85
            when 'ANALYST' then sal+100
            when 'CLERK' then sal+200
    else sal end 
    as ʵ������  --����
 from scott.emp ;
 
 -- decode����
 select ename,job,sal AS ��������,
     decode( job, 'SALESMAN',   sal*0.9,
                'MANAGER',  sal*0.85,
                'ANALYST',  sal+100,
                'CLERK',  sal+200,
                'PRESIDENT',sal
           )as ʵ������  --����
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


-- ������� 
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
       SUM(DECODE(e.NAME,'C����',e.score,0)) C����,
       SUM(DECODE(e.NAME,'VB',e.score,0)) VB,
       SUM(DECODE(e.NAME,'��ҳ���',e.score,0)) ��ҳ���
FROM tb_exam e, tb_student s
WHERE e.id = s.id
GROUP BY s.name;





