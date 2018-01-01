/**
Oracle是通过用户去管理数据。
我们要存储数据,必须先建表空间，再建用户，再建对象(表、索引、视图……)

1. 建议做自己的数据用自己的用户。不要使用System等系统用户。
2. 用户一定要使用表空间

*/

/*
表空间： 映射数据实际存储位置，建议一个用户使用一个表空间
*/


/*创建 表空间 表空间名称
数据文件保存路径、大小
自动扩展
注意：
 表空间名称j1604
执行成功后在路径下会有一个j1604.dbf文件产生
*/
CREATE TABLESPACE j1604
DATAFILE  'C:\oracle\product\10.2.0\oradata\orcl\j1604.dbf'  
SIZE 20M  
AUTOEXTEND ON ;  

--删除表空间同时删除表空间的所在的物理文件
DROP TABLESPACE j1604 INCLUDING CONTENTS AND DATAFILES;

--严重注意: 千万不要手动去删除文件夹下面的dbf文件

--数据字典查询所有表空间
select * from DBA_TABLESPACES;
--查询所有数据文件
select * from DBA_DATA_FILES;


/**
创建用户
*/
create user j1604
  identified by j1604
  default tablespace J1604
  temporary tablespace TEMP;
  
create user j1509    --创建  用户  用户名
  identified by j1509   --密码  密码字符
  default tablespace j1509   --默认表空间  表空间名
  temporary tablespace TEMP;  --临时表空间  表空间名
  
  --删除用户,注意：drop会删除用户的所有表和表数据，表空间还存在
 drop user j1604;

-- 数据字典，查询所有用户
 select * from dba_users;
 
 
 --oracle创建数据库会默认创建一个测试用户scott,密码tiger，这个用户默认是锁定

ALTER USER scott ACCOUNT LOCK;  --加锁

ALTER USER scott ACCOUNT UNLOCK;--解锁



-- 赋予连接权限给j1604用户
GRANT CONNECT TO j1604;
-- 赋予连接权限给j1604用户，j1604可以将该权限再赋给另一个用户
grant connect to j1604 with admin option;

-- 角色
grant DBA to j1604 with admin option;

-- 收回权限
REVOKE CONNECT FROM j1604;



