package com.iu.score;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.notice.NoticeDAO;

public class ScoreDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int num=0;
		int result=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			ScoreDAO scoreDAO = new ScoreDAO();
			result = scoreDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionForward.setCheck(false);
			actionForward.setPath("./scoreList.score");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./scoreList.score");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
