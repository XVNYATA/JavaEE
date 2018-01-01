/**
带参数的存储过程，向tb_clazz插入一条数据，可以用java调用
@param v_code 用户从jsp页面传入
*/
create or replace procedure saveclazzpro(v_code  VARCHAR2) 
is
begin
  INSERT INTO tb_clazz(id,code) VALUES(s_clazz.nextval,v_code);
  COMMIT;
end saveclazzpro;
/
