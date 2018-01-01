SELECT * FROM tb_student;
SELECT * FROM tb_exam;

--1.查询小强的详细信息
SELECT * FROM tb_student WHERE NAME = '小强';

 
--2.查询20岁以上的所有男同学的信息

SELECT * FROM tb_student WHERE sex = '男' AND age > 20;

 
--3.按年龄降序显示学生的信息

SELECT * FROM tb_student ORDER BY age DESC;
 

--4.按学生ID升序显示学生的ID，姓名，性别，课程，分数

SELECT *
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
ORDER BY s.id;
 

-- 5.按学生分数降序显示学生的ID，姓名，性别，课程，分数

 SELECT *
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
ORDER BY e.score DESC;

--7.查询所有学生的信息

SELECT * FROM tb_student;
 

--8.显示成绩表的前4条信息

SELECT * FROM tb_exam WHERE ROWNUM <= 4;

--聚合、分组
--10.列出所有考试分数的一个总和

SELECT SUM(score) FROM tb_exam ;

--11.列出鲁智深的成绩总和

 
 SELECT SUM(e.score)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
AND s.name = '鲁智深';


--12.列出C语言考试的平均分

SELECT AVG(score)
FROM tb_exam
WHERE NAME = 'C语言';

--14.列出李云参加了几次考试

SELECT COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
AND s.name = '李云';

 
--15.列出学生中最大的年龄

SELECT MAX(age) FROM tb_student;
 
--16.列出C语言最高的分数

SELECT MAX(score) FROM tb_exam WHERE NAME = 'C语言';
 

--17.列出每种考试的考试名称和成绩总和

SELECT NAME,SUM(score)
FROM tb_exam
GROUP BY NAME;
 
--18.列出每个学生的姓名和考试次数

SELECT s.name,COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
GROUP BY s.name;
 

--19.列出每个学生的姓名和考试次数,小于2次的不显示

SELECT s.name,COUNT(*)
FROM tb_student s ,tb_exam e
WHERE s.id = e.id
GROUP BY s.name
HAVING COUNT(*) >= 2;
 
--20.显示年龄在20到25岁之间的学生信息


 SELECT * FROM tb_student WHERE age  BETWEEN 20 AND 25;


