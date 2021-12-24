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
	         String name = request.getParameter("name");
	         String birth = request.getParameter("birth");
	         String phone = request.getParameter("phone");
	         String email = request.getParameter("email");

	         Member m = new MemberService().findPwd(memId);
	         
	         System.out.println(m);
	        
	         
	         String dateDob = String.join("", m.getBirth().substring(2,10).split("-"));
	         //date 생년월일 6자리로 변환

	         //출력
	         if(m.getMemName().equals(name) && dateDob.equals(birth) && m.getPhone().equals(phone)
	        		 && m.getEmail().equals(email)) {//정보가 모두 일치한다면
	        	 request.getSession().setAttribute("alertMsg", "비밀번호 변경화면으로 이동합니다");
	        	 response.sendRedirect(request.getContextPath()+"/resetPwd.me");
	         }
	         else {//잘못된 정보인 경우
	        	
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
