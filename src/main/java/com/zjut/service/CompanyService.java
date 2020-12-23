package com.zjut.service;

import com.zjut.bean.Company;
import com.zjut.dao.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶琛
 * @create 2020-11-12-15:43
 */
@Service
public class CompanyService {
	@Autowired
	CompanyMapper companyMapper;

	public List<Company> getCompanies() {
		return companyMapper.selectByExample(null);
	}
}
