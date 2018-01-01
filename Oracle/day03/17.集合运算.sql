--�Ӷ�����������ȡ����
select * from scott.dept;
select * from scott.emp;

--�������㣺�Ӷ�����������ȡ����

-- UNION�������������ѯ�з��������ظ�֮��Ľ��������distinct
-- ����������������ݺ�������Ȼ��ɵ��ظ���
--10,20,30,40  ������ѯ�з��������ظ�֮��Ľ��
select deptno from scott.dept -- 4
UNION
select deptno from scott.emp;  -- 14

--UNION ALL����������ѯ�Ľ�������а����ظ���
-- ����������������ݺ�����
--18
select deptno from scott.dept  --4
UNION ALL
select deptno from scott.emp;   --14

--����������ѯ�ж����ֵļ�¼ 10,20,30
-- ����������������ݺ�������Ȼ��ɵ��ظ��ģ�����������ѯ�ж����ֵļ�¼
select deptno from scott.dept  --4
INTERSECT
select deptno from scott.emp;   --14

--�ж����ݴ��ڵ�һ��ѯ�Ľ����,�������ڵڶ���ѯ�����ݼ�; 40
select deptno from scott.dept --4
MINUS
select deptno from scott.emp; --14



CREATE TABLE b (
  ID NUMBER NOT NULL,
  R2 varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;


insert  into b(ID,R2) values (2,'welcome');
insert  into b(ID,R2) values(3,'test');


CREATE TABLE r (
  ID NUMBER NOT NULL,
  R1 varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

insert  into r(ID,R1) values (1,'hello');
insert  into r(ID,R1) values (2,'world');


SELECT * FROM b;
SELECT * FROM r;


SELECT r.id,r.R1,nvl(b.R2,'null') FROM r , b WHERE r.id = b.id(+)
UNION 
SELECT b.id,nvl(r.R1,'null'),b.R2 FROM r ,b WHERE r.id(+) = b.id;

-- ��׼sql
SELECT r.id,r.R1,b.R2 FROM r LEFT OUTER JOIN b ON r.id = b.id
UNION 
SELECT b.id,r.R1,b.R2 FROM r RIGHT OUTER JOIN b ON b.id = r.id;


-- ȫ������
SELECT r.id,b.id ,r.R1,b.R2 FROM r FULL OUTER JOIN b ON r.id = b.id;

SELECT nvl(r.id,b.id) AS ID ,r.R1,b.R2 FROM r FULL OUTER JOIN b ON r.id = b.id;
