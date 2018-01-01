/**
DML(Data Manipulation Language): 数据操作语言，定义对数据库记录的操作。
INSERT（插入）、DELETE（删除）、UPDATE（修改）

Transaction Control:事务控制
COMMIT(提交)、ROLLBACK（回滚）
*/

/**
插入 insert
1. 默认情况下，一次插入操作只插入一行(mysql一次可以插入多行)
2. 插入的值必须和要插入的字段数量，类型匹配，数据库中字符用单引号表示
3. 如果为每列都指定值，则表名后不需列出插入的列名
*/
INSERT INTO tb_person(NAME,sex,age) VALUES('jack','男',20);
-- 不建议
INSERT INTO tb_person VALUES('tom','男',18);





/**
Transaction Control:事务控制
COMMIT[提交]、ROLLBACK[回滚]

事务：将多条sql语句看成一个整体，要么一起成功，要么一起回滚。
A.场景：
班长转账20000给肖老师。
tb_account
name account amount
班长   001   50000
肖老师 002   5000000

1. 班长的账户减去20000. update tb_account set amount = amount - 20000 where name='班长';
2. 肖老师账户加上20000. update tb_account set amount = amount + 20000 where name='肖老师';

B.事务的临界点（从什么时候开始到什么时候结束）。
1. 当一个commit/rollback执行之后，到另一个commit/rollback执行之前，所有的都是一个事务。

C.一个事务commit/rollback之后，这个事务就结束了，不能再次commit/rollback这个事务。

D.Oracle当中，默认DDL语句自动提交数据（语句之后带了一个commit），DML语句需要手动提交数据。
*/

/**
UPDATE  修改

语法：UPDATE table SET column = value [, column = value] [WHERE condition];

1. 默认修改所有符合条件的数据
2. 修改可以一次修改多行数据，修改的数据可用where子句限定，
   where子句里是一个条件表达式，只有符合该条件的行才会被修改。
3. 也可以同时修改多列，多列的修改中间采用逗号(,)隔开
*/

-- 将age修改成25
UPDATE tb_person SET age = 25;
-- 将age修改成25,条件是姓名是tom的
UPDATE tb_person SET age = 25 WHERE NAME = 'tom';
-- 将age修改成25,sex修改成女，条件是姓名是tom的
UPDATE tb_person SET age = 25,sex = '女' WHERE NAME = 'tom';
-- 将age修改成25，条件是姓名是jack的并且sex是男的
UPDATE tb_person SET age = 25 WHERE NAME = 'jack' AND sex = '男';
-- 将age修改成21，条件是姓名是jack的或者sex是女的
UPDATE tb_person SET age = 21 WHERE NAME = 'jack' OR sex = '女';


/**
delete  删除

语法：DELETE FROM table [WHERE condition];

注意：delete语句最小单位是行。
1. 默认删除所有符合条件的数据
2. 删除可以一次删除多行数据，删除的数据可用where子句限定，
   where子句里是一个条件表达式，只有符合该条件的行才会被删除。
*/
-- 删除所有数据
DELETE FROM tb_person;

-- 注意：删除jack的age列（update）
UPDATE tb_person SET age = NULL WHERE NAME = 'jack';

-- 删除,条件是姓名是tom的
DELETE FROM tb_person WHERE NAME = 'tom';
-- 删除，条件是姓名是jack的并且sex是男的
DELETE FROM tb_person WHERE NAME = 'jack' AND sex = '男';
--  删除，条件是姓名是jack的或者sex是女的
DELETE FROM tb_person WHERE NAME = 'jack' OR sex = '女';


SELECT * FROM tb_person;


/**
面试：
sql语句删除数据有几种方式？分别是什么？
答：
1. delete
   -- DML语句，delete语句最小单位是行，可以通过where选择删除，删除数据可以回滚，
      保留表结构。最慢
2. truncate
   -- DDL语句，TRUNCATE是截断表的所有数据，删除数据不可以回滚，保留表结构。较快
3. drop
  -- DDL语句，删除表结构和表所有数据，并且不能回滚，慎用。最快
*/


/**
1. Oracle数据库简介
2. 连接数据库
3. 表空间、用户、角色和权限  
4. DDL（重点）
5. DML（重点）


课堂练习：
1. 创建一个班级表，编号、名称、班主任，插入5条数据。
2. 创建一个学生表，姓名，性别，年龄，地址，电话，插入50条数据。
3. 测试数据的插入、修改、删除和事物操作。

*/
