package com.iu.coupon;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class CouponListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		CouponDAO couponDAO = new CouponDAO();
		
		ArrayList<CouponDTO> ar = null;
		
		try {
			ar = (ArrayList<CouponDTO>)couponDAO.selectList("admin");
		} catch (Exception e) {
		}
		
		request.setAttribute("ar", ar);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/coupon/couponList.jsp");
		
		
		return actionForward;
	}

}
