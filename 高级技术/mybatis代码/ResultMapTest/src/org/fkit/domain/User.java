
package org.fkit.domain;

import java.io.Serializable;

/**
 * 官方网站
 * www.fkjava.org
 * www.facejava.org
 * 学习交流论坛
 * www.crazyit.org
 *
 * @author 肖文吉
 * @date 2013-1-4
 * 
 * CREATE TABLE `tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(18) DEFAULT NULL,
  `sex` CHAR(2) DEFAULT NULL,
  `age` INT(11) DEFAULT NULL,
  PRIMARY KEY  (`id`)
)

INSERT INTO TB_USER(NAME,sex,age) VALUES('jack','男',22);
INSERT INTO TB_USER(NAME,sex,age) VALUES('rose','女',18);
INSERT INTO TB_USER(NAME,sex,age) VALUES('tom','男',25);
INSERT INTO TB_USER(NAME,sex,age) VALUES('mary','女',20); 

CREATE TABLE TB_USER2(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(18),
user_sex VARCHAR(18),
user_age INT
);
INSERT INTO TB_USER2(user_name,user_sex,user_age) VALUES('jack','男',22);
INSERT INTO TB_USER2(user_name,user_sex,user_age) VALUES('rose','女',18);
INSERT INTO TB_USER2(user_name,user_sex,user_age) VALUES('tom','男',25);
INSERT INTO TB_USER2(user_name,user_sex,user_age) VALUES('mary','女',20); 


 */
public class User implements Serializable{
	
	private Integer id;
	private String name;
	private String sex;
	private Integer age;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User( String name, String sex, Integer age) {
		super();
		this.name = name;
		this.sex = sex;
		this.age = age;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", sex=" + sex + ", age="
				+ age + "]";
	}
	
	

}
