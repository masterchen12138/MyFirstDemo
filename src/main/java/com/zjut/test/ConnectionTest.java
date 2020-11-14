package com.zjut.test;

import com.zjut.dao.LoginMapper;
import com.zjut.dao.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author 叶琛
 * @create 2020-11-09-13:01
 */

//测试连接是否成功
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ConnectionTest {
	@Autowired
	LoginMapper loginMapper;

	@Autowired
	UserMapper userMapper;

	@Test
	public void testCRUD() {
		System.out.println(123);
		System.out.println(loginMapper);
		//loginMapper.insertSelective(new Login("user3", "123456", null));
		//userMapper.insertSelective(new User(null, "lisi", "F", "lisi@163.com"));
	}
}
