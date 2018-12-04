package pms;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class) //使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestLogin {
	@Autowired
	UserService us;
	@Autowired
	DeptService ds;
	
	@Test
	public void testLogin(){
		QueryUser query = new QueryUser();
		query.setLoginname("test1");
		query.setPassword("123456");
		try {
			TUser user = us.chkLogin(query);
			System.out.println(user.getRealname()+"=========="+user.getId());
			List<TPermission> permissions = us.chkLogin(query).getPermission();
			for (TPermission tPermission : permissions) {
				System.out.println(tPermission.getPname());
			}
			System.out.println("------------------------------------------------");
			for (TPermission per1 : user.getMenu()) {
				System.out.println(per1.getPname());
				for (TPermission per2 : per1.getChildren()) {
					System.out.println("\t\t"+per2.getPname());
				}
			}
		} catch (AppException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getErrMsg());
		}catch(Exception e1){
			e1.printStackTrace();
		}
	}

	public void testQuery(){
		QueryUser query = new QueryUser();
		//query.setPage(1);
		//query.setLoginname("test1");
		//query.setPassword("123456");
		//query.setPassword("123456");
		try {
			List<TUser> list = us.queryByCon(query);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	public void testDelete(){
		int[] ids={3092,3093,3094};
		try {
			us.deleteByIds(ids);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	

	public void testUpdate(){
		TUser user=new TUser();
		TDept dept = new TDept();
		dept.setId(100);
		user.setId(3091);
		//user.setPassword("qwert");
		//user.setBirthday(new Date());
		//user.setRealname("阿毛");
		//user.setDept(dept);
		//user.setEmail("5566@qq.com");
		user.setIsenabled(1);
		//user.setSex("女");
		user.setUpdator(1000);
		//user.setPic("123.jpg");
		try {
			us.update(user);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
	
	public void testInsert() throws AppException{
		TUser user = new TUser();
		TDept dept = new TDept();
		dept.setId(100);
		user.setId(4000);
		user.setLoginname("qwert123");
		user.setPassword("123456");
		user.setDept(dept);
		user.setSex("女");
		user.setBirthday(new Date());
		user.setEmail("11");
		user.setRealname("二狗子");
		user.setCreator(1000);
		user.setPic("111.jpg");
		user.setIsenabled(-1);
		us.insert(user);
	}
	
	
	public void testDelet(){
		us.delete(3088);
		
	}
	
	public void testQueryByPage(){
		QueryUser query = new QueryUser();
		query.setIsenabled(-1);
		System.out.println(us.queryPageCounts(query));
		for(TUser user:us.queryByPage(query, 1)){
			System.out.println(user.getLoginname());
		}
	}

	public void testId(){
		TUser user = us.queryById(3086);
		System.out.println(user.getLoginname());
	}
	@Test
	public void testDept(){
		List<TDept> list = ds.queryByPid(2);
		for (TDept d : list) {
			System.out.println(d.getName());
		}
	}
}
