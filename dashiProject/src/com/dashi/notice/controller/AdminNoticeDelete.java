package com.dashi.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminNoticeDelete
 */
@WebServlet("/noDelete.ad")
public class AdminNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String noticeNo = request.getParameter("nno");
		
		int result = new NoticeService().deleteNotice(noticeNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/noList.ad?cpage=1");
		}else {
			//삭제 실패시 알람창
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
