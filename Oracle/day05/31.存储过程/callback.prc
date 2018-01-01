/**
调用备份的存储过程
*/
create or replace procedure callback 
IS
   v_id tb_maxid.maxid%TYPE;
BEGIN
  
   -- 查询上次备份的最大的id
  SELECT maxid INTO v_id FROM tb_maxid;
  -- 调用备份的存储过程,将查询到的最大id作为参数
  backpro(v_id);
  
end callback;
/
