package com.iu.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class NoticeDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int num=0;
		int result=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			NoticeDAO noticeDAO = new NoticeDAO();
			result = noticeDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionForward.setCheck(false);
			actionForward.setPath("./noticeList.notice");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./noticeList.notice");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
