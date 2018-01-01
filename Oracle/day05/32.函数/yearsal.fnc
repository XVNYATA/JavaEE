/**
计算年薪的函数
*/
create or replace function yearsal(v_sal in NUMBER) 
return number is
 
begin
  
  RETURN v_sal * 12;
end yearsal;
/
