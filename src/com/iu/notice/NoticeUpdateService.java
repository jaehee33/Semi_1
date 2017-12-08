package com.iu.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;

public class NoticeUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		NoticeDAO noticeDAO = new NoticeDAO();
		BoardDTO boardDTO = null;
		if(method.equals("POST")) {
			boardDTO = new BoardDTO();
			int result=0;
			try {
			boardDTO.setNum(Integer.parseInt(request.getParameter("num")));
			boardDTO.setTitle(request.getParameter("title"));
			boardDTO.setContents(request.getParameter("contents"));
			result=noticeDAO.update(boardDTO);
			}catch (Exception e) {

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
			
		}else {
			int num=0;
			try {
			num = (Integer.parseInt(request.getParameter("num")));
			boardDTO=noticeDAO.selectOne(num);
			}catch (Exception e) {

			}
			if(boardDTO != null) {
				request.setAttribute("view", boardDTO);
				actionForward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
				request.setAttribute("board", "notice");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./noticeList.notice");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionForward.setCheck(true);
			
		}
		
		return actionForward;
	}
}
