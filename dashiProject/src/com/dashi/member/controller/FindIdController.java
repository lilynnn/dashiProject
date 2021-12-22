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
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	         //입력 : memName , email  -----> MemberDao
			 
	         request.setCharacterEncoding("UTF-8");
 
	         String name = request.getParameter("name");
	         String email = request.getParameter("email");
	         
	         String memId = new MemberService().findId(name,email);


	         //출력
	         if(memId != null) {//결과가 있으면(정보가 맞다면)
	        	 request.setAttribute("loginUser", memId);
	         }
	         else {//결과가 없으면(정보가 맞지 않으면)
	        	 request.getSession().setAttribute("errorMsg", "조회 실패하였습니다.");
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
