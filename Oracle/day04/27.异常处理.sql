/**
1.预定义的Oracle 数据库异常
 有异常名，有错误代码，有异常信息
2.非预定义的Oracle 数据库异常
有错误代码，有异常信息，没有异常名
3.用户自定义的异常
违反用户自定义的业务逻辑规则，由程序主动触发。
*/

SELECT * FROM tb_clazz;
-- 了解
DECLARE
     v_id INT;
     v_code VARCHAR2(18);
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz;
  dbms_output.put_line('v_id: ' || v_id);
  dbms_output.put_line('v_code: ' || v_code);
EXCEPTION
  WHEN too_many_rows THEN
     dbms_output.put_line('返回多行数据');
  WHEN no_data_found THEN
    dbms_output.put_line('数据没有找到');
  WHEN OTHERS THEN
     dbms_output.put_line('others');
END;


--自定义异常   了解
DECLARE
    -- id   int;
    myerror EXCEPTION;
BEGIN
   dbms_output.put_line('before'); 
   -- 制造异常
   RAISE myerror;
   dbms_output.put_line('after'); 
EXCEPTION
   WHEN myerror  THEN   
     dbms_output.put_line('捕获到自定义异常'); 
   WHEN OTHERS THEN
     dbms_output.put_line('抛出异常'); 
END;

--重点 项目当中最常用的异常处理

--实际开发中异常的处理   重点
CREATE TABLE tb_error(
ID INT PRIMARY KEY,
errorObj VARCHAR2(18), --抛出异常的对象
SQLCODE VARCHAR2(50),  --异常编码
SQLERRM VARCHAR2(200),  --异常信息
currdate DATE         --发生时间
);

CREATE SEQUENCE s_tb_error;

SELECT * FROM tb_error;

-- 重点掌握
-- Oracle当抛出异常时会将异常编码存储到SQLCODE函数，异常信息存储到SQLERRM
DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
   v_sqlcode VARCHAR2(50);
   v_sqlerrm VARCHAR2(100);
BEGIN
  SELECT * INTO rt_tb_clazz FROM tb_clazz WHERE ID = 9 ;
  dbms_output.put_line(rt_tb_clazz.id||'  '||rt_tb_clazz.code);
EXCEPTION
  WHEN OTHERS THEN
    v_sqlcode := SQLCODE;
    v_sqlerrm := SQLERRM;
    -- 将异常信息保存到异常表
    INSERT INTO tb_error(ID,errorobj,sqlcode,sqlerrm,currdate)
    VALUES(s_tb_error.nextval,'default',v_sqlcode,v_sqlerrm,SYSDATE);
    COMMIT;
END;




