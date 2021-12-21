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
import com.dashi.dspBoard.model.vo.Category;
import com.dashi.dspBoard.model.vo.Dsp;

/**
 * Servlet implementation class dspUpdateController
 */
@WebServlet("/updateForm.dsp")
public class dspUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dspUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String dspNo = request.getParameter("dno");
		
		DspService dService = new DspService();
		ArrayList<Category> category = dService.selectCategoryList();
		Dsp d = dService.selectDsp(dspNo);
		ArrayList<Dsp> contentImgPath = dService.contentImgPath(dspNo);
		ArrayList<Attachment> list = dService.selectAttachmentList(dspNo);
		
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("d", d);
		request.setAttribute("contentImgPath", contentImgPath);
		System.out.println(contentImgPath);

		
		request.getRequestDispatcher("views/dspBoard/dspUpdateForm.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
