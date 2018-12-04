package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.po.TUser;
import com.zs.pms.service.ArticleService;
import com.zs.pms.util.Constants;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	ArticleDao adao;
	
	
	/**
	 * 根据条件查询
	 */
	@Override
	public List<TArticle> queryByCon(QueryArticle query) {
		// TODO 自动生成的方法存根
		return adao.queryByCon(query);
	}

	/**
	 * 批量删除
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByIds(int[] ids) {
		// TODO 自动生成的方法存根
		adao.deleteByIds(ids);

	}

	/**
	 * 修改
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(TArticle article) throws AppException {
		// TODO 自动生成的方法存根
		adao.update(article);
	}

	/**
	 * 新增
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void insert(TArticle article) {
		// TODO 自动生成的方法存根
		adao.insert(article);
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<TArticle> queryByPage(QueryArticle query, int page) {
		// TODO 自动生成的方法存根
		query.setPage(page);
		return adao.queryByPage(query);
	}

	/**
	 * 删除
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) {
		// TODO 自动生成的方法存根
		adao.delete(id);
	}

	/**
	 * 查询总页数
	 */
	@Override
	public int queryPageCounts(QueryArticle query) {
		// TODO 自动生成的方法存根
		int page = 0;
		if (adao.queryCounts(query)%Constants.PAGECOUNT==0) {
			page=adao.queryCounts(query)/Constants.PAGECOUNT;
		}else{
			page=adao.queryCounts(query)/Constants.PAGECOUNT+1;
		}
		return page;
	}

	/**
	 * 根据ID查询
	 */
	@Override
	public TArticle queryById(int id) {
		// TODO 自动生成的方法存根
		return adao.queryById(id);
	}

}
