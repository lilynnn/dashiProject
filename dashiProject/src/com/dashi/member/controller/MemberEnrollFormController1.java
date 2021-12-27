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
 * Servlet implementation class MemberEnrollForm
 */
@WebServlet("/enroll1.me")
public class MemberEnrollFormController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollFormController1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("views/member/memberEnrollForm1.jsp").forward(request, response);

		request.setCharacterEncoding("UTF-8");
		
		String gender = request.getParameter("gender");
		String userName = request.getParameter("userName");
		String birthDay = request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userNickName = request.getParameter("userNickName");
		String postNo = request.getParameter("postNo");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String email = request.getParameter("email");


		
		Member m = new Member(userId, userPwd, userName, userNickName, birthDay, gender, email, postNo, address, detailAddress, phone);
		
		System.out.println(m);
		int result = new MemberService().insertMember(m);
		
		
		if(result>0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","성공적으로 회원가입이 되었습니다");
			
			// 성공 => /jsp url 재요청 => index페이지
			request.getRequestDispatcher("index.jsp").forward(request, response);

			
		}else {
			//실패 => 에러 문구가 보여지는 에러페이지
			request.setAttribute("alertMsg", "회원가입에 실패했습니다.");
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
