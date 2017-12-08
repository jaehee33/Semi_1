package com.iu.useList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.board.BoardDTO;
import com.iu.notice.NoticeDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class UseListDAO {
	
	public int insert(UseListDTO useListDTO) throws Exception{
		
		return 0;
	}
	public int getTotalCount(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num),0) from useList where "+makeRow.getKind()+" like ? ";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = pre.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1); //nvl(count(num),0) 대신에 1로 쓰면 간단함
		DBConnector.disConnect(rs, pre, con);
		return totalCount;
	}
	
	//useList전체보기
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
			ar.add(useListDTO);
		}
		
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}

}
