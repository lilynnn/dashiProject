package com.dashi.answerBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.answerBoard.model.service.AnswerService;
import com.dashi.answerBoard.model.vo.Answer;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class AnswerForm
 */

/*사용자 1:1 등록 기능구현*/
@WebServlet("/insert.as")
public class AnswerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		 
		String qTitle = request.getParameter("qTitle");
		String qContent= request.getParameter("qContent");
		
		System.out.println(qTitle);
		System.out.println(qContent);
		
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		

				Answer a = new Answer();
				
				a.setqTitle(qTitle);
				a.setqContent(qContent);
				a.setMemNo(memNo);
				
				
		int result = new AnswerService().insertAnswer(a);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 문의가 등록되었습니다!");
		}else { 
			session.setAttribute("alertMsg", "등록 실패하였습니다.");
			
		} response.sendRedirect(request.getContextPath() + "/enroll.as");
		
	}	
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
