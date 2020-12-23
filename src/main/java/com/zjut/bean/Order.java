package com.zjut.bean;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;
import java.util.Date;

/**
 * 订单：包括航班，用户等信息
 */
public class Order {
	private Integer ordId;

	private Integer uId;

	private User user;

	private Integer fId;

	private Flight flight;

	private String time;

	private Integer cId;

	private Company company;

	@Pattern(regexp = "^[1-9]\\d*$", message = "此项必须为正整数")
	private Integer money;

	public Order() {
	}

	public Order(Integer ordId, Integer uId, Integer fId, String time, Integer cId, Integer money) {
		this.ordId = ordId;
		this.uId = uId;
		this.fId = fId;
		this.time = time;
		this.cId = cId;
		this.money = money;
	}

	public Integer getOrdId() {
		return ordId;
	}

	public void setOrdId(Integer ordId) {
		this.ordId = ordId;
	}

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public Integer getfId() {
		return fId;
	}

	public void setfId(Integer fId) {
		this.fId = fId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Order{" +
				"ordId=" + ordId +
				", uId=" + uId +
				", user=" + user +
				", fId=" + fId +
				", flight=" + flight +
				", time='" + time + '\'' +
				", cId=" + cId +
				", company=" + company +
				", money=" + money +
				'}';
	}
}