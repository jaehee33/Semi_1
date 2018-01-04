package com.iu.coupon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class CouponComeService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO=((MemberDTO)request.getSession().getAttribute("member"));
		CouponDAO couponDAO = new CouponDAO();

		if(memberDTO!=null) {
			String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();

			CouponDTO couponDTO = new CouponDTO();
			couponDTO.setId(id);
			couponDTO.setCoupon(request.getParameter("coupon"));
			couponDTO.setDiscount(Integer.parseInt(request.getParameter("count")));

			ArrayList<CouponDTO> ar = null;

			try {
				ar = (ArrayList<CouponDTO>)couponDAO.selectList(id);
			} catch (Exception e1) {
			}
			boolean check = false;
			for(CouponDTO couDTO : ar) {
				if(couDTO.getCoupon().equals(couponDTO.getCoupon())) {
					check=true;
					break;
				}
			}
			if(check) {
				request.setAttribute("message", "중복된 쿠폰 입니다.");
				request.setAttribute("path", "../coupon/couponList.coupon");

			}else {
				int result = 0;
				try {
					result = couponDAO.insert(couponDTO);
				} catch (Exception e) {
				}

				if(result>0) {
					request.setAttribute("message", "쿠폰 발급.");
					request.setAttribute("path", "../coupon/couponList.coupon");

				}else {
					request.setAttribute("message", "coupon fail");
					request.setAttribute("path", "../coupon/couponList.coupon");
				}
			}
		}else {
			request.setAttribute("message", "로그인 해주세요.");
			request.setAttribute("path", "../coupon/couponList.coupon");
		}
		actionForward.setCheck(true); 
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		return actionForward;
	}

}
