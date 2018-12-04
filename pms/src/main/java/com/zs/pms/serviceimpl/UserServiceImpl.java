package com.zs.pms.serviceimpl;

import java.util.List;

import javax.management.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.Constants;
import com.zs.pms.vo.QueryUser;
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao udao;


	/**
	 * 判断登录
	 */
	@Override
	public TUser chkLogin(QueryUser query) throws AppException {
		// TODO 自动生成的方法存根
		List<TUser> list = udao.queryByCon(query);
		if (list==null||list.size()!=1) {
			throw new AppException(1000, "用户名或者密码输入错误，请重新输入");
		}
		//返回第一条
	TUser user = list.get(0);
		return udao.queryById(user.getId());
//		return list.get(0);
	}
	
	/**
	 * 按条件查询
	 */
	@Override
	public List<TUser> queryByCon(QueryUser query){
		List<TUser> list = udao.queryByCon(query);
		return list;
	}
	
	/**
	 * 批量删除
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByIds(int[] ids){
		// TODO 自动生成的方法存根
		udao.deleteByIds(ids);
		
	}
	/**
	 * 修改用户
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(TUser user) throws AppException {
		// TODO 自动生成的方法存根
		udao.update(user);
		
	}
	/**
	 * 新增用户
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void insert(TUser user) throws AppException {
		// TODO 自动生成的方法存根
		if (user.getLoginname().equals("admin")) {
			throw new AppException(1001, "非法的用户名");
		}
		udao.insert(user);
		
	}
	/**
	 * 分页查询用户
	 */
	@Override
	public List<TUser> queryByPage(QueryUser query,int page) {
		// TODO 自动生成的方法存根
		query.setPage(page);
		return udao.queryByPage(query);
	}
	
	/**
	 * 按ID删除
	 */
	@Override
	public void delete(int id) {
		// TODO 自动生成的方法存根
		udao.delete(id);
		
	}
	
	/**
	 * 查询总页数
	 */
	@Override
	public int queryPageCounts(QueryUser query) {
		// TODO 自动生成的方法存根
		int page = udao.queryCounts(query);
		int pagecount = 0;
		if (page%Constants.PAGECOUNT==0) {
			pagecount=page/Constants.PAGECOUNT;
		}else {
			pagecount = page/Constants.PAGECOUNT+1;
		}
		return pagecount;
	}

	@Override
	public TUser queryById(int id) {
		// TODO 自动生成的方法存根
		
		return udao.queryById(id);
	}

}
