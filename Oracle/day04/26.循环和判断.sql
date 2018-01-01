
/*******************
if 分支
*******************/ 
declare
 v_i number:=10;
BEGIN
  if (v_i=10) then
     dbms_output.put_line('进入if块');
  end if;
end;



/*******************
if else 分支
*******************/ 
declare
 v_i varchar2(18):='a';
begin
  if (v_i='b') THEN
     dbms_output.put_line('进入if块');
  else
    dbms_output.put_line('进入else块');
  end if;
end;

/*******************
if elsif else 分支
*******************/   
declare
 v_i varchar2(18):='c';  --任何类型变量，如果没有赋值，都是null
begin
  if (v_i='a') then
    null; -- 假设不想做任何动作给null,null用来保证数据完整.
  elsif (v_i='b') then
     dbms_output.put_line('b');
  elsif (v_i='c') then
      dbms_output.put_line('c');
  ELSIF (v_i IS NULL) THEN
      dbms_output.put_line('v_i没有赋值');  
  else
    dbms_output.put_line('进入else块');
  end if;
end;



/*******************
重点
plsql的循环有三种  loop for while
简单loop循环
*******************/ 
declare
  v_i number:=0;
begin
  dbms_output.put_line('循环开始之前....');
  loop
    v_i := v_i + 1; --自增   
    dbms_output.put_line(v_i);
    exit when v_i = 5;  --当v_i=5的时候结束循环
  end loop;
   dbms_output.put_line('循环结束之后....');
end;

--第二中结束方法
declare
  v_i number:=0;
begin
  dbms_output.put_line('循环开始之前....');
  loop
    v_i := v_i + 1; --自增
    dbms_output.put_line(v_i);
    if(v_i = 5) then
           exit;  --退出循环
    end if;
  end loop;
   dbms_output.put_line('循环结束之后....');
end;


/*******************
重点
plsql的循环有三种
for循环
for循环的循环变量一定是整数，可以不用定义直接使用
*******************/ 
begin
  dbms_output.put_line('循环开始之前....');
  --v_i是整数，for循环自动给v_i赋值
  for v_i in 1..5  
  loop
    dbms_output.put_line(v_i);
    -- exit when v_i = 3;
  end loop;
   dbms_output.put_line('循环结束之后....');
end;

-- 使用if结束循环
begin
  dbms_output.put_line('循环开始之前....');
  --v_i是整数，for循环自动给v_i赋值
  for v_i in 1..5 
    loop
    dbms_output.put_line(v_i);
    if(v_i = 3) then
           exit;
    end if;
  end loop;
   dbms_output.put_line('循环结束之后....');
end;


begin
  dbms_output.put_line('循环开始之前....');
  --v_i是整数，for循环自动给v_i赋值
  --REVERSE 反转赋值，从大到小
  for v_i IN REVERSE  1..5 
    loop
    dbms_output.put_line(v_i);
  end loop;
   dbms_output.put_line('循环结束之后....');
end;


/*******************
plsql的循环有三种
while循环
如果变量没有赋值，不管什么类型，Oracle默认null
*******************/ 
declare
  v_i number := 0;
begin
  dbms_output.put_line('循环开始之前....');
  --v_i是整数，for循环自动给v_i赋值
  while v_i < 5 
    loop
    dbms_output.put_line(v_i);
    v_i := v_i + 1;
  end loop;
   dbms_output.put_line('循环结束之后....');
end;


/*******************
嵌套循环
*******************/ 
declare
    i number:=1;
    a number:=0;
begin
  loop
    dbms_output.put_line('i:' || i);
    exit when i = 5;
    i:=i+1;
      --内循环
       a:=0; --每次内循环之前将a归0
      loop
        dbms_output.put_line('a:' || a);
        exit when a = 2; --退出内循环
        a:=a+1;
      end loop;
  end loop;
end;



/**************
嵌套循环标签
******************/
declare
  i number :=0;
  a number :=0;
BEGIN
<<outer>> LOOP    --<<outer>>是标记,outer随便写的
     i :=i+1;
      dbms_output.put_line('outer: '||i);
     EXIT WHEN i>5;
     --内循环开始
      a :=0;
       --在里面写一个循环，打印3次，怎么写
       <<inner>> loop
           a :=a+1;
           dbms_output.put_line('inner: '||a);
           exit outer when a>2;   --当v_i大于2的时候结束当前的外循环
       end loop inner;
 END LOOP outer;
END;


