�麯����һ��ֵ�������㣬�����ص���ֵ��Ҳ�оۺϺ�����
COUNT(*|����)    ͳ������
AVG(��ֵ��������)  ƽ��ֵ
SUM (��ֵ��������)  ���
MAX(����)      ���ֵ
MIN(����)      ��Сֵ
�麯���������NULLֵ��

SELECT * FROM scott.emp;   --14

���磺
SELECT COUNT(*) FROM scott.emp ;  -- 14
SELECT COUNT(comm) FROM scott.emp; -- 4 

SELECT SUM(sal) FROM scott.emp;   -- 29025
SELECT SUM(comm) FROM scott.emp;  -- 2200

SELECT SUM(sal)/COUNT(*) FROM scott.emp;
SELECT AVG(sal) FROM scott.emp;  --ƽ������

SELECT MAX(sal) FROM scott.emp;   --�����
SELECT MIN(sal) FROM scott.emp;   --��С����

-- ͳ�ƹ�˾��Ϣ
SELECT count(*) ������,SUM(sal) AS �����ܶ�,MAX(sal) AS ��߹���,
  MIN(sal) AS ��͹���,AVG(sal) AS ƽ������
 FROM scott.emp;
 
-- ע�⣺�麯������һ��ֵ����ename����14��ֵ�������ʾ
SELECT COUNT(*),ename FROM scott.emp;
