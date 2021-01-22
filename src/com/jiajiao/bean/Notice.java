package com.jiajiao.bean;

public class Notice {
	private int nId;
	private String title;
	private String content;
	private int type;
	private String source;
	private int viewNum;
	private String pubTime;
	private int sort;
	private int display;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
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

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Override
	public String toString() {
		return "Notice [content=" + content + ", display=" + display + ", nId="
				+ nId + ", pubTime=" + pubTime + ", sort=" + sort + ", source="
				+ source + ", title=" + title + ", type=" + type + ", viewNum="
				+ viewNum + "]";
	}

}
