������Ӳ�ѯ��
1. �ѿ�������
2. ������
3. ������
4. ������

SELECT * FROM scott.dept;  --4
SELECT * FROM scott.emp;   --14

�ѿ�������
�ѿ���������������²�����
    �� ������һ��������������һ����������ʧЧ
    �� ��һ�ű�������к͵ڶ��ű�����������ӣ���������
Ϊ�˱���ѿ������Ĳ�����ͨ������һ����Ч����������WHERE�Ӿ䡣
-- ��ѯename��SMITH��Ա������Ϣ������������Ϣ
SELECT *
FROM scott.emp,scott.dept
WHERE scott.emp.ename = 'SMITH';

-- ��׼�ѿ�������SQL
SELECT * FROM scott.dept CROSS JOIN scott.emp;


�ص㣺������Ӳ�ѯʱ��һ��������Ǹ������ݿ� ���������������

�����ӣ���ֵ���ӣ�
�����������ӣ���ĳһ��������ȵ����ӳ�Ϊ�����ӡ������ӵķ�ʽ���ڡ����ñ�������ϵ���Ľ�����ѡ��=���������������ֳ�Ϊ��ֵ���ӡ����ӵĽ�����γ�һ���µ����ݱ�
�����ӵ�����˳���ǣ�
1.��������ݱ������ӣ��е�ÿ�����������ݱ������ӣ�������ƥ�䣬�γ���ʱ���ݱ�;
2.��������������ȵļ�¼����ʱ���ݱ���ѡ�������

SELECT *
FROM scott.emp,scott.dept
WHERE scott.emp.deptno = scott.dept.deptno
AND scott.emp.ename = 'SMITH';

-- ʹ�ñ����򻯲�ѯ
SELECT *
FROM scott.emp e ,scott.dept d
WHERE d.deptno = d.deptno
AND e.ename = 'SMITH';

SELECT e.*,d.dname,d.loc
FROM scott.emp e ,scott.dept d
WHERE d.deptno = d.deptno
AND e.ename = 'SMITH';


-- ��׼������SQL
SELECT *
FROM scott.dept d INNER JOIN scott.emp e
ON d.deptno = e.deptno
AND e.ename = 'SMITH';


�ص㣺����n�ű�������Ҫn-1���������������磺����3�ű�����Ҫ2����������



�����ӣ��ǵ�ֵ���ӣ�
���ڲ�ѯһ�ű�����һ�ű���û�й������ݵ���Ϣ
�����ӷ�Ϊ���֣�
�������ӣ�LEFT OUTER JOIN��
�������ӣ�RIGHT OUTER JOIN��
ȫ�����ӣ�FULL OUTER JOIN��

-- ��ѯ���ź�Ա����������Ϣ
SELECT * FROM scott.dept;  --4
SELECT * FROM scott.emp;   --14
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno = e.deptno;

-- �������ӣ�+�����ұߣ���ߵı���������ݶ�Ҫ��ʾ������ұ߱�û�ж�Ӧ�����ݣ���Null
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno = e.deptno(+);

-- �������ӵı�׼SQL
SELECT *
FROM scott.dept d LEFT OUTER JOIN scott.emp e
ON d.deptno = e.deptno;

-- �������ӣ�+������ߣ��ұߵı���������ݶ�Ҫ��ʾ�������߱�û�ж�Ӧ�����ݣ���Null
SELECT *
FROM scott.dept d ,scott.emp e
WHERE d.deptno(+) = e.deptno;

SELECT *
FROM scott.dept d ,scott.emp e
WHERE e.deptno(+) = d.deptno;


-- �������ӵı�׼SQL
SELECT *
FROM scott.dept d RIGHT OUTER JOIN scott.emp e
ON d.deptno = e.deptno;

SELECT *
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
ON d.deptno = e.deptno;

-- ȫ�����ӣ����ű���������ݶ�Ҫȫ����ʾ
SELECT *
FROM scott.dept d FULL OUTER JOIN scott.emp e
ON d.deptno = e.deptno;



������
������(self join)��SQL����о���Ҫ�õ����ӷ�ʽ��
ʹ�������ӿ��Խ�������һ����������һ�������Դ���
����һ�ű��ɶ��ű��������ӣ��Ӷ��ܹ��õ�һЩ��������ݡ�

SELECT * FROM scott.emp;   --14

���磺��emp�е�ÿһ��Ա�������Լ���mgr(����)��
����ÿһ����������Ҳ�ǹ�˾��Ա��������Ҳ���Լ��ľ���
����������Ҫ��ÿһ��Ա���Լ������ֺ;�������ֶ��ҳ�������ʱ�����Ǹ���ô���أ�
empno  ename  mgr  mgrname
7369   SMITH  7902  FORD

-- ����һ�ű����ݵ���췽��,�����Ʊ�Լ��
CREATE TABLE tb_emp AS SELECT * FROM scott.emp;

SELECT * FROM tb_emp;

-- ������Ӳ�ѯԱ���;���
SELECT e1.empno,e1.ename,e1.mgr,e2.ename
FROM scott.emp e1 ,tb_emp e2
WHERE e1.mgr = e2.empno 
AND e1.empno = '7369';

-- ������
SELECT e1.empno,e1.ename,e1.mgr,e2.ename
FROM scott.emp e1 ,scott.emp e2
WHERE e1.mgr = e2.empno 
AND e1.empno = '7369';


