package com.iu.score;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.notice.NoticeDAO;

public class ScoreViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int num=0;
		try {
		num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		ScoreDAO scoreDAO = new ScoreDAO();
		try {
			scoreDAO.hit(num);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		BoardDTO boardDTO=null;

		try {
			boardDTO = scoreDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		if(boardDTO != null) {
			request.setAttribute("board", "score");
			request.setAttribute("view", boardDTO);
			actionForward.setPath("../WEB-INF/view/score/scoreView.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./scoreList.score");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionForward.setCheck(true);

		return actionForward;
	}
}
