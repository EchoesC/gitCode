package com.zs.pms.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.xml.crypto.Data;

public class DateUtil {
	public static void showToday(){
		//获得日历类，通过日历类来获取实例
		Calendar cal = Calendar.getInstance();
		//年
		int y = cal.get(Calendar.YEAR);
		//月
		int m = cal.get(Calendar.MONTH)+1;
		//日
		int d = cal.get(Calendar.DATE);
		//时(12小时制)
		int hh = cal.get(Calendar.HOUR);
		//时（24小时制）
		int hh1 = cal.get(Calendar.HOUR_OF_DAY);
		//分
		int mm = cal.get(Calendar.MINUTE);
		//秒
		int ss = cal.get(Calendar.SECOND);
		System.out.println(y+"-"+m+"-"+d+" "+hh1+":"+mm+":"+ss);
	}
	public static String getDateToStr(Date time,String pattern){
		//创建一个日期格式化对象，构造函数
		DateFormat df = new SimpleDateFormat(pattern);
		//调用format方法可以把date数据转化成字符串数据
		return df.format(time);		
	}
	public static Date getStrToDate(String time,String pattern) throws ParseException{
		DateFormat df = new SimpleDateFormat(pattern);
		return df.parse(time);
	}
}

