package com.dashi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.common.model.vo.Attachment;
import com.dashi.member.model.service.MemberService;

/**
 * Servlet implementation class AdoptApplyDetailController
 */
@WebServlet("/detail.adp")
public class AdoptApplyDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptApplyDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String adpNo = request.getParameter("adpno");
		
		AdoptApply adp = new MemberService().selectAdoptApply(adpNo);
		Attachment at = new AdoptBoardService().selectAttachment(adpNo);
		
		request.setAttribute("at", at);
		request.setAttribute("adp", adp);
		
		request.getRequestDispatcher("views/member/adoptApplyDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
