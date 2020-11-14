package com.zjut.service;

import com.zjut.bean.Login;
import com.zjut.bean.LoginExample;
import com.zjut.dao.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 叶琛
 * @create 2020-11-09-18:42
 */
@Service
public class LoginService {
	@Autowired
	LoginMapper loginMapper;

	public Login getLogin(String username) {
		return loginMapper.selectByPrimaryKey(username);
	}
}
