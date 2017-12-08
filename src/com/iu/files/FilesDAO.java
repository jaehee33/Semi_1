package com.iu.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class FilesDAO {
	//insert===================================================================================================
		public int insert(FilesDTO filesDTO) throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="insert into files values(?,?,?)";
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1, filesDTO.getNum());
			st.setString(2, filesDTO.getOname());
			st.setString(3, filesDTO.getFname());
			int result=st.executeUpdate();
			DBConnector.disConnect(st, con);
			return result;
		}
		//selectList================================================================================================
		public ArrayList<FilesDTO> selectList(int num)throws Exception{
			Connection con=DBConnector.getConnect();
			String sql="select * from files where num=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1, num);
			ResultSet rs=st.executeQuery();
			ArrayList<FilesDTO> ar=new ArrayList<>();
			while(rs.next()) {
				FilesDTO filesDTO=new FilesDTO();
				filesDTO.setFname(rs.getString("fname"));
				filesDTO.setOname(rs.getString("oname"));
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
}
