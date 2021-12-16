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
@WebServlet("/insert.as")
public class AnswerFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 이름 연락처 내용 
		String memId = request.getParameter("memId");
		String qTitle = request.getParameter("qTitle");
		String qContent= request.getParameter("qContent");
		
		// 로그인한 회원 정보를 얻어내는 방법
		// 1. input type="hidden" 으로 애초에 요청시 숨겨서 전달하기
		// 2. session영역에 담겨있는 회원객체로부터 뽑기
		HttpSession session = request.getSession();
		String memNo = ((Member)session.getAttribute("memNo")).getMemId();
				
				Answer a = new Answer();
				a.setMemId(memId);
				a.setqTitle(qTitle);
				a.setqContent(qContent);
				
				
		
		int result = new AnswerService().insertAnswer(a);
		if(result > 0) { // 성공 => /jsp/list.no  url 재요청 => 목록페이지 보여지도록 alert(성공적으로 공지사항 등록되었습니다.)

			session.setAttribute("alertMsg", "성공적으로 공지사항 등록되었습니다!");
			response.sendRedirect(request.getContextPath() + "<%contextPath%>");
			
		}else { // 실패 => 에러문구(공지사항 등록 실패)담아서 에러페이지 포워딩
			request.setAttribute("errorMsg", "등록 실패 하였습니다");
			response.sendRedirect(request.getContextPath() + "<%contextPath%>");
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
