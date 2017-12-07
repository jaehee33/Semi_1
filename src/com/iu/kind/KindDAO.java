package com.iu.kind;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class KindDAO {

	
	public int insert(KindDTO kindDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into kind values (?,?,?,kind_seq.nextval)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getKind());
		st.setInt(2, kindDTO.getPrice());
		st.setString(3, kindDTO.getStore());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public ArrayList<KindDTO> selectList(MakeRow makeRow,String store) throws Exception{
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
	
	
	public int delete(StoreDTO storeDTO,int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete kind where num=? and store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		st.setString(2, storeDTO.getStore());
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
}
