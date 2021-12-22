package com.dashi.dspBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.dspBoard.model.service.DspService;

/**
 * Servlet implementation class dspDeleteController
 */
@WebServlet("/delete.dsp")
public class dspDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dspDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dspNo = request.getParameter("dno");
		System.out.println(dspNo);
		int result = new DspService().deleteDsp(dspNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			request.getRequestDispatcher("list.dsp?cpage=1").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "게시글삭제에 실패했습니다.");
			request.getRequestDispatcher("list.dsp?cpage=1").forward(request, response);
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
