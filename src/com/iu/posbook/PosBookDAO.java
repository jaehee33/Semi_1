package com.iu.posbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

public class PosBookDAO {

	public int success(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update use set state=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "확인");
		st.setInt(2, num);
		int result=st.executeUpdate();
		
		sql="delete posbook where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public List<PosBookDTO> selectList(String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from posbook where store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, store);
		ResultSet rs=st.executeQuery();
		List<PosBookDTO> ar=new ArrayList<>();
		while (rs.next()) {
			PosBookDTO posBookDTO=new PosBookDTO();
			posBookDTO.setNum(rs.getInt("num"));
			posBookDTO.setId(rs.getString("id"));
			posBookDTO.setName(rs.getString("name"));
			posBookDTO.setPhone(rs.getString("phone"));
			posBookDTO.setBk_date(rs.getDate("bk_date"));
			posBookDTO.setStore(rs.getString("store"));
			posBookDTO.setStyle(rs.getString("style"));
			posBookDTO.setPrice(rs.getInt("price"));
			posBookDTO.setCoupon(rs.getString("coupon"));
			posBookDTO.setTime(rs.getString("time"));	
			posBookDTO.setState(rs.getString("state"));
			ar.add(posBookDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	
	
}
