SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- ����������
-- ���Բ��벻��ȷ����
-- �ǿ�
INSERT INTO tb_student(sex,age,address,phone) VALUES('Ů',25,'���','13902000004');
-- ���
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('mary','��',250,'���','13902000004');
-- Ψһ
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('mary','Ů',25,'���','13902000001');

/**
CHECK ���Լ��
  -- NOT NULL �ǿ�Լ��������ļ��Լ����
UNIQUE KEY ΨһԼ��
PRIMARY KEY ����Լ��
FOREIGN KEY ���Լ��

����Լ����Ϊ���֣�
1. �м�Լ����ֱ�����к���дԼ�������ݿ�Ĭ�Ϸ���Ψһ��Լ�����ƣ�����SYS_C005943
2. ��Լ�������д�����֮��дԼ���������Զ���Լ������
*/
-- ɾ��tb_student�����´���������Լ��
DROP TABLE tb_student;


CREATE TABLE tb_student(
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '��' OR sex='Ů'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE
);

INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('jack','��',20,'����','13902000001');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('rose','Ů',19,'����','13902000002');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('tom','��',25,'���','13902000003');


/**
PRIMARY KEY ����Լ��
ΪʲôҪ������Լ����
���ã�����Ψһȷ��һ�м�¼

��1�������Ǳ���Ψһȷ��һ�����ݵ��ֶΣ������ӹ����Ͽ��൱�ڷǿ���Ψһ
��2��һ������ֻ����һ������
��3�������ֶο����ǵ��ֶλ����Ƕ��ֶε����
��4������������Լ��ʱ��OracleΪ����������Ӧ������
��5���ִ����ݿ⽨ģ������һ�ű�һ��Ҫ����������������Ӧ�ú�ҵ�������޹أ�����ʹ���Զ���������Ȼ����
*/
INSERT INTO tb_student(NAME,sex,age,address) VALUES('mary','Ů',25,'���');
INSERT INTO tb_student(NAME,sex,age,address) VALUES('mary','Ů',25,'���');

-- ɾ������һ��name��mary������
-- ��Ϊ����mary������ȫһ�£��޷�Ψһȷ�������κ�һ������
DELETE FROM tb_student WHERE NAME = 'mary';

-- �ٴν�����������Լ��
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '��' OR sex='Ů'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE
);

INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(1,'jack','��',20,'����','13902000001');
INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(2,'rose','Ů',19,'����','13902000002');
INSERT INTO tb_student(id,NAME,sex,age,address,phone) VALUES(3,'tom','��',25,'���','13902000003');
INSERT INTO tb_student(id,NAME,sex,age,address) VALUES(4,'mary','Ů',25,'���');
INSERT INTO tb_student(id,NAME,sex,age,address) VALUES(5,'mary','Ů',25,'���');




/**
FOREIGN KEY ���Լ��
ΪʲôҪ�����Լ����

��ʽ FOREIGN KEY (�������) REFERENCES ����(������)
���ã�����ǹ�����һ����������ֶλ���������������ֶ�֮��Ĺ�ϵ������������ࣨ���ࣩ���⡣
���磺ͨ��clazz_id�ֶν�tb_claz���tb_student�����������

clazz_id INT REFERENCES tb_clazz(ID) 

���Ҫע������⣺
1.��(��)��[tb_student]�����[clazz_id]��ֵ�����ڸ�(��)��[tb_clazz]������[id]ֵ�ķ�Χ�ڣ�
����Ϊ�գ�Ҳ���Լӷǿ�Լ����ǿ�Ʋ�����Ϊ�գ���

2.���[clazz_id]���յ�ֻ��������[tb_clazz]��������Ψһ����
��֤�ӱ��¼����׼ȷ��λ�������յļ�¼��

3.������[tb_clazz]�ļ�¼���ӱ�[tb_student]����ʱ�������¼������ɾ����

4.����ʱ���������������ã�
��1��ON DELETE CASCADE:�������е��б�ɾ����ʱ��ͬʱɾ�����ӱ�����������

clazz_id INT REFERENCES tb_clazz(ID)  ON DELETE CASCADE

��2��ON DELETE SET NULL:�����������ֵת��Ϊ��ֵ

clazz_id INT REFERENCES tb_clazz(ID)  ON SET NULL

*/

-- ���»���������������
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
sex CHAR(3) CHECK(sex = '��' OR sex='Ů'),
age INT CHECK(age > 15 AND age < 50),
address VARCHAR2(100),
phone VARCHAR2(30) UNIQUE,
c_code VARCHAR2(18),
c_name VARCHAR2(18),
c_bzr VARCHAR2(18)
);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(1,'jack','��',20,'����','13902000001','j1604','Java��ҵ��','����ʦ');
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(2,'rose','Ů',19,'����','13902000002','j1604','Java��ҵ��','����ʦ');
INSERT INTO tb_student(id,NAME,sex,age,address,phone,c_code,c_name,c_bzr) 
VALUES(3,'tom','��',25,'���','13902000003','j1604','Java��ҵ��','����ʦ');



-- ʹ��������������������
CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);

INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(1,'j1603','Java��ҵ��','л��ʦ');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1604','Java��ҵ��','����ʦ');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(3,'j1605','Java������','����ʦ');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
-- clazz_id ���� tb_clazz���id
clazz_id INT REFERENCES tb_clazz(ID)             
);

INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id) 
VALUES(1,'jack','��',20,'����','13902000001',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(2,'rose','Ů',19,'����','13902000002',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(3,'tom','��',25,'���','13902000003',2);
 
 -- 1.��(��)��[tb_student]�����[clazz_id]��ֵ�����ڸ�(��)��[tb_clazz]������[id]ֵ�ķ�Χ�ڣ�
 -- û�а༶idΪ7�İ༶����������ݲ��������
 INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(4,'mary','��',25,'���','13902000004',7);
 
 
 -- 2.���[clazz_id]���յ�ֻ��������[tb_clazz]��������Ψһ����
-- ��֤�ӱ��¼����׼ȷ��λ�������յļ�¼��
CREATE TABLE tb_clazz(
ID INT ,
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1603','Java��ҵ��','л��ʦ');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1604','Java��ҵ��','����ʦ');
INSERT INTO tb_clazz(id,Code,NAME,bzr) VALUES(2,'j1605','Java������','����ʦ');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT             
);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id) 
VALUES(1,'jack','��',20,'����','13902000001',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(2,'rose','Ů',19,'����','13902000002',2);
INSERT INTO tb_student(id,NAME,sex,age,address,phone,clazz_id)
 VALUES(3,'tom','��',25,'���','13902000003',2);
-- ��֤���� ����idΪ2�İ༶�ж�����޷�׼ȷ��λ��

-- 3.������[tb_clazz]�ļ�¼���ӱ�[tb_student]����ʱ�������¼������ɾ����
DELETE FROM tb_clazz WHERE ID = 2;

-- �������
-- (1) ��ɾ���ӱ�������ݣ���ɾ����������
DELETE FROM tb_student WHERE clazz_id = 2;
-- (2) ���޸��ӱ�������ݣ���ɾ����������
UPDATE tb_student SET clazz_id = 1 WHERE clazz_id = 2;
-- (3) �Ƚ��ӱ������������Ϊnull��ǰ���Ǹ��ֶ�����Ϊnull������ɾ����������
UPDATE tb_student SET clazz_id = NULL WHERE clazz_id = 2;

/**
4.����ʱ���������������ã�
��1��ON DELETE CASCADE:�������е��б�ɾ����ʱ��ͬʱɾ�����ӱ�����������
     ��ͬ�ڽ��������1��
clazz_id INT REFERENCES tb_clazz(ID)  ON DELETE CASCADE

��2��ON DELETE SET NULL:�����������ֵת��Ϊ��ֵ
��ͬ�ڽ��������3��
clazz_id INT REFERENCES tb_clazz(ID)  ON SET NULL
*/
CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30),
clazz_id INT REFERENCES tb_clazz(ID) ON DELETE SET NULL            
);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
