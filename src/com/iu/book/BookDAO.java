package com.iu.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.member.MemberDTO;
import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class BookDAO {

	public int insert(BookDTO bookDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into book values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, bookDTO.getId());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public BookDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		BookDTO bookDTO = null;
		String sql="select * from book where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			bookDTO=new BookDTO();
			bookDTO.setId(rs.getString("id"));
			bookDTO.setName(rs.getString("name"));
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setBk_store(rs.getString("bk_store"));
			bookDTO.setBk_style(rs.getString("bk_style"));
			bookDTO.setBk_price(rs.getInt("bk_price"));
			bookDTO.setBk_coupon(rs.getString("bk_coupon"));
			bookDTO.setBk_time(rs.getString("bk_time"));	
			bookDTO.setBk_use(Boolean.parseBoolean(rs.getString("bk_use")));
			bookDTO.setPhone(rs.getString("phone"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return bookDTO;
	}
	
	public ArrayList<BookDTO> selectList(StoreDTO storeDTO,MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		ArrayList<BookDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,B.* from (select * from book where bk_store='"+storeDTO.getStore()+"') B)"
				+ "where R between ? and ? order by bk_date,bk_time asc;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, makeRow.getStartRow());
		st.setInt(2, makeRow.getLastRow());		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			BookDTO bookDTO = new BookDTO();
			bookDTO.setId(rs.getString("id"));
			bookDTO.setName(rs.getString("name"));
			bookDTO.setPhone(rs.getString("phone"));
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setBk_store(rs.getString("bk_store"));
			bookDTO.setBk_style(rs.getString("bk_style"));
			bookDTO.setBk_price(rs.getInt("bk_price"));
			bookDTO.setBk_coupon(rs.getString("bk_coupon"));
			bookDTO.setBk_time(rs.getString("bk_time"));	
			bookDTO.setBk_use(Boolean.parseBoolean(rs.getString("bk_use")));
			
			list.add(bookDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="delete book where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
}
