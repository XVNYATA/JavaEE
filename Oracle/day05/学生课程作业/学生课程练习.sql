create table tb_student(
id number primary key ,
name varchar2(18) not null,
sex char(2) not null check(sex='男' or sex='女'),
age number not null check(age >=18 and age <=50),
address varchar2(100) default '不详'
);

create table TB_MARKS(
id number primary key ,
Course varchar2(18) not null,
student_id number not null,
WRITTENEXAM number default 0 check(WRITTENEXAM>=0 and WRITTENEXAM<=100) ,
LABEXAM number default 0 check(LABEXAM>=0 and LABEXAM<=100) ,
constraints tb_marks_fk foreign key (student_id) references tb_student(id)
);

INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(1,'张秋丽' ,'男',18,'北京海淀');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(2,'李斯文' ,'女',22,'河南洛阳');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(3,'李文才','男',22,'广州天河');
INSERT INTO TB_STUDENT (ID,NAME,SEX,AGE,ADDRESS) VALUES(4,'欧阳俊','男',28,'新疆威武哈');

--向学员成绩表TB_MARKS插入数据
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM, LABEXAM) VALUES(1,'JBDC', 1,80,58);
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM) VALUES(2,'HIbernate',2,50);
INSERT INTO TB_MARKS (ID,Course,STUDENT_ID, WRITTENEXAM, LABEXAM) VALUES(3,'JDBC', 2,97,82);


--4)	为了使表看起来更加易懂，建立视图，把字段都显示为中文
create view v_tb_student
as
select id as 编号,name as 姓名,sex as 性别,age as 年龄,address as 地址 from tb_student;

select * from v_tb_student;


create view v_tb_marks
as
select id as 编号,course as 课程,student_id as 学生编号,
writtenexam as 笔试成绩,labexam as 机试成绩 from tb_marks;


select * from v_tb_marks;

--5)	存储过程proc_failStudent，显示笔试或者机试成绩不及格的所有学员。
begin
  proc_failStudent;
end;


/**
6)	存储过程proc_addExam，添加学生考试成绩
提示：参数包括学生编号、课程名称、笔试成绩、机试成绩。
添加时注意先检查学生编号在学生表里面有没有，没有给出错误提示。有的话进行添加。

*/

create sequence seq_TB_MARKS start with 4;

begin
  proc_addExam
(3,'Struts2',80,90);
end;


/**
7)	创建触发器trig_delStu，删除学生信息表时，把有关此学生的考试信息也删除掉
提示：参数包括学生编号
如果删除不了的话，先删除外键约束，再测试
*/

select * from tb_student t;
select * from TB_MARKS;

delete from tb_student where id = 2;
