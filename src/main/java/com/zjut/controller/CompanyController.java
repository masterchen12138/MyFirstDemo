package com.zjut.controller;

import com.zjut.bean.Company;
import com.zjut.bean.Msg;
import com.zjut.dao.FlightMapper;
import com.zjut.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 叶琛
 * @create 2020-11-12-15:42
 */
@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;

	@ResponseBody
	@GetMapping("/companies")
	public Msg getCompanies() {
		List<Company> list = companyService.getCompanies();
		return Msg.success().add("companies", list);
	}

}
