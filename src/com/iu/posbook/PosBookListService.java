package com.iu.posbook;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDTO;
import com.iu.use.UseDAO;
import com.iu.use.UseDTO;

public class PosBookListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		String store="";


		PosBookDAO posBookDAO=new PosBookDAO();
		ArrayList<PosBookDTO> ar=null;
		
		try {
			store=request.getParameter("store");

			ar=(ArrayList<PosBookDTO>) posBookDAO.selectList(store);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("store", store);
		request.setAttribute("posbook", ar);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/pos/posBook.jsp");
		
		
		return actionForward;
	}

}
