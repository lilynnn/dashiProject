package com.dashi.dspBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.dspBoard.model.dao.DspDao;
import com.dashi.dspBoard.model.vo.Category;
import com.dashi.dspBoard.model.vo.Dsp;
import com.dashi.dspBoard.model.vo.DspReply;

public class DspService {

	//실종보호목격 글 입력 메소드
	public int insertDsp(Dsp d, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new DspDao().insertDsp(conn, d);
		
		int result2 = new DspDao().insertDspAttachment(conn, list);	
	
		if(
			result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			
		close(conn);
			
		return result1 * result2;
	
	}
	
	// 목록 조회 메소드
	public ArrayList<Dsp> selectDspList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Dsp> list = new DspDao().selectDspList(conn, pi);
		
		close(conn);
		return list;
		
		
		
	}
	
	// 조회수 증가 메소드
	public int increasCount(String dspNo) {
		Connection conn = getConnection();
		int result = new  DspDao().increaseCount(conn, dspNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 상세조회 시 정보 가져오는 메소드
	public Dsp selectDsp(String dspNo) {
		Connection conn = getConnection();
		Dsp d = new DspDao().selectDsp(conn, dspNo);
		close(conn);
		return d;
	}

	// 상세조회 시 첨부파일 가져오는 메소드
	public ArrayList<Attachment> selectAttachmentList(String dspNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new DspDao().selectAttachmentList(conn, dspNo);
		close(conn);
		return list;
	}

	
	// 실종 보호 목격 눌렀을시 메소드
	public ArrayList<Dsp> ctgList(String ctg) {
		Connection conn = getConnection();
		ArrayList<Dsp> list = new DspDao().ctgList(conn, ctg);
		close(conn);
		return list;
		
	}
	// 실종보호 목격 카테고리 불러오기
	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		ArrayList<Category> Category = new DspDao().selectCategoryList(conn);
		close(conn);
		return Category;
	}
	
	// 상세이미지 경로 따오는 메소드
	public ArrayList<Dsp> contentImgPath(String dspNo) {
		Connection conn = getConnection();
		ArrayList<Dsp> contentImgPath = new DspDao().contentImgPath(conn, dspNo);
		close(conn);
		
		return contentImgPath;
	}
	
	
	//게시글 수정메소드
	public int updateDsp(Dsp d, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new DspDao().updateDsp(conn,d);
		
		int result2 = 1;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getAttachNo() != null) {
				result2 = new DspDao().updateAttachmentList(conn,list.get(i));
			}else {
				result2 = new DspDao().insertNewAttachmentList(conn,list.get(i));

			}
		}
		

		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//게시글 삭제 메소드
	public int deleteDsp(String dspNo) {
		Connection conn = getConnection();
		int result = new DspDao().deleteDsp(conn, dspNo);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	//페이징바 만들때 전체게시글 갯수조회
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new DspDao().selectListCount(conn);
		close(conn);
		return listCount;
	}

	//----------------댓글 관련---------------------------
	//댓글작성
	public int insertReply(DspReply dr) {
		Connection conn = getConnection();
		int result = new DspDao().insertReply(conn, dr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 댓글 전체 조회
	public ArrayList<DspReply> selectReplyList(String dspNo) {
		
		Connection conn = getConnection();
		ArrayList<DspReply> list = new DspDao().selectReplyList(conn, dspNo);
		close(conn);
		return list;
	}

	// 댓글삭제
	public int deleteReply(String replyNo) {
		Connection conn = getConnection();
		int result = new DspDao().deleteReply(conn, replyNo);
		close(conn);
		return result;
	
	
	}

	

	

}
