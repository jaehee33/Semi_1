package com.iu.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;

public class FaqUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		FaqDAO faqDAO = new FaqDAO();
		BoardDTO boardDTO = null;
		if(method.equals("POST")) {
			boardDTO = new BoardDTO();
			int result=0;
			try {
			boardDTO.setNum(Integer.parseInt(request.getParameter("num")));
			boardDTO.setTitle(request.getParameter("title"));
			boardDTO.setContents(request.getParameter("contents"));
			result=faqDAO.update(boardDTO);
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./faqList.faq");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./faqList.faq");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
			
			
		}else {
			int num=0;
			try {
			num = (Integer.parseInt(request.getParameter("num")));
			boardDTO=faqDAO.selectOne(num);
			}catch (Exception e) {
				// TODO: handle exception
			}
			if(boardDTO != null) {
				request.setAttribute("view", boardDTO);
				actionForward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
				request.setAttribute("board", "faq");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./faqList.faq");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionForward.setCheck(true);
		}
		return actionForward;
	}

}
