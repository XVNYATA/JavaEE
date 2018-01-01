/**
第一个存储过程，在控制台打出helloworld
*/
create or replace procedure helloPro
IS

BEGIN
  
  dbms_output.put_line('HelloWorld');
  
end helloPro;
/
