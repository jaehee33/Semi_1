package com.iu.favor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBConnector;

public class FavorDAO {
	
	public int TotalCount() throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="select max(count) from favor";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		int count=0;
		if(rs.next()) {
		count=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		return count;
	}
	
	public int insert(FavorDTO favorDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into favor values(?,?,?)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, favorDTO.getId());
		pre.setString(2, favorDTO.getStore());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int delete(String store) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete favor where store=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, store);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
}
