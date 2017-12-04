package com.iu.useList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class UseListDAO {
	
	public int insert(UseListDTO useListDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into useList values(?,?,?,?,?)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, useListDTO.getId());
		pre.setDate(2, useListDTO.getUl_date());
		pre.setString(3, useListDTO.getUl_store());
		pre.setString(4, useListDTO.getUl_style());
		pre.setInt(5, useListDTO.getUl_price());
		pre.setString(6, useListDTO.getUl_coupon());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public List<UseListDTO> selectList(MakeRow makeRow) throws Exception {
		List<UseListDTO> ar = new ArrayList<UseListDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from (select rownum R, N.* from (select * from useList where "+makeRow.getKind()+" like ? order by num desc) N) where R between ? and ? ";
		PreparedStatement pre= con.prepareStatement(sql);
		pre.setString(1, "%"+makeRow.getSearch()+"%");
		pre.setInt(2, makeRow.getStartRow());
		pre.setInt(3, makeRow.getLastRow());
		ResultSet rs = pre.executeQuery();
		while(rs.next()) {
			UseListDTO useListDTO = new UseListDTO();
			useListDTO.setId(rs.getString("id"));
			useListDTO.setUl_date(rs.getDate("ul_date"));
			useListDTO.setUl_store(rs.getString("store"));
			useListDTO.setUl_style(rs.getString("style"));
			useListDTO.setUl_price(rs.getInt("ul_price"));
			useListDTO.setUl_coupon(rs.getString("ul_coupon"));
			ar.add(useListDTO);
		}
		
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}

}
