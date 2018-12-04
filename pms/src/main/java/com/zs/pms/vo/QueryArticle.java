package com.zs.pms.vo;

import com.zs.pms.po.TChannel;

public class QueryArticle extends QueryPage {
	private String title;
	private String author;
	private TChannel channel;
	public TChannel getChannel() {
		return channel;
	}
	public void setChannel(TChannel channel) {
		this.channel = channel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	 
}
