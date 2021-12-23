package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;

/**
 * Servlet implementation class AdminAdoptApplyDeleteController
 */
@WebServlet("/adpdelete.ad")
public class AdminAdoptApplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptApplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String boardNo = request.getParameter("adno");
		int result = new AdoptBoardService().deleteAdoptApply(boardNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "입양신청글 삭제가 완료되었습니다.");
			request.getRequestDispatcher("adplist.ad?cpage=1").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "입양신청글 삭제에 실패했습니다.");
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
