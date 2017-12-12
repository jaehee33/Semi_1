package com.iu.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class MemberRememberService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		MemberDTO memberDTO = new MemberDTO();
		
		Cookie [] ar= request.getCookies();
		String cId="";
		for(int i=0; i<ar.length; i++){
			if(ar[i].getName().equals("id")){
				cId=ar[i].getValue();
				break;
			}
		}
		String remember = request.getParameter("remember");
		if(remember != null){
			Cookie c = new Cookie("id", memberDTO.getId());
			c.setMaxAge(60*10);
			response.addCookie(c);
			request.setAttribute("cId", cId);
		}else {
			Cookie c = new Cookie("id", "");
			c.setMaxAge(0);
			response.addCookie(c);
			request.setAttribute("cId", cId);
		}

		actionForward.setCheck(false);
		actionForward.setPath("../WEB-INF/view/member/memberLogin.member");
		return actionForward;

	}
}
