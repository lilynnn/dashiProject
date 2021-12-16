package com.dashi.faqBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.faqBoard.model.service.FAQService;
import com.dashi.faqBoard.model.vo.FAQ;
import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AjaxFAQUpdateController
 */
@WebServlet("/faqUpdate.ad")
public class AdminFAQUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String fNo = request.getParameter("fno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int category = Integer.parseInt(request.getParameter("category"));
	
		FAQ f = new FAQ();
		
		f.setFAQNo(fNo);
		f.setFAQTitle(title);
		f.setFAQContent(content);
		f.setFAQCategory(category);
		
		int result = new FAQService().updateFAQ(f);
		
		if(result > 0) { //성공 => /jsp/detail.no?num=현재글번호 =>상세페이지
			
			request.getSession().setAttribute("alertMsg", "FAQ가 수정되었습니다!");
			response.sendRedirect(request.getContextPath() + "/faqList.ad");
			
		}else { // 실패=>에러페이지
			request.setAttribute("alertMsg", "FAQ 수정 실패");
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
