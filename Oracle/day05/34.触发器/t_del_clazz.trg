/**
维护数据完整性
当删除班级表数据时，删除关联数据
*/
create or replace trigger t_del_clazz
  before delete on tb_clazz  
  for each row
declare
  
begin

  -- 1. 删除中间表的关联的学生数据(班级里面的学生) 
  DELETE FROM tb_student_course WHERE student_id 
  IN
  (
       SELECT ID FROM tb_student WHERE clazz_id = :old.Id
  ); 

  -- 2. 删除学生表的关联数据
  DELETE FROM tb_student WHERE clazz_id = :old.id;
  
end t_del_clazz;
/
