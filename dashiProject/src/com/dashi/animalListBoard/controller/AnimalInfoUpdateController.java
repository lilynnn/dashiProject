package com.dashi.animalListBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.animalListBoard.model.service.AnimalListService;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AnimalInfoUpdateController
 */
@WebServlet("/anupdate.ad")
public class AnimalInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/animalList/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Animal a = new Animal();
			a.setEntNo(multiRequest.getParameter("entNo"));
			a.setAdoptStatus(multiRequest.getParameter("adoptStatus"));
			a.setAdoptDate(multiRequest.getParameter("adoptDate"));
			a.setAnimalAge(Integer.parseInt(multiRequest.getParameter("animalAge")));
			a.setAnimalVaccin(multiRequest.getParameter("animalVaccin"));
			a.setAnimalNeutral(multiRequest.getParameter("animalNeutral"));
			a.setAnimalDisease(multiRequest.getParameter("animalDisease"));
			a.setAnimalIssue(multiRequest.getParameter("animalIssue"));
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setPath("resources/upfiles/animalList/");
				at.setAttachLevel(1);
				at.setRefNo(multiRequest.getParameter("entNo"));

				if(multiRequest.getParameter("originFileNo") != null) {
					// ?????? ???????????? ?????? ??????
					at.setAttachNo(multiRequest.getParameter("originFileNo"));
					System.out.println("originFileNo");
				} else {
					// ??????????????? ???????????? ???????????????
					at.setRefNo(multiRequest.getParameter("entNo"));
				}

			}
			System.out.println("at : "+at);
			
			int result = new AnimalListService().updateAnimalInfo(a, at);
			System.out.println(at);
			if(result > 0) {	// ???????????? ??????
				request.getSession().setAttribute("alertMsg", "????????????????????? ??????????????? ?????????????????????.");
				response.sendRedirect(request.getContextPath() + "/andetail.ad?ano="+a.getEntNo());
			} else {	// ???????????? ??????
				request.getSession().setAttribute("alertMsg", "????????????????????? ??????????????????.");
				response.sendRedirect(request.getContextPath() + "/anlist.ad?cpage=1");
			}
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
