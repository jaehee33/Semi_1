package com.iu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.ldap.InitialLdapContext;
import javax.sql.DataSource;

public class DBConnector {
	
	public static Connection getConnect() throws Exception {
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/hair01");
		Connection con = dataSource.getConnection();
		
		return con;
	}
	
	public static void disConnect(PreparedStatement pre, Connection con)throws Exception{
		pre.close();
		con.close();
	}
	
	public static void disConnect(ResultSet rs, PreparedStatement pre, Connection con) throws Exception {
		rs.close();
		DBConnector.disConnect(pre, con);
	}

}
