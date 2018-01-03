package com.iu.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.favor.FavorDAO;
import com.iu.favor.FavorDTO;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;

public class StoreViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
			
		
		try {
			String id=request.getParameter("id");
			StoreDAO storeDAO=new StoreDAO();
			StoreDTO storeDTO=storeDAO.selectOne(id);
			
			FilesDAO filesDAO=new FilesDAO();
			ArrayList<FilesDTO> ar=filesDAO.selectList();
			
			FavorDAO favorDAO = new FavorDAO();
			FavorDTO favorDTO=favorDAO.selectOne(id);
			
			if(storeDTO != null) {
				request.setAttribute("favorDTO", favorDTO);
				request.setAttribute("filelist", ar);
				request.setAttribute("store", storeDTO);
				actionForward.setPath("../WEB-INF/view/store/storeView.jsp");
			}else {
				request.setAttribute("message", "정보가 없습니다.");
				request.setAttribute("path", "../index.jsp");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
