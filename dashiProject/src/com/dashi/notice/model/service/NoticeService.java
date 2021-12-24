package com.dashi.notice.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.notice.model.dao.NoticeDao;
import com.dashi.notice.model.vo.Notice;

public class NoticeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;		
	} // 공지사항 총 게시글 갯수 조회
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	} // 게시글 수 만큼(10개)조회

	public int increaseCount(String noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}// 게시판 조회수 증가
	
	public Notice selectNotice(String noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
		
	} // 게시글 상세조회
	
	public Attachment selectAttachment(String noticeNo) {
		Connection conn = getConnection();
		Attachment at = new NoticeDao().selectAttachment(conn, noticeNo);
		close(conn);
		return at;
		
	} // 게시글 상세조회
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	} // 공지사항 수정
	
	public ArrayList<Notice> searchNotice(String keyword){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchNotice(conn, keyword);
		close(conn);
		return list;
		
	}// 공지사항 키워드 검색 ---- 미완성
	
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		int result1 = new NoticeDao().insertNotice(conn, n);
		int result2 = 1;
		
		if(at != null) {
			result2 = new NoticeDao().insertAttachment(conn, at);
		}
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	
	}// 공지사항 작성
	
	
	public int deleteNotice(String noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}// 공지사항 삭제
	
	public int noInNotice(String noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().noInNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} //공지사항의 공지 등록
	
	public int cancleNotice(String noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().cancleNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} //공지사항의 공지등록취소
	
	public int selectCount() {
		Connection conn = getConnection();
		int noCount = new NoticeDao().selectCount(conn);
		close(conn);
		return noCount;
	} // 관리자 메인페이지 숫자 알아오기
	
	public String selectDate() {
		Connection conn = getConnection();
		String noDate = new NoticeDao().selectDate(conn);
		close(conn);
		return noDate;
	} // 관리자 메인페이지 날짜 알아오기
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
