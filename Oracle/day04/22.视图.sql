--�����û�ʱͨ��dba��ɫ����Ȩ�ޣ��������ֶ�����Ȩ��,�򴴽���ͼ�ᱨ��û��Ȩ��
--���������ʹ��system�û���¼���ٸ�j1509����Ȩ��
grant create any table to j1604 with admin option;
grant create any view to j1604 with admin option;
grant select any table to j1604 with admin option;

--�����ֵ䶼����ͼ
SELECT * FROM User_Tables; -- view

SELECT * FROM scott.emp;  -- table

-- ͬ���ֿ������Ϊ��ı�������ͼ��������sql���ı���

--��ͼ����ʹ���ӵĲ�ѯ��ü�
SELECT deptno ,count(*) ,
SUM(sal),AVG(sal) ,MAX(sal) ,MIN(sal) 
FROM scott.emp
GROUP BY deptno;


--��������ͼ(һ����)
CREATE VIEW v_deptinfo
AS
SELECT deptno AS ����,count(*) ����,SUM(sal) �ܹ���,AVG(sal) ƽ������,MAX(sal) ��߹���,MIN(sal) ��͹���
FROM scott.emp
GROUP BY deptno;


--ʹ����ͼ
SELECT * FROM v_deptinfo;


--������ͼ(�����)
CREATE VIEW v_info
AS
SELECT d.dname AS dname,d.loc AS loc,e.*
FROM scott.dept d,scott.emp e
WHERE d.deptno = e.deptno;

SELECT * FROM v_info;

--ɾ����ͼ
DROP VIEW v_deptinfo;



--ע�⣺����ͨ����ͼ���������ǲ�����  
