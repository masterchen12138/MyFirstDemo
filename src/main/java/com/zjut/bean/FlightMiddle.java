package com.zjut.bean;

/**
 * @author 叶琛
 * @create 2020-11-12-20:11
 */
public class FlightMiddle {
	private Integer flyId;

	private String origin;

	private String destination;

	private String cId;

	private String time;

	private String onlyDate;

	private String price;

	public FlightMiddle() {
	}

	public FlightMiddle(Integer flyId, String origin, String destination, String cId, String time, String onlyDate, String price) {
		this.flyId = flyId;
		this.origin = origin;
		this.destination = destination;
		this.cId = cId;
		this.time = time;
		this.onlyDate = onlyDate;
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
		this.origin = origin;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
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
		return Integer.parseInt(price);
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "FlightMiddle{" +
				"flyId=" + flyId +
				", origin='" + origin + '\'' +
				", destination='" + destination + '\'' +
				", cId='" + cId + '\'' +
				", time='" + time + '\'' +
				", onlyDate='" + onlyDate + '\'' +
				", price='" + price + '\'' +
				'}';
	}
}
