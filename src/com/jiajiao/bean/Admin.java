package com.jiajiao.bean;

public class Admin {
	private int aId;
	private String username;
	private String password;

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [aId=" + aId + ", password=" + password + ", username="
				+ username + "]";
	}

}
