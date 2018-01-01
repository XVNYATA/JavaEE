create table tb_student(
id number primary key ,
name varchar2(18) not null,
sex char(2) not null check(sex='��' or sex='Ů'),
age number not null check(age >=18 and age <=50),
address varchar2(100) default '����'
);

create table TB_MARKS(
id number primary key ,
Course varchar2(18) not null,
student_id number not null,
WRITTENEXAM number default 0 check(WRITTENEXAM>=0 and WRITTENEXAM<=100) ,
LABEXAM number default 0 check(LABEXAM>=0 and LABEXAM<=100) ,
constraints tb_marks_fk foreign key (student_id) references tb_student(id)
);

INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(1,'������' ,'��',18,'��������');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(2,'��˹��' ,'Ů',22,'��������');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(3,'���Ĳ�','��',22,'�������');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(4,'ŷ����','��',28,'�½������');

--��ѧԱ�ɼ���TB_MARKS��������
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM, LABEXAM) VALUES(1,'JBDC', 1,80,58);
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM) VALUES(2,'HIbernate',2,50);
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM, LABEXAM) VALUES(3,'JDBC', 2,97,82);


--4)	Ϊ��ʹ�����������׶���������ͼ�����ֶζ���ʾΪ����
create view v_tb_student
as
select id as ���,name as ����,sex as �Ա�,age as ����,address as ��ַ from tb_student;

select * from v_tb_student;


create view v_tb_marks
as
select id as ���,course as �γ�,student_id as ѧ�����,
writtenexam as ���Գɼ�,labexam as ���Գɼ� from tb_marks;


select * from v_tb_marks;

--5)	�洢����proc_failStudent����ʾ���Ի��߻��Գɼ������������ѧԱ��
begin
  proc_failStudent;
end;


/**
6)	�洢����proc_addExam�����ѧ�����Գɼ�
��ʾ����������ѧ����š��γ����ơ����Գɼ������Գɼ���
���ʱע���ȼ��ѧ�������ѧ����������û�У�û�и���������ʾ���еĻ�������ӡ�

*/

create sequence seq_TB_MARKS start with 4;

begin
  proc_addExam
(3,'Struts2',80,90);
end;


/**
7)	����������trig_delStu��ɾ��ѧ����Ϣ��ʱ�����йش�ѧ���Ŀ�����ϢҲɾ����
��ʾ����������ѧ�����
���ɾ�����˵Ļ�����ɾ�����Լ�����ٲ���
*/

select * from tb_student t;
select * from TB_MARKS;

delete from tb_student where id = 2;
