/**
Oracle��ͨ���û�ȥ�������ݡ�
����Ҫ�洢����,�����Ƚ���ռ䣬�ٽ��û����ٽ�����(����������ͼ����)

1. �������Լ����������Լ����û�����Ҫʹ��System��ϵͳ�û���
2. �û�һ��Ҫʹ�ñ�ռ�

*/

/*
��ռ䣺 ӳ������ʵ�ʴ洢λ�ã�����һ���û�ʹ��һ����ռ�
*/


/*���� ��ռ� ��ռ�����
�����ļ�����·������С
�Զ���չ
ע�⣺
 ��ռ�����j1604
ִ�гɹ�����·���»���һ��j1604.dbf�ļ�����
*/
CREATE TABLESPACE j1604
DATAFILE  'C:\oracle\product\10.2.0\oradata\orcl\j1604.dbf'  
SIZE 20M  
AUTOEXTEND ON ;  

--ɾ����ռ�ͬʱɾ����ռ�����ڵ������ļ�
DROP TABLESPACE j1604 INCLUDING CONTENTS AND DATAFILES;

--����ע��: ǧ��Ҫ�ֶ�ȥɾ���ļ��������dbf�ļ�

--�����ֵ��ѯ���б�ռ�
select * from DBA_TABLESPACES;
--��ѯ���������ļ�
select * from DBA_DATA_FILES;


/**
�����û�
*/
create user j1604
  identified by j1604
  default tablespace J1604
  temporary tablespace TEMP;
  
create user j1509    --����  �û�  �û���
  identified by j1509   --����  �����ַ�
  default tablespace j1509   --Ĭ�ϱ�ռ�  ��ռ���
  temporary tablespace TEMP;  --��ʱ��ռ�  ��ռ���
  
  --ɾ���û�,ע�⣺drop��ɾ���û������б�ͱ����ݣ���ռ仹����
 drop user j1604;

-- �����ֵ䣬��ѯ�����û�
 select * from dba_users;
 
 
 --oracle�������ݿ��Ĭ�ϴ���һ�������û�scott,����tiger������û�Ĭ��������

ALTER USER scott ACCOUNT LOCK;  --����

ALTER USER scott ACCOUNT UNLOCK;--����



-- ��������Ȩ�޸�j1604�û�
GRANT CONNECT TO j1604;
-- ��������Ȩ�޸�j1604�û���j1604���Խ���Ȩ���ٸ�����һ���û�
grant connect to j1604 with admin option;

-- ��ɫ
grant DBA to j1604 with admin option;

-- �ջ�Ȩ��
REVOKE CONNECT FROM j1604;



