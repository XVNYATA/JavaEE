/****************************************************************
7)  创建触发器trig_delStu，删除学生信息表时，把有关此学生的考试信息也删除掉
提示：先删除学生考试信息，因为有主外键关联
*****************************************************************/
create or replace trigger trig_delStu
  before delete on tb_student  
  referencing NEW AS NEW OLD AS OLD
  for each row
declare
  
begin
  delete from tb_marks where student_id = :OLD.ID;
end trig_delStu;
/
