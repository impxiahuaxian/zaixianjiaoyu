package com.jiajiao.bean;

public class MemberOrderTeacher {

	private int mosId;
	private int memberId;
	private int teacherId;
	private String teacherName;
	private int teachingCourse;
	private String teachingCourseName;
	private String name;
	private int gender;
	private int areaId;
	private String address;
	private String publicTime;
	private String price;
	private String remark;
	private String lat;
	private String lng;
	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getTeachingCourseName() {
		return teachingCourseName;
	}

	public void setTeachingCourseName(String teachingCourseName) {
		this.teachingCourseName = teachingCourseName;
	}

	public int getMosId() {
		return mosId;
	}

	public void setMosId(int mosId) {
		this.mosId = mosId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public int getTeachingCourse() {
		return teachingCourse;
	}

	public void setTeachingCourse(int teachingCourse) {
		this.teachingCourse = teachingCourse;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
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

	public String getPublicTime() {
		return publicTime;
	}

	public void setPublicTime(String publicTime) {
		this.publicTime = publicTime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "MemberOrderTeacher [address=" + address + ", areaId=" + areaId
				+ ", gender=" + gender + ", lat=" + lat + ", lng=" + lng
				+ ", memberId=" + memberId + ", mosId=" + mosId + ", name="
				+ name + ", price=" + price + ", publicTime=" + publicTime
				+ ", remark=" + remark + ", state=" + state + ", teacherId="
				+ teacherId + ", teacherName=" + teacherName
				+ ", teachingCourse=" + teachingCourse
				+ ", teachingCourseName=" + teachingCourseName + "]";
	}

}
