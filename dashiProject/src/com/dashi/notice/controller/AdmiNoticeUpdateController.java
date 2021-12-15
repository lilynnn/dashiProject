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
 * Servlet implementation class AdmiNoticeUpdateController
 */
@WebServlet("/noUpdate.ad")
public class AdmiNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmiNoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String noticeNo = request.getParameter("nno");
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
	
		Notice n = new Notice();
		
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) { //성공 => /jsp/detail.no?num=현재글번호 =>상세페이지
			
			request.getSession().setAttribute("alertMsg", "공지사항 수정에 성공했습니다!");
			response.sendRedirect(request.getContextPath() + "/noDetail.ad?nno=" + noticeNo);
			
		}else { // 실패=>에러페이지
			request.getSession().setAttribute("alertMsg", "공지사항이 수정 실패");
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
