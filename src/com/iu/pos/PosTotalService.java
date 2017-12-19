package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class PosTotalService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		PosDAO posDAO=new PosDAO();
		String store="";
		
		int totalMoney=0;
		try {
			store=request.getParameter("store");
			totalMoney=posDAO.getTotalMoney(store);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("total", totalMoney);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/pos/posTotal.jsp");
		}else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			request.setAttribute("path", "../member/memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionForward;
	}

}
