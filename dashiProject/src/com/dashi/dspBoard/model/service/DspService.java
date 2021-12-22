package com.dashi.dspBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.dao.DspDao;
import com.dashi.dspBoard.model.vo.Category;
import com.dashi.dspBoard.model.vo.Dsp;

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
	public ArrayList<Dsp> selectDspList() {
		Connection conn = getConnection();
		ArrayList<Dsp> list = new DspDao().selectDspList(conn);
		
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
	
	public int updateDsp(Dsp d, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new DspDao().updateDsp(conn,d);
		int result2 = 1;
		return result1 * result2;
	}

	

	

}
