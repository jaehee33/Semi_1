package com.iu.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class FilesDAO {
	//KindView selectView===================================================================================
	public ArrayList<FilesDTO> selectList(int num)throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from files where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		ArrayList<FilesDTO> ar=new ArrayList<>();
		while(rs.next()) {
			FilesDTO filesDTO=new FilesDTO();
			filesDTO.setFname(rs.getString("fname"));
			filesDTO.setOname(rs.getString("oname"));
			filesDTO.setNum(rs.getInt("num"));
			filesDTO.setStore(rs.getString("store"));
			ar.add(filesDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	//selectOne=============================================================================================
	public FilesDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select * from files where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		FilesDTO filesDTO=null;
		if(rs.next()) {
		filesDTO = new FilesDTO();
		filesDTO.setNum(num);
		filesDTO.setFname(rs.getString("fname"));
		filesDTO.setOname(rs.getString("oname"));
		filesDTO.setStore(rs.getString("store"));
		}
		DBConnector.disConnect(rs, st, con);
		return filesDTO;		
	}
	
	//insert===================================================================================================
		public int insert(FilesDTO filesDTO) throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="insert into files values(?,?,?,?)";
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1, filesDTO.getNum());
			st.setString(2, filesDTO.getOname());
			st.setString(3, filesDTO.getFname());
			st.setString(4, filesDTO.getStore());
			int result=st.executeUpdate();
			DBConnector.disConnect(st, con);
			return result;
		}
		//selectList================================================================================================
		public ArrayList<FilesDTO> selectList()throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="select * from files";
			PreparedStatement st=con.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			ArrayList<FilesDTO> ar=new ArrayList<>();
			while(rs.next()) {
				FilesDTO filesDTO=new FilesDTO();
				filesDTO.setFname(rs.getString("fname"));
				filesDTO.setOname(rs.getString("oname"));
				filesDTO.setNum(rs.getInt("num"));
				filesDTO.setStore(rs.getString("store"));
				ar.add(filesDTO);
			}
			DBConnector.disConnect(rs, st, con);
			return ar;
		}
		//Delete================================================================================================
		public int delete(int num) throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="delete files where num=?";
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1, num);
			int result=st.executeUpdate();
			DBConnector.disConnect(st, con);
			return result;
		}
		public int storedelete(String store) throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="delete files where store=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, store);
			int result=st.executeUpdate();
			DBConnector.disConnect(st, con);
			return result;
		}
}
