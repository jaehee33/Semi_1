package com.iu.pos;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.kind.KindDAO;
import com.iu.kind.KindDTO;
import com.iu.member.MemberDTO;

public class PosIndexService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		String store="";
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> ar=null;
		try {
			store=request.getParameter("store");
			ar=kindDAO.selectList(store);
		} catch (Exception e) {
			
		}
		request.setAttribute("kindlist", ar);
				request.setAttribute("store", store);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/pos/posIndex.jsp");
		}else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			request.setAttribute("path", "../member/memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionForward;
	}

}
