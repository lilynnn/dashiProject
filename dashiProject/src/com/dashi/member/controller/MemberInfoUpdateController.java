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
 * Servlet implementation class MemberInfoUpdateDetail
 */
@WebServlet("/updateInfo.me")
public class MemberInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String nickname = request.getParameter("nickname");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String postNo = request.getParameter("postNo");
		String addressN = request.getParameter("addressN");
		String addressD = request.getParameter("addressD");
		
		Member m = new Member(userId, userName, userPwd, nickname, birth, phone, email, postNo, addressN, addressD);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) {
			
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
					
		}else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원정보가 성공적으로 수정되었습니다!");
			
			response.sendRedirect(request.getContextPath() + "/infoView.me");
			
		}	
		
		//System.out.println(updateMem);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
