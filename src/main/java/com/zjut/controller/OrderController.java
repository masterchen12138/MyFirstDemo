package com.zjut.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjut.bean.Msg;
import com.zjut.bean.Order;
import com.zjut.bean.User;
import com.zjut.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 叶琛
 * @create 2020-11-11-18:37
 */
@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	User newUser;

	//删除订单
	@ResponseBody
	@DeleteMapping("/deleteOrders/{ordIds}")
	public Msg deleteOrders(@PathVariable("ordIds") String ordIds) {
		if (ordIds.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ordIds.split("-");
			for (String str_id : str_ids) {
				del_ids.add(Integer.parseInt(str_id));
			}
			orderService.deleteBatch(del_ids);
		} else {
			Integer id = Integer.parseInt(ordIds);
			orderService.deleteById(id);
		}
		return Msg.success();
	}

	//更新订单
	@ResponseBody
	@PutMapping("/updateOrder/{ordId}")
	public Msg updateOrder(Order order) {
		orderService.updateOrder(order);
		return Msg.success();
	}

	//根据ordId查询订单
	@ResponseBody
	@GetMapping("/orderByPrimary/{ordId}")
	public Msg getOneOrderByExample(@PathVariable("ordId") Integer ordId) {
		Order order = orderService.getOrderByPrimary(ordId);
		return Msg.success().add("order", order);
	}

	//根据身份证号查询订单
	@ResponseBody
	@GetMapping("/ordersByExample/{id_card}")
	public Msg getOrdersByExample(@PathVariable("id_card") String idCard) {
		Integer userId = getUserIdByIdCard(idCard).getUserId();
		List<Order> orders = orderService.getOrdersByUserId(userId);
		return Msg.success().add("myOrders", orders);
	}

	//查询所有订单
	@ResponseBody
	@GetMapping("/orders")
	public Msg getOrders(@RequestParam("pn") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Order> orders = orderService.getOrders();
		PageInfo page = new PageInfo(orders, 5);
		return Msg.success().add("pageInfo_orders", page);
	}

	//保存用户信息
	@ResponseBody
	@PostMapping("/saveUser")
	public Msg saveUser(@Valid User user, BindingResult result) {
		newUser = user;
		long l = orderService.checkUserExist(user);
		Map<String, Object> map = new HashMap<>();
		if (result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println("错误字段名：" + error.getField());
				System.out.println("错误信息：" + error.getDefaultMessage());
				map.put(error.getField(), error.getDefaultMessage());
			}
			if (l != 0) {
				return Msg.fail().add("errorFields", map).add("userExist", "用户已存在");
			}
			return Msg.fail().add("errorFields", map);
		} else {
			if (l != 0) {
				return Msg.fail().add("userExist", "用户已存在");
			}
			orderService.saveUser(user);
			return Msg.success();
		}
	}

	//添加订单
	@ResponseBody
	@GetMapping("/addOrder")
	public Msg addOder(@RequestParam("flyId") String flyId,
	                   @RequestParam("time") String time,
	                   @RequestParam("com") String com,
	                   @RequestParam("money") String money) {
		String idCard = newUser.getIdCard();
		Integer userId = orderService.getUserId(idCard);
		int flyId1 = Integer.parseInt(flyId);
		int com1 = Integer.parseInt(com);
		int money1 = Integer.parseInt(money);
		return orderService.saveOrder(userId, flyId1, time, com1, money1);
	}

	//根据身份证号获取UserId
	public User getUserIdByIdCard(String idCard) {
		return orderService.getUserIdByIdCard(idCard);
	}
}
