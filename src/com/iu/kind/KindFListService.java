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
import com.iu.store.StoreMakeRow;

public class KindFListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		StoreDAO storeDAO=new StoreDAO();
		FilesDAO filesDAO=new FilesDAO();
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> kindar= new ArrayList<>();
		ArrayList<FilesDTO> filear=new ArrayList<>();
		ArrayList<StoreDTO> storear=new ArrayList<>();
		ArrayList<KindDTO> kindlist= new ArrayList<>();
		StoreMakeRow storeMakeRow=new StoreMakeRow();
		String kind=request.getParameter("kind");
		String gender=request.getParameter("gender");
		
		try {
			filear=filesDAO.selectList();
			kindar=kindDAO.allselectList();
			kindlist=kindDAO.selectKindList(kind,gender);
			storeMakeRow.setKind("store");
			storeMakeRow.setSearch("");
			storeMakeRow.setLastRow(storeDAO.getTotalCount(storeMakeRow));
			storeMakeRow.setStartRow(0);
			storear=(ArrayList<StoreDTO>)storeDAO.selectList(storeMakeRow);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(kindar!=null) {
			request.setAttribute("kind", kind);
			request.setAttribute("kindarr", kindlist);
			request.setAttribute("filelist", filear);
			request.setAttribute("kindlist", kindar);
			request.setAttribute("storelist", storear);
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
