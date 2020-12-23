package com.zjut.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class User {
	private Integer userId;

	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u4E00-\\u9FA5]{2,5})",
			message = "用户名必须为2-5位中文或者6-16位英文数字组合")
	private String userName;

	private String gender;

	@Email(message = "邮箱格式不正确")
	private String email;

	private String phone;

	private String idCard;

	public User() {
	}

	public User(Integer userId, String userName, String gender, String email, String phone, String idCard) {
		this.userId = userId;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.idCard = idCard;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard == null ? null : idCard.trim();
	}

	@Override
	public String toString() {
		return "User{" +
				"userId=" + userId +
				", userName='" + userName + '\'' +
				", gender='" + gender + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", idCard='" + idCard + '\'' +
				'}';
	}
}