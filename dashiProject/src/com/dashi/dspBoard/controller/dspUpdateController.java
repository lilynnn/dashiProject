package com.dashi.dspBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.service.DspService;
import com.dashi.dspBoard.model.vo.Dsp;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class dspUpdateFormController
 */
@WebServlet("/update.dsp")
public class dspUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dspUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("서블릿 실행 ");
		request.setCharacterEncoding("UTF-8");
		
		//enctype타입이 multipart/form-data인지 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			System.out.println("if문 안");
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/dspThumb/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			//새롭게 넘어온값 담기
			Dsp d = new Dsp();
			String dspNo = multiRequest.getParameter("dno");
			d.setDspNo(multiRequest.getParameter("dno"));  					// 게시글 번호
			d.setCtg(multiRequest.getParameter("animal-category")); 		// 실종 보호 목격 카테고리
			d.setDspTitle(multiRequest.getParameter("title")); 				// 글제목
			d.setVariety(multiRequest.getParameter("animal_type"));			// 분류
			d.setAge(multiRequest.getParameter("animal_age"));				//나이
			d.setWeight(multiRequest.getParameter("animal_weight"));		//몸무게
			d.setGender(multiRequest.getParameter("animal_gender"));		//성별
			d.setIssueDate(multiRequest.getParameter("missing_date"));		//실종일
			d.setLocationName(multiRequest.getParameter("location"));		//지역
			d.setMoney(Integer.parseInt(multiRequest.getParameter("money"))); // 사례금
			d.setIssue(multiRequest.getParameter("characteristic"));		//특이사항
			d.setEtc(multiRequest.getParameter("ect"));						//기타사항
			d.setPhone(multiRequest.getParameter("phone"));					// 전화번호
	
			
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			Attachment at = null;

			
			for(int i=1; i<=5; i++) {
				String key = "file"+i;
				//넘어온 파일이 있을경우
				if(multiRequest.getOriginalFileName(key) != null) { // 새로이 넘어온 첨부파일이 있을 경우 
					at = new Attachment();
					
					// 기존의 첨부파일이 있었을 경우
					if(multiRequest.getParameter("originFileNo"+ i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo" + i));
					} 
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/dspThumb/");
					at.setRefNo(dspNo);
					if(i == 1) {
						at.setAttachLevel(1);
					} else {
						at.setAttachLevel(2);
					}
					list.add(at);
				 }

			}

			System.out.println("리스트 : " + list);
			
			int result = new DspService().updateDsp(d, list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글이 수정되었습니다..");
				response.sendRedirect(request.getContextPath()+"/list.dsp?cpage=1");
			} else {
				request.getSession().setAttribute("alertMsg", "게시글 수정에 실패했습니다.");
				response.sendRedirect(request.getContextPath()+"/detail.dsp?dno="+ dspNo);
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
