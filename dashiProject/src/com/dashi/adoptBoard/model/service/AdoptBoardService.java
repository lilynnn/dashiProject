package com.dashi.adoptBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptBoard.model.dao.AdoptBoardDao;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;

public class AdoptBoardService {

	// 페이징처리할 게시글 수 얻어오는 메소드
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptBoardDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 입양공고 리스트 불러오는 메소드
	public ArrayList<AdoptNotice> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<AdoptNotice> selectNoticeThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().selectNoticeThumbnailList(conn, pi);
		close(conn);
		return list;
	}
	
	// 조회수 증가 메소드
	public int increaseCount(String boardNo) {
		
		Connection conn = getConnection();
		int result = new AdoptBoardDao().increaseCount(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 입양공고상세보기 메소드
	public AdoptNotice selectAdoptNotice(String boardNo) {
		Connection conn = getConnection();
		AdoptNotice an = new AdoptBoardDao().selectAdoptNotice(conn, boardNo);
		close(conn);
		return an;
	}
	
	// 첨부파일 불러오는 메소드 (입양공고 상세보기)
	public Attachment selectAttachment(String boardNo) {

		Connection conn = getConnection();
		Attachment at = new AdoptBoardDao().selectAttachment(conn, boardNo);
		close(conn);
		return at;
	}
	
	// 입양신청서 업로드 메소드
	public int insertAdoptApply(AdoptApply adp, Attachment at) {
		
		Connection conn = getConnection();
		
		// 신청서 업로드 확인
		int result1 = new AdoptBoardDao().insertAdoptApply(conn, adp);
		
		int result2 = 1;
		if(at != null) {
			result2 = new AdoptBoardDao().insertAttachment(conn, at);
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result1 * result2;
	}
		
	
///////////////////입양공고 관련 메소드/////////////////////
	public Animal selectAnimalInfo(String animalNo) {
		Connection conn = getConnection();
		Animal a = new AdoptBoardDao().selectAnimalInfo(conn, animalNo);

		close(conn);
		return a;
	}
	
	public int insertAdoptNotice(AdoptNotice adt, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new AdoptBoardDao().insertAdoptNotice(conn, adt);
		System.out.println("dao의 insertAdoptNotice메소드 확인하기");
		System.out.println("result1 :" + result1);
		// -----------여기까지 성공
		
		int result2 = new AdoptBoardDao().insertAttachmentList(conn, list);
		//int result2 = new BoardDao().insertAttachmentList(conn, list);
		System.out.println("result2 : "+result2);
		
		System.out.println("-------------------------------------------------------");
		if(result1>0 && result2>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1*result2;
	}
	
	public AdoptNotice selectAdminAdoptNotice(String boardNo) {
		
		Connection conn = getConnection();
		AdoptNotice an = new AdoptBoardDao().selectAdminAdoptNotice(conn, boardNo);
		close(conn);
		return an;
	}
	
	public ArrayList<Attachment> selectAttachmentList(String boardNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdoptBoardDao().selectAttachmentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int deleteAdoptNotice(String boardNo) {
		Connection conn = getConnection();
		int result = new AdoptBoardDao().deleteAdoptNotice(conn, boardNo);
		close(conn);
		return result;
	}
	
	public int updateAdoptNotice(AdoptNotice notice, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new AdoptBoardDao().updateAdoptNotice(conn, notice);
		System.out.println("service : "+result1);
		int result2 = 1;
		if(!list.isEmpty()) {
			result2 = new AdoptBoardDao().updateAttachmentList(conn, list);
		} 
		System.out.println("result1 : " + result1);
		System.out.println("result2 : " + result2);
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1*result2;
	}
}
