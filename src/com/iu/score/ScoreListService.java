package com.iu.score;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.util.MakePage;
import com.iu.util.Pageing;

public class ScoreListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String store = request.getParameter("store");
		String id=request.getParameter("id");
		int curPage=1;
		int totalCount;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
		}
		ScoreMakeRow makeRow = new ScoreMakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		ScoreDAO scoreDAO = new ScoreDAO();
		
		
		List<ScoreDTO> ar=null;
		Pageing pageing=null;
		
		try {
			totalCount = scoreDAO.getTotalCount(store);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow=(ScoreMakeRow)makePage.getMakeRow(makeRow);
			ar=scoreDAO.selectList(makeRow,store);
			
			pageing = makePage.pageing();
			request.setAttribute("count", totalCount);
			
		} catch (Exception e) {
		
		}
		
		request.setAttribute("storeid", id);
		request.setAttribute("store", store);
		request.setAttribute("score", "score");
		request.setAttribute("list", ar);
		request.setAttribute("page", pageing);
		request.setAttribute("make", makeRow);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/score/scoreList.jsp");
		
		return actionForward;
		
	}

}
