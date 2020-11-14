package com.zjut.bean;

public class Company {
	private Integer comId;

	private String comName;

	public Integer getComId() {
		return comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName == null ? null : comName.trim();
	}

	@Override
	public String toString() {
		return "Company{" +
				"comId=" + comId +
				", comName='" + comName + '\'' +
				'}';
	}
}