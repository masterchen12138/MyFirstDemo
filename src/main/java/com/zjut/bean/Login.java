package com.zjut.bean;

/**
 * 登录系统：包括管理员和非管理员
 */
public class Login {
	private String username;

	private String password;

	private String admin;

	public Login() {
	}

	public Login(String username, String password, String admin) {
		this.username = username;
		this.password = password;
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Login{" +
				"username='" + username + '\'' +
				", password='" + password + '\'' +
				", admin='" + admin + '\'' +
				'}';
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin == null ? null : admin.trim();
	}
}