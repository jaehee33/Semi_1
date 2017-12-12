package com.iu.posbook;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.iu.util.DBConnector;

public class PosBookDAO {

	public int success(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update use set state=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "확인");
		st.setInt(2, num);
		int result=st.executeUpdate();
		
		sql="delete posbook where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
}
