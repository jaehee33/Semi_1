package com.iu.kind;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;
import com.sun.org.apache.regexp.internal.recompile;

public class KindDAO {
	
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
	
		DBConnector.disConnect(rs, st, con);
		return kindDTO;
	}
	
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
		String sql="insert into kind values (?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getKind());
		st.setInt(2, kindDTO.getPrice());
		st.setString(3, kindDTO.getStore());
		st.setInt(4, kindDTO.getNum());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
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
		String sql="update kind set kind=?,price=? where store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getKind());
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
			ar.add(kindDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
