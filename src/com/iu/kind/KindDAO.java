package com.iu.kind;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.iu.store.StoreDTO;
import com.iu.util.DBConnector;
import com.iu.util.MakeRow;

public class KindDAO {

	
	public int insert(KindDTO kindDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into kind values (?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, kindDTO.getKind());
		st.setInt(2, kindDTO.getPrice());
		st.setString(3, kindDTO.getStore());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public ArrayList<KindDTO> selectList(MakeRow makeRow) throws Exception{
		return null;
	}
	public int delete(StoreDTO storeDTO) throws Exception{
		return 0;
	}
	public int update(StoreDTO storeDTO) throws Exception{
		return 0;
	}
}
