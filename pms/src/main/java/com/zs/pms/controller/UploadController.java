package com.zs.pms.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	
	@RequestMapping("/upload/common.do")
	@ResponseBody
	public String uploadFile(MultipartFile file,HttpServletRequest req){
		
		//获取upload的路径
		String path = req.getRealPath("/upload");
		//利用uuid算法，生成32位随机码
		UUID uuid = UUID.randomUUID();
		//利用uuid的随机码拼接新的文件名，保证绝不重复
		String destfilename = uuid.toString()+file.getOriginalFilename();
		
		//创建新文件
		File destfile = new File(path+File.separator+destfilename);
		/*
		 * 将原始文件拷贝
		 */
		
		try {
			file.transferTo(destfile);
			return destfilename;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "ERROR";
		}
		
	}
}
