create or replace package fkutil is

  -- Author  : FKIT
  -- Created : 2016/7/18 14:28:00
  -- Purpose : 
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
  
  -- Public constant declarations
  v_school constant CHAR(6) := 'fkjava';

  -- Public variable declarations
  v_clazz VARCHAR2(18);

  -- Public function and procedure declarations
  function yearsal(v_sal NUMBER) return NUMBER;
  
  PROCEDURE hellopro;

end fkutil;
/
create or replace package body fkutil is

  -- Function and procedure implementations
  function yearsal(v_sal NUMBER) return NUMBER
     is
   
  begin
    RETURN v_sal * 12;
  END yearsal;

  PROCEDURE hellopro
    IS
   BEGIN
     -- 给变量赋值
     v_clazz := 'j1604';
     dbms_output.put_line(v_school || ' 的'|| v_clazz || ' 欢迎你');
   END hellopro;

end fkutil;
/
