/**
PL/SQL是 Procedure Language & Structured Query Language 的缩写
PL/SQL是Oracle数据库对SQL语句的扩展，增加了编程语言的特点。
数据操作和查询语句被包含在PL/SQL代码的过程单元中，
经过逻辑判断、循环等操作完成复杂的功能或者计算.
简单地归纳：PL/SQL = 传统SQL ＋ 结构化流程控制

好处:
1. 有结构化的流程控制，可以完成复杂操作
2. 性能高于sql
   sql:页面输入信息 -- servlet接收数据，调用持久层生成sql - sql语句发送到数据库(DBMS)，数据库编译 -- 执行sql。
   plsql:页面输入信息 -- servlet接收数据，调用持久层传入参数(调用存储过程) -  执行sql。
   银行系统
3.可以对程序中的异常进行处理
*/

/**
PL/SQL分为匿名块和命名块(存储过程、函数等)

PL/SQL程序由三个块组成。即
   声明部分: 在此声明PL/SQL用到的变量,类型及游标，以及局部的存储过程和函数 
   执行部分: 过程及SQL 语句  , 即程序的主要部分 
   异常处理部分: 错误处理   
*/
DECLARE
  -- 声明部分，用来定义变量等
BEGIN
  -- 可以理解成java的花括号，编写代码的地方
EXCEPTION
  -- 处理程序抛出异常
END;


/**
第一个plsql,在控制台输出HelloWorld
*/
BEGIN
  -- System.out.println();
  -- 包.过程(参数)
  dbms_output.put_line('HelloWorld');
END;

/**
定义变量,变量初始值都是null
常量 CONSTANT
*/
DECLARE
   --  变量名  数据类型(长度);
   v_id INT;
   v_name VARCHAR2(18);
   v_clazz CONSTANT CHAR(5) := 'j1604';
BEGIN
   -- 赋值
   v_id := 100;
   v_name := '疯狂Java';
   dbms_output.put_line('v_id = ' || v_id);
   dbms_output.put_line('v_name = ' || v_name);
   dbms_output.put_line('v_clazz = ' || v_clazz);
END;


/***************************
复合变量(数据类型)   VARRAY(不重要)     TABLE(不重要)   RECORD (重要)
1.包含多个内部组件，用于存放多个值
2.需要先定义类型，然后用该类型可重复定义多个变量。
 注意: 复合变量属于数据类型，定义时前面要加 TYPE
       TYPE是不能直接使用的,使用前需要定义变量引用
***************************/
-- 提取数据
-- tb_user  name，sex，age
/**
  class User{
        private String name;
        private String sex;
        private Integer age;
  }
*/
DECLARE
 -- 定义一个RECORD
  TYPE r_tb_user IS RECORD 
  (
       name VARCHAR2(18),
       sex CHAR(3),
       age INT
  );
  --  v_id INT;
  v_tb_user r_tb_user;
BEGIN
  v_tb_user.name := 'jack';
  v_tb_user.sex := '男';
  v_tb_user.age := 25;
  dbms_output.put_line(v_tb_user.name || '       ' || v_tb_user.sex || '  '|| v_tb_user.age);
END;





