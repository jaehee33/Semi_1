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
				CouponDAO couponDAO = new CouponDAO();
				ArrayList<CouponDTO> ar = null;
				
				try {
					ar = (ArrayList<CouponDTO>)couponDAO.selectList(memberDTO.getId());
				} catch (Exception e) {
				}
				
				if(ar != null) {
					request.setAttribute("list", ar);					
				}
				
				Calendar cal=Calendar.getInstance();
				int year=cal.get(Calendar.YEAR);
				int month=cal.get(Calendar.MONTH)+1;
				int date=cal.get(Calendar.DATE);
				int hour=cal.get(Calendar.HOUR_OF_DAY);
				int min=cal.get(Calendar.MINUTE);
				
				cal.set(year, month-1, 1); //시작일
				int start=1;
				int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				int week=cal.get(Calendar.DAY_OF_WEEK);//1일이 무슨요일인지 알아냄
				int weeks=cal.get(Calendar.WEEK_OF_MONTH);
				
				request.setAttribute("year", year); //년
				request.setAttribute("month", month); //월
				request.setAttribute("date", date);
				request.setAttribute("start", start); 
				request.setAttribute("end", end); //해당 월에 끝나는 날짜
				request.setAttribute("week",week);
				request.setAttribute("weeks", weeks);
				request.setAttribute("hour", hour);
				request.setAttribute("min", min);
				
				
				
				
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
