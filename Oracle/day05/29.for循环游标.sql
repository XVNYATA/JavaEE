/**
课堂练习：
使用游标提取scott用户的dept的所有数据，同时提取每个部门的员工数据，打印在控制台
*/
SELECT * FROM scott.dept;
SELECT * FROM scott.emp;


DECLARE
       -- 部门
       CURSOR c_dept IS SELECT * FROM scott.dept;
       rt_dept scott.dept%ROWTYPE;
       -- 员工
       CURSOR c_emp(v_deptno scott.dept.deptno%TYPE)
        IS SELECT * FROM scott.emp WHERE deptno = v_deptno;
       rt_emp scott.emp%ROWTYPE;
BEGIN
     OPEN c_dept;
          LOOP
               FETCH c_dept INTO rt_dept;
               EXIT WHEN c_dept%NOTFOUND;
               dbms_output.put_line(rt_dept.deptno ||'  '||rt_dept.dname);
               
               OPEN c_emp(rt_dept.deptno);
                    LOOP
                       FETCH c_emp INTO rt_emp;
                       EXIT WHEN c_emp%NOTFOUND;
                       dbms_output.put_line(rt_emp.empno||'  '||rt_emp.ename||'  '||rt_emp.sal);
                    END LOOP;
               CLOSE c_emp;
               
               dbms_output.put_line('************************************');
               
          END LOOP;
     CLOSE c_dept;
END;



/**
游标FOR 循环
1.不需要显式打开游标。
2.for循环会自动隐式地定义record变量。
RECORD  相当java中的类,recode中可以包含多个变量或者类型
3.不需要使用fetch来抓取数据。
4.循环结束后，不需要使用close来关闭游标

RECORD  相当java中的类,recode中可以包含多个变量或者类型
tb_clazz  id  code 
public class Clazz{
  private Integer id;
  private String code;
}

type RECORD{
  id int ;
  code varchar2(18);
}
*/

DECLARE
       -- 部门
       CURSOR c_dept IS SELECT * FROM scott.dept;
       -- 员工
       CURSOR c_emp(v_deptno scott.dept.deptno%TYPE)
        IS SELECT * FROM scott.emp WHERE deptno = v_deptno;
BEGIN
    -- for v_i in 1..5 
    FOR re_dept IN c_dept
      LOOP
        dbms_output.put_line(re_dept.deptno ||'  '||re_dept.dname);
        
        FOR re_emp IN c_emp(re_dept.deptno)
          LOOP
            dbms_output.put_line(re_emp.empno||'  '||re_emp.ename||'  '||re_emp.sal);
          END LOOP;
        
        dbms_output.put_line('************************************');
      END LOOP;
END;


