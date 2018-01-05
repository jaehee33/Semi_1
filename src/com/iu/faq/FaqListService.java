package com.iu.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class FaqListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int curPage=1;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {

		}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		
		FaqDAO faqDAO = new FaqDAO();
		int totalCount;
		try {
			totalCount = faqDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow=makePage.getMakeRow(makeRow);
			List<BoardDTO> ar=faqDAO.selectList(makeRow);
			Pageing pageing = makePage.pageing();
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("count", totalCount);
			request.setAttribute("board", "faq");
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardList.jsp");

		
		return actionForward;
	}

}
