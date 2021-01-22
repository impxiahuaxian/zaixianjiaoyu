package com.jiajiao.bean;

//家教订单需求
public class Orders {

	private int oId;
	private int publisher1;// 发布人1 如果发布人1是0的话，代表的是本平台管理员代发布（通过微信、电话联系）。
	private int publisher2;// 发布人2 为实际学员发布（后续进行家教订单评价时需要）
	private int teachingCourse;// 求教科目
	private int gradeId;// 年级科目小类
	private String courseName;// 求教科目名称
	private String contactName;// 联系人姓名
	private String contactPhone;// 联系人电话
	private int contactGender;// 联系人性别
	private String wxNumber;// 微信号
	private int studentGender;// 学员性别
	private int studentGradeId;// 学员年级编号
	private String studentGradeName;// 学员年级名称
	private String profile;// 学员概况
	private int areaId;// 授课区域编号
	private String area;// 授课区域
	private String address;//
	private String teachingTime;// 教授时间
	private int coursePrice;// 课酬
	private int teachingWay;// 教授方式
	private String teachingWayName;// 教授方式
	private int teacherGender;// 教员性别
	private int teacherType;// 教员类型
	private String teacherTypeName;// 教员类型
	private String requirements;// 对教员要求
	private int orderStatus;// 订单状态
	private String remark;// 备注--给平台管理员
	private String orderCode;// 订单编号
	private String lng;// 经度
	private String lat;// 纬度
	private String publicTime;// 发布时间

	private Integer teacherId;// 授课教师编号
	private String teacherName;// 授课教师姓名



	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getPublicTime() {
		return publicTime;
	}

	public String getTeachingWayName() {
		return teachingWayName;
	}

	public void setTeachingWayName(String teachingWayName) {
		this.teachingWayName = teachingWayName;
	}

	public void setPublicTime(String publicTime) {
		this.publicTime = publicTime;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
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

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public int getPublisher1() {
		return publisher1;
	}

	public void setPublisher1(int publisher1) {
		this.publisher1 = publisher1;
	}

	public int getPublisher2() {
		return publisher2;
	}

	public void setPublisher2(int publisher2) {
		this.publisher2 = publisher2;
	}

	public int getStudentGradeId() {
		return studentGradeId;
	}

	public void setStudentGradeId(int studentGradeId) {
		this.studentGradeId = studentGradeId;
	}

	public String getStudentGradeName() {
		return studentGradeName;
	}

	public void setStudentGradeName(String studentGradeName) {
		this.studentGradeName = studentGradeName;
	}

	public int getTeachingCourse() {
		return teachingCourse;
	}

	public void setTeachingCourse(int teachingCourse) {
		this.teachingCourse = teachingCourse;
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

	public int getContactGender() {
		return contactGender;
	}

	public void setContactGender(int contactGender) {
		this.contactGender = contactGender;
	}

	public String getWxNumber() {
		return wxNumber;
	}

	public void setWxNumber(String wxNumber) {
		this.wxNumber = wxNumber;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTeacherTypeName() {
		return teacherTypeName;
	}

	public void setTeacherTypeName(String teacherTypeName) {
		this.teacherTypeName = teacherTypeName;
	}

	public int getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(int studentGender) {
		this.studentGender = studentGender;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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

	public String getTeachingTime() {
		return teachingTime;
	}

	public void setTeachingTime(String teachingTime) {
		this.teachingTime = teachingTime;
	}

	public int getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}

	public int getTeachingWay() {
		return teachingWay;
	}

	public void setTeachingWay(int teachingWay) {
		this.teachingWay = teachingWay;
	}

	public int getTeacherGender() {
		return teacherGender;
	}

	public void setTeacherGender(int teacherGender) {
		this.teacherGender = teacherGender;
	}

	public int getTeacherType() {
		return teacherType;
	}

	public void setTeacherType(int teacherType) {
		this.teacherType = teacherType;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "Orders [address=" + address + ", area=" + area + ", areaId="
				+ areaId + ", contactGender=" + contactGender
				+ ", contactName=" + contactName + ", contactPhone="
				+ contactPhone + ", courseName=" + courseName
				+ ", coursePrice=" + coursePrice + ", gradeId=" + gradeId
				+ ", lat=" + lat + ", lng=" + lng + ", oId=" + oId
				+ ", orderCode=" + orderCode + ", orderStatus=" + orderStatus
				+ ", profile=" + profile + ", publicTime=" + publicTime
				+ ", publisher1=" + publisher1 + ", publisher2=" + publisher2
				+ ", remark=" + remark + ", requirements=" + requirements
				+ ", studentGender=" + studentGender + ", studentGradeId="
				+ studentGradeId + ", studentGradeName=" + studentGradeName
				+ ", teacherGender=" + teacherGender + ", teacherId="
				+ teacherId + ", teacherName=" + teacherName + ", teacherType="
				+ teacherType + ", teacherTypeName=" + teacherTypeName
				+ ", teachingCourse=" + teachingCourse + ", teachingTime="
				+ teachingTime + ", teachingWay=" + teachingWay
				+ ", teachingWayName=" + teachingWayName + ", wxNumber="
				+ wxNumber + "]";
	}

}
