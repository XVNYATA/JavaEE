/**
  �����������ݵĴ洢����
  @param v_maxid �ϴα��ݵ����id
  
  ����:ÿ������12�㱸�����н��׼�¼��ϸ������Ϣ
˼·��
1. ��ѯtb_transaction��ģ����죩��������
2. ���뱸�ݱ�tb_back
3. ���浱�ղ�������id
ע�⣺
1.��ÿ�챸�ݵ�����id�洢���ڵڶ��챸��
  Ϊ����ʾ�洢���̵Ļ�����ã�����id����Ϊ�������ݵ���ǰ����
 2.ÿ��commitִ��IO�������ǳ�������Դ������������commit,
  һ��commit��Ҫ�������ݻع�����������⣬ʹ�á��ֶ��ύ���������
  
*/
create or replace procedure backpro(v_maxid  INT) 
IS
   -- ��ѯ������Ҫ���ݵ�����
   CURSOR c_tran IS SELECT * FROM tb_tran WHERE id > v_maxid;
   -- �������
   v_index INT := 0;
   -- �������id
   v_id INT;
begin
  
   FOR r_tran IN c_tran
     LOOP
       INSERT INTO tb_back(id,account,amount,currdate)
        VALUES(r_tran.id,r_tran.account,r_tran.amount,r_tran.currdate);
        -- ����
        v_index := v_index + 1;
        IF (v_index = 1000) THEN
            COMMIT;
            v_index := 0;
        END IF;
     END LOOP;
     
     -- ���浱�ղ�������id
     SELECT MAX(id) INTO v_id FROM tb_back;
     UPDATE tb_maxid SET maxid = v_id;
     
      COMMIT;

end backpro;
/
