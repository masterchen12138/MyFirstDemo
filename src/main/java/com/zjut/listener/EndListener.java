package com.zjut.listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * @author 叶琛
 * @create 2020-11-09-18:28
 */
public class EndListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		System.out.println("服务器成功启动");
	}

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		Enumeration<Driver> drivers = DriverManager.getDrivers();
		Driver driver = null;
		while (drivers.hasMoreElements()) {
			try {
				driver = drivers.nextElement();
				DriverManager.deregisterDriver(driver);
			} catch (SQLException ex) {
			}
		}
		AbandonedConnectionCleanupThread.checkedShutdown();
	}
}
