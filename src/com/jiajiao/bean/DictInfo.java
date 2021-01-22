package com.jiajiao.bean;

public class DictInfo {
	private int dictId;
	private String code;// 类别编码
	private String content;// 内容
	private int linkDict;// 科目小类跟科目大类关联

	public int getDictId() {
		return dictId;
	}

	public void setDictId(int dictId) {
		this.dictId = dictId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLinkDict() {
		return linkDict;
	}

	public void setLinkDict(int linkDict) {
		this.linkDict = linkDict;
	}

	@Override
	public String toString() {
		return "DictInfo [code=" + code + ", content=" + content + ", dictId="
				+ dictId + ", linkDict=" + linkDict + "]";
	}

}
