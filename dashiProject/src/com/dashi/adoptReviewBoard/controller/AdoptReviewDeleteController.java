package com.dashi.adoptReviewBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptReviewBoard.model.service.AdoptReviewBoardService;

/**
 * Servlet implementation class AdoptReviewDeleteController
 */
@WebServlet("/delete.ar")
public class AdoptReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arlistNo = request.getParameter("arno");
		
		int result = new AdoptReviewBoardService().deleteReview(arlistNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 입양후기를 삭제했습니다.");
			request.getRequestDispatcher("/list.ar?cpage=1").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "입양후기 삭제 실패");
			request.getRequestDispatcher("/list.ar?cpage=1").forward(request, response);
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
