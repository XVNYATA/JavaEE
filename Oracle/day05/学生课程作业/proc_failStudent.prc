create or replace procedure proc_failStudent 
is

   cursor c_tb_s_e is
   select s.id as id,s.name as name,m.writtenexam as writtenexam,m.labexam as labexam
   from tb_student s ,tb_marks m
   where s.id = m.student_id
   and (m.writtenexam<60 or m.labexam <60); 
   
   v_id tb_student.id%type;
   v_name tb_student.name%type;
   v_writtenexam tb_marks.writtenexam%type;
   v_labexam tb_marks.labexam%type;
   
begin
  open c_tb_s_e;
  loop
    fetch c_tb_s_e into v_id,v_name,v_writtenexam,v_labexam;
    exit when c_tb_s_e%notfound;
    dbms_output.put('ÐÕÃû: ' || v_name ||'  ');
    if(v_writtenexam<60) then
     dbms_output.put('±ÊÊÔ: ' || v_writtenexam ||'  ');
    end if;
    if(v_labexam<60) then
     dbms_output.put('»úÊÔ: ' || v_labexam ||'  ');
    end if;
     dbms_output.put_line('');
  end loop;
  close c_tb_s_e;
end proc_failStudent;
/
