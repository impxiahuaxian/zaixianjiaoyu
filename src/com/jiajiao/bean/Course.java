package com.jiajiao.bean;

public class Course {

	private int courseId;
	private String courseName;// 科目名称
	private int keMuXiaoLei;// 科目小类
	private String keMuXiaoLeiName;
	private int keMuDaLei;// 科目大类
	private String keMuDaLeiName;
	private int isMobile;// 是否显示手机端首页

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getKeMuXiaoLei() {
		return keMuXiaoLei;
	}

	public void setKeMuXiaoLei(int keMuXiaoLei) {
		this.keMuXiaoLei = keMuXiaoLei;
	}

	public String getKeMuXiaoLeiName() {
		return keMuXiaoLeiName;
	}

	public void setKeMuXiaoLeiName(String keMuXiaoLeiName) {
		this.keMuXiaoLeiName = keMuXiaoLeiName;
	}

	public int getKeMuDaLei() {
		return keMuDaLei;
	}

	public void setKeMuDaLei(int keMuDaLei) {
		this.keMuDaLei = keMuDaLei;
	}

	public String getKeMuDaLeiName() {
		return keMuDaLeiName;
	}

	public void setKeMuDaLeiName(String keMuDaLeiName) {
		this.keMuDaLeiName = keMuDaLeiName;
	}

	public int getIsMobile() {
		return isMobile;
	}

	public void setIsMobile(int isMobile) {
		this.isMobile = isMobile;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName
				+ ", isMobile=" + isMobile + ", keMuDaLei=" + keMuDaLei
				+ ", keMuDaLeiName=" + keMuDaLeiName + ", keMuXiaoLei="
				+ keMuXiaoLei + ", keMuXiaoLeiName=" + keMuXiaoLeiName + "]";
	}

}
