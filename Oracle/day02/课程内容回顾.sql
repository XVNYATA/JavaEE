/**
������ϰ��
1. ����һ���༶����š����ơ������Σ�����5�����ݡ�
2. ����һ��ѧ�����������Ա����䣬��ַ���绰������50�����ݡ�
3. �������ݵĲ��롢�޸ġ�ɾ�������������
*/
CREATE TABLE tb_clazz(
CODE VARCHAR2(18),
NAME VARCHAR2(18),
bzr VARCHAR2(18)
);

INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1603','Java��ҵ��','л��ʦ');
INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1604','Java��ҵ��','����ʦ');
INSERT INTO tb_clazz(Code,NAME,bzr) VALUES('j1605','Java������','����ʦ');

CREATE TABLE tb_student(
NAME VARCHAR2(18),
sex CHAR(3),
age INT,
address VARCHAR2(100),
phone VARCHAR2(30)
);

INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('jack','��',20,'����','13902000001');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('rose','Ů',19,'����','13902000002');
INSERT INTO tb_student(NAME,sex,age,address,phone) VALUES('tom','��',25,'���','13902000003');


SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
