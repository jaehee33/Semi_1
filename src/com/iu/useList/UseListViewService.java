package com.iu.useList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.book.BookDAO;
import com.iu.book.BookDTO;

public class UseListViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward= new ActionForward();
		
		int num=0;
		try {
		num=Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = null;
		
		try {
			bookDTO = bookDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(bookDTO != null) {
			request.setAttribute("book", "useList");
			request.setAttribute("view", bookDTO);
			actionForward.setPath("../WEB-INF/view/useList/useListView.jsp");
		}else {
			request.setAttribute("message", "fail");
			request.setAttribute("path", "./useList.useList");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
