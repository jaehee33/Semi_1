package com.iu.pos;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class PosListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String store=request.getParameter("store");
		//curPage
				int curPage=1;
				
				try {
				curPage=Integer.parseInt(request.getParameter("curPage"));
				}catch (Exception e) {
					// TODO: handle exception
				}
				//kind search
				PosMakeRow posMakeRow=new PosMakeRow();
				posMakeRow.setType(request.getParameter("type"));
				PosDAO posDAO=new PosDAO();
				int totalCount;
				try {
					totalCount = posDAO.getTotalCount();
					MakePage makePage= new MakePage(curPage, totalCount);
					posMakeRow=(PosMakeRow)makePage.getMakeRow((MakeRow)posMakeRow);
					List<PosDTO> ar=(List<PosDTO>)posDAO.selectList(posMakeRow, store);
					//페이징 처리
					Pageing pageing=makePage.pageing();
					request.setAttribute("list", ar);
					request.setAttribute("page", pageing);
					request.setAttribute("make", posMakeRow);
					request.setAttribute("store", store);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//전송
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/pos/posList.jsp");
		
		return actionForward;
	}

}
