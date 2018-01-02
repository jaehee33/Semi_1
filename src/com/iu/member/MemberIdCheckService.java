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

			String id = request.getParameter("id");
			MemberDAO memberDAO = new MemberDAO();

			boolean check=false;
			
			try {
				check = memberDAO.idCheck(id);
			} catch (Exception e1) {
			}
			
			if(check) {
				request.setAttribute("id", id);
				request.setAttribute("message", "사용가능한 ID 입니다.");
				request.setAttribute("check", check);

			}else {
				request.setAttribute("id", id);
				request.setAttribute("message", "중복된 ID 입니다.");
				request.setAttribute("check", check);
			}
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberIdCheck.jsp");
		return actionForward;

	}
}

