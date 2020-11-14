package com.zjut.service;

import com.zjut.bean.*;
import com.zjut.dao.OrderMapper;
import com.zjut.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶琛
 * @create 2020-11-11-18:39
 */
@Service
public class OrderService {
	@Autowired
	UserMapper userMapper;
	@Autowired
	OrderMapper orderMapper;

	public void saveUser(User user) {
		userMapper.insertSelective(user);
	}

	//根据输入的idCard查找id并返回
	public Integer getUserId(String idCard) {
		Integer userId = null;
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andIdCardEqualTo(idCard);
		List<User> users = userMapper.selectByExample(example);
		for (User user : users) {
			userId = user.getUserId();
		}
		return userId;
	}

	public Msg saveOrder(Integer userId, int flyId1, String time, int com1, int money1) {
		if (userId != null) {
			System.out.println("成功插入一条订单");
			orderMapper.insertSelective(new Order(null,userId,flyId1,time,com1,money1));
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}

	public List<Order> getOrders() {
		return orderMapper.selectByExampleWithOthers(null);
	}

	public User getUserIdByIdCard(String idCard) {
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andIdCardEqualTo(idCard);
		return userMapper.selectByExample(example).get(0);
	}

	public List<Order> getOrdersByUserId(Integer userId) {
		OrderExample example=new OrderExample();
		OrderExample.Criteria criteria=example.createCriteria();
		criteria.andUIdEqualTo(userId);
		return orderMapper.selectByExampleWithOthers(example);
	}

	public Order getOrderByPrimary(Integer ordId) {
		return orderMapper.selectByPrimaryKeyWithOthers(ordId);
	}

	public void deleteBatch(List<Integer> del_ids) {
		OrderExample example=new OrderExample();
		OrderExample.Criteria criteria=example.createCriteria();
		criteria.andOrdIdIn(del_ids);
		orderMapper.deleteByExample(example);
	}

	public void deleteById(Integer id) {
		orderMapper.deleteByPrimaryKey(id);
	}

	public long checkUserExist(User user) {
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andIdCardEqualTo(user.getIdCard());
		return userMapper.countByExample(example);
	}

	public void updateOrder(Order order) {
		orderMapper.updateByPrimaryKeySelective(order);
	}
}
