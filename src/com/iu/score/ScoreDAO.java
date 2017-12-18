package com.iu.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.board.BoardDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class ScoreDAO {
	
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select board_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		
		return num;
	}
	
	
	public int insert(ScoreDTO scoreDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="insert into score values(?,?,?,?,sysdate,0,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, scoreDTO.getNum());
		st.setString(2, scoreDTO.getId());
		st.setString(3, scoreDTO.getTitle());
		st.setString(4, scoreDTO.getContents());
		st.setInt(5, scoreDTO.getPoint());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	public ScoreDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from score where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		ScoreDTO scoreDTO = null;
		if(rs.next()) {
			scoreDTO = new ScoreDTO();
			scoreDTO.setNum(rs.getInt("num"));
			scoreDTO.setId(rs.getString("id"));
			scoreDTO.setTitle(rs.getString("title"));
			scoreDTO.setContents(rs.getString("contents"));
			scoreDTO.setReg_date(rs.getDate("reg_date"));
			scoreDTO.setHit(rs.getInt("hit"));
			scoreDTO.setPoint(rs.getInt("point"));
			
			}
		
		DBConnector.disConnect(rs, st, con);
		
		return scoreDTO;
	}
	
	
	public ArrayList<ScoreDTO> selectList(MakeRow makeRow) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from score where "+makeRow.getKind()+" like ? order by ref desc, step asc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		ArrayList<ScoreDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			ScoreDTO scoreDTO = new ScoreDTO();
			scoreDTO.setNum(rs.getInt("num"));
			scoreDTO.setId(rs.getString("Id"));
			scoreDTO.setTitle(rs.getString("title"));
			scoreDTO.setContents(rs.getString("contents"));
			scoreDTO.setReg_date(rs.getDate("reg_date"));
			scoreDTO.setHit(rs.getInt("hit"));
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
	
	
	public int update(ScoreDTO scoreDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update score set title=?, contents=? point=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, scoreDTO.getTitle());
		st.setString(2, scoreDTO.getContents());
		st.setInt(3, scoreDTO.getPoint());
		st.setInt(4, scoreDTO.getNum());
		
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
	
	
	public int getTotalPoint(ScoreDTO scoreDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="select avg(point) from score ";
		PreparedStatement st = con.prepareStatement(sql);
		
		int result= st.executeUpdate();
		DBConnector.disConnect(st, con);	
		
		return result;
	}

	
}