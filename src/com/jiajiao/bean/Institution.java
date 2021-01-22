package com.jiajiao.bean;

public class Institution {

	private int iId;
	private String iName;
	private String kemudalei;
	private String course;
	private String contactName;
	private String contactPhone;
	private String teachingType;
	private String teachingPrice;
	private int isListen;
	private String qq;
	private String logo;
	private int areaId;
	private String address;
	private String lng;
	private String lat;
	private String photo;
	private String pubTime;
	private int sort;
	private String introduce;
	private int viewNum;
	private int display;

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}

	public String getKemudalei() {
		return kemudalei;
	}

	public void setKemudalei(String kemudalei) {
		this.kemudalei = kemudalei;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getTeachingType() {
		return teachingType;
	}

	public void setTeachingType(String teachingType) {
		this.teachingType = teachingType;
	}

	public String getTeachingPrice() {
		return teachingPrice;
	}

	public void setTeachingPrice(String teachingPrice) {
		this.teachingPrice = teachingPrice;
	}

	public int getIsListen() {
		return isListen;
	}

	public void setIsListen(int isListen) {
		this.isListen = isListen;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
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

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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

	@Override
	public String toString() {
		return "Institution [address=" + address + ", areaId=" + areaId
				+ ", contactName=" + contactName + ", contactPhone="
				+ contactPhone + ", course=" + course + ", display=" + display
				+ ", iId=" + iId + ", iName=" + iName + ", introduce="
				+ introduce + ", isListen=" + isListen + ", kemudalei="
				+ kemudalei + ", lat=" + lat + ", lng=" + lng + ", logo="
				+ logo + ", photo=" + photo + ", pubTime=" + pubTime + ", qq="
				+ qq + ", sort=" + sort + ", teachingPrice=" + teachingPrice
				+ ", teachingType=" + teachingType + ", viewNum=" + viewNum
				+ "]";
	}

}
