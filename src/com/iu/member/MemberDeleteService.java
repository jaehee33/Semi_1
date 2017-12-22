package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;

public class MemberDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		StoreDTO storeDTO = (StoreDTO)request.getSession().getAttribute("store");
		
			MemberDAO memberDAO = new MemberDAO();
			StoreDAO storeDAO = new StoreDAO();
			int result=0;
			int result2=0;
			try {
				result = memberDAO.delete(memberDTO);
				result2 = storeDAO.delete(memberDTO.getId());
			} catch (Exception e) {
			}
			
			if(result>0 && result2>0) {
				request.setAttribute("check", "탈퇴하시겠습니까?");
				request.setAttribute("pass", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/member/memberDelete.jsp");
			}else {
				request.setAttribute("message", "fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			request.getSession().invalidate();
			actionForward.setCheck(false);
			actionForward.setPath("../index.jsp");
			
		return actionForward;

	}

}
