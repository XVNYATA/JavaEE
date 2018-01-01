/**
������ϰ��
ʹ���α���ȡscott�û���dept���������ݣ�ͬʱ��ȡÿ�����ŵ�Ա�����ݣ���ӡ�ڿ���̨
*/
SELECT * FROM scott.dept;
SELECT * FROM scott.emp;


DECLARE
       -- ����
       CURSOR c_dept IS SELECT * FROM scott.dept;
       rt_dept scott.dept%ROWTYPE;
       -- Ա��
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
�α�FOR ѭ��
1.����Ҫ��ʽ���αꡣ
2.forѭ�����Զ���ʽ�ض���record������
RECORD  �൱java�е���,recode�п��԰������������������
3.����Ҫʹ��fetch��ץȡ���ݡ�
4.ѭ�������󣬲���Ҫʹ��close���ر��α�

RECORD  �൱java�е���,recode�п��԰������������������
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
       -- ����
       CURSOR c_dept IS SELECT * FROM scott.dept;
       -- Ա��
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


