���飺GROUP BY
�Ѹ��о�����ֵͬ�Ķ�����¼����һ���¼�������ֻ���һ����¼��
���麯�����Կ�ֵ��
�������ʽ����������,�����Ҫ�ı�����ʽ����ʹ��Order by �Ӿ䡣

SELECT deptno FROM scott.emp;
-- ���ղ��ŷ���
SELECT deptno FROM scott.emp GROUP BY deptno;


GROUP BY �Ӿ��������������������麯�����ʹ�á��������Բ�ѯ���������ݽ��з��顣

SELECT deptno,COUNT(*) FROM scott.emp GROUP BY deptno;

SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp GROUP BY deptno;

-- ����֮�󷵻�һ�����ݣ�����ename�ж������ݣ��޷���ʾ
SELECT deptno,count(ename) FROM scott.emp GROUP BY deptno;


���麯������Ҫ����
��1�����ʹ���˷��麯��������ʹ��GROUP BY �Ĳ�ѯ��
������SELECT�б��е��ֶΣ�Ҫô��������Ϻ����Ҫô������GROUP BY �Ӿ��С�
��2��GROUP BY �Ӿ���ֶο��Բ�������SELECT�б��С�
��3��ʹ���麯�����Բ�ʹ��GROUP BY�Ӿ䣬��ʱ���еĲ�ѯ�����Ϊһ�顣


-- ��ѯ������Ϣ�������ܹ��ʵ���9000�Ĳ���ʾ
SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp 
GROUP BY deptno
HAVING SUM(sal) > 9000;


�޶���Ľ����HAVING�Ӿ�
HAVING�Ӿ������Է����Ľ���ٽ����������ˡ�

HAVING��WHERE������
where��having����������������
WHERE���ڷ���ǰ�����������ˣ� HAVING�Ӿ����ڷ��������������ˣ�
WHERE�Ӿ��в���ʹ�þۺϺ�����HAVING�Ӿ����ʹ�þۺϺ�����

�ܹ��ʵ���9000�Ĳ���ʾ
SELECT deptno,COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) 
FROM scott.emp 
GROUP BY deptno
HAVING SUM(sal) > 9000
ORDER BY SUM(sal) DESC;


-- �ؼ���
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

