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
			
			/*			Cookie [] ar= request.getCookies();
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
			} GET방식으로 보내기 */
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			// 추가적으로 job 셋팅
			
			MemberDAO memberDAO = new MemberDAO();
			
			try {
				
				memberDTO=memberDAO.login(memberDTO);
					
			} catch (Exception e) {
				memberDTO=null;
			}

			if(memberDTO !=null) {
				
				request.getSession().setAttribute("member", memberDTO);
				//request.setAttribute("cId", cId);
				actionForward.setCheck(false); //실패하나 성공하나 인덱스로 고고 
				actionForward.setPath("../index.jsp");
			}else {
				//request.setAttribute("cId", cId);
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
