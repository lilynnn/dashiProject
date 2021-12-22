package com.dashi.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.member.model.service.MemberService;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class FindPwd2Controller
 */

/*pwd찾기 넘어온 값 1행조회*/
@WebServlet("/FindPwd2.me")
public class FindPwd2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwd2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	        
	         request.setCharacterEncoding("UTF-8");
 
	         String memId = request.getParameter("memId");
	         String memName = request.getParameter("name");
	         String dob = request.getParameter("birth");
	         String phone = request.getParameter("phone");
	         String email = request.getParameter("email");

	         Member m = new MemberService().findPwd(memId,memName,dob,phone,email);

	         //출력
	         if(memId != null) {//결과가 있으면(정보가 맞다면)
	        	 request.getSession().setAttribute("alertMsg", "비밀번호 변경화면으로 이동합니다");
	        	 response.sendRedirect(request.getContextPath()+"/resetPwd.me");
	         }
	         else if(memId == null) {//결과가 없으면(정보가 맞지 않으면)
	        	 request.getSession().setAttribute("alertMsg", "일치하는 회원이 없습니다.");
	        	 response.sendRedirect(request.getContextPath());
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	         response.sendError(500);
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
