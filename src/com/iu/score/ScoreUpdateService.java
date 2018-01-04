package com.iu.score;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class ScoreUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		ScoreDAO scoreDAO = new ScoreDAO();
		ScoreDTO scoreDTO = null;
		if(method.equals("POST")) {
			scoreDTO = new ScoreDTO();
			int result=0;
			try {
				scoreDTO.setNum(Integer.parseInt(request.getParameter("num")));
				scoreDTO.setTitle(request.getParameter("title"));
				scoreDTO.setContents(request.getParameter("contents"));
			result=scoreDAO.update(scoreDTO);
			}catch (Exception e) {

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
			
		}else {
			int num=0;
			try {
			num = (Integer.parseInt(request.getParameter("num")));
			scoreDTO=scoreDAO.selectOne(num);
			}catch (Exception e) {

			}
			if(scoreDTO != null) {
				request.setAttribute("view", scoreDTO);
				actionForward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
				request.setAttribute("score", scoreDAO);
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./scoreList.score");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionForward.setCheck(true);
			
		}
		
		return actionForward;
	}


}
