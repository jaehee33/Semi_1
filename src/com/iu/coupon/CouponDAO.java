package com.iu.coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.member.MemberDTO;
import com.iu.useList.UseListDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;


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
	
	public int delete(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete coupon where id=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, memberDTO.getId());
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	public List<CouponDTO> selectList(MakeRow makeRow) throws Exception {
		List<CouponDTO> ar = new ArrayList<CouponDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from (select rownum R, N.* from (select * from coupon where "+makeRow.getKind()+" like ? order by num desc) N) where R between ? and ? ";
		PreparedStatement pre= con.prepareStatement(sql);
		pre.setString(1, "%"+makeRow.getSearch()+"%");
		pre.setInt(2, makeRow.getStartRow());
		pre.setInt(3, makeRow.getLastRow());
		ResultSet rs = pre.executeQuery();
		while(rs.next()) {
			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setId(rs.getString("id"));
			couponDTO.setCoupon(rs.getString("coupon"));
			couponDTO.setDiscount(rs.getInt("discount"));
			ar.add(couponDTO);
		}
		
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}

}
