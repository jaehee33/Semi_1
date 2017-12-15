package com.iu.favor;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.iu.util.DBConnector;

public class FavorDAO {
	
	public int insert(FavorDTO favorDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into favor values(?,?,?)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, favorDTO.getId());
		pre.setString(2, favorDTO.getFav_style());
		pre.setInt(3, favorDTO.getCount());
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
