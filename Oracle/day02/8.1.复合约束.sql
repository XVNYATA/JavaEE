/**
������Լ����ʱ��, �������Ի��ڵ��ж���Լ��,Ҳ���Ի��ڶ��ж��帴��Լ��.

ͨ������Լ������������Լ����Ψһ��Լ����

ע��, ����Լ��ֻ���ڱ��ж���.

*/
-- ����
-- id   ��    ��
--  1   2016  1
--  2   2016  2
-- 3    2016  1
-- Ψһ������Լ��
CREATE TABLE tb_ropt(
ID INT PRIMARY KEY,
YEAR CHAR(4),
MONTH CHAR(2),
CONTENT VARCHAR2(18),
--  ���꣬������Ψһ��
UNIQUE(YEAR,MONTH)
);

INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(1,'2016','1');
INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(2,'2016','2');
-- Υ��ΨһԼ������
INSERT INTO tb_ropt(ID,YEAR,MONTH) VALUES(3,'2016','1');


-- ��������Լ��
CREATE TABLE tb_ropt(
YEAR CHAR(4),
MONTH CHAR(2),
CONTENT VARCHAR2(18),
--  ���꣬��������������
PRIMARY KEY(YEAR,MONTH)
);

INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','1');
INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','2');
-- Υ��ΨһԼ������
INSERT INTO tb_ropt(YEAR,MONTH) VALUES('2016','1');
