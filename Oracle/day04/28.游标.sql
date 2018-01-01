/*
游标：用来提取多行数据
Oracle打开一个工作区（内存）来保存多行查询的结果集，
游标就是给这个工作区命的名称，并能用于处理由多行查询而返回的记录行。

隐式游标: 默认的DML语句和select语句都有隐式游标
显示游标: 开发中给工作区命名,并且可以进行操作

%ISOPEN  Boolean  游标打开，则返回True
%NOTFOUND  Boolean  如果最近抓取没有获得记录，返回True
%FOUND  Boolean  如果最近抓取获得记录，返回True
%ROWCOUNT  Number  返回到目前为止获取的记录数

使用游标的步骤:
1. 定义游标  CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
2. 打开游标  OPEN c_tb_clazz;
3. fetch游标  FETCH c_tb_clazz INTO r_tb_clazz; 
   游标有个指针，默认指向第一行之上，fetch将指针向下移动，指向第N行数据，
   如果有数据，NOTFOUND返回false，FOUND返回true。
   如果到末尾，会一直抓取最后一条数据
4. 关闭游标   CLOSE c_tb_clazz;
*/

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

/**
第一个例子： 使用游标提取tb_clazz的所有数据
*/
DECLARE
  -- 定义游标
  CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
  -- 定义rowtype接收数据
  rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  -- 打开游标
  OPEN c_tb_clazz;
  -- 循环抓取数据
  LOOP
    FETCH c_tb_clazz INTO rt_tb_clazz;
    
    -- 如果没有抓取到数据notfound会返回true
    EXIT WHEN c_tb_clazz%NOTFOUND;
    
    dbms_output.put_line(rt_tb_clazz.id || '  '|| rt_tb_clazz.code);
  END LOOP;
  
  -- 关闭游标
  CLOSE c_tb_clazz;
END;


/**
带参数的游标
第二个例子：使用游标提取tb_clazz的所有数据，同时提取每个班级的学生数据
注意：传递是形参，形参是不用长度的
*/
DECLARE
   -- 班级
   CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
   rt_tb_clazz tb_clazz%ROWTYPE;
   -- 学生
   CURSOR c_tb_student(v_id tb_student.clazz_id%TYPE)
    IS SELECT * FROM tb_student WHERE clazz_id = v_id;
    rt_tb_student tb_student%ROWTYPE;
BEGIN
   OPEN c_tb_clazz;
        LOOP
          FETCH c_tb_clazz INTO rt_tb_clazz;
          EXIT WHEN c_tb_clazz%NOTFOUND;
          dbms_output.put_line(rt_tb_clazz.id || '  '|| rt_tb_clazz.code);
          -- 查询tb_student表对应的班级学生
          OPEN c_tb_student(rt_tb_clazz.id );
               LOOP
                 FETCH c_tb_student INTO rt_tb_student;
                 EXIT WHEN c_tb_student%NOTFOUND;
                 dbms_output.put_line(rt_tb_student.id || '  '|| rt_tb_student.name);
               END LOOP;
          CLOSE c_tb_student;
          dbms_output.put_line('******************************');
        END LOOP;
   CLOSE c_tb_clazz;
END;


/**
作业：
使用游标提取scott用户的dept的所有数据，同时提取每个部门的员工数据，打印在控制台
*/










