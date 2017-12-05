package com.iu.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;


public class MemberMyPageService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO m2 = null;
		try {
			m2 = memberDAO.login(memberDTO);
		} catch (Exception e) {
		}
		
		if(m2 != null) {
			request.setAttribute("m2", m2);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberMyPage.jsp");
		}
		
		return actionForward;

	}
}
