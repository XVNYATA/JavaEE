create or replace trigger t_dml_clazz
  before INSERT OR UPDATE OR delete on tb_clazz  
  for each row
declare
  -- local variables here
begin
  IF (INSERTING) THEN
    dbms_output.put_line('激活的是insert操作');
  ELSIF (UPDATING) THEN
     dbms_output.put_line('激活的是update操作'); 
  ELSE
    dbms_output.put_line('激活的是delete操作');  
  END IF;
end t_dml_clazz;
/
