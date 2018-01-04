package com.iu.style;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;

public class StyleDAO {

	public StyleDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select * from style where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		StyleDTO styleDTO=null;
		
		if(rs.next()) {
			styleDTO=new StyleDTO();
			styleDTO.setId(rs.getString("id"));
			styleDTO.setNum(rs.getInt("num"));
			styleDTO.setPrice(rs.getInt("price"));
			styleDTO.setStore(rs.getString("store"));
			styleDTO.setStyle(rs.getString("style"));
			styleDTO.setStore_id(rs.getString("store_id"));
		}
		DBConnector.disConnect(rs, st, con);
		return styleDTO;
	}
	
	public List<StyleDTO> selectList() throws Exception {
		Connection con= DBConnector.getConnect();
		
		String sql="select * from style";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		List<StyleDTO> list=new ArrayList<>();
		
		while(rs.next()) {
			StyleDTO styleDTO = new StyleDTO();
			styleDTO.setId(rs.getString("id"));
			styleDTO.setNum(rs.getInt("num"));
			styleDTO.setPrice(rs.getInt("price"));
			styleDTO.setStore(rs.getString("store"));
			styleDTO.setStyle(rs.getString("style"));
			styleDTO.setStore_id(rs.getString("store_id"));
			
			list.add(styleDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;		
	}
	
	public int TotalCount() throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="select nvl(count(num),0) from style";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		int count=0;
		if(rs.next()) {
			count=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		return count;
	}

	public int insert(StyleDTO styleDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into style values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, styleDTO.getId());
		st.setString(2, styleDTO.getStyle());
		st.setInt(3, styleDTO.getNum());
		st.setInt(4, styleDTO.getPrice());
		st.setString(5, styleDTO.getStore());
		st.setString(6, styleDTO.getStore_id());
		int result=st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}

	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete style where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result=st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}
}
