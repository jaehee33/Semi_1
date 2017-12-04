package com.iu.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;
import com.iu.util.DBConnector;

public class StoreDAO extends MemberDAO{
	
	//회원가입
			public int join(MemberDTO memberDTO) throws Exception{
				Connection con = DBConnector.getConnect();
				String sql="insert into store values(?,?,?,?,?)";
				PreparedStatement pre = con.prepareStatement(sql);
				pre.setString(1, memberDTO.getId());
				pre.setString(2, ((StoreDTO)memberDTO).getStore());
				pre.setString(3, ((StoreDTO)memberDTO).getArea());
				pre.setString(4, ((StoreDTO)memberDTO).getStoretel());
				pre.setString(5, ((StoreDTO)memberDTO).getHoliday());
				int result=pre.executeUpdate();
				DBConnector.disConnect(pre, con);
				return result;
			}
			
			//로그인
			public MemberDTO login(MemberDTO memberDTO) throws Exception{
				Connection con = DBConnector.getConnect();
				String sql="select * from store where id=? and pw=?";
				PreparedStatement pre = con.prepareStatement(sql);
				pre.setString(1, memberDTO.getId());
				pre.setString(2, memberDTO.getPw());
				ResultSet rs=pre.executeQuery();
				StoreDTO storeDTO = null;
				if(rs.next()) {
					storeDTO = new StoreDTO();
					storeDTO.setStore(rs.getString("store"));
					storeDTO.setArea(rs.getString("area"));
					storeDTO.setStoretel(rs.getString("storetel"));
					storeDTO.setHoliday(rs.getString("holiday"));
				}
				DBConnector.disConnect(rs, pre, con);
				return memberDTO;
			}
			
			//수정
			public int update(MemberDTO memberDTO) throws Exception{
				
				return 0;
			}
			
			//탈퇴
			public int delete(String id) throws Exception{
				
				return 0;
			}

}
