
/** MySQL 练习 **/

/** 1. 创建 student 和 score 表 **/

-- 创建 student 表
CREATE TABLE student (
-- 学号
id INT(10) NOT NULL UNIQUE PRIMARY KEY,
-- 名字
NAME VARCHAR(20) NOT NULL,
-- 性别
sex VARCHAR(4),
-- 生日
birth YEAR,
-- 院系
department VARCHAR(20),
-- 家庭住址
address VARCHAR(50)
)

-- 创建 score 表
CREATE TABLE score (
-- 编号
id INT(10) PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
-- 学号
stu_id INT(10) NOT NULL,
-- 课程名
c_name VARCHAR(20),
-- 分数
grade INT(10)
)

-- 查询表
SELECT * FROM student;
SELECT * FROM score;



/** 2. 插入数据 **/

-- 给 student 插入数据
INSERT INTO student VALUES( 901,'张老大', '男',1985,'计算机系', '北京市海淀区');
INSERT INTO student VALUES( 902,'张老二', '男',1986,'中文系', '北京市昌平区');
INSERT INTO student VALUES( 903,'张三', '女',1990,'中文系', '湖南省永州市');
INSERT INTO student VALUES( 904,'李四', '男',1990,'英语系', '辽宁省阜新市');
INSERT INTO student VALUES( 905,'王五', '女',1991,'英语系', '福建省厦门市');
INSERT INTO student VALUES( 906,'王六', '男',1988,'计算机系', '湖南省衡阳市');

-- 给 score 插入数据
INSERT INTO score VALUES(NULL,901, '计算机',98);
INSERT INTO score VALUES(NULL,901, '英语', 80);
INSERT INTO score VALUES(NULL,902, '计算机',65);
INSERT INTO score VALUES(NULL,902, '中文',88);
INSERT INTO score VALUES(NULL,903, '中文',95);
INSERT INTO score VALUES(NULL,904, '计算机',70);
INSERT INTO score VALUES(NULL,904, '英语',92);
INSERT INTO score VALUES(NULL,905, '英语',94);
INSERT INTO score VALUES(NULL,906, '计算机',90);
INSERT INTO score VALUES(NULL,906, '英语',85);



/** 3. 从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息 **/
SELECT id,NAME,department FROM student;


/** 4. 从student表中查询计算机系和英语系的学生的信息 **/
SELECT * FROM student WHERE department IN ('计算机系','英语系');


/** 5. 从student表中查询年龄20~30岁的学生信息 **/
SELECT id,NAME,sex,2016-birth AS age,department,address
FROM student
WHERE 2016-birth BETWEEN  20 AND 30;

SELECT id,NAME,sex,2016-birth AS age,department,address
FROM student
WHERE 2016-birth>=20 AND 2016-birth<=30;


/** 6. 从student表中查询每个院系有多少人 **/
SELECT department, COUNT(id) FROM student GROUP BY department;


/** 7. 从score表中查询每个科目的最高分 **/
SELECT c_name,MAX(grade) FROM score GROUP BY c_name;


/** 8. 查询李四的考试科目（c_name）和考试成绩（grade）**/
SELECT c_name, grade
FROM score WHERE stu_id=
(SELECT id FROM student WHERE NAME= '李四' );


/** 9. 用连接的方式查询所有学生的信息和考试信息 **/
SELECT student.id,NAME,sex,birth,department,address,c_name,grade
FROM student,score
WHERE student.id=score.stu_id;


/** 10. 计算每个学生的总成绩 **/
SELECT student.id,NAME,SUM(grade) FROM student,score
WHERE student.id=score.stu_id
GROUP BY id;


/** 11. 计算每个考试科目的平均成绩 **/
SELECT c_name,AVG(grade) FROM score GROUP BY c_name;