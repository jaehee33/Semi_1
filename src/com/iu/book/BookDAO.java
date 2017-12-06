package com.iu.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;

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
	
	public BookDTO selectOne(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		BookDTO bookDTO = null;
		String sql="select * from book where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			bookDTO=new BookDTO();
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setBk_store(rs.getString("bk_store"));
			bookDTO.setBk_style(rs.getString("bk_style"));
			bookDTO.setBk_price(rs.getInt("bk_price"));
			bookDTO.setBk_coupon(rs.getString("bk_coupon"));
			bookDTO.setBk_time(rs.getString("bk_time"));	
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return bookDTO;
	}
	
	public ArrayList<BookDTO> selectList(StoreDTO storeDTO) throws Exception{
		return null;
	}
	
	public int delete(String id) throws Exception{
		return 0;
	}
}
