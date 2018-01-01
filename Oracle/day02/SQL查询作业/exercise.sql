CREATE TABLE tb_Student(
  ID number  PRIMARY KEY, --ѧ�����
  NAME VARCHAR2(20) NOT NULL,--ѧ������
  Sex VARCHAR2(2) CHECK(Sex IN('��','Ů')) , --ѧ���Ա�
  Age number, --ѧ������
  Address VARCHAR2(50) , --ѧ����ַ
  Tel VARCHAR2(30), --ѧ���绰
  Email VARCHAR2(30)--ѧ������
);


INSERT INTO tb_Student
VALUES
(1,'Сǿ','��',20,'����ʡ��ɳ������뽭��Է9��203��','0731-4230123','xq@sina.com');
INSERT INTO tb_Student
VALUES
(2,'����','Ů',19,'����ʡ��ɳ�ж���·�����´�21��502��','0731-4145268','ly@163.com');
INSERT INTO tb_Student
VALUES
(3,'³����','��',30,'����ʡ������601������15��308��','0732-8342567',NULL);
INSERT INTO tb_Student
VALUES
(4,'�ŷ�','��',28,'����ʡ����������ҽԺ20��301��','0735-2245214',NULL);
INSERT INTO tb_Student
VALUES
(5,'�仨','Ů',21,'����ʡ��ɳ�����º�12��403��','0731-8325124','ch@sina.com');


CREATE TABLE tb_Exam
(
  ID number ,         --ѧ�����
  NAME VARCHAR2(20) NOT NULL,                  --�γ�����
  Score number CHECK(Score BETWEEN 0 AND 100),          --���Է���
  exam_date DATE,                      --����ʱ��
  PRIMARY KEY(ID,NAME),   --ѧ����źͿγ��������������� 
  CONSTRAINT tb_exam_fk FOREIGN KEY (id) REFERENCES tb_Student(id)
);

INSERT INTO tb_Exam VALUES(1,'C����',78,to_date('2004-06-10','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(2,'C����',90,to_date('2004-06-10','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(3,'C����',0,NULL);
INSERT INTO tb_Exam VALUES(3,'VB',35,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(4,'VB',35,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(5,'VB',85,to_date('2004-07-16','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(2,'��ҳ���',85,to_date('2004-08-20','yyyy-mm-dd'));
INSERT INTO tb_Exam VALUES(3,'��ҳ���',85,NULL);



CREATE TABLE tb_Emp
(
   ID        number     PRIMARY KEY,--ְԱ���
   NAME    VARCHAR2(20)    NOT NULL,--ְԱ����
   Sex        VARCHAR2(2)    NOT NULL    CHECK(sex IN ('��','Ů')),--ְԱ�Ա�                            
   Age        number    NOT NULL CHECK(age>=18),--ְԱ����
   Address    VARCHAR2(50)    NOT NULL, --ְԱ��ַ
   Tel        VARCHAR2(30)    NOT NULL,--ְԱ�绰
   Email    VARCHAR2(30)--ְԱ����
);


INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(1,'����','��',25,'����ʡ��ɳ������뽭��Է9��203��','0731-4230123');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(2,'����','Ů',23,'����ʡ��ɳ�ж���·�����´�21��502��','0731-4145268');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(3,'��һ��','��',24,'����ʡ������601������15��308��','0732-8342567');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(4,'��Ц','��',27,'����ʡ����������ҽԺ20��301��','0735-2245214');
INSERT INTO tb_emp
(ID,NAME,sex,age,address,tel)
VALUES
(5,'����','Ů',23,'����ʡ��ɳ�����º�12��403��','0731-8325124');


CREATE TABLE tb_Prod
(
   ID        number     PRIMARY KEY,--��Ʒ���
   TYPE    VARCHAR2(20)    NOT NULL,--��Ʒ����
   Mark    VARCHAR2(20)    NOT NULL,--��ƷƷ��
   Spec    VARCHAR2(20)--��Ʒ���
);



INSERT INTO tb_prod VALUES(1,'���ӻ�','����','29Ӣ�紿ƽ');

INSERT INTO tb_prod VALUES(2,'���ӻ�','����','29Ӣ�紿ƽ����');

INSERT INTO tb_prod VALUES(3,'���ӻ�','����','32Ӣ�米Ͷ');

INSERT INTO tb_prod VALUES(4,'���ӻ�','��è','29Ӣ�紿ƽ');

INSERT INTO tb_prod VALUES(5,'���ӻ�','��è','29Ӣ�紿ƽ����');

INSERT INTO tb_prod VALUES(6,'���ӻ�','��è','32Ӣ�米Ͷ');

INSERT INTO tb_prod VALUES(7,'�ʼǱ�','����','P4-1.8G');

INSERT INTO tb_prod VALUES(8,'�ʼǱ�','����','P4-2.4G');

INSERT INTO tb_prod VALUES(9,'�ʼǱ�','�Ϲ�','P4-1.8G');

INSERT INTO tb_prod VALUES(10,'�ʼǱ�','�Ϲ�','P4-2.4G');


CREATE TABLE tb_Sales
(
   srNO        number     PRIMARY KEY,--��¼���
   eID        number    NOT NULL REFERENCES tb_emp(id),--ְԱ���
   pID        number    NOT NULL REFERENCES tb_prod(id),--��Ʒ���
   pQty        number    NOT NULL CHECK(pqty>0),--��������
   pAmount    number        NOT NULL CHECK(pamount>0),--���ۼ�ֵ
   sDate    date    default sysdate --����ʱ��
);


INSERT INTO tb_sales VALUES(1,1,1,10,21000,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(2,1,2,5,20000,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(3,1,1,4,23500,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(4,1,5,4,16500,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(5,2,3,3,31000,to_date('2004-3-11','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(6,2,6,4,40000,to_date('2004-3-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(7,3,7,5,40000,to_date('2004-3-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(8,3,8,3,36000,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(9,4,9,6,41500,to_date('2004-3-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(10,4,10,5,50000,to_date('2004-3-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(11,1,1,10,21000,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(12,1,2,5,20000,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(13,1,4,12,23500,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(14,1,5,4,16500,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(15,2,3,3,31000,to_date('2004-4-11','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(16,2,6,4,40000,to_date('2004-4-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(17,3,7,5,40000,to_date('2004-4-13','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(18,3,8,3,36000,to_date('2004-4-14','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(19,4,9,6,41500,to_date('2004-4-12','yyyy-mm-dd'));

INSERT INTO tb_sales VALUES(20,4,10,5,50000,to_date('2004-4-14','yyyy-mm-dd'));


