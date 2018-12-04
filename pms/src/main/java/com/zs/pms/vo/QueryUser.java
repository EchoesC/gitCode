package com.zs.pms.vo;

/**
 * @author Echoes
 *	用户查询对象
 */
public class QueryUser extends QueryPage {
	
	private String loginname;
	private String password;
	private int isenabled;
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
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
}
