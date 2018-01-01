--  plsql��������

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

-- dml
/**
2. ���ܸ���sql
   sql:ҳ��������Ϣ -- servlet�������ݣ����ó־ò�����sql - sql��䷢�͵����ݿ�(DBMS)�����ݿ���� -- ִ��sql��
   plsql:ҳ��������Ϣ -- servlet�������ݣ����ó־ò㴫�����(���ô洢����) -  ִ��sql��
   ����ϵͳ
*/
BEGIN
  INSERT INTO tb_clazz(ID,CODE) VALUES(3,'j1601');
  COMMIT;
END;



-- select
/**
plsql�������������ݣ����������鿴��
1. select�����ȱ��into�Ӿ�
2. ʵ�ʷ�����������������������ȡ����������Ҫʹ���α꣩
3. δ�ҵ��κ�����
*/
DECLARE
   v_id INT;
   v_code VARCHAR2(18);
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz WHERE ID = 9;
  dbms_output.put_line(v_id ||' ' || v_code);
END;

/**
%type
v_id tb_clazz.id%TYPE
v_id������tb_clazz���id�е��������͡�����һ��
*/
DECLARE
   v_id tb_clazz.id%TYPE;
   v_code tb_clazz.code%TYPE;
BEGIN
  SELECT ID,CODE INTO v_id,v_code FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(v_id ||' ' || v_code);
END;


/**
%rowtype
rt_tb_clazz tb_clazz%ROWTYPE
rt_tb_clazz������tb_clazz��ı�ṹһ��,�൱�ڱ�ṹ�ĸ���
*/
DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  SELECT ID,CODE INTO rt_tb_clazz.id,rt_tb_clazz.code FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(rt_tb_clazz.id ||' ' || rt_tb_clazz.code);
END;


-- ʵ�ʲ���

DECLARE
   rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  SELECT * INTO rt_tb_clazz FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(rt_tb_clazz.id ||' ' || rt_tb_clazz.code);
END;

-- ʹ��recode
DECLARE
   -- ����һ������RECODE
   TYPE t_tb_clazz is RECORD
      (
        ID tb_clazz.id%TYPE, 
        CODE tb_clazz.code%TYPE
    );
    -- ����һ������
    v_tb_clazz t_tb_clazz;
BEGIN
  SELECT * INTO v_tb_clazz FROM tb_clazz WHERE ID = 3;
  dbms_output.put_line(v_tb_clazz.id ||' ' || v_tb_clazz.code);
END;







