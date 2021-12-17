package com.dashi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.member.model.service.MemberService;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");		
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String reason = request.getParameter("reason");
		
		Member m = new Member();
		m.setMemId(userId);
		m.setMemPwd(userPwd);
		m.setDelReason(reason);
		
		int result = new MemberService().deleteMember(m);
		
		HttpSession session =  request.getSession();
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "그동안 다시,사랑받개!를 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			
			response.sendRedirect(request.getContextPath());
			
		}else {
			
			request.getSession().setAttribute("alertMsg", "회원탈퇴 실패");
			request.getRequestDispatcher("views/member/memberInfoUpdateDetail.jsp").forward(request, response);
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
