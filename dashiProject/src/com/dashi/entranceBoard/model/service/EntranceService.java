package com.dashi.entranceBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.entranceBoard.model.dao.EntranceDao;
import com.dashi.entranceBoard.model.vo.Entrance;
import com.dashi.notice.model.dao.NoticeDao;
import com.dashi.notice.model.vo.Notice;

public class EntranceService {

	public int insertEntrance(Entrance e, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new EntranceDao().insertEntrance(conn, e);
		int result2 = new EntranceDao().insertAttachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
		
	} // 입소게시글 등록
	
	public ArrayList<Entrance> selectEntranceList(int userNo){
		Connection conn = getConnection();
		ArrayList<Entrance> list = new EntranceDao().selectEntranceList(conn, userNo);
		close(conn);
		return list;
	} // 입소신청 게시글 조회해오기
	
	public ArrayList<Attachment> selectAttachmentList(String eno){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new EntranceDao().selectAttachmentList(conn, eno);
		close(conn);
		return list;
		
	}// 여러파일 담겨있는 게시글 읽어오기
	
	public Entrance selectEntrance(String eno) {
		Connection conn = getConnection();
		Entrance b = new EntranceDao().selectEntrance(conn, eno);
		close(conn);
		return b;
	} //게시글 상세조회
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new EntranceDao().selectListCount(conn);
		close(conn);
		return listCount;		
	} // 공지사항 총 게시글 갯수 조회
	
	public ArrayList<Entrance> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Entrance> list = new EntranceDao().selectList(conn, pi);
		close(conn);
		return list;
	} // 게시글 수 만큼(10개)조회
	
	public int updateEntrance(Entrance e, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new EntranceDao().updateEntrance(conn, e);
		//--여기까지 board테이블에 게시글 수정		
		
		int result2 = 1;
		
		if(!list.isEmpty()) { 
			// 기존 첨부파일 업데이트
			result2 = new EntranceDao().updateAttachment(conn, list);				
		}
	
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result1 * result2;
		
		
	} //게시글 수정 밑 첨부파일 수정,등록
	
	public int deleteEntrance(String eno) {
		Connection conn = getConnection();
		
		int result1 = new EntranceDao().deleteEntrance(conn, eno);
		int result2 = new EntranceDao().deleteAttachment(conn, eno);
		
		if(result1 > 0 && result2 > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	} // 게시글 삭제
	
	public int confirmEntrance(String eno) {
		Connection conn = getConnection();
		int result = new EntranceDao().confirmEntrance(conn, eno);
		
		if(result > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // 입소 승인
	
	public int rejectEntrance(String eno) {
		Connection conn = getConnection();
		int result = new EntranceDao().rejectEntrance(conn, eno);
		
		if(result > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // 입소 승인
	
	public String selectDate() {
		Connection conn = getConnection();
		String noDate = new EntranceDao().selectDate(conn);
		close(conn);
		return noDate;
	} // 관리자 메인페이지 날짜 알아오기
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
