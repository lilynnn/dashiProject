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
		
	
	
}
