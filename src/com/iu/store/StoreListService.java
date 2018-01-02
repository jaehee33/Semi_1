package com.iu.store;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class StoreListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		int curPage=1;
		try {
		curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		//kind search
		StoreMakeRow storeMakeRow=new StoreMakeRow();
		storeMakeRow.setKind(request.getParameter("kind"));
		storeMakeRow.setSearch(request.getParameter("search"));
		
		StoreDAO storeDAO=new StoreDAO();
		ArrayList<StoreDTO> ar=null;
		int totalCount=0;
		Pageing pageing=null;
		try {
			totalCount = storeDAO.getTotalCount(storeMakeRow);
			MakePage makePage= new MakePage(curPage, totalCount);
			storeMakeRow=(StoreMakeRow)makePage.getMakeRow((MakeRow)storeMakeRow);
			ar=(ArrayList<StoreDTO>)storeDAO.selectList(storeMakeRow);
			pageing=makePage.pageing();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("curPage", curPage);
		request.setAttribute("storelist", ar);
		request.setAttribute("page", pageing);
		request.setAttribute("make", storeMakeRow);
		
		//전송
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/store/storeList.jsp");

		
		return actionForward;
	}

}
