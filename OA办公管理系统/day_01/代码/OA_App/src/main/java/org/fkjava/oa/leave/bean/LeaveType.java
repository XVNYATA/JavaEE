package org.fkjava.oa.leave.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



import javax.persistence.*;

import org.fkjava.oa.identity.bean.User;



/**
 * @Author chunlong.luo @tel 15622266642 @qq 584614151
 * @Date 2015年9月6日下午1:12:56
 * @Email 584614151&qq.com
 * @Version 1.0
 * @From http://www.fkit.org
 *
 */
@Entity @Table(name="OA_LEAVE_TYPE")
public class LeaveType implements Serializable {

	private static final long serialVersionUID = -227626827894886737L;
	@Id @Column(name="CODE", length=255)
	private String code;
	/** 名称 */
	@Column(name="NAME", length=100)
	private String name;
	/** 备注 */
	@Column(name="REMARK", length=500)
	private String remark;
	/** 修改人 */
	@ManyToOne(targetEntity=User.class, fetch=FetchType.LAZY)
	@JoinColumn(name="MODIFIER", referencedColumnName="USER_ID", 
			foreignKey=@ForeignKey(name="FK_LEAVETYPE_MODIFIER"))
	private User modifier;
	/** 修改日期 */
	@Column(name="MODIFY_DATE")
	private Date modifyDate;
	/** 创建人 */
	@ManyToOne(targetEntity=User.class, fetch=FetchType.LAZY)
	@JoinColumn(name="CREATER", referencedColumnName="USER_ID",
			foreignKey=@ForeignKey(name="FK_LEAVETYPE_CREATER"))
	private User creater;
	/** 创建日期 */
	@Column(name="CREATE_DATE")
	private Date createDate;
	// 假期类型与假期明细存在一对多关联
	@OneToMany(targetEntity=LeaveItem.class,cascade=CascadeType.ALL,
			fetch=FetchType.LAZY, mappedBy="leaveType", orphanRemoval=true)
	private Set<LeaveItem> leaveItems 
			= new HashSet<LeaveItem>(0);
	
	/** setter and getter method */
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public User getModifier() {
		return modifier;
	}
	public void setModifier(User modifier) {
		this.modifier = modifier;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public User getCreater() {
		return creater;
	}
	public void setCreater(User creater) {
		this.creater = creater;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Set<LeaveItem> getLeaveItems() {
		return leaveItems;
	}
	public void setLeaveItems(Set<LeaveItem> leaveItems) {
		this.leaveItems = leaveItems;
	}
}