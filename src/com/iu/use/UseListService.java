package com.iu.use;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.util.MakePage;
import com.iu.util.Pageing;

public class UseListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int curPage=1;
		
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		UseMakeRow useMakeRow = new UseMakeRow();
		useMakeRow.setKind(request.getParameter("kind"));
		useMakeRow.setSearch(request.getParameter("search"));
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		UseDAO useDAO = new UseDAO();		

		int totalCount;
		try {
			totalCount=useDAO.getTotalCount(useMakeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			useMakeRow = (UseMakeRow) makePage.getMakeRowUse(useMakeRow);
			List<UseDTO> ar = useDAO.selectList(useMakeRow,memberDTO.getId());
			Pageing pageing = makePage.pageingUse();
			
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			request.setAttribute("make", useMakeRow);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/use/useList.jsp");
		
		return actionForward;
	}

}
