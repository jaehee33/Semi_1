package com.iu.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class MemberJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {

			String job = request.getParameter("job");
			if(job.equals("C")) {

				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw"));
				memberDTO.setName(request.getParameter("name"));
				memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
				memberDTO.setPhone(request.getParameter("phone"));
				memberDTO.setJob(request.getParameter("job"));

				MemberDAO memberDAO = new MemberDAO();

				int result=0;
				try {
					result=memberDAO.join(memberDTO);

				} catch (Exception e) {
				}
				
				if(result>0) {
					actionForward.setCheck(false);
					actionForward.setPath("../index.jsp");		
				}else {
					request.setAttribute("message", "fail");
					request.setAttribute("path", "./memberJoin.member");
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}

			}
			
		}else {
			actionForward = new ActionForward();
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberJoin.jsp");

		}
		return actionForward;
	}

}
