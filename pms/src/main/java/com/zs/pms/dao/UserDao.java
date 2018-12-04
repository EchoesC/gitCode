package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

/**
 * @author Echoes
 * 用户数据表接口
 *
 */
public interface UserDao {
	
	//通过条件查询
	public List<TUser> queryByCon(QueryUser query);	
	//通过id查询
	public TUser queryById(int id);
	//批量删除
	public void deleteByIds(int[] ids);
	//修改
	public void update(TUser user);
	//新增
	public void insert(TUser user);
	//查分页
	public List<TUser> queryByPage(QueryUser query);
	//删除
	public void delete(int id);
	//查询总数
	public int queryCounts(QueryUser query);
	

}
