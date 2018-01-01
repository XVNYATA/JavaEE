/****************************************************
存储过程proc_addExam，添加学生考试成绩
提示：参数包括学生编号、课程名称、笔试成绩、机试成绩。
添加时注意先检查学生编号在学生表里面有没有，没有给出错误提示。有的话进行添加。
****************************************************/
create or replace procedure proc_addExam
(v_id number,v_course varchar2,v_WRITTENEXAM number,v_labexam number) 
is
  v_count number;
begin
  select COUNT(*) into v_count from tb_student where id = v_id;
  IF(v_count=0) THEN 
      dbms_output.put_line('未找到该学生信息!');
      raise_application_error(-20001,'未找到该学生信息!');
  ELSE
     insert into tb_marks(id,course,student_id,writtenexam,labexam)
    values(seq_TB_MARKS.Nextval,v_course,v_id,v_WRITTENEXAM,v_labexam);
    commit;
  END IF;
end proc_addExam;