SELECT * FROM tb_student;
SELECT * FROM tb_exam;

--1.��ѯСǿ����ϸ��Ϣ
SELECT * FROM tb_student WHERE NAME = 'Сǿ';

 
--2.��ѯ20�����ϵ�������ͬѧ����Ϣ

SELECT * FROM tb_student WHERE sex = '��' AND age > 20;

 
--3.�����併����ʾѧ������Ϣ

SELECT * FROM tb_student ORDER BY age DESC;
 

--4.��ѧ��ID������ʾѧ����ID���������Ա𣬿γ̣�����

SELECT *
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
ORDER BY s.id;
 

-- 5.��ѧ������������ʾѧ����ID���������Ա𣬿γ̣�����

 SELECT *
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
ORDER BY e.score DESC;

--7.��ѯ����ѧ������Ϣ

SELECT * FROM tb_student;
 

--8.��ʾ�ɼ����ǰ4����Ϣ

SELECT * FROM tb_exam WHERE ROWNUM <= 4;

--�ۺϡ�����
--10.�г����п��Է�����һ���ܺ�

SELECT SUM(score) FROM tb_exam ;

--11.�г�³����ĳɼ��ܺ�

 
 SELECT SUM(e.score)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
AND s.name = '³����';


--12.�г�C���Կ��Ե�ƽ����

SELECT AVG(score)
FROM tb_exam
WHERE NAME = 'C����';

--14.�г����Ʋμ��˼��ο���

SELECT COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
AND s.name = '����';

 
--15.�г�ѧ������������

SELECT MAX(age) FROM tb_student;
 
--16.�г�C������ߵķ���

SELECT MAX(score) FROM tb_exam WHERE NAME = 'C����';
 

--17.�г�ÿ�ֿ��ԵĿ������ƺͳɼ��ܺ�

SELECT NAME,SUM(score)
FROM tb_exam
GROUP BY NAME;
 
--18.�г�ÿ��ѧ���������Ϳ��Դ���

SELECT s.name,COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
GROUP BY s.name;
 

--19.�г�ÿ��ѧ���������Ϳ��Դ���,С��2�εĲ���ʾ

SELECT s.name,COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
GROUP BY s.name
HAVING COUNT(*) >= 2;
 
--20.��ʾ������20��25��֮���ѧ����Ϣ


 SELECT * FROM tb_student WHERE age  BETWEEN 20 AND 25;


