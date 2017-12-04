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
		
		if(memberDTO.getJob().equals("S")) {
			StoreDAO storeDAO = new StoreDAO();
			try {
				memberDTO = storeDAO.login(memberDTO);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("member", memberDTO);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/member/memberMyPage.jsp");
		return actionForward;
	}

}
