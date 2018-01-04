package com.iu.coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.member.MemberDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;


public class CouponDAO {
	
	
	public int insert(CouponDTO couponDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into coupon values(?,?,?,coupon_seq.nextval)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, couponDTO.getId());
		pre.setString(2, couponDTO.getCoupon());
		pre.setInt(3, couponDTO.getDiscount());
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete coupon where num=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setInt(1, num);
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public List<CouponDTO> selectList(String id) throws Exception {
		List<CouponDTO> ar = new ArrayList<CouponDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from coupon where id=?";
		PreparedStatement pre= con.prepareStatement(sql);
		pre.setString(1, id);
		ResultSet rs = pre.executeQuery();
		while(rs.next()) {
			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setId(rs.getString("id"));
			couponDTO.setCoupon(rs.getString("coupon"));
			couponDTO.setDiscount(rs.getInt("discount"));
			couponDTO.setNum(rs.getInt("num"));
			ar.add(couponDTO);
		}
		
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}
	


}
