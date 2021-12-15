package com.dashi.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.notice.model.service.NoticeService;
import com.dashi.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeDetailController
 */
@WebServlet("/noDetail.ad")
public class AdminNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String noticeNo = request.getParameter("nno");
		
		NoticeService nService = new NoticeService();
		
		int result = nService.increaseCount(noticeNo);
		
		if(result > 0) {
			Notice n = nService.selectNotice(noticeNo);
			//Attachment at = bService.selectAttachment(noticeNo);
			
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/notice/adminNoticeDetail.jsp").forward(request, response);
			
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항이 글 조회 실패");
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
