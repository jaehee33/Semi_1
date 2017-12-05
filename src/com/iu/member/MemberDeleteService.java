package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;

public class MemberDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
			MemberDAO memberDAO = new MemberDAO();
			StoreDAO storeDAO = new StoreDAO();
			int result=0;
			int result2=0;
			try {
				result = memberDAO.delete(memberDTO);
				result2 = storeDAO.delete(memberDTO);
			} catch (Exception e) {
			}
			
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("../memberMyPage.jsp");
			}else {
				request.setAttribute("message", "fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		
		return actionForward;

	}

}
