/****************************************************************
7)  ����������trig_delStu��ɾ��ѧ����Ϣ��ʱ�����йش�ѧ���Ŀ�����ϢҲɾ����
��ʾ����ɾ��ѧ��������Ϣ����Ϊ�����������
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
