package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

public class PosDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		int num=0;
		int result=0;
		String store="";
		PosDAO posDAO=new PosDAO();
		try {
			store=request.getParameter("store");
			num=Integer.parseInt(request.getParameter("num"));
			result=posDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionForward.setPath("./posIndex.pos?store="+store);
		}else {
			request.setAttribute("message", "delete fail");
			request.setAttribute("path", "./posIndex.pos?store="+store);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
			
		}
		actionForward.setCheck(true);
		}else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			request.setAttribute("path", "../member/memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionForward;
	}

}
