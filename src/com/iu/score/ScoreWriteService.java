package com.iu.score;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.store.StoreDTO;
import com.iu.use.UseDAO;
import com.iu.use.UseDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ScoreWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO= (MemberDTO)request.getSession().getAttribute("member");
		String method=request.getMethod();



		if(method.equals("POST")) {
			String storeid=request.getParameter("storeid");
			String store=request.getParameter("store");
			
			if(memberDTO==null) {
				request.setAttribute("message", "로그인이 필요합니다.");
				request.setAttribute("path", "../member/memberLogin.member");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			} else {
				
					ScoreDAO scoreDAO = new ScoreDAO();
					ScoreDTO scoreDTO = new ScoreDTO();
					String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();

					int num=0;
					try {
						num = scoreDAO.getNum();
					} catch (Exception e1) {

					}

					scoreDTO.setId(id);
					scoreDTO.setNum(num);
					scoreDTO.setContents(request.getParameter("contents"));
					scoreDTO.setPoint(Double.valueOf(request.getParameter("star-input")));
					scoreDTO.setStore(store);
					int result=0;
					try {
						result=scoreDAO.insert(scoreDTO);
					} catch (Exception e) {
						e.printStackTrace();
					}


					if(result>0) {
						request.setAttribute("storeid", storeid);
						request.setAttribute("store", store );
						actionForward.setCheck(true);
						/*actionForward.setPath("../index.jsp");*/
						actionForward.setPath("./scoreList.score?id="+storeid+"&store="+store);
					}else {
						request.setAttribute("message", "Fail");
						request.setAttribute("path", "../index.jsp");
						actionForward.setCheck(true);
						actionForward.setPath("../WEB-INF/view/common/result.jsp");
					}
				}
			

		}else {
			String store= request.getParameter("store");
			String storeid=request.getParameter("id");


			request.setAttribute("storeid", storeid);
			request.setAttribute("store", store );
			request.setAttribute("board", "score");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/score/scoreWrite.jsp");



		}
		return actionForward;
	}
}

