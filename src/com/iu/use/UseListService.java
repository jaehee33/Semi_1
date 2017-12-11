package com.iu.use;

<<<<<<< HEAD
import java.util.List;
=======
import java.util.ArrayList;
>>>>>>> jj

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
<<<<<<< HEAD:src/com/iu/useList/UseListService.java
import com.iu.book.BookDTO;

=======
import com.iu.member.MemberDTO;
>>>>>>> sj_book:src/com/iu/use/UseListService.java
import com.iu.util.MakePage;
import com.iu.util.MakeRow;
import com.iu.util.Pageing;

public class UseListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int curPage=1;
		
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
<<<<<<< HEAD:src/com/iu/useList/UseListService.java
		}catch (Exception e){
			}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));

		BookDTO bookDTO = (BookDTO)request.getSession().getAttribute("list");
		UseListDAO useListDAO = new UseListDAO();
=======
		} catch (Exception e) {
			// TODO: handle exception
		}
		UseMakeRow useMakeRow = new UseMakeRow();
		useMakeRow.setKind(request.getParameter("kind"));
		useMakeRow.setSearch(request.getParameter("search"));
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		UseDAO useDAO = new UseDAO();
>>>>>>> sj_book:src/com/iu/use/UseListService.java
		

		int totalCount;
		try {
			totalCount=useDAO.getTotalCount(useMakeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
<<<<<<< HEAD:src/com/iu/useList/UseListService.java
			makeRow = makePage.getMakeRow(makeRow);

			
<<<<<<< HEAD
			List<UseListDTO> ar = useListDAO.selectList(makeRow); //db조회
			List<BookDTO> ar2 = bookDAO.selectList(memberDTO);
			System.out.println(ar);
			System.out.println(ar2);
=======
			ArrayList<UseListDTO> ar = useListDAO.selectList2(bookDTO);

>>>>>>> jj
			//pageing
=======
			useMakeRow = (UseMakeRow) makePage.getMakeRow(useMakeRow);
			List<UseDTO> ar = useDAO.selectList(useMakeRow,memberDTO.getId());
>>>>>>> sj_book:src/com/iu/use/UseListService.java
			Pageing pageing = makePage.pageing();
			
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			request.setAttribute("make", useMakeRow);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/use/useList.jsp");
		
		return actionForward;
	}

}
