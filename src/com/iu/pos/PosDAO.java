package com.iu.pos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.member.MemberDTO;
import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class PosDAO {
	
	
	
	public int getTotalMoney(String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select sum(pos_import)-sum(expend) from pos where store=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, store);
		ResultSet rs=st.executeQuery();
		int totalMoney=0;
		if(rs.next()) {
			totalMoney=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		return totalMoney;
	}
	
	public int getTotalCount() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from pos"; 
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);

		return totalCount;
	}
	
	public int insert(PosDTO posDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into pos values (sysdate,?,?,?,?,null,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, posDTO.getPos_import());
		st.setInt(2, posDTO.getExpend());
		st.setString(3, posDTO.getKind());
		st.setString(4, posDTO.getStore());
		st.setInt(5, posDTO.getNum());
		st.setString(6, posDTO.getState());
	
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	public ArrayList<PosDTO> selectList(PosMakeRow posMakeRow, String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R,P.* from "
				+ "(select pos_date,"+posMakeRow.getType()+",pos_coupon,store,kind,num,state from pos where store=? order by num asc) P)"
						+ " where R between ? and ? order by R desc";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,store);
		st.setInt(2, posMakeRow.getStartRow());
		st.setInt(3, posMakeRow.getLastRow());
		ResultSet rs=st.executeQuery();
		ArrayList<PosDTO> ar=new ArrayList<>();
		while(rs.next()) {
			PosDTO posDTO=new PosDTO();
			if(posMakeRow.getType().equals("expend")){
				posDTO.setExpend(rs.getInt("expend"));
			}else if(posMakeRow.getType().equals("pos_import")){
				posDTO.setPos_import(rs.getInt("pos_import"));
			}else {
				posDTO.setExpend(rs.getInt("expend"));
				posDTO.setPos_import(rs.getInt("pos_import"));
			}
			posDTO.setStore(rs.getString("store"));
			posDTO.setPos_date(rs.getDate("pos_date"));
			posDTO.setKind(rs.getString("kind"));
			posDTO.setPos_coupon(Boolean.parseBoolean(rs.getString("pos_coupon")));
			posDTO.setNum(rs.getInt("num"));
			posDTO.setState(rs.getString("state"));
			ar.add(posDTO);
		}
		return ar;
	}
	
	public int getNum() throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select use_seq.nextval from dual";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		int result=0;
		if(rs.next()) {
			result=rs.getInt(1);
		}
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public int delete(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete pos where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	
	
}
