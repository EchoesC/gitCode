package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;

public interface ArticleService {
	

		// 根据条件查询
		public List<TArticle> queryByCon(QueryArticle query);

		// 批量删除
		public void deleteByIds(int[] ids);

		// 修改
		public void update(TArticle article) throws AppException;

		// 新增
		public void insert(TArticle article);

		// 分页查询
		public List<TArticle> queryByPage(QueryArticle query,int page);

		// 删除
		public void delete(int id);
		
		//查询总页数
		public int queryPageCounts(QueryArticle query);
		
		//根据ID查询
		public TArticle queryById(int id);
}
