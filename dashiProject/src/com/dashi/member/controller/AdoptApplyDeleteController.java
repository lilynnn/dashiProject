package com.dashi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;

/**
 * Servlet implementation class AdoptApplyDeleteController
 */
@WebServlet("/delete.adp")
public class AdoptApplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptApplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adpNo = request.getParameter("adpno");
		
		int result = new AdoptBoardService().deleteAdoptApply(adpNo);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "입양신청글 삭제가 완료되었습니다.");
			request.getRequestDispatcher("mypage.me").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "입양신청글 삭제에 실패했습니다.");
			request.getRequestDispatcher("mypage.me").forward(request, response);
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
