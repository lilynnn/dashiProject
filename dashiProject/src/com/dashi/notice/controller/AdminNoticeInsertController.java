package com.dashi.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.notice.model.service.NoticeService;
import com.dashi.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/noInsert.ad")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String noSelect = request.getParameter("noSelect");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 로그인한 회원 정보 얻어내는방법 기술해야됨
		HttpSession session = request.getSession();
		String mnNo = ((Notice)session.getAttribute("loginAdmin")).getMnNo();
		
		Notice n = new Notice();
		n.setNoticeYN(noSelect);
		n.setNoticeTitle(title);
		n.setNoticeContent(content);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항 글 등록이 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/noList.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 글 등록에 실패했습니다.");
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
