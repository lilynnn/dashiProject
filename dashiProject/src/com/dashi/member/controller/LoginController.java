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
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
	 
		Member loginUser = new MemberService().loginMember(userId,userPwd);
	
		HttpSession session = request.getSession();
		
		if(loginUser != null) { //로그인성공
			
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath()+"/home");
			
		}else { //로그인실패
			request.getSession().setAttribute("errorMsg", "로그인에 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/home");

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
