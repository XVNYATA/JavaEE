/**
��tb_tran��delete����֮ǰ���б�������
*/
create or replace trigger t_del_tran
  before delete on tb_tran  
  for each row
declare
  
begin
  
  -- ��Ҫɾ�������ݲ��뵽tb_back��
  INSERT INTO tb_back(id,account,amount,currdate)
  VALUES(:old.id,:old.Account,:old.Amount,:old.Currdate);
  
  --COMMIT;

end t_del_tran;
/
