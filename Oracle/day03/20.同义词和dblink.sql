/**
Oracle�еĶ��� �����С�ͬ����
ͨ������ͬ���֣����������һ�����֣��򻯷��ʶ���Ĳ���
create synonym d_sum
for dept_sum_vu;
*/
select * FROM scott.emp;

--����  ͬ����  ͬ������  for  ��Դ���Ǹ���
create synonym tb_emp for scott.emp;

select * from tb_emp;

--ɾ��
drop synonym tb_emp;

-- ע�⣺ͬ���ֿ���ɾ��ԭ������,ǰ����������Ȩ��,������
DELETE FROM tb_emp;


-- ���ݿ�����
-- Database link
create database link link10
���� connect to SYSTEM identified by orcl
���� using '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.10.10)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
  )';
  
  
  --            ��@���ݿ�������
select * FROM scott.emp@link10;

create synonym tb_emp for scott.emp@link10;

select * from tb_emp;

-- ��ѯ��ǰ���ݿ��scott.dept���10���ݿ��scott.emp��
SELECT * FROM scott.dept d,tb_emp e WHERE d.deptno = e.deptno;


