package com.iu.coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.iu.util.DBConnector;


public class CouponDAO {
	
	
	public int insert(CouponDTO couponDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into coupon values(?,?,?)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, couponDTO.getId());
		pre.setString(2, couponDTO.getCoupon());
		pre.setInt(3, couponDTO.getDiscount());
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete coupon where id=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, id);
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}

}
