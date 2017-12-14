package com.iu.kind;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;

public class KindFListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FilesDAO filesDAO=new FilesDAO();
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> ar= new ArrayList<>();
		ArrayList<FilesDTO> ar2=new ArrayList<>();
		try {
			ar2=filesDAO.selectList();
			ar=kindDAO.allselectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ar!=null) {
			request.setAttribute("filelist", ar2);
			request.setAttribute("kindlist", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindStoreList.jsp");
		}else {
			request.setAttribute("message", "kind Fail");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
