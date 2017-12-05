package com.iu.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;


public class MemberMyPageService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO2 = null;
		try {
			memberDTO2 = memberDAO.login(memberDTO);
		} catch (Exception e) {
		}
		
		if(memberDTO2 != null) {
			request.setAttribute("m", memberDTO2);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberMyPage.jsp");
		}
		
		return actionForward;

	}
}
