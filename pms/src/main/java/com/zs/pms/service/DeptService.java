package com.zs.pms.service;

import java.util.List;

import com.zs.pms.po.TDept;

public interface DeptService {
	public List<TDept> queryByPid(int pid);
}
