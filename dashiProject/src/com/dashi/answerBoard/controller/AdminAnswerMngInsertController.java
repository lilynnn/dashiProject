package com.dashi.answerBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.admin.model.vo.Manager;
import com.dashi.answerBoard.model.service.AnswerService;
import com.dashi.answerBoard.model.vo.Answer;
import com.dashi.faqBoard.model.service.FAQService;
import com.dashi.faqBoard.model.vo.FAQ;

/**
 * Servlet implementation class AdminAnswerMngInsertController
 */

/*1:1 답변 insert 관리자*/
@WebServlet("/adInsert.as")
public class AdminAnswerMngInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAnswerMngInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		int mnNo = ((Manager)session.getAttribute("loginAdmin")).getMnNo();	
		
		Answer a = new Answer();
		a.setAnContent(content);
		a.setMnNo(mnNo);
		
		int result = new AnswerService().adinsertAnswer(a);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변등록에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/admain.ad");
		}else {
			request.getSession().setAttribute("alertMsg", "등록에 실패하였습니다.");
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
