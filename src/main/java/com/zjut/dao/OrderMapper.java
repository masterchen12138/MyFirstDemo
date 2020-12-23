package com.zjut.dao;

import com.zjut.bean.Order;
import com.zjut.bean.OrderExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
	long countByExample(OrderExample example);

	int deleteByExample(OrderExample example);

	int deleteByPrimaryKey(Integer ordId);

	int insert(Order record);

	int insertSelective(Order record);

	List<Order> selectByExample(OrderExample example);

	Order selectByPrimaryKey(Integer ordId);

	List<Order> selectByExampleWithOthers(OrderExample example);

	Order selectByPrimaryKeyWithOthers(Integer ordId);

	int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

	int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

	int updateByPrimaryKeySelective(Order record);

	int updateByPrimaryKey(Order record);
}