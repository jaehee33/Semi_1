package com.iu.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.board.BoardDTO;
import com.iu.faq.FaqDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class ScoreDAO {

	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="insert into score values(?,?,?,?,sysdate,0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getId());
		st.setString(3, boardDTO.getTitle());
		st.setString(4, boardDTO.getContents());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	public BoardDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from score where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		BoardDTO boardDTO = null;
		if(rs.next()) {
			boardDTO = new BoardDTO();
			boardDTO.setNum(rs.getInt("num"));
			boardDTO.setId(rs.getString("id"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setContents(rs.getString("contents"));
			boardDTO.setReg_date(rs.getDate("reg_date"));
			boardDTO.setHit(rs.getInt("hit"));
			}
		
		DBConnector.disConnect(rs, st, con);
		
		return boardDTO;
	}
	
	public ArrayList<ScoreDTO> selectList(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from faq where "+makeRow.getKind()+" like ? order by ref desc, step asc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		ArrayList<ScoreDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			ScoreDTO scoreDTO = new ScoreDTO();

			scoreDTO.setPoint(rs.getInt("point"));
			ar.add(scoreDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete score where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		return result;
	}
	
	
	public int update(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update score set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getContents());
		st.setInt(3, boardDTO.getNum());
		int result = st.executeUpdate();
		return result;
	}

	
	public int getTotalCount(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from score where "+makeRow.getKind()+ " like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);

		return totalCount;
	}

	
	public int hit(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update score set hit=hit+1 where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}
	
	
	public int point(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into score value(?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result= st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
}