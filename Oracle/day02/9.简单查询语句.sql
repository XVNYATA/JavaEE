SELECT * FROM scott.dept;
SELECT * FROM scott.emp;

-- ֻ��ĳ����
SELECT empno ,ename,sal FROM scott.emp;

SELECT����е��������ʽ
����ֵ�������С���������������ʹ�������������������ʽ��+ -* /��
�������������С���������������ʹ�ò��������������������ʽ��+ -��
����������������кͳ���֮��������㣬Ҳ�����ڶ���֮��������㡣

SELECT empno ,ename,sal,sal * 12 FROM scott.emp;


����������ȼ�
�˷��ͳ��������ȼ����ڼӷ��ͼ���
ͬ�������˳���Ǵ�����
���ʽ��ʹ�����ſ�ǿ�иı����ȼ�������˳��

SELECT empno ,ename,sal,(sal+100) * 12 FROM scott.emp;



�����������Ͷ�֧��nullֵ
NULLֵ��ʹ��
��ֵ��ָ�����á�δ�����ֵ
��ֵ���������ո�
�������Ͷ�����֧�ֿ�ֵ
������ֵ���κ��������ʽ�����ڿ�
�ַ�����null�����������㣬�õ�Ҳ��null.

SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = 0;
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = '';
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm = NULL;-- �鲻��
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm IS NULL;
SELECT empno,ename,sal,comm FROM scott.emp WHERE comm IS NOT NULL;


SELECT empno,ename,sal,comm,(sal + comm) * 12 FROM scott.emp;
-- ����(����java�ķ���)
-- nvl(��һ���������ڶ�������)�������һ������Ϊnull�����صڶ������������򷵻ص�һ������
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 FROM scott.emp;



�����ֶεı���
�ı��еı���ͷ
���ڱ�ʾ�������ĺ���
��Ϊ�еı���

SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 AS ��н FROM scott.emp;
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12 AS "��н" FROM scott.emp;

SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12  ��н FROM scott.emp;
SELECT empno,ename,sal,comm,(sal + NVL(comm,0)) * 12  "��н" FROM scott.emp;


�ظ���¼
ȱʡ����²�ѯ��ʾ������,�����ظ���
ʹ��DISTINCT�ؼ��ֿɴӲ�ѯ���������ظ���
DISTINCT�����÷�Χ�Ǻ��������ֶε����

SELECT deptno FROM scott.emp;
SELECT DISTINCT deptno FROM scott.emp;
-- DISTINCT�����ں��������ֶΣ���DISTINCT(deptno,ename)
-- ���DISTINCTֻ��������deptno����ô��ѯ��3�����ݣ�name��鵽14�����ݣ������ʾ��
SELECT DISTINCT deptno,ename FROM scott.emp;
SELECT job FROM scott.emp;
SELECT DISTINCT job FROM scott.emp;
SELECT  deptno,job FROM scott.emp;
SELECT DISTINCT deptno,job FROM scott.emp;


WHERE�Ӿ�������ѡ��ļ�¼
ʹ��WHERE�Ӿ��޶����صļ�¼
WHERE�Ӿ���������FROM �Ӿ��

SELECT * FROM scott.emp WHERE deptno = 20;


WHERE�п���ʹ�ñȽ��������
=��>��>=��<��<=��<>

SELECT * FROM scott.emp WHERE sal >= 800 AND sal =< 1600;


�����Ƚ��������
between .. and .. ��������ֵ֮�䣨������

SELECT * FROM scott.emp WHERE sal BETWEEN 800 AND 1600;


in(list) ��ƥ�������г���ֵ

SELECT * FROM scott.emp WHERE deptno = 20 OR deptno = 30;
-- inִ��ʱ���ֳ�һ��or
SELECT * FROM scott.emp WHERE deptno IN (20,30);


like��ģ����ѯ��"%"��ʾƥ��������ַ�����_����ʾƥ�䵥���ַ�

-- ��ѯename��A��ͷ��Ա��
SELECT * FROM scott.emp WHERE ename LIKE 'A%';
-- ��ѯename��S��β��Ա��
SELECT * FROM scott.emp WHERE ename LIKE '%S';
-- ��ѯename����S��Ա��
SELECT * FROM scott.emp WHERE ename LIKE '%S%';
SELECT * FROM scott.emp WHERE ename LIKE '%A%';

-- ��ѯ�ڶ�����ĸ��A��
SELECT * FROM scott.emp WHERE ename LIKE '_A%';


is null���ǿ�ֵ
is not null�����ǿ�ֵ
�߼��������
and����������������true������true�����򷵻�false
or������������֮һ��true������true
not��ȡ��


���ȼ����򣺽���ʹ������������ȼ�
-- ��And ��or
SELECT ename, job, sal
FROM scott.emp
WHERE job='SALESMAN'
OR job='PRESIDENT'
AND sal>1500;

SELECT ename, job, sal
FROM scott.emp
WHERE (job='SALESMAN'
OR job='PRESIDENT')
AND sal>1500;

SELECT ename, job, sal
FROM scott.emp
WHERE job='SALESMAN'
OR (job='PRESIDENT'
AND sal>1500);


�Խ��������
��ѯ���ִ�еĲ�ѯ����������ǰ�����˳�����У�����ʵ������Ҫ��ĳ�е�ֵ��С��������
��ĳ���������order by ����[desc],������
�������������ÿ�е�asc��desc���뵥���趨

�ؼ��֣�order by
ASC ���� Ĭ��   DESC ����
ע�⣺order by ���������sql�������һ��

SELECT * FROM scott.emp ORDER BY sal;
SELECT * FROM scott.emp ORDER BY sal ASC;
SELECT * FROM scott.emp ORDER BY sal DESC;




