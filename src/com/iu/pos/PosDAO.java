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
		String sql="insert into pos values (sysdate,?,?,null,?,?,null,pos_seq.nextval)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, posDTO.getPos_import());
		st.setInt(2, posDTO.getExpend());
		st.setInt(3, posDTO.getTotal());
		st.setString(4, posDTO.getStore());
	
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	public ArrayList<PosDTO> selectList(PosMakeRow posMakeRow, String store) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R,P.* from "
				+ "(select pos_date,"+posMakeRow.getType()+",total,pos_date,pos_coupon from pos where store=?) P)"
						+ " where R between ? and ? order by R desc";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, store);
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
			posDTO.setTotal(rs.getInt("total"));
			posDTO.setPos_coupon(Boolean.parseBoolean(rs.getString("pos_coupon")));
			ar.add(posDTO);
		}
		return ar;
	}
	
	
	public int delete(MemberDTO memberDTO) throws Exception{
		return 0;
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		return 0;
	}
	
	
}
