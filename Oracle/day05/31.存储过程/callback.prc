/**
���ñ��ݵĴ洢����
*/
create or replace procedure callback 
IS
   v_id tb_maxid.maxid%TYPE;
BEGIN
  
   -- ��ѯ�ϴα��ݵ�����id
  SELECT maxid INTO v_id FROM tb_maxid;
  -- ���ñ��ݵĴ洢����,����ѯ�������id��Ϊ����
  backpro(v_id);
  
end callback;
/
