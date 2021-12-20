package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;

/**
 * Servlet implementation class AdminAdoptNoticeDeleteController
 */
@WebServlet("/adtdelete.ad")
public class AdminAdoptNoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptNoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String boardNo = request.getParameter("adno");
		int result = new AdoptBoardService().deleteAdoptNotice(boardNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "입양공고글 삭제가 완료되었습니다.");
			request.getRequestDispatcher("adlist.ad?cpage=1").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "입양공고글 삭제에 실패했습니다.");
			request.getRequestDispatcher("main.ad").forward(request, response);
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
