/**
DML(Data Manipulation Language): ���ݲ������ԣ���������ݿ��¼�Ĳ�����
INSERT�����룩��DELETE��ɾ������UPDATE���޸ģ�

Transaction Control:�������
COMMIT(�ύ)��ROLLBACK���ع���
*/

/**
���� insert
1. Ĭ������£�һ�β������ֻ����һ��(mysqlһ�ο��Բ������)
2. �����ֵ�����Ҫ������ֶ�����������ƥ�䣬���ݿ����ַ��õ����ű�ʾ
3. ���Ϊÿ�ж�ָ��ֵ������������г����������
*/
INSERT INTO tb_person(NAME,sex,age) VALUES('jack','��',20);
-- ������
INSERT INTO tb_person VALUES('tom','��',18);





/**
Transaction Control:�������
COMMIT[�ύ]��ROLLBACK[�ع�]

���񣺽�����sql��俴��һ�����壬Ҫôһ��ɹ���Ҫôһ��ع���
A.������
�೤ת��20000��Ф��ʦ��
tb_account
name account amount
�೤   001   50000
Ф��ʦ 002   5000000

1. �೤���˻���ȥ20000. update tb_account set amount = amount - 20000 where name='�೤';
2. Ф��ʦ�˻�����20000. update tb_account set amount = amount + 20000 where name='Ф��ʦ';

B.������ٽ�㣨��ʲôʱ��ʼ��ʲôʱ���������
1. ��һ��commit/rollbackִ��֮�󣬵���һ��commit/rollbackִ��֮ǰ�����еĶ���һ������

C.һ������commit/rollback֮���������ͽ����ˣ������ٴ�commit/rollback�������

D.Oracle���У�Ĭ��DDL����Զ��ύ���ݣ����֮�����һ��commit����DML�����Ҫ�ֶ��ύ���ݡ�
*/

/**
UPDATE  �޸�

�﷨��UPDATE table SET column = value [, column = value] [WHERE condition];

1. Ĭ���޸����з�������������
2. �޸Ŀ���һ���޸Ķ������ݣ��޸ĵ����ݿ���where�Ӿ��޶���
   where�Ӿ�����һ���������ʽ��ֻ�з��ϸ��������вŻᱻ�޸ġ�
3. Ҳ����ͬʱ�޸Ķ��У����е��޸��м���ö���(,)����
*/

-- ��age�޸ĳ�25
UPDATE tb_person SET age = 25;
-- ��age�޸ĳ�25,������������tom��
UPDATE tb_person SET age = 25 WHERE NAME = 'tom';
-- ��age�޸ĳ�25,sex�޸ĳ�Ů��������������tom��
UPDATE tb_person SET age = 25,sex = 'Ů' WHERE NAME = 'tom';
-- ��age�޸ĳ�25��������������jack�Ĳ���sex���е�
UPDATE tb_person SET age = 25 WHERE NAME = 'jack' AND sex = '��';
-- ��age�޸ĳ�21��������������jack�Ļ���sex��Ů��
UPDATE tb_person SET age = 21 WHERE NAME = 'jack' OR sex = 'Ů';


/**
delete  ɾ��

�﷨��DELETE FROM table [WHERE condition];

ע�⣺delete�����С��λ���С�
1. Ĭ��ɾ�����з�������������
2. ɾ������һ��ɾ���������ݣ�ɾ�������ݿ���where�Ӿ��޶���
   where�Ӿ�����һ���������ʽ��ֻ�з��ϸ��������вŻᱻɾ����
*/
-- ɾ����������
DELETE FROM tb_person;

-- ע�⣺ɾ��jack��age�У�update��
UPDATE tb_person SET age = NULL WHERE NAME = 'jack';

-- ɾ��,������������tom��
DELETE FROM tb_person WHERE NAME = 'tom';
-- ɾ����������������jack�Ĳ���sex���е�
DELETE FROM tb_person WHERE NAME = 'jack' AND sex = '��';
--  ɾ����������������jack�Ļ���sex��Ů��
DELETE FROM tb_person WHERE NAME = 'jack' OR sex = 'Ů';


SELECT * FROM tb_person;


/**
���ԣ�
sql���ɾ�������м��ַ�ʽ���ֱ���ʲô��
��
1. delete
   -- DML��䣬delete�����С��λ���У�����ͨ��whereѡ��ɾ����ɾ�����ݿ��Իع���
      ������ṹ������
2. truncate
   -- DDL��䣬TRUNCATE�ǽضϱ���������ݣ�ɾ�����ݲ����Իع���������ṹ���Ͽ�
3. drop
  -- DDL��䣬ɾ����ṹ�ͱ��������ݣ����Ҳ��ܻع������á����
*/


/**
1. Oracle���ݿ���
2. �������ݿ�
3. ��ռ䡢�û�����ɫ��Ȩ��  
4. DDL���ص㣩
5. DML���ص㣩


������ϰ��
1. ����һ���༶����š����ơ������Σ�����5�����ݡ�
2. ����һ��ѧ�����������Ա����䣬��ַ���绰������50�����ݡ�
3. �������ݵĲ��롢�޸ġ�ɾ�������������

*/
