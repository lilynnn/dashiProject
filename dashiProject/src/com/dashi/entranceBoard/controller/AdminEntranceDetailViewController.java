package com.dashi.entranceBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.common.model.vo.Attachment;
import com.dashi.entranceBoard.model.service.EntranceService;
import com.dashi.entranceBoard.model.vo.Entrance;

/**
 * Servlet implementation class AdminEntranceDetailViewController
 */
@WebServlet("/entDetail.ad")
public class AdminEntranceDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEntranceDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eno = request.getParameter("eno");
		
		Entrance e = new EntranceService().selectEntrance(eno);
		ArrayList<Attachment> list = new EntranceService().selectAttachmentList(eno);
		
		request.setAttribute("e", e);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/entranceBoard/adminEntranceDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
