CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(10)
);
INSERT INTO tb_clazz(ID,CODE) VALUES(1,'j1604');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL, 
sex CHAR(2) CHECK(sex='��' OR sex='Ů'),  
age INT CHECK (age > 18 AND age < 60),
email VARCHAR2(50) UNIQUE,
address VARCHAR2(100) DEFAULT '����', 
iphone VARCHAR2(20),
clazz_id INT,
CONSTRAINTS tb_student_fk FOREIGN KEY (clazz_id) REFERENCES tb_clazz(ID)
)

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;


/**
Oracle�еĶ��� ������
������ص㣺���Ը���������ʹ�ã����ֲ����ظ�
����  �Զ����ɵ�Ψһ���к� �������������Զ�����
*/
CREATE  SEQUENCE  s_tb_student; 
/*
��������ʱ�������ָ����������Ĭ�ϴ�1��ʼ��ÿ���Զ�����1��
�������999999999999999999999999999��
Ĭ�ϲ�ѭ����
create sequence S_TB_STUDENT
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;
*/


--1.����   ����     ������
CREATE SEQUENCE s_tb_student;

--3. ɾ��  ����   ������
DROP SEQUENCE s_tb_student;

--2.ʹ������,��������������currval��nextval
--����Ҫʹ�ù�����(nextval),���ܲ�ѯcurrval
--ִ�й�nextval֮�󣬸�ֵ���Ѿ�ʹ����
--��ѯ��ǰֵcurrvalʱ�����б����Ѿ�ʹ�ù�
SELECT s_tb_student.currval FROM dual;
SELECT s_tb_student.nextval FROM dual;


--�����ֵ�
SELECT * FROM user_sequences;

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- ʹ������

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Scott','��',22,'���','scott@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Jack','��',22,'���','jack@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Rose','��',22,'���','rose@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(9,'Tom','��',22,'���','tom@163.com',1);

INSERT INTO tb_student(ID,NAME,sex,age,address,email,clazz_id)
VALUES(s_tb_student.nextval,'Alice','Ů',22,'���','alice@163.com',1);

--������Ϊһ������,���Ը����tableʹ�� ����һ�ű�ʹ��һ������

INSERT INTO tb_clazz(ID,CODE) VALUES(s_tb_student.nextval,'j1508');


/**
���в�������rollback�ع�,������Щ���ʱSequenceֵ���ܲ�����϶
�ع�����
���б����������ı�(������)  ����һ�ű�ʹ��һ������
ϵͳ崻�
*/


