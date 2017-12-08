package com.iu.kind;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;

public class KindInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		if(method.equals("POST")) {
			StoreDAO storeDAO=new StoreDAO();
			StoreDTO storeDTO=null;

			try {
				storeDTO = storeDAO.selectOne(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String[] kind=request.getParameterValues("kind");
			String[] price=request.getParameterValues("price");
			int result=0;
			for(int i=0;i<kind.length;i++) {
				KindDTO kindDTO=new KindDTO();
				kindDTO.setKind(kind[i]);
				kindDTO.setPrice(Integer.parseInt(price[i]));
				kindDTO.setStore(storeDTO.getStore());
				KindDAO kindDAO=new KindDAO();
				result=0;
				try {
					result=kindDAO.insert(kindDTO);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(result<0) {
					break;
				}
			}
			if(result>0) {
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/kind/kindIndex.jsp");
			}else {
				request.setAttribute("message", "kind fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {

			StoreDAO storeDAO=new StoreDAO();
			StoreDTO storeDTO=null;
			try {
				storeDTO = storeDAO.selectOne(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("store",storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindInsertForm.jsp");
		}

		return actionForward;
	}

}
