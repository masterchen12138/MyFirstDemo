package com.zjut.bean;

import java.util.Date;

public class Flight {
	private Integer flyId;

	private String origin;

	private String destination;

	private Company company;

	private Integer cId;

	private String time;

	private String onlyDate;

	private Integer price;

	public Flight() {
	}

	public Flight(Integer flyId, String origin, String destination, Integer cId, String time, Integer price) {
		this.flyId = flyId;
		this.origin = origin;
		this.destination = destination;
		this.cId = cId;
		this.time = time;
		this.price = price;
	}

	public Integer getFlyId() {
		return flyId;
	}

	public void setFlyId(Integer flyId) {
		this.flyId = flyId;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin == null ? null : origin.trim();
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination == null ? null : destination.trim();
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getOnlyDate() {
		return onlyDate;
	}

	public void setOnlyDate(String onlyDate) {
		this.onlyDate = onlyDate;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Flight{" +
				"flyId=" + flyId +
				", origin='" + origin + '\'' +
				", destination='" + destination + '\'' +
				", company=" + company +
				", cId=" + cId +
				", time='" + time + '\'' +
				", onlyDate='" + onlyDate + '\'' +
				", price=" + price +
				'}';
	}
}