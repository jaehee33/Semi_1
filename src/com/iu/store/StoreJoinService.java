package com.iu.store;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;

public class StoreJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int result=0;
		int result2=0;
		String id=request.getParameter("id");
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setPhone(request.getParameter("phone"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setJob(request.getParameter("job"));
		MemberDAO memberDAO=new MemberDAO();
		try {
			result=memberDAO.join(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StoreDTO storeDTO=new StoreDTO();
		storeDTO.setArea(request.getParameter("area"));
		storeDTO.setHoliday(request.getParameter("holiday"));
		storeDTO.setStoretel(request.getParameter("storetel"));
		storeDTO.setStore(request.getParameter("store"));
		storeDTO.setId(id);
		
		StoreDAO storeDAO=new StoreDAO();
		try {
			result2=storeDAO.insert(storeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		if(result>0&&result2>0) {
			actionForward.setCheck(false);
			actionForward.setPath("../index.jsp");
		}else {
			request.setAttribute("message", "회원가입 실패");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		
	
		return actionForward;
	}

}
