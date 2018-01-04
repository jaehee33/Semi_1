package com.iu.favor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

public class FavorDAO {
	
	public FavorDTO selectOne(String store_id) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select * from favor where store_id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, store_id);
		ResultSet rs = st.executeQuery();
		
		FavorDTO favorDTO=null;
		
		if(rs.next()) {
			favorDTO=new FavorDTO();
			favorDTO.setId(rs.getString("id"));
			favorDTO.setStore(rs.getString("store"));
			favorDTO.setStore_id(rs.getString("store_id"));
		}
		DBConnector.disConnect(rs, st, con);
		return favorDTO;
	}
	
	public List<FavorDTO> selectList() throws Exception {
		Connection con= DBConnector.getConnect();
		
		String sql="select * from favor";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		List<FavorDTO> list=new ArrayList<>();
		
		while(rs.next()) {
			FavorDTO favorDTO = new FavorDTO();
			favorDTO.setId(rs.getString("id"));
			favorDTO.setStore(rs.getString("store"));
			favorDTO.setStore_id(rs.getString("store_id"));
			
			list.add(favorDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;		
	}
	
	public int TotalCount() throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="select nvl(count(id),0) from favor";
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
		pre.setString(3, favorDTO.getStore_id());
		
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int delete(String store_id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete favor where store_id=?";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, store_id);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
}
