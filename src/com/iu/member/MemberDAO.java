package com.iu.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBConnector;

public class MemberDAO {

		//회원가입
		public int join(MemberDTO memberDTO) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql="insert into member values(?,?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, memberDTO.getId());
			pre.setString(2, memberDTO.getPw());
			pre.setString(3, memberDTO.getName());
			pre.setDate(4, memberDTO.getBirth());
			pre.setString(5, memberDTO.getPhone());
			pre.setString(6, memberDTO.getJob());
			int result=pre.executeUpdate();
			DBConnector.disConnect(pre, con);
			return result;
		}
		
		//로그인
		public MemberDTO login(MemberDTO memberDTO) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql="select * from member where id=? and pw=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, memberDTO.getId());
			pre.setString(2, memberDTO.getPw());
			ResultSet rs=pre.executeQuery();
			if(rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setBirth(rs.getDate("birth"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setJob(rs.getString("job"));
			}else {
				memberDTO=null;
			}
			DBConnector.disConnect(rs, pre, con);
			return memberDTO;
		}
		
		//수정
		public int update(MemberDTO memberDTO) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql="update member set pw=?, name=?, birth=?, phone=?, job=? where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, memberDTO.getPw());
			pre.setString(2, memberDTO.getName());
			pre.setDate(3, memberDTO.getBirth());
			pre.setString(4, memberDTO.getPhone());
			pre.setString(5, memberDTO.getJob());
			pre.setString(6, memberDTO.getId());
			int result=pre.executeUpdate();
			DBConnector.disConnect(pre, con);
			return result;
		}
		
		//탈퇴
		public int delete(MemberDTO memberDTO) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql="delete member where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, memberDTO.getId());
			int result=pre.executeUpdate();
			DBConnector.disConnect(pre, con);
			return result;
		}
		//하나보기
		public MemberDTO selectOne(String id) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql = "select * from member where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			ResultSet rs = pre.executeQuery();
			MemberDTO memberDTO = null;
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPw(rs.getString("pw"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setBirth(rs.getDate("birth"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setJob(rs.getString("job"));
			}
			DBConnector.disConnect(rs, pre, con);
			return memberDTO;
		}
		
		//idCheck
		public boolean idCheck(String id) throws Exception{
			boolean check=true;
			Connection con=DBConnector.getConnect();
			String sql="select * from member where id=?";
			PreparedStatement pre=con.prepareStatement(sql);
			pre.setString(1, id);
			ResultSet rs=pre.executeQuery();
			if(rs.next()) {
				check=false;
			}
			DBConnector.disConnect(rs, pre, con);
			return check;
			
		}
		public boolean kakao(String id) throws Exception {
			Connection con=DBConnector.getConnect();
			boolean chk=true;
			
			String sql="select * from member where id=?";
			
			PreparedStatement pre=con.prepareStatement(sql);
			
			pre.setString(1, id);
			
			ResultSet rs= pre.executeQuery();
			
			if(rs.next()) {
				chk=false;
			}
			
			DBConnector.disConnect(rs, pre, con);
			
			return chk;
		}

}
