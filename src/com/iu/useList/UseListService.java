package com.iu.useList;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.book.BookDAO;
import com.iu.book.BookDTO;
import com.iu.member.MemberDTO;
import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class UseListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		//curPage 
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e){
			}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		BookDAO bookDAO = new BookDAO();

		UseListDAO useListDAO = new UseListDAO();
		
		int totalCount;
		try {
			totalCount = useListDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow = makePage.getMakeRow(makeRow);
			
			List<UseListDTO> ar = useListDAO.selectList(makeRow); //db조회
			ArrayList<BookDTO> ar2 = bookDAO.selectList(memberDTO);
			System.out.println(ar);
			System.out.println(ar2);
			//pageing
			Pageing pageing = makePage.pageing();
			
			request.setAttribute("list", ar);
			request.setAttribute("list2", ar2);
			request.setAttribute("page", pageing);
			request.setAttribute("make", makeRow);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//전송
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/useList/useList.jsp");
			
		return actionForward;
	}

}
