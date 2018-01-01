select * from scott.dept;
--��ѯ�Ľ����Ϊ '�����'

-- rownum α��  '�����'�в���������
-- ������Ľ������deptnoΪ20��rownumΪ2
select rownum ,deptno,dname,loc from scott.dept;

-- ������Ľ������deptnoΪ20��rownumΪ1
select rownum ,deptno,dname,loc from scott.dept where deptno in(20,30);

select rownum ,deptno,dname,loc from scott.dept
where rownum =1 ; --�鵽1������

select rownum ,deptno,dname,loc from scott.dept
where rownum =2;  --�鵽0������

select rownum ,deptno,dname,loc from scott.dept
where rownum <3 ; --�鵽2������

select rownum ,deptno,dname,loc from scott.dept
where rownum >1;  --��������ǲ鵽3������,���ǽ��û��

select rownum ,deptno,dname,loc from scott.dept
where rownum >0 ; --4

/*
Oracle��rownum�Ĵ���
rownum���ڵõ��������ʱ������ģ����ڱ�ǽ�����н��˳���һ���ֶΣ�
����ֶα���Ϊ��α���С���Ҳ������ʵ�ϲ����ڵ�һ�����С�
�����ص��ǰ���˳���ǡ��������ǡ���εݼӡ��ģ�
���仰˵����ֻ�д���rownum=1�ļ�¼���ſ��ܴ���rownum=2�ļ�¼��

�������ǵĲ�ѯ����Ϊrownum = 2����ô�ڲ�ѯ���ĵ�һ����¼��ʱ��
oracle��Ǵ�����¼rownumΪ1��������ֺ�rownum=2���������������ǽ����Ϊ��
*/


select * from scott.emp WHERE ROWNUM <=3;

--����rownum��ҳ 
select rownum,empno,ename from scott.emp;

select empno,ename from scott.emp
WHERE ROWNUM BETWEEN 6 AND 10;


--��ѯemp�е�5-10��
SELECT t.tid,empno ,ename from
(select ROWNUM AS tid ,empno ,ename from scott.emp )  t
where t.tid between 6 and 10;

--��ϰ: ��ȡscott.dept�е�3��-��4����¼
select * from scott.dept;
select deptno ,dname,loc from
(select rownum as tempid,deptno ,dname,loc from scott.dept )  t
where t.tempid between 3 and 4;



/**
oracle���ṩ������һ�����У�rowid��
rowid��rownum��ͬ��һ��˵��ÿһ�����ݶ�Ӧһ��rowid�������ǹ̶�����Ψһ�ģ�
����һ�����ݴ������ݿ��ʱ���ȷ���ˡ���������java�����е��ڴ��ַ.
��������rowid����ѯ��¼������ͨ��rowid��ѯ��¼�ǲ�ѯ�ٶ����Ĳ�ѯ����.
(��˭�ܼ�ס18λ���ȵ�rowid�ַ���)
rowidֻ���ڱ����ƶ�(�����ռ�仯�����ݵ���/�����Ժ�)���Żᷢ���仯��
*/

select rowid ,deptno,dname,loc from scott.dept;

select deptno,dname,loc from scott.dept
where rowid = 'AAAMgxAAEAAAAAQAAA';

-- ������
--ɾ���ظ�����
drop table tb_test;
--ɾ���ظ�����
create table tb_test(
name varchar(18),
age number,
address VARCHAR2(18)
);
insert into tb_test(name,age,address) values('tom',22,'����');
insert into tb_test(name,age,address) values('marry',23,'���');
insert into tb_test(name,age,address) values('tom',22,'���');
insert into tb_test(name,age,address) values('alice',22,'����');
insert into tb_test(name,age,address) values('tom',22,'����');
insert into tb_test(name,age,address) values('scott',18,'����');
insert into tb_test(name,age,address) values('scott',18,'����');

select * from tb_test;
/**
�ظ�����: tom  22 [3]  scott 18 [2]
1.ɾ�������ظ�����
2.ɾ���ظ����ݣ����Ǳ���һ��(��������rowid������С)
*/

DELETE FROM tb_test
WHERE NAME IN
(
SELECT NAME
FROM tb_test
GROUP BY NAME,age
HAVING COUNT(*) >1
)


--����һ��
--1.ͨ��������ʱ��
-- ע�⣺���ֶαȽ϶ࣨname��age��sex��address��phone...���������ж��ظ�ֻ��name��age�ֶΣ��Ͳ���ʹ��distince��
create table tb_tmp as select distinct name,age from tb_test;
truncate table tb_test;--��ձ��¼
insert into tb_test(NAME,age) select NAME,age from tb_tmp;--����ʱ���е����ݲ������

select * from tb_tmp;
select * from tb_test;


--�鿴tom��rowid
select rowid,name,age from tb_test where name = 'tom' AND age=22;

--2.����maxʹ��minҲ����
delete from tb_test where rowid not in 
(SELECT MAX(ROWID) from tb_test  group by name, age);

delete from tb_test where rowid not in 
(select MIN(ROWID) from tb_test  group by name, age);



