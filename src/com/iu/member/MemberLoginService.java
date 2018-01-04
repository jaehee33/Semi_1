package com.iu.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class MemberLoginService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		MemberDTO memberDTO = new MemberDTO();
	
		if(method.equals("POST")) {
			
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			// 추가적으로 job 셋팅
			String save=request.getParameter("remember");

			if(save !=null){
			Cookie id=new Cookie("id",memberDTO.getId());
			Cookie pw=new Cookie("pw",memberDTO.getPw());
			id.setMaxAge(60*10);
			response.addCookie(id);
			}else{
				Cookie id= new Cookie("id","");
				id.setMaxAge(0);
				response.addCookie(id);
			}
			
			
			MemberDAO memberDAO = new MemberDAO();
			
			try {
				
				memberDTO=memberDAO.login(memberDTO);
					
			} catch (Exception e) {
				memberDTO=null;
			}
			
			if(memberDTO !=null) {
		
				request.getSession().setAttribute("member", memberDTO);
				actionForward.setCheck(false); //실패하나 성공하나 인덱스로 고고 
				actionForward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "ID나 비밀번호를 잘못 입력하셨습니다.");
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
