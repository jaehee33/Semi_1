package com.iu.style;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class StyleInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		
		StyleDAO styleDAO=new StyleDAO();
		int count=0;
		int result=0;
		try {
			count=styleDAO.TotalCount();
			
			if(count>3) {
				request.setAttribute("message", "");
				request.setAttribute("path", "./kinFList.kind");
			}
			else {
				StyleDTO styleDTO=new StyleDTO();
				styleDTO.setId(memberDTO.getId());
				styleDTO.setStyle(request.getParameter("style"));
				styleDTO.setPrice(Integer.parseInt(request.getParameter("price")));
				styleDTO.setStore(request.getParameter("store"));
				result=styleDAO.insert(styleDTO);
				
				if(result>0) {
					request.setAttribute("message", "즐겨찾기에 추가되었습니다.");
					request.setAttribute("path", "./");
				}else {
					request.setAttribute("message", "추가 실패");
					request.setAttribute("path", "./kinFList.kind");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}
