package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;

/**
 * @author Echoes
 * 文章数据表接口
 *
 */
public interface ArticleDao {
	
	//通过条件查询
	public List<TArticle> queryByCon(QueryArticle query);	
	//通过id查询
	public TArticle queryById(int id);
	//批量删除
	public void deleteByIds(int[] ids);
	//修改
	public void update(TArticle user);
	//新增
	public void insert(TArticle user);
	//查分页
	public List<TArticle> queryByPage(QueryArticle query);
	//删除
	public void delete(int id);
	//查询总数
	public int queryCounts(QueryArticle query);

}
