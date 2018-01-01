/**
����Լ����Ϊ���֣�
1. �м�Լ����ֱ�����к���дԼ�������ݿ�Ĭ�Ϸ���Ψһ��Լ�����ƣ�����SYS_C005943
2. ��Լ�������д�����֮��дԼ���������Զ���Լ������
*/
DROP TABLE tb_student;

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '��' OR sex='Ů'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
-- clazz_id ���� tb_clazz���id,����д��ֻ��Oracle֧��
clazz_id INT REFERENCES tb_clazz(ID)             
);

-- �����ֵ�
SELECT * FROM User_Constraints WHERE table_name = 'TB_STUDENT';
SELECT * FROM User_Cons_Columns WHERE table_name = 'TB_STUDENT';

-- ���ϲ�ѯ
SELECT c2.table_name,c2.column_name,c1.constraint_type
FROM User_Constraints c1 ,User_Cons_Columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = 'TB_STUDENT';


-- ��Լ�� 1 
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT ,
-- ����Լ��
PRIMARY KEY(ID),
CHECK(NAME IS NOT NULL),
CHECK(sex = '��' OR sex = 'Ů'),
CHECK(age > 15 AND age < 50),
UNIQUE(phone),
-- ���(��)  ���� ����(��)
FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)
);

-- ��Լ�� 2
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT ,
-- Լ��    Լ����     Լ������(��)
CONSTRAINTS tb_student_pk PRIMARY KEY(ID),
CONSTRAINTS tb_student_n CHECK(NAME IS NOT NULL),
CONSTRAINTS tb_student_s CHECK(sex = '��' OR sex = 'Ů'),
CONSTRAINTS tb_student_a CHECK(age > 15 AND age < 50),
CONSTRAINTS tb_student_u UNIQUE(phone),
-- ���(��)  ���� ����(��)
CONSTRAINTS tb_student_fk FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)
);

/**
�ص㣺�Ƽ�Լ��д�� ������ɱ�Լ����������д���м�Լ��
*/
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '��' OR sex='Ů'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
clazz_id INT,
CONSTRAINTS tb_student_fk FOREIGN KEY(clazz_id) REFERENCES tb_clazz(Id)             
);

-- ����֮�󴴽�Լ����ʹ��DDL
CREATE TABLE tb_student(
ID INT ,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT 
);

-- ע�⣺����Լ��ʱ����������е����ݺ�Լ���г�ͻ����Ҫ�ȸ㶨��������
-- ��������Լ��
ALTER TABLE tb_student ADD PRIMARY KEY(ID);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_pk PRIMARY KEY(ID);

-- ���Ӽ��Լ��
ALTER TABLE tb_student ADD CHECK(sex = '��' AND sex = 'Ů');
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_c CHECK(sex = '��' AND sex = 'Ů');

-- ����ΨһԼ��
ALTER TABLE tb_student ADD UNIQUE(phone);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_u UNIQUE(phone);

-- �������Լ��
ALTER TABLE tb_student ADD FOREIGN KEY(clazz_id) REFERENCES tb_clazz(ID);
ALTER TABLE tb_student ADD CONSTRAINTS tb_student_fk 
FOREIGN KEY(clazz_id) REFERENCES tb_clazz(ID);

-- ɾ��Լ�� DDL
ALTER TABLE tb_student DROP CONSTRAINTS tb_student_fk;

-- �����Ҫ�޸�Լ������ɾ���������´���

-- ����Լ��
alter table TB_STUDENT disable constraint TB_STUDENT_U;
  
-- ����Լ��
alter table TB_STUDENT enable constraint TB_STUDENT_U;










