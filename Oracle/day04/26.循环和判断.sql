
/*******************
if ��֧
*******************/ 
declare
 v_i number:=10;
BEGIN
  if (v_i=10) then
     dbms_output.put_line('����if��');
  end if;
end;



/*******************
if else ��֧
*******************/ 
declare
 v_i varchar2(18):='a';
begin
  if (v_i='b') THEN
     dbms_output.put_line('����if��');
  else
    dbms_output.put_line('����else��');
  end if;
end;

/*******************
if elsif else ��֧
*******************/   
declare
 v_i varchar2(18):='c';  --�κ����ͱ��������û�и�ֵ������null
begin
  if (v_i='a') then
    null; -- ���費�����κζ�����null,null������֤��������.
  elsif (v_i='b') then
     dbms_output.put_line('b');
  elsif (v_i='c') then
      dbms_output.put_line('c');
  ELSIF (v_i IS NULL) THEN
      dbms_output.put_line('v_iû�и�ֵ');  
  else
    dbms_output.put_line('����else��');
  end if;
end;



/*******************
�ص�
plsql��ѭ��������  loop for while
��loopѭ��
*******************/ 
declare
  v_i number:=0;
begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  loop
    v_i := v_i + 1; --����   
    dbms_output.put_line(v_i);
    exit when v_i = 5;  --��v_i=5��ʱ�����ѭ��
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;

--�ڶ��н�������
declare
  v_i number:=0;
begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  loop
    v_i := v_i + 1; --����
    dbms_output.put_line(v_i);
    if(v_i = 5) then
           exit;  --�˳�ѭ��
    end if;
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;


/*******************
�ص�
plsql��ѭ��������
forѭ��
forѭ����ѭ������һ�������������Բ��ö���ֱ��ʹ��
*******************/ 
begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  --v_i��������forѭ���Զ���v_i��ֵ
  for v_i in 1..5  
  loop
    dbms_output.put_line(v_i);
    -- exit when v_i = 3;
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;

-- ʹ��if����ѭ��
begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  --v_i��������forѭ���Զ���v_i��ֵ
  for v_i in 1..5 
    loop
    dbms_output.put_line(v_i);
    if(v_i = 3) then
           exit;
    end if;
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;


begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  --v_i��������forѭ���Զ���v_i��ֵ
  --REVERSE ��ת��ֵ���Ӵ�С
  for v_i IN REVERSE  1..5 
    loop
    dbms_output.put_line(v_i);
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;


/*******************
plsql��ѭ��������
whileѭ��
�������û�и�ֵ������ʲô���ͣ�OracleĬ��null
*******************/ 
declare
  v_i number := 0;
begin
  dbms_output.put_line('ѭ����ʼ֮ǰ....');
  --v_i��������forѭ���Զ���v_i��ֵ
  while v_i < 5 
    loop
    dbms_output.put_line(v_i);
    v_i := v_i + 1;
  end loop;
   dbms_output.put_line('ѭ������֮��....');
end;


/*******************
Ƕ��ѭ��
*******************/ 
declare
    i number:=1;
    a number:=0;
begin
  loop
    dbms_output.put_line('i:' || i);
    exit when i = 5;
    i:=i+1;
      --��ѭ��
       a:=0; --ÿ����ѭ��֮ǰ��a��0
      loop
        dbms_output.put_line('a:' || a);
        exit when a = 2; --�˳���ѭ��
        a:=a+1;
      end loop;
  end loop;
end;



/**************
Ƕ��ѭ����ǩ
******************/
declare
  i number :=0;
  a number :=0;
BEGIN
<<outer>> LOOP    --<<outer>>�Ǳ��,outer���д��
     i :=i+1;
      dbms_output.put_line('outer: '||i);
     EXIT WHEN i>5;
     --��ѭ����ʼ
      a :=0;
       --������дһ��ѭ������ӡ3�Σ���ôд
       <<inner>> loop
           a :=a+1;
           dbms_output.put_line('inner: '||a);
           exit outer when a>2;   --��v_i����2��ʱ�������ǰ����ѭ��
       end loop inner;
 END LOOP outer;
END;


