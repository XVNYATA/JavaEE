/**
1.Ԥ�����Oracle ���ݿ��쳣
 ���쳣�����д�����룬���쳣��Ϣ
2.��Ԥ�����Oracle ���ݿ��쳣
�д�����룬���쳣��Ϣ��û���쳣��
3.�û��Զ�����쳣
Υ���û��Զ����ҵ���߼������ɳ�������������
*/

SELECT * FROM tb_clazz;
-- �˽�
DECLARE
     v_id INT;
     v_code VARCHAR2(18);
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz;
  dbms_output.put_line('v_id: ' || v_id);
  dbms_output.put_line('v_code: ' || v_code);
EXCEPTION
  WHEN too_many_rows THEN
     dbms_output.put_line('���ض�������');
  WHEN no_data_found THEN
    dbms_output.put_line('����û���ҵ�');
  WHEN OTHERS THEN
     dbms_output.put_line('others');
END;


--�Զ����쳣   �˽�
DECLARE
    -- id   int;
    myerror EXCEPTION;
BEGIN
   dbms_output.put_line('before'); 
   -- �����쳣
   RAISE myerror;
   dbms_output.put_line('after'); 
EXCEPTION
   WHEN myerror  THEN   
     dbms_output.put_line('�����Զ����쳣'); 
   WHEN OTHERS THEN
     dbms_output.put_line('�׳��쳣'); 
END;

--�ص� ��Ŀ������õ��쳣����

--ʵ�ʿ������쳣�Ĵ���   �ص�
CREATE TABLE tb_error(
ID INT PRIMARY KEY,
errorObj VARCHAR2(18), --�׳��쳣�Ķ���
SQLCODE VARCHAR2(50),  --�쳣����
SQLERRM VARCHAR2(200),  --�쳣��Ϣ
currdate DATE         --����ʱ��
);

CREATE SEQUENCE s_tb_error;

SELECT * FROM tb_error;

-- �ص�����
-- Oracle���׳��쳣ʱ�Ὣ�쳣����洢��SQLCODE�������쳣��Ϣ�洢��SQLERRM
DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
   v_sqlcode VARCHAR2(50);
   v_sqlerrm VARCHAR2(100);
BEGIN
  SELECT * INTO rt_tb_clazz FROM tb_clazz WHERE ID = 9 ;
  dbms_output.put_line(rt_tb_clazz.id||'  '||rt_tb_clazz.code);
EXCEPTION
  WHEN OTHERS THEN
    v_sqlcode := SQLCODE;
    v_sqlerrm := SQLERRM;
    -- ���쳣��Ϣ���浽�쳣��
    INSERT INTO tb_error(ID,errorobj,sqlcode,sqlerrm,currdate)
    VALUES(s_tb_error.nextval,'default',v_sqlcode,v_sqlerrm,SYSDATE);
    COMMIT;
END;




