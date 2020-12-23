package com.zjut.controller;

import com.zjut.bean.Login;
import com.zjut.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author 叶琛
 * @create 2020-11-09-14:39
 */
@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	@RequestMapping("/start")
	public String toLogin() {
		return "login";
	}

	@PostMapping(value = "/login")
	public String LoginCheck(@RequestParam(value = "username") String username,
	                         @RequestParam(value = "password") String password,
	                         HttpSession session) {
		session.setAttribute("fail_login_username", "");
		session.setAttribute("fail_login_password", "");
		Login login = new Login();
		if (loginService.getLogin(username) != null) {
			login = loginService.getLogin(username);
		} else {
			session.setAttribute("fail_login_username", "用户名或密码为空！");
			return "login";
		}
		if (login.getUsername() != null && login.getPassword().equals(password) && login.getAdmin().equals("Y")) {
			session.setAttribute("admin", "管理员");
			return "business";
		} else if (login.getUsername() != null && login.getPassword().equals(password) && login.getAdmin().equals("N")) {
			session.setAttribute("admin", "用户");
			return "business";
		} else if (login.getUsername() != null && login.getPassword() != password) {
			session.setAttribute("fail_login_password", "密码错误！");
			return "login";
		} else {
			session.setAttribute("fail_login_username", "用户不存在！");
			return "login";
		}
	}
}