package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AdminAdoptApplyDetailController
 */
@WebServlet("/adpdetail.ad")
public class AdminAdoptApplyDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptApplyDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("apno");
		
		AdoptApply apply = new AdoptBoardService().selectAdminAdoptApply(boardNo);
		Attachment at = new AdoptBoardService().selectAttachment(boardNo);
		request.setAttribute("apply", apply);
		request.setAttribute("at", at);
		System.out.println(apply);
		System.out.println(at);
		
		request.getRequestDispatcher("views/adoptBoard/adminAdoptApplyDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
