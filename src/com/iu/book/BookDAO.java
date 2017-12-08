package com.iu.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.member.MemberDTO;
import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;

public class BookDAO {

	//예약하기
	public int insert(BookDTO bookDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into book values(book_seq,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, bookDTO.getId());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//예약 취소
	public int delete(BookDTO bookDTO) throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="insert into uselist values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bookDTO.getNum());
		st.setString(2, bookDTO.getId());
		st.setString(3, bookDTO.getName());
		st.setString(4, bookDTO.getPhone());
		st.setDate(5, bookDTO.getBk_date());
		st.setString(6, bookDTO.getStore());
		st.setString(7, bookDTO.getStyle());
		st.setInt(8, bookDTO.getPrice());
		st.setString(9, bookDTO.getCoupon());
		st.setString(10, bookDTO.getTime());
		st.setString(11, "취소");

		st.executeUpdate();
		
		sql="delete book where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, bookDTO.getNum());
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);

		return result;
	}
	
	//나의예약 보기
	public BookDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		BookDTO bookDTO = null;
		String sql="select * from book where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			bookDTO=new BookDTO();
			bookDTO.setNum(rs.getInt("num"));
			bookDTO.setId(rs.getString("id"));
			bookDTO.setName(rs.getString("name"));
			bookDTO.setPhone(rs.getString("phone"));
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setStore(rs.getString("store"));
			bookDTO.setStyle(rs.getString("style"));
			bookDTO.setPrice(rs.getInt("price"));
			bookDTO.setCoupon(rs.getString("coupon"));
			bookDTO.setTime(rs.getString("time"));	
			bookDTO.setState(rs.getString("state"));
		}
		
		DBConnector.disConnect(rs, st, con);
		return bookDTO;
	}
	
	//나의 예약 가져오기
	public ArrayList<BookDTO> selectList(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		ArrayList<BookDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,B.* from (select * from book where id=?) B)"
				+ "order by bk_date,time asc";
		PreparedStatement st = con.prepareStatement(sql);	
		st.setString(1, memberDTO.getId());
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			BookDTO bookDTO = new BookDTO();
			bookDTO=new BookDTO();
			bookDTO.setNum(rs.getInt("num"));
			bookDTO.setId(rs.getString("id"));
			bookDTO.setName(rs.getString("name"));
			bookDTO.setPhone(rs.getString("phone"));
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setStore(rs.getString("store"));
			bookDTO.setStyle(rs.getString("style"));
			bookDTO.setPrice(rs.getInt("price"));
			bookDTO.setCoupon(rs.getString("coupon"));
			bookDTO.setTime(rs.getString("time"));	
			bookDTO.setState(rs.getString("state"));
			
			list.add(bookDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
	//손님 예약 가져오기
	public ArrayList<BookDTO> selectList(StoreDTO storeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		ArrayList<BookDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,B.* from (select * from book where bk_store='"+storeDTO.getStore()+"') B)"
				+ "order by bk_date,time asc;";
		PreparedStatement st = con.prepareStatement(sql);	
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			BookDTO bookDTO = new BookDTO();
			bookDTO.setNum(rs.getInt("num"));
			bookDTO.setId(rs.getString("id"));
			bookDTO.setName(rs.getString("name"));
			bookDTO.setPhone(rs.getString("phone"));
			bookDTO.setBk_date(rs.getDate("bk_date"));
			bookDTO.setStore(rs.getString("store"));
			bookDTO.setStyle(rs.getString("style"));
			bookDTO.setPrice(rs.getInt("price"));
			bookDTO.setCoupon(rs.getString("coupon"));
			bookDTO.setTime(rs.getString("time"));	
			bookDTO.setState(rs.getString("state"));
			
			list.add(bookDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
}
