package com.dashi.faqBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.faqBoard.model.service.FAQService;

/**
 * Servlet implementation class AdminFAQDeleteController
 */
@WebServlet("/faqDelete.ad")
public class AdminFAQDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String faqNo = request.getParameter("fno");
		
		int result = new FAQService().deleteFAQ(faqNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "FAQ가 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/faqList.ad");
		}else{
			request.getSession().setAttribute("alertMsg", "FAQ삭제 실패!");
			request.getRequestDispatcher("views/faqBoard/faqList.ad");
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
