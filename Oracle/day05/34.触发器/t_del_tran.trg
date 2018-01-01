/**
在tb_tran的delete操作之前进行备份数据
*/
create or replace trigger t_del_tran
  before delete on tb_tran  
  for each row
declare
  
begin
  
  -- 将要删除的数据插入到tb_back表
  INSERT INTO tb_back(id,account,amount,currdate)
  VALUES(:old.id,:old.Account,:old.Amount,:old.Currdate);
  
  --COMMIT;

end t_del_tran;
/
