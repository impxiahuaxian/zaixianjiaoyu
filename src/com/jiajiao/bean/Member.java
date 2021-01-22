package com.jiajiao.bean;

public class Member {
	private int memberId;// 编号
	private String name;// 姓名
	private String phone;// 手机号码-账号
	private String password;// 密码
	private int gender;// 性别
	private String wxNumber;// 微信号
	private int districtId;// 区域编码
	private String district;// 区域名称
	private String address;// 详细地址
	private String registTime;// 注册时间
	private int isUse;// 账号是否可用
	private int orderNum;
	private int appointNum;

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getAppointNum() {
		return appointNum;
	}

	public void setAppointNum(int appointNum) {
		this.appointNum = appointNum;
	}

	public int getIsUse() {
		return isUse;
	}

	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getWxNumber() {
		return wxNumber;
	}

	public void setWxNumber(String wxNumber) {
		this.wxNumber = wxNumber;
	}

	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegistTime() {
		return registTime;
	}

	public void setRegistTime(String registTime) {
		this.registTime = registTime;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	@Override
	public String toString() {
		return "Member [address=" + address + ", appointNum=" + appointNum
				+ ", district=" + district + ", districtId=" + districtId
				+ ", gender=" + gender + ", isUse=" + isUse + ", memberId="
				+ memberId + ", name=" + name + ", orderNum=" + orderNum
				+ ", password=" + password + ", phone=" + phone
				+ ", registTime=" + registTime + ", wxNumber=" + wxNumber + "]";
	}

}
