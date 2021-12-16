package com.dashi.faqBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.admin.model.vo.Manager;
import com.dashi.faqBoard.model.service.FAQService;
import com.dashi.faqBoard.model.vo.FAQ;

/**
 * Servlet implementation class AdminFAQInsertController
 */
@WebServlet("/faqInsert.ad")
public class AdminFAQInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");		
		
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		int mnNo = ((Manager)session.getAttribute("loginAdmin")).getMnNo();	
		
		FAQ f = new FAQ();
		f.setFAQCategory(category);
		f.setFAQTitle(title);
		f.setFAQContent(content);
		f.setMnNo(mnNo);
		
		int result = new FAQService().insertFAQ(f);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "FAQ등록에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/faqList.ad");
		}else {
			request.getSession().setAttribute("alertMsg", "FAQ등록 실패");
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
