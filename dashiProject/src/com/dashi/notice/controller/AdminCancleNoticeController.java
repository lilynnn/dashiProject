package com.dashi.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminCancleNoticeController
 */
@WebServlet("/cancleNotice.ad")
public class AdminCancleNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCancleNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeNo = request.getParameter("nno");
		
		int result = new NoticeService().cancleNotice(noticeNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지 등록 취소.");
			response.sendRedirect(request.getContextPath() + "/noList.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "일반게시글 전환 실패!");
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
