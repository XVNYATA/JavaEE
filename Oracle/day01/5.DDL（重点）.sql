/***
DDL(Data Definition Language):���ݶ������ԣ���������ݿ����(�⡢���С�����)�Ĳ�����
CREATE����������DROP��ɾ������ALTER�����£���RENAME������������ TRUNCATE���ضϣ���

�û���
��ṹ�� name��sex��age
���ݣ�  jack���У�22

����  ��  ����(
����[�ֶ�]  ������(����),
����  ������(����),
����  ������(����)  
);
ע�⣺�к���֮����","���������һ���в���Ҫ","
*/
CREATE TABLE tb_person(
NAME VARCHAR2(18),
sex CHAR(3),
age INT
);

-- * ��ʾ������
SELECT * FROM tb_person;

-- �����ṹ������ʵ�����,��ô�ڽ����, ����ʹ�� alter table���ı��ṹ, ����������,�ı��ж���,ɾ���е�. 

-- �޸�  Alter
-- ���������ֶ�address,phone
-- ����  ��   ����    ��� (����  ����(����))
ALTER TABLE tb_person ADD (address VARCHAR2(50),phone VARCHAR2(30));

-- ɾ���ֶ�
-- ɾ��addresss��phone
-- ����  ��   ����    ɾ�� (����  ����(����))
ALTER TABLE tb_person DROP (address,phone);

-- �޸��ֶεĳ���
-- ��address�еĳ��ȸĳ�100
-- ����  ��   ����    �޸� (����  ����(����))
ALTER TABLE tb_person MODIFY(address VARCHAR2(100));

-- �޸�����
-- ����  ��   ����    ����  ��  ������ to ������
ALTER TABLE tb_person RENAME COLUMN phone TO iphone6S;

-- �޸ı���
-- ����   �ɱ���  to  �±���
RENAME  tb_person TO tb_user;
RENAME  tb_user TO tb_person;


-- ɾ����  drop
-- ע�⣺drop table�����ڱ�һ�ν������ݺͱ�ṹȫ��ɾ��������ʹ�� 
-- ɾ��  ��  ����
DROP TABLE tb_person;


-- �ضϱ�  TRUNCATE
-- �����ڱ�һ�ν�������������ȫ��ɾ�������Ǳ�����ṹ
TRUNCATE TABLE tb_person;

-- ע��  ���˽�
-- ע��  on ��  ����  is  '�Լ���ע��'
COMMENT  on table tb_person is '�û���';
COMMENT  on column tb_person.name is '����';

--  �û�.����[������]
-- Ĭ�ϲ�ѯ��ǰ�û��ı�
SELECT * FROM tb_person;
SELECT * FROM j1601.tb_person;
SELECT * FROM scott.emp;


/**
�����ֵ���Ҫ�����־�̬��ͼ��ɣ�ÿ��Ӧ���ڲ�ͬ�ķ�Χ��
DBA:���з����еĶ���
ALL:�û����ܷ��ʵ����ж���
USER:���û������еĶ���
*/
SELECT * FROM dba_tables;
SELECT * FROM all_tables;
SELECT * FROM user_tables;



