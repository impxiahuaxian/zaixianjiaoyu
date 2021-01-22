package com.jiajiao.bean;

//教员接单表
public class TakeOrders {
	private int toId;// 编号
	private int oId;// 家教需求订单编号
	private String orderCode;// 家教需求订单编号
	private String contactName;// 家长姓名
	private int contactGender;// 家长性别
	private String courseName;// 授课科目
	private int areaId;// 区域
	private String address;// 地址
	private int teacherId;// 教员编号
	private String teacherName;// 教员姓名
	private int memberId;// 学员编号
	private String takeTime;// 接单时间
	private int courcePrice;// 支付金额
	private int takeStatus;// 接单状态
	private String remark;// 备注

	public String getTeacherName() {
		return teacherName;
	}

	public int getContactGender() {
		return contactGender;
	}

	public void setContactGender(int contactGender) {
		this.contactGender = contactGender;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public int getToId() {
		return toId;
	}

	public void setToId(int toId) {
		this.toId = toId;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
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

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getTakeTime() {
		return takeTime;
	}

	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}

	public int getCourcePrice() {
		return courcePrice;
	}

	public void setCourcePrice(int courcePrice) {
		this.courcePrice = courcePrice;
	}

	public int getTakeStatus() {
		return takeStatus;
	}

	public void setTakeStatus(int takeStatus) {
		this.takeStatus = takeStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Override
	public String toString() {
		return "TakeOrders [address=" + address + ", areaId=" + areaId
				+ ", contactGender=" + contactGender + ", contactName="
				+ contactName + ", courcePrice=" + courcePrice
				+ ", courseName=" + courseName + ", memberId=" + memberId
				+ ", oId=" + oId + ", orderCode=" + orderCode + ", remark="
				+ remark + ", takeStatus=" + takeStatus + ", takeTime="
				+ takeTime + ", teacherId=" + teacherId + ", teacherName="
				+ teacherName + ", toId=" + toId + "]";
	}

}
