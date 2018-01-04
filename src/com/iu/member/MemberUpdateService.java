package com.iu.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;

import oracle.net.aso.r;

public class MemberUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = null;
		
		if(method.equals("POST")) {
			memberDTO = new MemberDTO();
			//업데이트부분
			int result =0;
			try {
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw"));
				memberDTO.setName(request.getParameter("name"));
				memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
				memberDTO.setPhone(request.getParameter("phone"));
				memberDTO.setJob(request.getParameter("job"));
				result = memberDAO.update(memberDTO);
			} catch (Exception e) {
			}
			if(result>0) {
				actionForward.setCheck(true);
				actionForward.setPath("./memberMyPage.member");		
			}else {
				request.setAttribute("message", "모두 작성해주시기 바랍니다.");
				request.setAttribute("path", "./memberMyPage.member");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			//폼 부분
			String id="";
			try {
				id=request.getParameter("id");
				memberDTO=memberDAO.selectOne(id);
			}catch (Exception e) {
			}
			if(memberDTO != null) {
				request.setAttribute("m2", memberDTO);
				actionForward.setPath("../WEB-INF/view/member/memberUpdate2.jsp");
			}else {
				request.setAttribute("message", "update fail");
				request.setAttribute("path", "./memberMyPage.member");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionForward.setCheck(true);
		}
		return actionForward;
	}

}
