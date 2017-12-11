package com.iu.use;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.member.MemberDTO;
import com.iu.notice.NoticeDAO;

public class UseViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num=0;
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}		
		
		UseDAO useDAO = new UseDAO();
		UseDTO useDTO=null;
		
		try {
			useDTO=useDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(useDTO != null) {
			request.setAttribute("view", useDTO);
			actionForward.setPath("../WEB-INF/view/use/useView.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../member/memberMyPage.member");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
