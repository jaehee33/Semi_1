package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class MemberLoginService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			// 추가적으로 job 셋팅
			MemberDAO memberDAO = new MemberDAO();
			try {
				
				memberDTO=memberDAO.login(memberDTO);
				
			} catch (Exception e) {
				memberDTO=null;
				e.printStackTrace();
			}
			if(memberDTO !=null) {
				request.getSession().setAttribute("member", memberDTO);
				actionForward.setCheck(false); //실패하나 성공하나 인덱스로 고고 
				actionForward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "fail");
				request.setAttribute("path", "./memberLogin.member");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
		}else {
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberLogin.jsp");
		}
		
		
		return actionForward;
	}

}
