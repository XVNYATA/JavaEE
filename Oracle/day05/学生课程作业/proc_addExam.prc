/****************************************************
�洢����proc_addExam�����ѧ�����Գɼ�
��ʾ����������ѧ����š��γ����ơ����Գɼ������Գɼ���
���ʱע���ȼ��ѧ�������ѧ����������û�У�û�и���������ʾ���еĻ�������ӡ�
****************************************************/
create or replace procedure proc_addExam
(v_id number,v_course varchar2,v_WRITTENEXAM number,v_labexam number) 
is
  v_count number;
begin
  select COUNT(*) into v_count from tb_student where id = v_id;
  IF(v_count=0) THEN 
      dbms_output.put_line('δ�ҵ���ѧ����Ϣ!');
      raise_application_error(-20001,'δ�ҵ���ѧ����Ϣ!');
  ELSE
     insert into tb_marks(id,course,student_id,writtenexam,labexam)
    values(seq_TB_MARKS.Nextval,v_course,v_id,v_WRITTENEXAM,v_labexam);
    commit;
  END IF;
end proc_addExam;