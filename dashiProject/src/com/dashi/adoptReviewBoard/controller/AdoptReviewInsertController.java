package com.dashi.adoptReviewBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.adoptReviewBoard.model.service.AdoptReviewBoardService;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdoptReviewInsertController
 */
@WebServlet("/insert.ar")
public class AdoptReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송용량제한(10mb)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("resources/upfiles/adoptReview/");
			
			// 2. 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. DB에 기록할 값 뽑기
			// AdoptReview insert
			AdoptReview ar = new AdoptReview();
			ar.setMemNo(Integer.parseInt(multiRequest.getParameter("userNo")));
			ar.setMemId(multiRequest.getParameter("userId"));
			ar.setNickname(multiRequest.getParameter("nickname"));
			ar.setAnType(multiRequest.getParameter("animal"));
			ar.setArTitle(multiRequest.getParameter("title"));
			ar.setArContent(multiRequest.getParameter("content"));
			
			// Attachment에 여러번 insert할 데이터 뽑기
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이 존재할 경우
					// Attachment 생성 + 원본명, 수정명, 폴더경로, 파일레벨 담아서 => list에 쌓기
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptReview/");	
					
					if(i == 1) { // 대표이미지일 경우
						at.setAttachLevel(1);
					}else { // 상세이미지일 경우
						at.setAttachLevel(2);
					}
					list.add(at);
				}
			}
			
			int result = new AdoptReviewBoardService().insertThumbnailAdoptReview(ar, list);
			
			if(result > 0) { // 성공 => /loveagain/list.ar 	url요청 => 목록페이지
				
				request.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.ar");
				
			}else { // 실패 => 에러페이지
				
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
