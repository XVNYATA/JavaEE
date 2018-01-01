SELECT * FROM tb_emp;
SELECT * FROM tb_prod;
SELECT * FROM tb_sales;

�����ѯ
1. ��ѯ����ְԱ��������Ϣ

SELECT * FROM tb_emp;
 
2. ��ѯ����ְԱ������,�绰,��ַ

 SELECT NAME,tel,address FROM tb_emp;

3. ��ѯ����ŮְԱ����ϸ��Ϣ

SELECT * FROM tb_emp WHERE sex = 'Ů';
 
4. ��ѯ������24��26��֮���ְԱ������,�Ա�


SELECT NAME,sex,age FROM tb_emp WHERE age BETWEEN 24 AND 26;
 

5. ��ѯ��ס��ɳ��ŮְԱ������,�绰,��ַ

SELECT NAME,tel,address FROM tb_emp WHERE sex = 'Ů' AND address LIKE '%��ɳ%';
 
6. ��ѯ����,��һ��,��Ц�ĵ绰,��ַ

SELECT NAME,tel,address FROM tb_emp WHERE NAME IN('����','��һ��','��Ц');
 
7. ��ѯ���޺����޵�ְԱ������,�Ա�,����

SELECT NAME,sex,age,address FROM tb_emp WHERE address LIKE '%����%'
OR address LIKE '%����%';

 
8. ��ѯ��ס��ɳ,������25��28��֮�����ְԱ������

SELECT NAME,sex,age,address
FROM tb_emp 
WHERE sex = '��'
AND age BETWEEN 25 AND 28
AND address LIKE '%��ɳ%';
 

9. ��ѯ�ʼ���ַΪ�յ�ְԱ

SELECT * FROM tb_emp WHERE email IS NULL;


�ϼ�
1. �ܹ��ж��ٸ�ְԱ��

SELECT COUNT(*) FROM tb_emp;
 
3. ������С��ŮְԱ������

SELECT MIN(age) FROM tb_emp WHERE sex = 'Ů';
 
7. ���Ա�ͳ��ְԱ������������С����

SELECT sex,MAX(age),MIN(age)
FROM tb_emp 
GROUP BY sex;
 

4. �ʼǱ��������ۼ�ֵ��ߵĵ������ۼ�ֵ

SELECT MAX(s.pamount)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '�ʼǱ�';

 
5. ��è���ӻ���ƽ�����ۼ۸�

SELECT SUM(s.pamount) / SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '���ӻ�'
AND p.mark = '��è';
 
6. �Ϲ�ʼǱ�4�·ݵ������ܶ�
 
SELECT SUM(s.pamount)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '�ʼǱ�'
AND p.mark = '�Ϲ�'
AND to_char(s.sdate,'mm') = '04';


������ϼ�
1. ������,Ʒ��ͳ����Ʒ������������,����������,����20�Ĳ�ͳ��

SELECT p.type,p.mark,SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
GROUP BY p.type,p.mark
HAVING SUM(s.pqty) >= 20;
 
2. ��Ʒ��,���ͳ�ƱʼǱ���ƽ�����ۼ۸�,�����ۼ۸�Ӹߵ��͵�˳����ʾ

SELECT p.mark,p.spec,SUM(s.pamount)/SUM(s.pqty)
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '�ʼǱ�'
GROUP BY p.mark,p.spec
ORDER BY SUM(s.pamount)/SUM(s.pqty) DESC;
 
3. ������ͳ����ְԱ3�·ݵ������ܶ�,�����ܶ����80000�Ĳ�ͳ��

SELECT e.name,SUM(s.pamount)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
AND e.sex = '��'
AND to_char(s.sdate,'mm') = '03'
GROUP BY e.name
HAVING SUM(s.pamount) > 80000;
 
 
5. ������ͳ��ÿ��ְԱһ������˶��ٱ�����ҵ��

SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name;
 
6. �ҳ��������ҵ��������ٵ�ְԱ������������ɵ�ҵ����

-- 1.ʹ���Ӳ��º�rownumm��ɣ��������ͬ�ģ��������ȷ
SELECT * FROM (
SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
ORDER BY COUNT(*)
 )
 WHERE ROWNUM = 1;
 
 -- 2. ʹ��having���Ӳ�ѯ
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT COUNT FROM (
SELECT e.name,COUNT(*) AS COUNT
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
ORDER BY COUNT(*)
 )
 WHERE ROWNUM = 1
);

-- 3. ʹ��having���Ӳ�ѯ
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) <= ALL
(
SELECT COUNT(*) AS COUNT
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
);

-- 4. �Ӳ�ѯ��ʹ��Ƕ�׺���
 SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT min(COUNT(*))
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
);

-- 5. 
SELECT e.name,COUNT(*)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING COUNT(*) = 
(
SELECT min(COUNT(*))
FROM tb_sales s
GROUP BY s.eid
);

4. �ҳ������ܶ���ߵ�ְԱ������
 
SELECT e.name,SUM(s.pamount)
FROM tb_emp e,tb_sales s
WHERE e.id = s.eid
GROUP BY e.name
HAVING SUM(s.pamount) = 
(
SELECT MAX(SUM(s.pamount))
FROM tb_sales s
GROUP BY s.eid
);



����ѯ
1. ����ְԱ,������Ʒ���������,
����:ְԱ����,��Ʒ���,��ƷƷ��,��Ʒ���,��������,���ۼ�ֵ,����ʱ��,������ʱ��Ӹߵ�������

SELECT *
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid 
AND p.id = s.pid;

 

2. �ʼǱ�4�·ݵ��������,
����:��Ʒ���,��ƷƷ��,��Ʒ���,��������,���ۼ�ֵ,�����������ӵ͵�������

SELECT *
FROM tb_prod p,tb_sales s
WHERE p.id = s.pid
AND p.type = '�ʼǱ�'
AND to_char(s.sdate,'mm') = '04';


3. ����3�·ݵ��������,����:��Ʒ���,��ƷƷ��,��Ʒ���,��������,���ۼ�ֵ
1.������tb_emp����Ʒ���,��ƷƷ��,��Ʒ�����tb_prod��,��������,���ۼ�ֵ��tb_sales��
���ű�����,
2.�ҹ�������
3.��ɸѡ����

SELECT e.name,p.id,p.type AS ��ƷƷ��,p.mark AS ��Ʒ���,s.pqty AS ��������,s.pamount ���ۼ۸�
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid AND p.id = s.pid
AND e.name='����'
AND to_char(s.sdate,'mm')='03';
 

4. ����29Ӣ�紿ƽ�������ӻ����������,����:��������,���ۼ�ֵ,����ʱ��

SELECT *
FROM tb_prod p ,tb_sales s
WHERE p.id = s.pid
AND p.type = '���ӻ�'
AND p.mark = '����'
AND p.spec = '29Ӣ�紿ƽ����';
 
5. ��ɳ��ְԱ4�·ݵ��������,����:ְԱ����,��Ʒ���,��ƷƷ��,��Ʒ���,��������,���ۼ�ֵ

 SELECT *
FROM tb_emp e,tb_prod p,tb_sales s
WHERE e.id = s.eid AND p.id = s.pid
AND e.sex = '��'
AND to_char(s.sdate,'mm') = '04'
AND address LIKE '%��ɳ%';

