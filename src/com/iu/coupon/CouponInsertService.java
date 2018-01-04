package com.iu.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class CouponInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		CouponDAO couponDAO = new CouponDAO();
		String method = request.getMethod();
		if(method.equals("POST")) {
			
			String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();

			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setId(id);
			couponDTO.setCoupon(request.getParameter("coupon"));
			couponDTO.setDiscount(Integer.parseInt(request.getParameter("count")));
			
			int result = 0;
			try {
				result = couponDAO.insert(couponDTO);
			} catch (Exception e) {
			}
			
			
			if(result>0) {
				request.setAttribute("message", "coupon inserted");
				actionForward.setCheck(false); //redirect. request 죽음 바로 보내니까.
				actionForward.setPath("../coupon/couponList.coupon");
				
			}else {
				request.setAttribute("message", "coupon fail");
				request.setAttribute("path", "../coupon/couponInsert.coupon");
				actionForward.setCheck(true); //위에 setAttr 부분을 살리려고
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
			
		}else {
			actionForward.setCheck(true); //forward 방식. get방식이면 인서트 폼이 뜬다. //request가 살아있다. 정보가 같이 가니까
			actionForward.setPath("../WEB-INF/view/coupon/couponInsert.jsp");
		}
		
		return actionForward;
	}

}
