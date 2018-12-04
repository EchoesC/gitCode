package com.zs.pms.po;

import java.io.Serializable;

/**
 * @author Echoes
 * 部门表的PO
 *
 */
public class TDept implements Serializable {

	private static final long serialVersionUID = 576555799166420979L;
	private int id; 
	private String name; 
	private TDept pid;
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
	public TDept getPid() {
		return pid;
	}
	public void setPid(TDept pid) {
		this.pid = pid;
	}
	
}
