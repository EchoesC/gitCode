package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TDept;

public interface DeptDao {
	public List<TDept> queryByPid(int pid);
}
