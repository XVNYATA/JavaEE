/**
  备份银行数据的存储过程
  @param v_maxid 上次备份的最大id
  
  功能:每天晚上12点备份银行交易记录明细表当日信息
思路：
1. 查询tb_transaction表的（当天）所有数据
2. 插入备份表tb_back
3. 保存当日插入的最大id
注意：
1.将每天备份的最大的id存储用于第二天备份
  为了演示存储过程的互相调用，最大的id会作为参数传递到当前程序
 2.每次commit执行IO动作，非常消耗资源，尽量避免多次commit,
  一次commit需要处理”数据回滚段溢出“问题，使用”分段提交“解决问题
  
*/
create or replace procedure backpro(v_maxid  INT) 
IS
   -- 查询所有需要备份的数据
   CURSOR c_tran IS SELECT * FROM tb_tran WHERE id > v_maxid;
   -- 定义变量
   v_index INT := 0;
   -- 当天最大id
   v_id INT;
begin
  
   FOR r_tran IN c_tran
     LOOP
       INSERT INTO tb_back(id,account,amount,currdate)
        VALUES(r_tran.id,r_tran.account,r_tran.amount,r_tran.currdate);
        -- 自增
        v_index := v_index + 1;
        IF (v_index = 1000) THEN
            COMMIT;
            v_index := 0;
        END IF;
     END LOOP;
     
     -- 保存当日插入的最大id
     SELECT MAX(id) INTO v_id FROM tb_back;
     UPDATE tb_maxid SET maxid = v_id;
     
      COMMIT;

end backpro;
/
