package com.zjut.dao;

import com.zjut.bean.Login;
import com.zjut.bean.LoginExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
	long countByExample(LoginExample example);

	int deleteByExample(LoginExample example);

	int deleteByPrimaryKey(String username);

	int insert(Login record);

	int insertSelective(Login record);

	List<Login> selectByExample(LoginExample example);

	Login selectByPrimaryKey(String username);

	int updateByExampleSelective(@Param("record") Login record, @Param("example") LoginExample example);

	int updateByExample(@Param("record") Login record, @Param("example") LoginExample example);

	int updateByPrimaryKeySelective(Login record);

	int updateByPrimaryKey(Login record);
}