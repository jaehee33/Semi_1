package com.iu.useList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.notice.NoticeDAO;
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
		
		UseListDAO useListDAO = new UseListDAO();
		int totalCount;
		try {
			totalCount = useListDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow = makePage.getMakeRow(makeRow);
			List<UseListDTO> ar = useListDAO.selectList(makeRow); //db조회
			
			//pageing
			Pageing pageing = makePage.pageing();
			
			request.setAttribute("list", ar);
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
