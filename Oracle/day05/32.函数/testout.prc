/**
out：值被返回调用环境（Java或者C++）。子程序会改变参数值。
*/
create or replace procedure testout
(v_name in out VARCHAR2) is
BEGIN
  v_name := 'Tom';
  dbms_output.put_line('v_name == ' || v_name);
end testout;
/
