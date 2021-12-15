package com.dashi.adoptBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptNotice;

/**
 * Servlet implementation class AdoptDetailController
 */
@WebServlet("/addetail.adt")
public class AdoptDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("adtno");
		
		int result = new AdoptBoardService().increaseCount(boardNo);

				
		if(result>0) {	// 로드할 수 있는 게시글 -> 게시글, 첨부파일 조회
			//일단 먼저 게시글 조회만 하기
			AdoptNotice an = new AdoptBoardService().selectAdoptNotice(boardNo);
			
			// 첨부파일 조회
			// Attachment at
			
			request.setAttribute("an", an);
			
			
			request.getRequestDispatcher("views/adoptBoard/adoptDetailView.jsp").forward(request, response);
		}
		else {
			
			
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
