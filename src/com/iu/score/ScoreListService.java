package com.iu.score;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class ScoreListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String store = request.getParameter("store");
		String id= request.getParameter("id");
		
		int curPage=1;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
		}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		ScoreDAO scoreDAO = new ScoreDAO();
		int totalCount;
		
		List<ScoreDTO> ar=null;
		Pageing pageing=null;
		
		try {
			totalCount = scoreDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow=makePage.getMakeRow(makeRow);
			ar=scoreDAO.selectList(makeRow);
			
			pageing = makePage.pageing();
			
			request.setAttribute("store", store);
			request.setAttribute("board", "score");
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			request.setAttribute("make", makeRow);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		request.setAttribute("storeid", id);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/score/scoreList.jsp");
		
		return actionForward;
		
	}

}
