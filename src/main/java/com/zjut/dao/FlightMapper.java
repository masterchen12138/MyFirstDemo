package com.zjut.dao;

import com.zjut.bean.Flight;
import com.zjut.bean.FlightExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FlightMapper {
	long countByExample(FlightExample example);

	int deleteByExample(FlightExample example);

	int deleteByPrimaryKey(Integer flyId);

	int insert(Flight record);

	int insertSelective(Flight record);

	List<Flight> selectByExample(FlightExample example);

	Flight selectByPrimaryKey(Integer flyId);

	List<Flight> selectByExampleWithCom(FlightExample example);

	Flight selectByPrimaryKeyWithCom(Integer flyId);

	int updateByExampleSelective(@Param("record") Flight record, @Param("example") FlightExample example);

	int updateByExample(@Param("record") Flight record, @Param("example") FlightExample example);

	int updateByPrimaryKeySelective(Flight record);

	int updateByPrimaryKey(Flight record);
}