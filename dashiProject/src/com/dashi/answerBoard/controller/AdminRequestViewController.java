package com.dashi.answerBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.answerBoard.model.service.AnswerService;
import com.dashi.answerBoard.model.vo.Answer;

/**
 * Servlet implementation class AdminRequestViewController
 */
@WebServlet("/requestView.ad")
public class AdminRequestViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRequestViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String answerNo = request.getParameter("asno");
		
		AnswerService as = new AnswerService();
		int result = as.increaseCount(answerNo);
		
		if(result > 0) {
			Answer n = as.selectDetailAnswer(answerNo);

			request.setAttribute("n", n);
			request.getRequestDispatcher("views/answerBoard/adDetail.jsp").forward(request, response);			

		}else {
			request.getSession().setAttribute("alertMsg", "게시글 조회 실패");
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
