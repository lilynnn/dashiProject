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
 * Servlet implementation class reset2PwdController
 */

/*update처리서블릿*/
@WebServlet("/resetPwd2.me")
public class reset2PwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reset2PwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId");
		String userpwd = request.getParameter("userpwd");
		String pw = request.getParameter("pw");
		
		Member updateMem = new MemberService().updatePwdMember(memId, userpwd, pw);
	
		HttpSession session = request.getSession();
		if(updateMem == null) { // 실패
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
		}else { // 성공
			session.setAttribute("alertMsg", "비밀번호 변경이 완료됐습니다");
			session.setAttribute("loginUser", updateMem);
		}
		
		response.sendRedirect(request.getContextPath());
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
