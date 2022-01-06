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
 * Servlet implementation class AnswerUpdateController
 */

/*사용자 1:1 수정*/
@WebServlet("/asupdate2")
public class AnswerUpdateController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerUpdateController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String answerNo = request.getParameter("asno");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		String anContent = request.getParameter("anContent");
		

		
		Answer n = new Answer();
		
		n.setInquireNo(answerNo);
		n.setqTitle(qTitle);
		n.setqContent(qContent);
		n.setAnContent(anContent);
		
		
		
		
		
		int result = new AnswerService().updateAnswer(n);
		
		
		System.out.println(result);
		if(result > 0) { //성공 => /jsp/detail.no?num=현재글번호 =>상세페이지
			
			request.getSession().setAttribute("alertMsg", "수정 성공했습니다!");
			 
			
		} else { // 실패=>에러페이지
			request.getSession().setAttribute("alertMsg", "답변 등록 실패");
		} response.sendRedirect(request.getContextPath()+"/adlist.as");
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
