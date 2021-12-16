package com.dashi.animalListBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/adoptNotice/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Animal a = new Animal();
			a.setEntNo(multiRequest.getParameter("entNo"));
			a.setAdoptStatus(multiRequest.getParameter("adoptStatus"));
			a.setAdoptDate(multiRequest.getParameter("adoptDate"));
			a.setAnimalAge(Integer.parseInt(multiRequest.getParameter("animalAge")));
			a.setAnimalVaccin(multiRequest.getParameter("animalVaccin"));
			a.setAnimalNeutral(multiRequest.getParameter("animalNuetral"));
			a.setAnimalDisease(multiRequest.getParameter("animalDisease"));
			a.setAnimalIssue(multiRequest.getParameter("animalIssue"));
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				//첨부파일 name 속성을 file1, file2, .. 로 전달
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptNotice/");
					
					if(i==1) {	//대표이미지 level 1로 세팅
						at.setAttachLevel(1);
					} else {	//상세이미지 level 2로 세팅
						at.setAttachLevel(2);
					}
				}
				
				int result = new AnimalListService().updateAnimalInfo(a, list);
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
