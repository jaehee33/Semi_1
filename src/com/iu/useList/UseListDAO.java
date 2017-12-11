package com.iu.useList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.book.BookDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class UseListDAO {
	
	public int getTotalCount(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num),0) from useList where "+makeRow.getKind()+" like? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}
	
	//나의예약 보기
		public UseListDTO selectOne(int num) throws Exception{
			Connection con = DBConnector.getConnect();
			UseListDTO useListDTO = null;
			String sql="select * from useList where num=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				useListDTO = new UseListDTO();
				useListDTO.setNum(rs.getInt("num"));
				useListDTO.setId(rs.getString("id"));
				useListDTO.setName(rs.getString("name"));
				useListDTO.setPhone(rs.getString("phone"));
				useListDTO.setBk_date(rs.getDate("bk_date"));
				useListDTO.setStore(rs.getString("store"));
				useListDTO.setStyle(rs.getString("style"));
				useListDTO.setPrice(rs.getInt("price"));
				useListDTO.setCoupon(rs.getString("coupon"));
				useListDTO.setTime(rs.getString("time"));	
				useListDTO.setState(rs.getString("state"));
			}
			
			DBConnector.disConnect(rs, st, con);
			return useListDTO;
		}
	
	public ArrayList<UseListDTO> selectList2(BookDTO bookDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		ArrayList<UseListDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,B.* from (select * from useList where id=?) B)"
				+ "order by bk_date,time asc";
		PreparedStatement st = con.prepareStatement(sql);	
		st.setString(1, bookDTO.getId());
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			UseListDTO useListDTO = new UseListDTO();
			useListDTO=new UseListDTO();
			useListDTO.setNum(rs.getInt("num"));
			useListDTO.setId(rs.getString("id"));
			useListDTO.setName(rs.getString("name"));
			useListDTO.setPhone(rs.getString("phone"));
			useListDTO.setBk_date(rs.getDate("bk_date"));
			useListDTO.setStore(rs.getString("store"));
			useListDTO.setStyle(rs.getString("style"));
			useListDTO.setPrice(rs.getInt("price"));
			useListDTO.setCoupon(rs.getString("coupon"));
			useListDTO.setTime(rs.getString("time"));	
			useListDTO.setState(rs.getString("state"));
			
			list.add(useListDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}

}
