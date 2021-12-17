package com.dashi.dspBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.service.DspService;
import com.dashi.dspBoard.model.vo.Dsp;

/**
 * Servlet implementation class dpsDetailViewController
 */
@WebServlet("/detail.dsp")
public class dpsDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dpsDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String dspNo = request.getParameter("dspno");
		
		DspService dService = new DspService();
		int result = dService.increasCount(dspNo);
		
		if(result > 0) {// 성공 => 유효한게시글 => 상세페이지
			Dsp d = dService.selectDsp(dspNo);
			ArrayList<Attachment> list = dService.selectAttachmentList(dspNo);
			
			request.setAttribute("d", d);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/dspBoard/dspDetailView.jsp").forward(request, response);
		}else {
			
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
