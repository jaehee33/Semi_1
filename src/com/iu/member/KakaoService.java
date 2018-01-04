package com.iu.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class KakaoService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();

		MemberDTO memberDTO=new MemberDTO();
		MemberDAO memberDAO=new MemberDAO();
		String id = request.getParameter("id");
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("id"));

		boolean check=true;
		try {
			check=memberDAO.kakao(id);

			
			if(check) {
				memberDAO.join(memberDTO);
			}
				memberDTO=memberDAO.login(memberDTO);
		
			if(memberDTO !=null) {
				request.getSession().setAttribute("member", memberDTO);
				actionForward.setCheck(false);
				actionForward.setPath("../index.jsp");
			}
			
		} catch (Exception e) {
		}
		
			request.setAttribute("m2", memberDTO);
			request.setAttribute("message", "로그인되었습니다.");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");

		return actionForward;

}
}

	
	
	