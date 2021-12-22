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

import javafx.scene.control.Alert;

/**
 * Servlet implementation class dpsInsertController
 */
@WebServlet("/insert.dsp")
public class dpsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dpsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//첨부파일 최대용량
			int maxSize = 10 * 1024 * 1024;
			
			// 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/dspThumb/");
			
			// 전달된 값 파일 업로드
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		
			//db에 기록할 값 뽑기
			Dsp d = new Dsp();
			d.setMemNo(multipartRequest.getParameter("userNo"));  				// 작성한 회원번호
			d.setNickName(multipartRequest.getParameter("nickname")); 			// 작성자 닉네임
			d.setCtg(multipartRequest.getParameter("animal-category")); 		// 실종 보호 목격 카테고리
			d.setDspTitle(multipartRequest.getParameter("title")); 				// 글제목
			d.setVariety(multipartRequest.getParameter("animal_type"));			// 분류
			d.setAge(multipartRequest.getParameter("animal_age"));				//나이
			d.setWeight(multipartRequest.getParameter("animal_weight"));		//몸무게
			d.setGender(multipartRequest.getParameter("animal_gender"));		//성별
			d.setIssueDate(multipartRequest.getParameter("missing_date"));		//실종일
			d.setLocationName(multipartRequest.getParameter("location"));		//지역
			d.setMoney(Integer.parseInt(multipartRequest.getParameter("money"))); // 사례금
			d.setIssue(multipartRequest.getParameter("characteristic"));		//특이사항
			d.setEtc(multipartRequest.getParameter("ect"));						//기타사항
			d.setPhone(multipartRequest.getParameter("phone"));
	
			
			
			// attachment  값 뽑기
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1 ; i<=5 ; i++) {
				String key = "file" + i;
				
				
				if(multipartRequest.getOriginalFileName(key) != null) {
					//첨부파일이 있을경우 at생성
					Attachment at = new Attachment();
					at.setOriginName(multipartRequest.getOriginalFileName(key));
					at.setChangeName(multipartRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/dspThumb/");
					
					if(i == 1) { // 대표이미지
						at.setAttachLevel(1);
					}else { // 상세이미지
						at.setAttachLevel(2);
					}
					list.add(at);
				}
			}
			
			
			int result = new DspService().insertDsp(d, list);
		
			if(result>0) { //성공
				request.getSession().setAttribute("alertMsg", "게시글등록에 성공했습니다!");
				response.sendRedirect(request.getContextPath() + "/list.dsp");
			}else {
				request.getSession().setAttribute("alertMsg", "게시글등록에 실패했습니다ㅠㅠㅠ");
				response.sendRedirect(request.getContextPath() + "/list.dsp");
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
