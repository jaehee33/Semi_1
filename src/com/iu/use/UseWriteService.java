package com.iu.use;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.coupon.CouponDAO;
import com.iu.coupon.CouponDTO;
import com.iu.member.MemberDTO;
import com.iu.pos.PosDAO;
import com.iu.pos.PosDTO;

public class UseWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO != null) {
			String method=request.getMethod();

			String store=request.getParameter("store");
			String style=request.getParameter("style");
			int price=0;
			int num=0;
			int discount=0;
			PosDAO posDAO=new PosDAO();
			UseDAO useDAO = new UseDAO();
			CouponDAO couponDAO = new CouponDAO();
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
				useDTO.setCoupon(request.getParameter("coupon"));
				ArrayList<CouponDTO> list;
				try {
					list = (ArrayList<CouponDTO>)couponDAO.selectList(memberDTO.getId());
					for(CouponDTO couponDTO:list) {
						if(couponDTO.getCoupon().equals(useDTO.getCoupon())) {
							discount=couponDTO.getDiscount();
							break;
						}
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				useDTO.setPrice(price-(price*discount/100));
				useDTO.setTime(request.getParameter("time"));
				
				
				PosDTO posDTO = new PosDTO();
				posDTO.setNum(num);
				posDTO.setPos_import(price);
				posDTO.setKind(style);
				posDTO.setStore(store);
				posDTO.setState("예약");

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
				ArrayList<CouponDTO> ar = null;
				
				try {
					ar = (ArrayList<CouponDTO>)couponDAO.selectList(memberDTO.getId());
				} catch (Exception e) {
				}
				
				if(ar != null) {
					request.setAttribute("list", ar);					
				}
				
				Calendar cal=Calendar.getInstance();
				int hour=cal.get(Calendar.HOUR_OF_DAY);
				int min=cal.get(Calendar.MINUTE);
				int sec=cal.get(Calendar.SECOND);
				request.setAttribute("hour", hour);
				request.setAttribute("min", min);
				request.setAttribute("sec", sec);			
				
				request.setAttribute("member", memberDTO);
				request.setAttribute("store", store);
				request.setAttribute("style", style);
				request.setAttribute("price", price);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/use/useWrite.jsp");
			}
		}else {
			request.setAttribute("message", "로그인이 필요합니다");
			request.setAttribute("path", "../member/memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionForward;
	}

}
