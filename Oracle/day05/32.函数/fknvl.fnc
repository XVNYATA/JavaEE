/**
模拟实现nvl函数功能
nvl(first,second) 如果第一个参数为null，返回第二个参数，否则返回第一个参数
作业：实现nvl2（first,second,three）
  如果第一个参数为null，返回第三个参数，否则返回第二个参数
*/
create or replace function fknvl(v_first in NUMBER, v_second in NUMBER) 
return number 
is
  
begin
  
       IF (v_first IS NULL) THEN
         
          RETURN v_second;
       ELSE
         
          RETURN v_first;
       END IF;
  
end fknvl;
/
