/**
�������Ĵ洢���̣���tb_clazz����һ�����ݣ�������java����
@param v_code �û���jspҳ�洫��
*/
create or replace procedure saveclazzpro(v_code  VARCHAR2) 
is
begin
  INSERT INTO tb_clazz(id,code) VALUES(s_clazz.nextval,v_code);
  COMMIT;
end saveclazzpro;
/
