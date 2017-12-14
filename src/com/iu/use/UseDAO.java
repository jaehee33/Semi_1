package com.iu.use;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class UseDAO {
	//글 갯수 가져오기
	public int getTotalCount(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql = "select nvl(count(num),0) from use where "+makeRow.getKind()+" like? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}

	//예약하기
	public int insert(UseDTO useDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into use values(use_seq,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, useDTO.getId());
		st.setString(2, useDTO.getName());
		st.setString(3, useDTO.getPhone());
		st.setDate(4, useDTO.getBk_date());
		st.setString(5, useDTO.getStore());
		st.setString(6, useDTO.getStyle());
		st.setInt(7, useDTO.getPrice());
		st.setString(8, useDTO.getCoupon());
		st.setString(9, useDTO.getTime());
		st.setString(10, "예약");
		st.executeUpdate();
		
		sql="insert into posbook values(use_seq,?,?,?,?,?,?,?,?,?,?)";
		st = con.prepareStatement(sql);
		st.setString(1, useDTO.getId());
		st.setString(2, useDTO.getName());
		st.setString(3, useDTO.getPhone());
		st.setDate(4, useDTO.getBk_date());
		st.setString(5, useDTO.getStore());
		st.setString(6, useDTO.getStyle());
		st.setInt(7, useDTO.getPrice());
		st.setString(8, useDTO.getCoupon());
		st.setString(9, useDTO.getTime());
		st.setString(10, "예약");

		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//예약 취소
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="update use set state=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "취소");
		st.setInt(2, num);
		st.executeUpdate();
		
		sql="delete posbook where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);

		return result;
	}
	
	//이용기록 자세히보기
	public UseDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		UseDTO useDTO = null;
		String sql="select * from use where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			useDTO=new UseDTO();
			useDTO.setNum(rs.getInt("num"));
			useDTO.setId(rs.getString("id"));
			useDTO.setName(rs.getString("name"));
			useDTO.setPhone(rs.getString("phone"));
			useDTO.setBk_date(rs.getDate("bk_date"));
			useDTO.setStore(rs.getString("store"));
			useDTO.setStyle(rs.getString("style"));
			useDTO.setPrice(rs.getInt("price"));
			useDTO.setCoupon(rs.getString("coupon"));
			useDTO.setTime(rs.getString("time"));	
			useDTO.setState(rs.getString("state"));
		}
		
		DBConnector.disConnect(rs, st, con);
		return useDTO;
	}
	
	//이용기록 목록 가져오기
	public List<UseDTO> selectList(UseMakeRow useMakeRow, String id) throws Exception{
		Connection con = DBConnector.getConnect();
		List<UseDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,U.* from "
				+ "(select * from use where id=? and "+useMakeRow.getKind()+" like ? order by bk_date,time asc) U)"
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);	
		st.setString(1, id);
		st.setString(2, "%"+useMakeRow.getSearch()+"%");
		st.setInt(3, useMakeRow.getStartRow());
		st.setInt(4, useMakeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			UseDTO useDTO = new UseDTO();
			useDTO.setNum(rs.getInt("num"));
			useDTO.setId(rs.getString("id"));
			useDTO.setName(rs.getString("name"));
			useDTO.setPhone(rs.getString("phone"));
			useDTO.setBk_date(rs.getDate("bk_date"));
			useDTO.setStore(rs.getString("store"));
			useDTO.setStyle(rs.getString("style"));
			useDTO.setPrice(rs.getInt("price"));
			useDTO.setCoupon(rs.getString("coupon"));
			useDTO.setTime(rs.getString("time"));
			useDTO.setState(rs.getString("state"));
			
			list.add(useDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
	//손님 예약 가져오기
	public List<UseDTO> selectList(StoreDTO storeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		List<UseDTO> list = new ArrayList<>();
		
		String sql="select * from"
				+ "(select rownum R,U.* from (select * from use where bk_store='"+storeDTO.getStore()+"') U)"
				+ "order by bk_date,time asc;";
		PreparedStatement st = con.prepareStatement(sql);	
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			UseDTO useDTO = new UseDTO();
			useDTO.setNum(rs.getInt("num"));
			useDTO.setId(rs.getString("id"));
			useDTO.setName(rs.getString("name"));
			useDTO.setPhone(rs.getString("phone"));
			useDTO.setBk_date(rs.getDate("bk_date"));
			useDTO.setStore(rs.getString("store"));
			useDTO.setStyle(rs.getString("style"));
			useDTO.setPrice(rs.getInt("price"));
			useDTO.setCoupon(rs.getString("coupon"));
			useDTO.setTime(rs.getString("time"));	
			useDTO.setState(rs.getString("state"));
			
			list.add(useDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return list;
	}
	
}
