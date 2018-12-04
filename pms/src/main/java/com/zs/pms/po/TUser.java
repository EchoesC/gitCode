package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.util.DateUtil;

/**
 * 用户表的PO
 */
public class TUser implements Serializable {

	
	private static final long serialVersionUID = 5293214558214995122L;
	private int id; 
	private String loginname; 
	private String password; 
	private String sex; 
	private Date birthday; 
	private String email; 
	private TDept dept; 
	private String realname; 
	private int isenabled;
	private String isenabledTxt;
	public String getIsenabledTxt() {
		if (isenabled==1) {
			return "可用";
		}else{
			return "不可用";
		}
		
	}



	public int getIsenabled() {
		return isenabled;
	}



	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	private int creator; 
	private Date creatime; 
	private int updator; 
	private List<TPermission> permission;
	private List<TPermission> menu = new ArrayList<>();
	public List<TPermission> getMenu() {
		List<TPermission> permissions = this.permission;
		for (TPermission per1 : permissions) {
			if (per1.getPid()==0) {
				for (TPermission per2 : permissions) {
					if (per1.getId()==per2.getPid()) {
						per1.getChildren().add(per2);
					}
				}
				menu.add(per1);
			}
		}
		return menu;
	}



	public List<TPermission> getPermission() {
		return permission;
	}
	public void setPermission(List<TPermission> permission) {
		this.permission = permission;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}



	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public TDept getDept() {
		return dept;
	}
	public void setDept(TDept dept) {
		this.dept = dept;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatime() {
		return updatime;
	}
	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	private Date updatime; 
	private String pic;

}
