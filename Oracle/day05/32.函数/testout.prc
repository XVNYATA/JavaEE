/**
out��ֵ�����ص��û�����Java����C++�����ӳ����ı����ֵ��
*/
create or replace procedure testout
(v_name in out VARCHAR2) is
BEGIN
  v_name := 'Tom';
  dbms_output.put_line('v_name == ' || v_name);
end testout;
/
