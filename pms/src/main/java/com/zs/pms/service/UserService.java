package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	// 查询登录
	public TUser chkLogin(QueryUser query) throws AppException;

	// 根据条件查询
	public List<TUser> queryByCon(QueryUser query);

	// 批量删除
	public void deleteByIds(int[] ids);

	// 修改
	public void update(TUser user) throws AppException;

	// 新增
	public void insert(TUser user) throws AppException;

	// 分页查询
	public List<TUser> queryByPage(QueryUser query,int page);

	// 删除
	public void delete(int id);
	
	//查询总页数
	public int queryPageCounts(QueryUser query);
	
	//按id查询
	public TUser queryById(int id);
}
