/**
������н�ĺ���
*/
create or replace function yearsal(v_sal in NUMBER) 
return number is
 
begin
  
  RETURN v_sal * 12;
end yearsal;
/
