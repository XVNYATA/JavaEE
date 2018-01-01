create or replace trigger t_dml_clazz
  before INSERT OR UPDATE OR delete on tb_clazz  
  for each row
declare
  -- local variables here
begin
  IF (INSERTING) THEN
    dbms_output.put_line('�������insert����');
  ELSIF (UPDATING) THEN
     dbms_output.put_line('�������update����'); 
  ELSE
    dbms_output.put_line('�������delete����');  
  END IF;
end t_dml_clazz;
/
