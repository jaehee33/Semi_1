package com.iu.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.catalina.Store;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class StoreDAO extends MemberDAO{
	
	//회원가입
			public int insert(StoreDTO storeDTO) throws Exception{
				Connection con = DBConnector.getConnect();
				String sql="insert into store values(?,?,?,?,?)";
				PreparedStatement pre = con.prepareStatement(sql);
				pre.setString(1, storeDTO.getId());
				pre.setString(2, storeDTO.getStore());
				pre.setString(3, storeDTO.getArea());
				pre.setString(4, storeDTO.getStoretel());
				pre.setString(5, storeDTO.getHoliday());
				int result=pre.executeUpdate();
				DBConnector.disConnect(pre, con);
				return result;
			}
			
			//로그인
			public StoreDTO selectOne(MemberDTO memberDTO) throws Exception{
				Connection con=DBConnector.getConnect();
				String sql="select * from store where id=?";
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, memberDTO.getId());
				ResultSet rs=st.executeQuery();
				StoreDTO storeDTO=null;
				if(rs.next()) {
					storeDTO=new StoreDTO();
					storeDTO.setArea(rs.getString("area"));
					storeDTO.setHoliday(rs.getString("holiday"));
					storeDTO.setStoretel(rs.getString("storetel"));
					storeDTO.setStore(rs.getString("store"));
				}
				DBConnector.disConnect(rs, st, con);
				return storeDTO;
			}
			
			//수정
			public int update(MemberDTO memberDTO) throws Exception{
				Connection con=DBConnector.getConnect();
				return 0;
			}
			
			//탈퇴
			public int delete(String id) throws Exception{
				
				return 0;
			}
			
			public ArrayList<StoreDTO> selectList(MakeRow makeRow) throws Exception{
				return null;
			}

}
