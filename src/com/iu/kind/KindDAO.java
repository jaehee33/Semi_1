package com.iu.kind;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class KindDAO {	
	//============================KindView selectOne============================
	public KindDTO selectone(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select * from kind where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		rs.next();
		KindDTO kindDTO = new KindDTO();
		kindDTO.setNum(num);
		kindDTO.setKind(rs.getString("kind"));
		kindDTO.setPrice(rs.getInt("price"));
		kindDTO.setStore(rs.getString("store"));
		kindDTO.setStyle(rs.getString("style"));
		kindDTO.setGender(rs.getString("gender"));
	
		DBConnector.disConnect(rs, st, con);
		return kindDTO;
	}
	//============================KindView selectOne 끝============================	
	
	public int getNum() throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select kind_seq.nextval from dual";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		int result=0;
		if(rs.next()) {
			result=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public int insert(KindDTO kindDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into kind values (?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getStyle());
		st.setInt(2, kindDTO.getPrice());
		st.setString(3, kindDTO.getStore());
		st.setInt(4, kindDTO.getNum());
		st.setString(5, kindDTO.getKind());
		st.setString(6, kindDTO.getGender());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//store로 검색
	public ArrayList<KindDTO> selectList(String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from kind where store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, store);
		ResultSet rs=st.executeQuery();
		ArrayList<KindDTO> ar=new ArrayList<>();
		while(rs.next()) {
			KindDTO kindDTO=new KindDTO();
			kindDTO.setKind(rs.getString("kind"));
			kindDTO.setPrice(rs.getInt("price"));
			kindDTO.setStore(rs.getString("store"));
			kindDTO.setNum(rs.getInt("num"));
			kindDTO.setStyle(rs.getString("style"));
			kindDTO.setGender(rs.getString("gender"));
			ar.add(kindDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	//kind로 검색
	public ArrayList<KindDTO> selectKindList(String kind, String gender) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from kind where kind=? and gender=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kind);
		st.setString(2, gender);
		ResultSet rs=st.executeQuery();
		ArrayList<KindDTO> ar=new ArrayList<>();
		while(rs.next()) {
			KindDTO kindDTO=new KindDTO();
			kindDTO.setKind(rs.getString("kind"));
			kindDTO.setPrice(rs.getInt("price"));
			kindDTO.setStore(rs.getString("store"));
			kindDTO.setNum(rs.getInt("num"));
			kindDTO.setStyle(rs.getString("style"));
			kindDTO.setGender(rs.getString("gender"));
			ar.add(kindDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	public int delete(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete kind where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public int update(KindDTO kindDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update kind set style=?,price=? where store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getStyle());
		st.setInt(2, kindDTO.getPrice());
		st.setString(3, kindDTO.getStore());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public ArrayList<KindDTO> allselectList() throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from kind";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		ArrayList<KindDTO> ar=new ArrayList<>();
		while(rs.next()) {
			KindDTO kindDTO=new KindDTO();
			kindDTO.setKind(rs.getString("kind"));
			kindDTO.setPrice(rs.getInt("price"));
			kindDTO.setStore(rs.getString("store"));
			kindDTO.setNum(rs.getInt("num"));
			kindDTO.setStyle(rs.getString("style"));
			kindDTO.setGender(rs.getString("gender"));
			ar.add(kindDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
