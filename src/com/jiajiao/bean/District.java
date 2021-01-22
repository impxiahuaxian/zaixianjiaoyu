package com.jiajiao.bean;

public class District {
	private int districtId;
	private String district;

	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	@Override
	public String toString() {
		return "District [district=" + district + ", districtId=" + districtId
				+ "]";
	}

}
