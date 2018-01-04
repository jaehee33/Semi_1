package com.iu.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class CouponDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int num=0;
		CouponDAO couponDAO=new CouponDAO();
		int result=0;
		try {
				num=Integer.parseInt(request.getParameter("num"));
				result=couponDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result>0) {
			request.setAttribute("message", "쿠폰삭제성공");
		}else {
			request.setAttribute("message", "쿠폰삭제 실패");
		}
		
		request.setAttribute("path", "../coupon/couponList.coupon");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
				
		return actionForward;
	}

}
