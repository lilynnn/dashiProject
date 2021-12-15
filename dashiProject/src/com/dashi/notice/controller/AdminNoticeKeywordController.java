package com.dashi.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.notice.model.service.NoticeService;
import com.dashi.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeKeywordController
 */
@WebServlet("/noKeyword.ad")
public class AdminNoticeKeywordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeKeywordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String titleSearch = request.getParameter("titleSearch");
				
		ArrayList<Notice> list = new NoticeService().searchNotice(titleSearch);
				
		if(list.isEmpty()) {
			request.getRequestDispatcher("views/notice/adminNoticeListView.jsp").forward(request, response);
		}else {
			request.setAttribute("list", list);
			response.sendRedirect(request.getContextPath() + "/noList.ad?cpage=1");
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
