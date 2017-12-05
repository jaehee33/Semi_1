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
	
	public int insert(PosDTO posDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into pos values (?,?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setDate(1, posDTO.getPos_date());
		st.setInt(2, posDTO.getPos_import());
		st.setInt(3, posDTO.getExpend());
		st.setString(4, posDTO.getKind());
		st.setString(5, posDTO.getStore());
		st.setInt(6, posDTO.getTotal());
		st.setBoolean(7, posDTO.isPos_coupon());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public ArrayList<PosDTO> selectList(MakeRow makeRow, String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R,P.* from "
				+ "(select pos_date,"+makeRow.getKind()+",total,pos_date,pos_coupon from pos where store=?) P)"
						+ " where R between ? and ? order by R desc";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, store);
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		ResultSet rs=st.executeQuery();
		ArrayList<PosDTO> ar=new ArrayList<>();
		while(rs.next()) {
			PosDTO posDTO=new PosDTO();

		}
		return null;
	}
	
	
	public int delete(MemberDTO memberDTO) throws Exception{
		return 0;
	}
	public int update(MemberDTO memberDTO) throws Exception{
		return 0;
	}
	
	
}
