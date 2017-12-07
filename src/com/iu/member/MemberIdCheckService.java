package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;

public class MemberIdCheckService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {

			String id = request.getParameter("id");
			MemberDAO memberDAO = new MemberDAO();

			boolean check;
			check=false;
			
			try {
				check = memberDAO.idCheck(id);
			} catch (Exception e1) {
			}
			if( !check ) {
				request.setAttribute("사용 가능한 id 입니다.", check);
				actionForward.setCheck(false);
				actionForward.setPath("../memberIdCheck.member");
			}else {
				request.setAttribute("중복된 id 입니다.", check);
				request.setAttribute("message", "fail");
				request.setAttribute("path", "../WEB-INF/view/member/memberIdCheck.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}

		}else {
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberIdCheck.jsp");
		}
		return actionForward;

	}
}
