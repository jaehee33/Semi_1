package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class KakaoLogoutService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		HttpSession session=request.getSession();
		
		session.invalidate();
		request.getSession().invalidate();
		request.setAttribute("message", "로그아웃되었습니다.");
		request.setAttribute("path", "../index.jsp");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}