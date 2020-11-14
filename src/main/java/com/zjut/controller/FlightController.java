package com.zjut.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjut.bean.Flight;
import com.zjut.bean.FlightMiddle;
import com.zjut.bean.Msg;
import com.zjut.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 叶琛
 * @create 2020-11-10-15:47
 */
@Controller
public class FlightController {
	@Autowired
	FlightService flightService;

	//获取所有的航班号
	@ResponseBody
	@GetMapping("/flightsId")
	public Msg getFlightsId() {
		List<Flight> list = flightService.getFlightsId();
		return Msg.success().add("flights", list);
	}

	//删除指定航班
	@ResponseBody
	@DeleteMapping("/deleteFlights/{id}")
	public Msg deleteFlight(@PathVariable("id") String ids) {
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String str_id : str_ids) {
				del_ids.add(Integer.parseInt(str_id));
			}
			flightService.deleteBatch(del_ids);
		} else {
			Integer id = Integer.parseInt(ids);
			flightService.deleteById(id);
		}
		return Msg.success();
	}

	//更新航班
	@ResponseBody
	@PutMapping("/updateFlight/{flyId}")
	public Msg saveUpdate(FlightMiddle flightMiddle) {
		try {
			Integer id = flightMiddle.getFlyId();
			String start = flightMiddle.getOrigin();
			String end = flightMiddle.getDestination();
			String time = flightMiddle.getTime();
			Integer price = flightMiddle.getPrice();
			Flight flight = new Flight(id, start, end, null, time, price);
			flightService.saveUpdate(flight);
			return Msg.success();
		} catch (Exception e) {
			return Msg.fail().add("wrong_price_update", "此项必须为正整数");
		}

	}

	//根据Id获取航班信息
	@ResponseBody
	@GetMapping(value = "/flightsByPrimary/{id}")
	public Msg getFlightsById(@PathVariable("id") Integer id) {
		Flight flight = flightService.getFlightsById(id);
		return Msg.success().add("flight", flight);
	}

	//保存航班
	@ResponseBody
	@GetMapping("/saveFlights")
	public Msg saveFlight(@RequestParam(value = "start") String start,
	                      @RequestParam(value = "end") String end,
	                      @RequestParam(value = "time") String time,
	                      @RequestParam(value = "price") String price,
	                      @RequestParam(value = "comId") Integer comId) {
		try {
			Integer new_price = Integer.parseInt(price);
			Flight flight = new Flight(null, start, end, comId, time, new_price);
			flightService.saveFlights(flight);
			return Msg.success();
		} catch (Exception e) {
			return Msg.fail().add("wrong_price", "此项必须为正整数");
		}
	}

	@ResponseBody
	@GetMapping("/flights")
	public Msg getFlights(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		//pageSize=5
		PageHelper.startPage(pn, 5);
		List<Flight> flight = flightService.getFlights();
		//将日期格式设置成yyyy-MM-dd HH-mm-ss
		for (Flight f : flight) {
			String dateTime = f.getTime();
			f.setOnlyDate(dateTime.substring(0, 10));
		}
		//连续显示的页码=5
		PageInfo page = new PageInfo(flight, 5);
		return Msg.success().add("pageInfo", page);
	}

	//按条件查询航班
	@ResponseBody
	@GetMapping("/flightsByExample")
	public Msg getFlightsByExample(@RequestParam(value = "start", required = false) String start,
	                               @RequestParam(value = "end", required = false) String end,
	                               @RequestParam(value = "date", defaultValue = "", required = false) String date,
	                               @RequestParam(value = "pn", defaultValue = "1", required = false) Integer pn) {
		List<Flight> flight = flightService.getFlights();
		PageHelper.startPage(pn, 5);
		List<Flight> flightByExample = select_flights(flight, start, end, date);
		//连续显示的页码=5
		PageInfo page = new PageInfo(flightByExample, 5);
		return Msg.success().add("pageInfo", page);
	}

	//封装符合条件的航班信息
	public List<Flight> select_flights(List<Flight> flight, String start, String end, String date) {
		List<Flight> flightByExample = new ArrayList<Flight>();
		for (Flight f : flight) {
			String dateTime = f.getTime();
			f.setOnlyDate(dateTime.substring(0, 10));
			if (date.equals("")) {
				if (f.getOrigin().equals(start) && f.getDestination().equals(end)) {
					flightByExample.add(f);
				}
			} else {
				if (f.getOrigin().equals(start) && f.getDestination().equals(end) && f.getOnlyDate().equals(date)) {
					flightByExample.add(f);
				}
			}
		}
		return flightByExample;
	}
}
