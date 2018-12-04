package com.zs.pms.controller;

import java.security.interfaces.DSAKey;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class UserController {
	
	@Autowired
	UserService us;
	@Autowired
	DeptService ds;
	@RequestMapping("/userlist.do")
	public String toList(QueryUser query,String page,ModelMap map){
		if (page==null||page=="") {
			page="1";
		}
		map.addAttribute("users", us.queryByPage(query, Integer.parseInt(page)));
		map.addAttribute("PageCount", us.queryPageCounts(query));
		map.addAttribute("page", page);
		map.addAttribute("QUERY", query);
		return "user/list";
	}
	
	@RequestMapping("/useradd.do")
	public String toadd(ModelMap map){
		//获得一级部门列表
		List<TDept> list1 = ds.queryByPid(0);
		map.addAttribute("DLIST", list1);
		//获得默认一级部门下的二级部门
		List<TDept> list2 = ds.queryByPid(list1.get(0).getId());
		map.addAttribute("DLIST2", list2);
		return "user/add";
	}
	
	@RequestMapping("/getdept.do")
	@ResponseBody
	public List<TDept> getDept(int pid){
		List<TDept> list = ds.queryByPid(pid);
		return list;
	}
	
	@RequestMapping("/touseradd.do")
	public String add(TUser user,ModelMap map,HttpSession session){
		try {
			TUser cUser = (TUser) session.getAttribute("CUSER");
			user.setCreator(cUser.getId());
			user.setIsenabled(1);
			
			us.insert(user);
			return "redirect:userlist.do";
					
		} catch (AppException e) {
			// TODO: handle exception
			map.addAttribute("MSG", e.getErrMsg());
			return this.toadd(map);
		}
		
	}

}
