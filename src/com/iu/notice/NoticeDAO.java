package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class NoticeDAO {

	//insert
	public int insert(NoticeDTO noticeDTO)throws Exception {
		Connection con = DBConnector.getConnect();

		String sql="insert into notice values(?,?,?,?,sysdate,0)";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, noticeDTO.getNum());
		st.setString(2, noticeDTO.getId());
		st.setString(3, noticeDTO.getTitle());
		st.setString(4, noticeDTO.getContents());

		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
		
	}

	//selectOne
	public NoticeDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setId(rs.getString("Id"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}

		DBConnector.disConnect(rs, st, con);

		return noticeDTO;
	}

	//selectList
	public ArrayList<NoticeDTO> selectList(MakeRow makeRow) throws Exception{
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
		ArrayList<NoticeDTO> ar = new ArrayList<>();

		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setId(rs.getString("Id"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}

		DBConnector.disConnect(rs, st, con);

		return ar;
	}



	//delete
	public int delete(int num)throws Exception{
		Connection con = DBConnector.getConnect();

		String sql ="delete notice where num=?";

		PreparedStatement st = con.prepareStatement(sql);

		st.setInt(1, num);

		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}


	//update
	public int update(NoticeDTO noticeDTO)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, contents=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}



	//getTotalCount
	public int getTotalCount(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from notice where "+ makeRow.getKind()+ " like ?";
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
		String sql ="update notice set hit=hit+1 where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}


}
