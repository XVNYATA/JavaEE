/**
�����������:
1. �������,��ͻ����й�ͨ
2. �������������ʵ�����еĶ���ģ�⵽�����
   ���ݽ�ģ
3. ����
4. ����
5. ���߲���

�ӹ�ϵ���ݿ�ı���ɾ��������Ϣ�Ĺ��̳�Ϊ�淶����
�ǵõ���Ч�Ĺ�ϵ�����ݿ����߼��ṹ��ú������׵ķ�����

������ݹ淶���ķ���: ����ʽ

����1:
��һ��ʽ�� ����Ҫ������,����ÿ������ֵ ���ǲ����ٷֵ���С���ݵ�λ�����R�ǵ�һ��ʽ�Ĺ�ϵ��
�ڶ���ʽ�� ���з����ؼ��ֶ���ȫ���������ؼ���(ͨ��������������)
������ʽ�� �����ؼ��ֲ������������������ؼ��֣�ͨ������һ��������

*/

-- ��N���༶����N��ѧ������N�ſγ�
-- һ��������ж��ѧ����һ��ѧ��ֻ������һ���࣬һ��ѧ������ѡ�޶��ſγ̣�һ�ſγ̿��Ա����ѧ��ѡ��

CREATE TABLE tb_clazz(
ID INT PRIMARY KEY,
CODE VARCHAR2(10)
);

INSERT INTO tb_clazz(ID,CODE)VALUES(1,'j1604');
INSERT INTO tb_clazz(ID,CODE)VALUES(2,'j1605');

CREATE TABLE tb_student(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL, 
sex CHAR(2) CHECK(sex='��' OR sex='Ů'),  
age INT CHECK (age > 18 AND age < 60),
email VARCHAR2(50) UNIQUE,
address VARCHAR2(100) DEFAULT '����', 
iphone VARCHAR2(20),
clazz_id INT,
FOREIGN KEY (clazz_id) REFERENCES tb_clazz(ID)
)

INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(1,'jack','��',20,'jack@163.com','HK','18620000001',1);
INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(2,'mary','��',20,'mary@163.com','HK','18620000002',1);
INSERT INTO tb_student(id,NAME,sex,age,email,Address,iphone,clazz_id)
VALUES(3,'tom','��',20,'tom@163.com','HK','18620000003',2);

CREATE TABLE tb_course(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
CREDIT VARCHAR2(18)
);

INSERT INTO tb_course(ID,NAME,CREDIT)VALUES(1,'JAVASE',5);
INSERT INTO tb_course(ID,NAME,CREDIT)VALUES(2,'JAVAEE',10);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
SELECT * FROM tb_course;
SELECT * FROM tb_student_course;


-- idΪ1��ѧ��ѡ����JAVASE�γ̣���ô�洢����
/** id   name  clazz_id  course_id 
    1     jack   1        1
    
-- idΪ1��ѧ��ѡ����JAVAEE�γ̣���ô�洢����
id   name  clazz_id  course_id   course_id2
    1     jack   1        1       2
-- idΪ1��ѧ��ѡ����JAVASE�γ̣�����90��
id   name  clazz_id  course_id  grade 
    1     jack   1        1      90
    
/**
���ݽ�ģ 
1. ����������ʽ
2. ����ʵ��֮��Ĺ�ϵ

һ��һ�� һ����ֻ��һ�����֤  Ψһ�������������������
һ�Զࣺ һ���༶�����ж��ѧ��    һ��ѧ��ֻ����һ���༶ ��clazz - student��
        ������ һ�Զ�ʹ�������������ͨ���ڶ෽��student���������
��Զࣺ һ��ѧ������ѡ����ſγ�   һ�ſγ̿��Ա����ѧ��ѡ�� ��student - course��
          ������ ��Զ�ͨ��ʹ���м���ٶཨһ�ű�洢����������
                 ͨ���м��������ű��id��Ϊ����������������Ϊ���ָ�������
*/
CREATE TABLE tb_student_course(
student_id INT,
course_id INT,
grade INT,
PRIMARY KEY(student_id,course_id),
FOREIGN KEY(student_id) REFERENCES tb_student(ID),
FOREIGN KEY(course_id) REFERENCES tb_course(ID)
);

-- idΪ1��ѧ��ѡ����JAVASE�γ̣���ô�洢����
/** student_id  course_id   grader
      1              1       90
    
-- idΪ1��ѧ��ѡ����JAVAEE�γ̣���ô�洢����
   student_id  course_id   grader
      1              2       80
**/
INSERT INTO tb_student_course(student_id,course_id,grade) VALUES(1,1,90);
INSERT INTO tb_student_course(student_id,course_id,grade) VALUES(1,2,80);

SELECT * FROM tb_clazz;
SELECT * FROM tb_student;
SELECT * FROM tb_course;
SELECT * FROM tb_student_course;

-- ��ѯ��jack������Ϣ�������༶���γ̣�����

SELECT s.name,c.code,c2.name,sc.grade
FROM tb_clazz c,tb_student s,tb_course c2,tb_student_course sc
WHERE c.id = s.clazz_id
AND s.id = sc.student_id
AND c2.id = sc.course_id
AND s.name = 'jack';

/**
������ϰ��

1. �༶��ѧ�����γ̡��м��������ݣ�jack����ѡ��2�ſγ�
   ��ѯ��jack������ϸ��Ϣ��������
   �༶���ơ���ѡ�Ŀγ̣��γ̵�ѧ�ֺͷ���
   
   
2. ���Ϲ���
�� : id�������������硢����ʱ�䡢�۸����ߡ�����
�û���id�� ��������ַ���绰��email
����: id , ���code 

�û��Ͷ�����һ�Զࡣ
�������鼮�Ƕ�Զ�
�û����鼮�Ƕ�Զ࣬�����û��Ͷ������й�����ϵ�����Բ���Ҫ�ٶཨ�м��ά���û����鼮�Ĺ�ϵ
tb_user: id
tb_order:id   user_id
tb_book: id
tb_item: order_id,book_id,count


3. �顢�û����������м��������ݣ�jack���ٹ���2�֣�ÿ�ֹ���2����
   ��ѯ��jack������ϸ��Ϣ��������
   �û���Ϣ��������Ϣ�������鼮���ơ����������
*/

CREATE TABLE tb_book(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
author VARCHAR2(18),
price NUMBER,
pree VARCHAR2(50),
remark VARCHAR2(100)
);
CREATE SEQUENCE s_tb_book;

INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'���Java����','���',99,'���ӹ�ҵ������','����');

INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'���Android����','���',88,'���ӹ�ҵ������','����');


INSERT INTO tb_book(ID,name,author,price,pree,remark) 
VALUES(s_tb_book.nextval,'���Ajax����','���',77,'���ӹ�ҵ������','����');

CREATE TABLE tb_user(
ID INT PRIMARY KEY,
NAME VARCHAR2(18) NOT NULL,
phone VARCHAR2(30) NOT NULL,
address VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE s_tb_user;

INSERT INTO tb_user(ID,NAME,phone,address) VALUES(s_tb_user.nextval,'jack','13902001235','��ӳ���');


CREATE TABLE tb_order(
ID INT PRIMARY KEY,
CODE VARCHAR2(32) NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES tb_user(ID)
);

CREATE SEQUENCE s_tb_order;

INSERT INTO tb_order(ID,CODE,user_id) VALUES(s_tb_order.nextval,'uuid001',1);

CREATE TABLE tb_item(
order_id INT,
book_id INT,
COUNT INT,
PRIMARY KEY(order_id,book_id),
FOREIGN KEY (order_id) REFERENCES tb_order(ID),
FOREIGN KEY (book_id) REFERENCES tb_book(ID)
);

INSERT INTO tb_item(order_id,book_id,COUNT) VALUES(2,1,10);
INSERT INTO tb_item(order_id,book_id,COUNT) VALUES(2,2,5);


SELECT * FROM tb_book;
SELECT * FROM tb_user;
SELECT * FROM tb_order;
SELECT * FROM tb_item;

-- ��ѯ��jack���Ĺ�����Ϣ
SELECT u.name,o.code,b.name,b.price,i.count
FROM tb_user u,tb_book b,tb_order o,tb_item i
WHERE u.id = o.user_id
AND o.id = i.order_id
AND b.id = i.book_id
AND u.name = 'jack';


/**
һ��һ�� һ����ֻ��һ�����֤  Ψһ�������������������
*/
-- Ψһ�������,��Ҫ��һ�������ά��������ϵ �Ƽ�ʹ��
CREATE TABLE tb_card(
ID INT PRIMARY KEY,
CODE VARCHAR2(18)
);

INSERT INTO tb_card(ID,CODE) VALUES(1,'123456');

CREATE TABLE tb_person(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
card_id INT UNIQUE,
FOREIGN KEY (card_id) REFERENCES tb_card(ID)
);

INSERT INTO tb_person(ID,NAME,card_id) VALUES(1,'jack',1);


-- ��������
CREATE TABLE tb_card(
ID INT PRIMARY KEY,
CODE VARCHAR2(18)
);

INSERT INTO tb_card(ID,CODE) VALUES(1,'123456');

CREATE TABLE tb_person(
ID INT PRIMARY KEY,
NAME VARCHAR2(18),
FOREIGN KEY (ID) REFERENCES tb_card(ID)
);

INSERT INTO tb_person(ID,NAME) VALUES(1,'jack');







