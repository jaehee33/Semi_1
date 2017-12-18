package com.iu.score;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.notice.NoticeDAO;
import com.iu.notice.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ScoreWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			ScoreDAO scoreDAO = new ScoreDAO();
			ScoreDTO scoreDTO = new ScoreDTO();
			String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
			scoreDTO.setId(id);
			int num=0;
			try {
				num = scoreDAO.getNum();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			scoreDTO.setNum(num);
			scoreDTO.setContents(request.getParameter("contents"));
			scoreDTO.setPoint(Double.valueOf(request.getParameter("star-input")));
			
			int result=0;
			try {
				result=scoreDAO.insert(scoreDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./scoreList.score");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./scoreList.score");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
		}else {
			request.setAttribute("board", "score");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/score/scoreWrite.jsp");
		}
		
		return actionForward;
	}

}
