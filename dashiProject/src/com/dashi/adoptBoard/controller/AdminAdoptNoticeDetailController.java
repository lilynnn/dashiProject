package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AdminAdoptNoticeDetailController
 */
@WebServlet("/adtdetail.ad")
public class AdminAdoptNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("adno");
		
		int result = new AdoptBoardService().increaseCount(boardNo);
		
		if(result>0) {	// 조회가능한 게시글
			
			AdoptNotice an = new AdoptBoardService().selectAdoptNotice(boardNo);
			Attachment at =  new AdoptBoardService().selectAttachment(boardNo);	
			
			
			request.setAttribute("an", an);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/adoptBoard/adminAdoptNoticeDetailView.jsp").forward(request, response);
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
