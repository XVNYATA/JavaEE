/**
PL/SQL�� Procedure Language & Structured Query Language ����д
PL/SQL��Oracle���ݿ��SQL������չ�������˱�����Ե��ص㡣
���ݲ����Ͳ�ѯ��䱻������PL/SQL����Ĺ��̵�Ԫ�У�
�����߼��жϡ�ѭ���Ȳ�����ɸ��ӵĹ��ܻ��߼���.
�򵥵ع��ɣ�PL/SQL = ��ͳSQL �� �ṹ�����̿���

�ô�:
1. �нṹ�������̿��ƣ�������ɸ��Ӳ���
2. ���ܸ���sql
   sql:ҳ��������Ϣ -- servlet�������ݣ����ó־ò�����sql - sql��䷢�͵����ݿ�(DBMS)�����ݿ���� -- ִ��sql��
   plsql:ҳ��������Ϣ -- servlet�������ݣ����ó־ò㴫�����(���ô洢����) -  ִ��sql��
   ����ϵͳ
3.���ԶԳ����е��쳣���д���
*/

/**
PL/SQL��Ϊ�������������(�洢���̡�������)

PL/SQL��������������ɡ���
   ��������: �ڴ�����PL/SQL�õ��ı���,���ͼ��α꣬�Լ��ֲ��Ĵ洢���̺ͺ��� 
   ִ�в���: ���̼�SQL ���  , ���������Ҫ���� 
   �쳣������: ������   
*/
DECLARE
  -- �������֣��������������
BEGIN
  -- ��������java�Ļ����ţ���д����ĵط�
EXCEPTION
  -- ��������׳��쳣
END;


/**
��һ��plsql,�ڿ���̨���HelloWorld
*/
BEGIN
  -- System.out.println();
  -- ��.����(����)
  dbms_output.put_line('HelloWorld');
END;

/**
�������,������ʼֵ����null
���� CONSTANT
*/
DECLARE
   --  ������  ��������(����);
   v_id INT;
   v_name VARCHAR2(18);
   v_clazz CONSTANT CHAR(5) := 'j1604';
BEGIN
   -- ��ֵ
   v_id := 100;
   v_name := '���Java';
   dbms_output.put_line('v_id = ' || v_id);
   dbms_output.put_line('v_name = ' || v_name);
   dbms_output.put_line('v_clazz = ' || v_clazz);
END;


/***************************
���ϱ���(��������)   VARRAY(����Ҫ)     TABLE(����Ҫ)   RECORD (��Ҫ)
1.��������ڲ���������ڴ�Ŷ��ֵ
2.��Ҫ�ȶ������ͣ�Ȼ���ø����Ϳ��ظ�������������
 ע��: ���ϱ��������������ͣ�����ʱǰ��Ҫ�� TYPE
       TYPE�ǲ���ֱ��ʹ�õ�,ʹ��ǰ��Ҫ�����������
***************************/
-- ��ȡ����
-- tb_user  name��sex��age
/**
  class User{
        private String name;
        private String sex;
        private Integer age;
  }
*/
DECLARE
 -- ����һ��RECORD
  TYPE r_tb_user IS RECORD 
  (
       name VARCHAR2(18),
       sex CHAR(3),
       age INT
  );
  --  v_id INT;
  v_tb_user r_tb_user;
BEGIN
  v_tb_user.name := 'jack';
  v_tb_user.sex := '��';
  v_tb_user.age := 25;
  dbms_output.put_line(v_tb_user.name || '       ' || v_tb_user.sex || '  '|| v_tb_user.age);
END;





