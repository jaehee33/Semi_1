package com.iu.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.util.DBConnector;


public class StoreDAO{
	
	//회원가입
			
			public int getTotalCount(StoreMakeRow storeMakeRow) throws Exception {
				Connection con = DBConnector.getConnect();
				String sql ="select nvl(count(store), 0) from store where "+storeMakeRow.getKind()+" like ?";
				
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, "%"+storeMakeRow.getSearch()+"%");
			
				ResultSet rs = st.executeQuery();
				int totalCount=0;
				if(rs.next()) {
					totalCount=rs.getInt(1);
				}
				DBConnector.disConnect(rs, st, con);
			
				return totalCount;
			}
	
	
			public int insert(StoreDTO storeDTO) throws Exception{
				Connection con = DBConnector.getConnect();
				String sql="insert into store values(?,?,?,?,?)";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, storeDTO.getId());
				st.setString(2, storeDTO.getStore());
				st.setString(3, storeDTO.getArea());
				st.setString(4, storeDTO.getStoretel());
				st.setString(5, storeDTO.getHoliday());
				int result=st.executeUpdate();
				DBConnector.disConnect(st, con);
				return result;
			}
			
			//로그인
			public StoreDTO selectOne(String id) throws Exception{
				Connection con=DBConnector.getConnect();
				String sql="select * from store where id=?";
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, id);
				ResultSet rs=st.executeQuery();
				StoreDTO storeDTO=null;
				if(rs.next()) {
					storeDTO=new StoreDTO();
					storeDTO.setId(rs.getString("id"));
					storeDTO.setArea(rs.getString("area"));
					storeDTO.setHoliday(rs.getString("holiday"));
					storeDTO.setStoretel(rs.getString("storetel"));
					storeDTO.setStore(rs.getString("store"));
				}
				DBConnector.disConnect(rs, st, con);
				return storeDTO;
			}
			
			//수정
			public int update(StoreDTO storeDTO) throws Exception{
				Connection con=DBConnector.getConnect();
				String sql="update store set store=?,area=?,storetel=?,holiday=? where id=?";
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, storeDTO.getStore());
				st.setString(2, storeDTO.getArea());
				st.setString(3, storeDTO.getStoretel());
				st.setString(4, storeDTO.getHoliday());
				st.setString(5, storeDTO.getId());
				int result=st.executeUpdate();
				DBConnector.disConnect(st, con);
				return result;
			}
			
			//탈퇴
			public int delete(String id) throws Exception{
				Connection con=DBConnector.getConnect();
				String sql="delete store where id=?";
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, id);
				int result=st.executeUpdate();
				DBConnector.disConnect(st, con);
				return result;
			}
			
			public List<StoreDTO> selectList(StoreMakeRow storeMakeRow) throws Exception{
				Connection con = DBConnector.getConnect();
				List<StoreDTO> list = new ArrayList<>();
				
				String sql="select * from"
						+ "(select rownum R,S.* from "
						+ "(select * from store where "+storeMakeRow.getKind()+" like ? ) S)"
						+ "where R between ? and ?";
				PreparedStatement st = con.prepareStatement(sql);	
				st.setString(1, "%"+storeMakeRow.getSearch()+"%");
				st.setInt(2, storeMakeRow.getStartRow());
				st.setInt(3, storeMakeRow.getLastRow());
				ResultSet rs = st.executeQuery();
				
				while(rs.next()) {
					StoreDTO storeDTO=new StoreDTO();
					storeDTO.setId(rs.getString("id"));
					storeDTO.setArea(rs.getString("area"));
					storeDTO.setHoliday(rs.getString("holiday"));
					storeDTO.setStoretel(rs.getString("storetel"));
					storeDTO.setStore(rs.getString("store"));
					
					list.add(storeDTO);
				}
				DBConnector.disConnect(rs, st, con);
				return list;
			}

			
			//===============style에서 store로 갈때 style의 store로 store검색==============
			public StoreDTO selectOnd(String store) throws Exception{
				Connection con=DBConnector.getConnect();
				String sql="select * from store where store=?";
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, store);
				ResultSet rs=st.executeQuery();
				
				StoreDTO storeDTO = new StoreDTO();
				
				if(rs.next()) {
					storeDTO=new StoreDTO();
					storeDTO.setId(rs.getString("id"));
					storeDTO.setStore(rs.getString("store"));
					storeDTO.setArea(rs.getString("area"));
					storeDTO.setStoretel(rs.getString("storetel"));
					storeDTO.setHoliday(rs.getString("holiday"));
				}
				DBConnector.disConnect(rs, st, con);
				return storeDTO;
			}
}
