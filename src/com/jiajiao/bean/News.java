package com.jiajiao.bean;

public class News {

	private int nId;
	private String title;
	private int degree;
	private String content;
	private String source;// 来源于
	private int viewNum;
	private int display;
	private String pubTime;
	private int sort;

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public String getPubTime() {
		return pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Override
	public String toString() {
		return "News [content=" + content + ", degree=" + degree + ", display="
				+ display + ", nId=" + nId + ", pubTime=" + pubTime + ", sort="
				+ sort + ", source=" + source + ", title=" + title
				+ ", viewNum=" + viewNum + "]";
	}

}
