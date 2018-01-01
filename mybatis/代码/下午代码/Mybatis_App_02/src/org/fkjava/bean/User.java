/**
 * 
 */
package org.fkjava.bean;

/**
 * @author chunlong.luo
 * @date 2015-11-20
 * @email 584614151@qq.com
 * @version 1.0
 */
public class User {
		
	    private int id;
		private String loginname;
		private String password;
		private String username;
		private String sex;
		private String address;
		private Integer age;
		
		public User() {
			super();
			// TODO Auto-generated constructor stub
		}
		public User(String loginname, String password, String username, String sex,
				Integer age) {
			super();
			this.loginname = loginname;
			this.password = password;
			this.username = username;
			this.sex = sex;
			this.age = age;
		}
		public String getLoginname() {
			return loginname;
		}
		public void setLoginname(String loginname) {
			this.loginname = loginname;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
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
		
		
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		/**
		 * @return the address
		 */
		public String getAddress() {
			return address;
		}
		/**
		 * @param address the address to set
		 */
		public void setAddress(String address) {
			this.address = address;
		}
		@Override
		public String toString() {
			return "User [id=" + id + ", loginname=" + loginname + ", password=" + password + ", username=" + username
					+ ", sex=" + sex + ", address=" + address + ", age=" + age + "]";
		}


		
		
		

}
