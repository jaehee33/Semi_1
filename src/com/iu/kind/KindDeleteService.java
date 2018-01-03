package com.iu.kind;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.member.MemberDTO;

public class KindDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		KindDAO kindDAO=new KindDAO();
		FilesDAO filesDAO=new FilesDAO();
		int result=0;
		int result2=0;
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			result=kindDAO.delete(num);
			result2=filesDAO.delete(num);
		}catch(Exception e) {
			
		}
		if(result>0 && result2>0) {
			actionForward.setPath("./kindIndex.kind?id="+memberDTO.getId());
		}else {
			request.setAttribute("message", "delete fail");
			request.setAttribute("path", "./kindIndex.kind");
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
