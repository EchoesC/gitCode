package pms;

import java.awt.geom.Area;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class) //使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestArticle {
	
	@Autowired
	ArticleService as;
	
	public void testQueryByCon(){
		QueryArticle query = new QueryArticle();
		TChannel channel = new TChannel();
		channel.setId(3);
		query.setChannel(channel);
		List<TArticle> list = as.queryByCon(query);
		for (TArticle tArticle : list) {
			System.out.println(tArticle.getTitle());
		}
	}
	
	
	public void testInsert(){
		TArticle article = new TArticle();
		TChannel channel = new TChannel();
		channel.setId(2);
		article.setAuthor("赵宸");
		article.setChannel(channel);
		article.setTitle("新增测试3");
		article.setContent("123456");
		article.setIshot(1);
		article.setIsremod(-1);
		article.setCreator(100);
		as.insert(article);
	}

	public void testDeleteByIds(){
		int[] ids = {5,6};
		as.deleteByIds(ids);
	}
	
	public void testUpdate(){
		TArticle article = new TArticle();
		article.setId(7);
		article.setAuthor("二狗子");
		try {
			as.update(article);
		} catch (AppException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
		
	public void testQueryByPage(){
		QueryArticle query = new QueryArticle();
		List<TArticle> list = as.queryByPage(query, 2);
		System.out.println("总共有"+as.queryPageCounts(query));
		for (TArticle tArticle : list) {
			System.out.println(tArticle.getTitle());
		}
		
	}
	
	public void testQueryById(){
		TArticle article = as.queryById(8);
		System.out.println(article.getAuthor()+"=========="+article.getContent());
	}
	@Test
	public void testDelete(){
		
		as.delete(7);
	}

}
