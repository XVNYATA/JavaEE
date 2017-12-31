package org.fkjava.hibernate.domain;

import javax.persistence.*;

@Entity @Table(name="STU_INFO")
/** HQL命名查询 */
@NamedQuery(name="hql_2", query="select s from Student s where s.name like ?")
public class Student {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="STU_ID")
	private int id;
	@Column(name="STU_NAME", length=50)
	private String name;
	@Column(name="STU_AGE")
	private int age;
	@Column(name="STU_SCORE")
	private float score;
	@Column(name="STU_PHONE", length=20)
	private String phone;
	
	/** 多的一端 */
	@ManyToOne(fetch=FetchType.LAZY, targetEntity=Teacher.class)
	/** 生成外键列 */
	@JoinColumn(name="T_ID", referencedColumnName="TEA_ID", // 引用主表的主键列
				foreignKey=@ForeignKey(name="FK_STU_TEA")) // 更改外键约束名
	private Teacher teacher;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
}
