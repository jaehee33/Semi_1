package com.iu.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class ScoreDAO {
	
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select board_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		int num=0;
		if(rs.next()) {
			num = rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		
		return num;
	}
	
	
	public int insert(ScoreDTO scoreDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="insert into score values(?,?,?,sysdate,0,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, scoreDTO.getNum());
		st.setString(2, scoreDTO.getId());
		st.setString(3, scoreDTO.getContents());
		st.setDouble(4, scoreDTO.getPoint());
		st.setString(5, scoreDTO.getStore());
		
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
			scoreDTO.setContents(rs.getString("contents"));
			scoreDTO.setReg_date(rs.getDate("reg_date"));
			scoreDTO.setRec(rs.getInt("rec"));
			scoreDTO.setPoint(rs.getDouble("point"));
			scoreDTO.setStore(rs.getString("store"));
			}
		
		DBConnector.disConnect(rs, st, con);
		
		return scoreDTO;
	}
	
	
	public List<ScoreDTO> selectList(MakeRow makeRow,String store) throws Exception{
		Connection con = DBConnector.getConnect();
		List<ScoreDTO> ar = new ArrayList<ScoreDTO>();
		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from score where store=? order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, store);
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			ScoreDTO scoreDTO = new ScoreDTO();
			scoreDTO.setNum(rs.getInt("num"));
			scoreDTO.setId(rs.getString("Id"));
			scoreDTO.setContents(rs.getString("contents"));
			scoreDTO.setReg_date(rs.getDate("reg_date"));
			scoreDTO.setRec(rs.getInt("rec"));
			scoreDTO.setPoint(rs.getDouble("point"));
			scoreDTO.setStore(rs.getString("store"));
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
		String sql = "update score set contents=? point=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, scoreDTO.getContents());
		st.setDouble(2, scoreDTO.getPoint());
		st.setInt(3, scoreDTO.getNum());
		
		int result = st.executeUpdate();
		return result;
	}
	
	
	public int getTotalCount(String store) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from score where store=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, store);
		ResultSet rs = st.executeQuery();
		int totalCount=0;
		if(rs.next()) {
			totalCount=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);

		return totalCount;
	}

	
	
	public int getTotalPoint(ScoreDTO scoreDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="select avg(point) from score where store=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, scoreDTO.getStore());
		
		int result= st.executeUpdate();
		DBConnector.disConnect(st, con);	
		
		return result;
	}

	
}