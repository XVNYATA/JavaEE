/**
ά������������
��ɾ���༶������ʱ��ɾ����������
*/
create or replace trigger t_del_clazz
  before delete on tb_clazz  
  for each row
declare
  
begin

  -- 1. ɾ���м��Ĺ�����ѧ������(�༶�����ѧ��) 
  DELETE FROM tb_student_course WHERE student_id 
  IN
  (
       SELECT ID FROM tb_student WHERE clazz_id = :old.Id
  ); 

  -- 2. ɾ��ѧ����Ĺ�������
  DELETE FROM tb_student WHERE clazz_id = :old.id;
  
end t_del_clazz;
/
