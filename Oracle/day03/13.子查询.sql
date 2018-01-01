-- ˭�Ĺ��ʱ�ALLEN��

SELECT * FROM scott.emp;

-- ��ALLEN�Ĺ���
SELECT sal FROM scott.emp WHERE ename = 'ALLEN';
-- �鹤�ʱ�ALLEN�ߵ�
SELECT * FROM scott.emp WHERE sal > 1600;

-- �Ӳ�ѯ
SELECT * FROM scott.emp WHERE sal > 
(
SELECT sal FROM scott.emp WHERE ename = 'ALLEN'
);


-- �Ӳ�ѯҲ�������ڲ�ѯ�����
SELECT * FROM 
(
   SELECT * FROM scott.emp     
) e,
(
  SELECT * FROM scott.dept
) d;


-- ע�⣺ �����Ӳ�ѯ���ض���
SELECT * FROM scott.emp WHERE sal > 
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);

-- in ����
SELECT * FROM scott.emp WHERE sal IN
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);


-- any ���Ӳ�ѯ���ص�ÿһ��ֵ�Ƚ�  > any  ������С��    < any С������
SELECT * FROM scott.emp WHERE sal > ANY
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);


-- all ���Ӳ�ѯ���ص�����ֵ�Ƚ�  > all ��������   < all  С����С��
SELECT * FROM scott.emp WHERE sal > ALL
(
SELECT MIN(sal) FROM scott.emp GROUP BY deptno
);
