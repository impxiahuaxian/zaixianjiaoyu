package com.jiajiao.bean;

//评价表
public class Evaluation {
	private int eId;
	private int teacherId;//教员编号
	private int memberId;//学员用户编号
	private int toId;//接单编号
	private int oId;//订单编号
	private int score;//满意度
	private String evaluationContent;//评价内容
	private String evaluationTime;//评价时间
	
	public int getEId() {
		return eId;
	}
	public void setEId(int id) {
		eId = id;
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
	public int getToId() {
		return toId;
	}
	public void setToId(int toId) {
		this.toId = toId;
	}
	public int getOId() {
		return oId;
	}
	public void setOId(int id) {
		oId = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getEvaluationTime() {
		return evaluationTime;
	}
	public void setEvaluationTime(String evaluationTime) {
		this.evaluationTime = evaluationTime;
	}
	
	

}
