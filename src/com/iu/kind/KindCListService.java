package com.iu.kind;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.member.MemberDTO;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;

public class KindCListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String id="";
		try {
			id=request.getParameter("id");
		}catch (Exception e) {
			// TODO: handle exception
		}
		StoreDAO storeDAO=new StoreDAO();
		StoreDTO storeDTO=null;
		try {
			storeDTO = storeDAO.selectOne(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FilesDAO filesDAO=new FilesDAO();
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> ar= new ArrayList<>();
		ArrayList<FilesDTO> ar2=new ArrayList<>();
		try {
			ar2=filesDAO.selectList();
			ar=kindDAO.selectList(storeDTO.getStore());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ar!=null) {
			request.setAttribute("filelist", ar2);
			request.setAttribute("kindlist", ar);
			request.setAttribute("store", storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindList.jsp");
		}else {
			request.setAttribute("message", "kind Fail");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
