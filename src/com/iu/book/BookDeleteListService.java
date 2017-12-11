package com.iu.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class BookDeleteListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
ActionForward actionForward = new ActionForward();
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		BookDAO bookDAO = new BookDAO();
		try {
			ArrayList<BookDTO> ar = bookDAO.selectList(memberDTO);
			request.setAttribute("list", ar);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/book/bookList.jsp");
		
		return actionForward;
	}

}
