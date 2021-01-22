package com.jiajiao.bean;

/**
 * 试卷
 */
public class Paper {

	private int pId;
	private String title;
	private int degree;
	private int grade;
	private int course;
	private String content;
	private String downLink;
	private String downPwd;
	private int view;
	private int downNum;
	private int display;
	private String pubTime;
	private int sort;

	public int getpId() {
		return pId;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public void setpId(int pId) {
		this.pId = pId;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDownLink() {
		return downLink;
	}

	public int getCourse() {
		return course;
	}

	public void setCourse(int course) {
		this.course = course;
	}

	public void setDownLink(String downLink) {
		this.downLink = downLink;
	}

	public String getDownPwd() {
		return downPwd;
	}

	public void setDownPwd(String downPwd) {
		this.downPwd = downPwd;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getDownNum() {
		return downNum;
	}

	public void setDownNum(int downNum) {
		this.downNum = downNum;
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

	@Override
	public String toString() {
		return "Paper [content=" + content + ", course=" + course + ", degree="
				+ degree + ", display=" + display + ", downLink=" + downLink
				+ ", downNum=" + downNum + ", downPwd=" + downPwd + ", grade="
				+ grade + ", pId=" + pId + ", pubTime=" + pubTime + ", sort="
				+ sort + ", title=" + title + ", view=" + view + "]";
	}

}
