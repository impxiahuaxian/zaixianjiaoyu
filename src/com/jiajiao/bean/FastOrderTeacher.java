package com.jiajiao.bean;

/**
 * 快速请家教信息
 */
public class FastOrderTeacher {
	private int fotId;
	private String name;
	private String phone;
	private int teachingCourse;
	private String teachingCourseName;
	private String wxNumber;
	private String orderPrice;
	private int teacherId;
	private String teacherName;
	private String remark;
	private int state;
	private String publicTime;
	private String ip;

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeachingCourseName() {
		return teachingCourseName;
	}

	public void setTeachingCourseName(String teachingCourseName) {
		this.teachingCourseName = teachingCourseName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getFotId() {
		return fotId;
	}

	public void setFotId(int fotId) {
		this.fotId = fotId;
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

	public int getTeachingCourse() {
		return teachingCourse;
	}

	public void setTeachingCourse(int teachingCourse) {
		this.teachingCourse = teachingCourse;
	}

	public String getWxNumber() {
		return wxNumber;
	}

	public void setWxNumber(String wxNumber) {
		this.wxNumber = wxNumber;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPublicTime() {
		return publicTime;
	}

	public void setPublicTime(String publicTime) {
		this.publicTime = publicTime;
	}

	@Override
	public String toString() {
		return "FastOrderTeacher [fotId=" + fotId + ", ip=" + ip + ", name="
				+ name + ", orderPrice=" + orderPrice + ", phone=" + phone
				+ ", publicTime=" + publicTime + ", remark=" + remark
				+ ", state=" + state + ", teacherId=" + teacherId
				+ ", teacherName=" + teacherName + ", teachingCourse="
				+ teachingCourse + ", teachingCourseName=" + teachingCourseName
				+ ", wxNumber=" + wxNumber + "]";
	}

}
