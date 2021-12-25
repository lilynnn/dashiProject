package com.dashi.answerBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.answerBoard.model.service.AnswerService;
import com.dashi.answerBoard.model.vo.Answer;
import com.dashi.common.model.vo.Attachment;
import com.dashi.notice.model.service.NoticeService;
import com.dashi.notice.model.vo.Notice;

/**
 * Servlet implementation class AnswerUpdateView
 */
@WebServlet("/updateview")
public class AnswerUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String answerNo = request.getParameter("asno");
		
		Answer n = new AnswerService().selectDetailAnswer(answerNo);
		request.setAttribute("n", n);
		 
		request.getRequestDispatcher("views/answerBoard/answerUpdateView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
