package com.iu.style;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.iu.util.DBConnector;

public class StyleDAO {

	public int TotalCount() throws Exception{
		Connection con = DBConnector.getConnect();

		String sql="select nvl(count(num),0) from style";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		int count=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return count;
	}

	public int insert(StyleDTO styleDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="insert into style values(?,?favor_seq.nextval,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, styleDTO.getId());
		st.setString(2, styleDTO.getStyle());
		st.setInt(3, styleDTO.getPrice());
		st.setString(4, styleDTO.getStore());
		int result=st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}

	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="delete style where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);

		int result=st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}
}
