--  plsql操作数据

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- dml
/**
2. 性能高于sql
   sql:页面输入信息 -- servlet接收数据，调用持久层生成sql - sql语句发送到数据库(DBMS)，数据库编译 -- 执行sql。
   plsql:页面输入信息 -- servlet接收数据，调用持久层传入参数(调用存储过程) -  执行sql。
   银行系统
*/
BEGIN
  INSERT INTO tb_clazz(ID,CODE) VALUES(3,'j1601');
  COMMIT;
END;



-- select
/**
plsql是用来操作数据，不是用来查看的
1. select语句中缺少into子句
2. 实际返回行数超出请求行数（提取所有数据需要使用游标）
3. 未找到任何数据
*/
DECLARE
   v_id INT;
   v_code VARCHAR2(18);
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz WHERE ID = 9;
  dbms_output.put_line(v_id ||' ' || v_code);
END;

/**
%type
v_id tb_clazz.id%TYPE
v_id变量和tb_clazz表的id列的数据类型、长度一致
*/
DECLARE
   v_id tb_clazz.id%TYPE;
   v_code tb_clazz.code%TYPE;
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(v_id ||' ' || v_code);
END;


/**
%rowtype
rt_tb_clazz tb_clazz%ROWTYPE
rt_tb_clazz变量和tb_clazz表的表结构一致,相当于表结构的副本
*/
DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  SELECT ID,CODE INTO rt_tb_clazz.id,rt_tb_clazz.code FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(rt_tb_clazz.id ||' ' || rt_tb_clazz.code);
END;


-- 实际操作

DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  SELECT * INTO rt_tb_clazz FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(rt_tb_clazz.id ||' ' || rt_tb_clazz.code);
END;

-- 使用recode
DECLARE
   -- 定义一个类型RECODE
   TYPE t_tb_clazz is RECORD
      (
        ID tb_clazz.id%TYPE, 
        CODE tb_clazz.code%TYPE
    );
    -- 定义一个变量
    v_tb_clazz t_tb_clazz;
BEGIN
  SELECT * INTO v_tb_clazz FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(v_tb_clazz.id ||' ' || v_tb_clazz.code);
END;







