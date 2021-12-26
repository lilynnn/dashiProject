package com.dashi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.member.model.service.MemberService;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class AdminBlacklistDelete
 */
@WebServlet("/blackdelete")
public class AdminBlacklistDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBlacklistDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memNo = (Integer.parseInt(request.getParameter("bno")));
		 
		 
		

		
		Member m = new Member();
		
		m.setMemNo(memNo);
		 
		 
 
		int result = new MemberService().deleteBlackGrade(m);
		
		
		System.out.println(result);
		if(result > 0) { 
			
			request.getSession().setAttribute("alertMsg", "정상회원으로 복원되었습니다.");
			response.sendRedirect(request.getContextPath() + "/blackList.ad");
			
		} else { // 실패=>에러페이지
			request.getSession().setAttribute("alertMsg", "등급 변경 실패");
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
