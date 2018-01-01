/*
�α꣺������ȡ��������
Oracle��һ�����������ڴ棩��������в�ѯ�Ľ������
�α���Ǹ�����������������ƣ��������ڴ����ɶ��в�ѯ�����صļ�¼�С�

��ʽ�α�: Ĭ�ϵ�DML����select��䶼����ʽ�α�
��ʾ�α�: �����и�����������,���ҿ��Խ��в���

%ISOPEN  Boolean  �α�򿪣��򷵻�True
%NOTFOUND  Boolean  ������ץȡû�л�ü�¼������True
%FOUND  Boolean  ������ץȡ��ü�¼������True
%ROWCOUNT  Number  ���ص�ĿǰΪֹ��ȡ�ļ�¼��

ʹ���α�Ĳ���:
1. �����α�  CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
2. ���α�  OPEN c_tb_clazz;
3. fetch�α�  FETCH c_tb_clazz INTO r_tb_clazz; 
   �α��и�ָ�룬Ĭ��ָ���һ��֮�ϣ�fetch��ָ�������ƶ���ָ���N�����ݣ�
   ��������ݣ�NOTFOUND����false��FOUND����true��
   �����ĩβ����һֱץȡ���һ������
4. �ر��α�   CLOSE c_tb_clazz;
*/

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;

/**
��һ�����ӣ� ʹ���α���ȡtb_clazz����������
*/
DECLARE
  -- �����α�
  CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
  -- ����rowtype��������
  rt_tb_clazz tb_clazz%ROWTYPE;
BEGIN
  -- ���α�
  OPEN c_tb_clazz;
  -- ѭ��ץȡ����
  LOOP
    FETCH c_tb_clazz INTO rt_tb_clazz;
    
    -- ���û��ץȡ������notfound�᷵��true
    EXIT WHEN c_tb_clazz%NOTFOUND;
    
    dbms_output.put_line(rt_tb_clazz.id || '  '|| rt_tb_clazz.code);
  END LOOP;
  
  -- �ر��α�
  CLOSE c_tb_clazz;
END;


/**
���������α�
�ڶ������ӣ�ʹ���α���ȡtb_clazz���������ݣ�ͬʱ��ȡÿ���༶��ѧ������
ע�⣺�������βΣ��β��ǲ��ó��ȵ�
*/
DECLARE
   -- �༶
   CURSOR c_tb_clazz IS SELECT * FROM tb_clazz;
   rt_tb_clazz tb_clazz%ROWTYPE;
   -- ѧ��
   CURSOR c_tb_student(v_id tb_student.clazz_id%TYPE)
    IS SELECT * FROM tb_student WHERE clazz_id = v_id;
    rt_tb_student tb_student%ROWTYPE;
BEGIN
   OPEN c_tb_clazz;
        LOOP
          FETCH c_tb_clazz INTO rt_tb_clazz;
          EXIT WHEN c_tb_clazz%NOTFOUND;
          dbms_output.put_line(rt_tb_clazz.id || '  '|| rt_tb_clazz.code);
          -- ��ѯtb_student���Ӧ�İ༶ѧ��
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
��ҵ��
ʹ���α���ȡscott�û���dept���������ݣ�ͬʱ��ȡÿ�����ŵ�Ա�����ݣ���ӡ�ڿ���̨
*/










