package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreJoinService;

public class MemberJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			
			String job = request.getParameter("job");
			if(job.equals("C")) {
				MemberJoinService memberJoinService = new MemberJoinService();
				actionForward=memberJoinService.doProcess(request, response);
			}else {
				StoreJoinService storeJoinService = new StoreJoinService();
				actionForward=storeJoinService.doProcess(request, response);
			}
		}else {
			actionForward = new ActionForward();
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberJoin.jsp");

		}
		return actionForward;
	}

}
