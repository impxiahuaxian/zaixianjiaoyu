package com.jiajiao.bean;

//友情链接
public class Link {
	private int lid;
	private String webName;// 网站名称
	private String webUrl;// 网站地址
	private String webDescribe;// 描述
	private String contactName;// 联系人
	private String webPhone;// 联系电话
	private int display;// 是否显示
	private int sort;// 排序
	private String pubTime;// 申请时间



	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getWebName() {
		return webName;
	}

	public void setWebName(String webName) {
		this.webName = webName;
	}

	public String getWebUrl() {
		return webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getPubTime() {
		return pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

	public String getWebDescribe() {
		return webDescribe;
	}

	public void setWebDescribe(String webDescribe) {
		this.webDescribe = webDescribe;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getWebPhone() {
		return webPhone;
	}

	public void setWebPhone(String webPhone) {
		this.webPhone = webPhone;
	}

	@Override
	public String toString() {
		return "Link [contactName=" + contactName + ", display=" + display
				+ ", lId=" + lid + ", pubTime=" + pubTime + ", sort=" + sort
				+ ", webDescribe=" + webDescribe + ", webName=" + webName
				+ ", webPhone=" + webPhone + ", webUrl=" + webUrl + "]";
	}



}
