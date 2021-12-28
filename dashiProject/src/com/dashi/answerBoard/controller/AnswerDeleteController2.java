package com.dashi.answerBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.answerBoard.model.service.AnswerService;
import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AnswerDeleteController
 */
@WebServlet("/asdelete2")
public class AnswerDeleteController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerDeleteController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String answerNo = request.getParameter("asno");
	
		int result = new AnswerService().deleteAnswer(answerNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의가 삭제 되었습니다.");
			
		}else {
			request.getSession().setAttribute("alertMsg", "문의삭제 실패!");
		}response.sendRedirect(request.getContextPath()+"/asList.as");
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
