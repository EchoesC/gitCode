package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class LoginController {

	@Autowired
	UserService us;
	
	@RequestMapping("/login.do")
	public String chkLogin(QueryUser user,String yanz,String online, ModelMap map,HttpSession session) {
		try {
			TUser tuser = us.chkLogin(user);
			List<TPermission> permission = tuser.getMenu();
			
			//获取图片中验证码
			String code = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (!yanz.equals(code)) {
				map.addAttribute("err","验证码错误，请重新输入");
				return "login";
			}
			map.addAttribute("user",tuser);
			session.setAttribute("CUSER", tuser);
			map.addAttribute("permission", permission);
			return "index";

		} catch (AppException e) {
			map.addAttribute("err",e.getErrMsg());
			return "login";
		}

	}
	@RequestMapping("/tologin.do")
	public String toLogin(){
		return "login";
	}
}
