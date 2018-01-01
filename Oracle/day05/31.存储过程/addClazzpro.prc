/**
存储过程,向tb_clazz表插入一条数据
*/
create or replace procedure addClazzpro is
begin
  INSERT INTO tb_clazz(id,code) VALUES(4,'j1607');
  COMMIT;
end addClazzpro;
/
