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
import com.iu.style.StyleDAO;
import com.iu.style.StyleDTO;

public class KindViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num=0;
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
			KindDAO kindDAO = new KindDAO();
			KindDTO kindDTO = kindDAO.selectone(num);

			FilesDAO filesDAO = new FilesDAO();			
			FilesDTO filesDTO = filesDAO.selectOne(num);
			ArrayList<FilesDTO> ar= filesDAO.selectList();
			
			StyleDAO styleDAO = new StyleDAO();
			StyleDTO styleDTO=styleDAO.selectOne(num);
			
			
			if(kindDTO != null) {
				StoreDAO storeDAO = new StoreDAO();
				StoreDTO storeDTO= storeDAO.selectOnd(kindDTO.getStore());
				
				request.setAttribute("store", storeDTO);
				request.setAttribute("fileList", ar);
				request.setAttribute("styleDTO", styleDTO);
				request.setAttribute("kind", kindDTO);
				request.setAttribute("file", filesDTO);
				actionForward.setPath("../WEB-INF/view/kind/kindView.jsp");
			}
			else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
