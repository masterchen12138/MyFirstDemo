package com.zjut.service;

import com.zjut.bean.Company;
import com.zjut.bean.Flight;
import com.zjut.bean.FlightExample;
import com.zjut.dao.CompanyMapper;
import com.zjut.dao.FlightMapper;
import com.zjut.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶琛
 * @create 2020-11-10-19:33
 */
@Service
public class FlightService {
	@Autowired
	FlightMapper flightMapper;
	@Autowired
	UserMapper userMapper;

	public List<Flight> getFlights() {
		return flightMapper.selectByExampleWithCom(null);
	}

	public void saveFlights(Flight flight) {
		flightMapper.insertSelective(flight);
	}

	public Flight getFlightsById(Integer id) {
		return flightMapper.selectByPrimaryKey(id);
	}

	public void saveUpdate(Flight flight) {
		flightMapper.updateByPrimaryKeySelective(flight);
	}


	public void deleteBatch(List<Integer> del_ids) {
		FlightExample example = new FlightExample();
		FlightExample.Criteria criteria = example.createCriteria();
		criteria.andFlyIdIn(del_ids);
		flightMapper.deleteByExample(example);
	}

	public void deleteById(Integer id) {
		flightMapper.deleteByPrimaryKey(id);
	}

	public List<Flight> getFlightsId() {
		return flightMapper.selectByExample(null);
	}
}
