/**
ģ��ʵ��nvl��������
nvl(first,second) �����һ������Ϊnull�����صڶ������������򷵻ص�һ������
��ҵ��ʵ��nvl2��first,second,three��
  �����һ������Ϊnull�����ص��������������򷵻صڶ�������
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
