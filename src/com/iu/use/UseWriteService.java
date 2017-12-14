package com.iu.use;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.pos.PosDAO;
import com.iu.pos.PosDTO;

public class UseWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		String method=request.getMethod();
		
		String store=request.getParameter("store");
		String style=request.getParameter("style");
		int price=0;
		int num=0;
		PosDAO posDAO=new PosDAO();
		UseDAO useDAO = new UseDAO();
		try {
			price=Integer.parseInt(request.getParameter("price"));	
			num=useDAO.getNum();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(method=="POST") {
			UseDTO useDTO=new UseDTO();
			useDTO.setNum(num);
			useDTO.setId(memberDTO.getId());
			useDTO.setName(memberDTO.getName());
			useDTO.setPhone(memberDTO.getPhone());
			useDTO.setBk_date(Date.valueOf(request.getParameter("bk_date")));
			useDTO.setStore(store);
			useDTO.setStyle(style);
			useDTO.setPrice(price);
			useDTO.setCoupon(request.getParameter("coupon"));
			useDTO.setTime(request.getParameter("time"));
			
			PosDTO posDTO = new PosDTO();
			posDTO.setNum(num);
			posDTO.setPos_import(price);
			posDTO.setKind(style);
			posDTO.setStore(store);
			
		
			int useresult=0;
			int posresult=0;
			
			try {
				useresult=useDAO.insert(useDTO);
				posresult=posDAO.insert(posDTO);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if(useresult>0 && posresult>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./useList.use");		
			}else {
				request.setAttribute("message", "fail");
				request.setAttribute("path", "../store/storeList.store");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			request.setAttribute("store", store);
			request.setAttribute("style", style);
			request.setAttribute("price", price);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/use/useWrite.jsp");
		}
		return actionForward;
	}

}
