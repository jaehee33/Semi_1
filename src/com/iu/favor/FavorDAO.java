package com.iu.favor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBConnector;

public class FavorDAO {
	//========================store========================
	public int getCount() throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select max(count) from favor";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		int count=rs.getInt(1);
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
	
	public int delete(FavorDTO favorDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete favor where id=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, favorDTO.getId());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
}
