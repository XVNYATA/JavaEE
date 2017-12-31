CREATE TABLE tb_stu(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(20),
pass VARCHAR(20),
remark VARCHAR(50)
);

INSERT INTO tb_stu(username,pass,remark) VALUE ("Jss","123456","疯狂Java讲师");
INSERT INTO tb_stu(username,pass,remark) VALUE ("ligang","123456","疯狂Java讲师");
INSERT INTO tb_stu(username,pass,remark) VALUE ("xiaowenji","123456","疯狂Java讲师");
INSERT INTO tb_stu(username,pass,remark) VALUE ("luowenqiang","123456","疯狂Java讲师");
INSERT INTO tb_stu(username,pass,remark) VALUE ("luochunlong","123456","疯狂Java讲师");
INSERT INTO tb_stu(username,pass,remark) VALUE ("xulei","123456","疯狂Java讲师");


SELECT * FROM tb_stu WHERE username='Jss' AND pass='123456';
SELECT * FROM tb_stu WHERE username='Jsss' AND pass='123456' OR 1=1;

SELECT * FROM tb_stu ;
DROP TABLE tb_stu;