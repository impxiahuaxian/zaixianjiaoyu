package com.jiajiao.bean;

//各年级科目价格表
public class GradePrice {
	private int pId;
	private int gradeId;
	private String gradeName;
	private int tminPrice;
	private int tmaxPrice;
	private int sminPrice;
	private int smaxPrice;
	private int gradeType;
	private String gradeTypeName;

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getTminPrice() {
		return tminPrice;
	}

	public void setTminPrice(int tminPrice) {
		this.tminPrice = tminPrice;
	}

	public int getTmaxPrice() {
		return tmaxPrice;
	}

	public void setTmaxPrice(int tmaxPrice) {
		this.tmaxPrice = tmaxPrice;
	}

	public int getSminPrice() {
		return sminPrice;
	}

	public void setSminPrice(int sminPrice) {
		this.sminPrice = sminPrice;
	}

	public int getSmaxPrice() {
		return smaxPrice;
	}

	public void setSmaxPrice(int smaxPrice) {
		this.smaxPrice = smaxPrice;
	}

	public int getGradeType() {
		return gradeType;
	}

	public void setGradeType(int gradeType) {
		this.gradeType = gradeType;
	}

	public String getGradeTypeName() {
		return gradeTypeName;
	}

	public void setGradeTypeName(String gradeTypeName) {
		this.gradeTypeName = gradeTypeName;
	}

	@Override
	public String toString() {
		return "GradePrice [gradeId=" + gradeId + ", gradeName=" + gradeName
				+ ", gradeType=" + gradeType + ", gradeTypeName="
				+ gradeTypeName + ", pId=" + pId + ", smaxPrice=" + smaxPrice
				+ ", sminPrice=" + sminPrice + ", tmaxPrice=" + tmaxPrice
				+ ", tminPrice=" + tminPrice + "]";
	}

}
