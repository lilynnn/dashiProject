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
@WebServlet("/asupdate")
public class AnswerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String answerNo = request.getParameter("asno");
		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");
		
		Answer n = new Answer();
		
		n.setInquireNo(answerNo);
		n.setqTitle(qTitle);
		n.setqContent(qContent);
		
		int result = new AnswerService().updateAnswer(n);
		
		if(result > 0) { //성공 => /jsp/detail.no?num=현재글번호 =>상세페이지
			
			request.getSession().setAttribute("alertMsg", "문의글 수정에 성공했습니다!");
			response.sendRedirect(request.getContextPath() + "/asList.as");
			
		} else { // 실패=>에러페이지
			request.getSession().setAttribute("alertMsg", "문의글 수정 실패");
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
