package com.iu.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.notice.NoticeDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class FaqDAO {

	
	//insert
	public int insert(FaqDTO faqDTO)throws Exception {
		Connection con = DBConnector.getConnect();

		String sql="insert into faq values(?,?,?,?,sysdate,0)";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, faqDTO.getNum());
		st.setString(2, faqDTO.getId());
		st.setString(3, faqDTO.getTitle());
		st.setString(4, faqDTO.getContents());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}


	//selectOne
	public FaqDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select * from faq where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		FaqDTO faqDTO = null;
		if(rs.next()) {
			faqDTO = new FaqDTO();
			faqDTO.setNum(rs.getInt("num"));
			faqDTO.setId(rs.getString("Id"));
			faqDTO.setTitle(rs.getString("title"));
			faqDTO.setContents(rs.getString("contents"));
			faqDTO.setReg_date(rs.getDate("reg_date"));
			faqDTO.setHit(rs.getInt("hit"));
		}

		DBConnector.disConnect(rs, st, con);

		return faqDTO;
	}


	//selectList
	public ArrayList<FaqDTO> selectList(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();

		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from notice where "+makeRow.getKind()+" like ? order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());

		ResultSet rs = st.executeQuery();
		ArrayList<FaqDTO> ar = new ArrayList<>();

		while(rs.next()) {
			FaqDTO faqDTO = new FaqDTO();
			faqDTO.setNum(rs.getInt("num"));
			faqDTO.setId(rs.getString("Id"));
			faqDTO.setTitle(rs.getString("title"));
			faqDTO.setContents(rs.getString("contents"));
			faqDTO.setReg_date(rs.getDate("reg_date"));
			faqDTO.setHit(rs.getInt("hit"));
			ar.add(faqDTO);
		}

		DBConnector.disConnect(rs, st, con);

		return ar;
	}

	
	//delete
	public int delete(int num)throws Exception{
		Connection con = DBConnector.getConnect();

		String sql ="delete faq where num=?";

		PreparedStatement st = con.prepareStatement(sql);

		st.setInt(1, num);

		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);

		return result;
	}


	//update
	public int update(FaqDTO faqDTO)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update faq set title=?, contents=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, faqDTO.getTitle());
		st.setString(2, faqDTO.getContents());
		st.setInt(3, faqDTO.getNum());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}


	//getTotalCount
	public int getTotalCount(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from faq where "+ makeRow.getKind()+ " like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);

		return totalCount;
	}

	
	//hitUpdate
	public int hitUpdate(int num)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update faq set hit=hit+1 where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}

	
}
