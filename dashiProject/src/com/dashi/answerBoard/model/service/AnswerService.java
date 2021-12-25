package com.dashi.answerBoard.model.service;

import java.util.ArrayList;
import java.sql.Connection;
import static com.dashi.common.JDBCTemplate.*;

import com.dashi.answerBoard.model.dao.AnswerDao;
import com.dashi.answerBoard.model.vo.Answer;
import com.dashi.notice.model.dao.NoticeDao;

public class AnswerService {
	
	public ArrayList<Answer> selectAnswerList(){
		
		Connection conn = getConnection();
		ArrayList<Answer> list = new AnswerDao().selectAnswerList(conn);
		close(conn);
		
		
		return list;	
		
	} // 1) answer 사용자 전체조회
	
	
	public int insertAnswer(Answer a) {
		
		Connection conn = getConnection();
		int result = new AnswerDao().insertAnswer(conn, a);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // 2) answer 사용자 등록
	
	public Answer selectDetailAnswer(String answerNo) {
		Connection conn = getConnection();
		Answer n = new AnswerDao().selectDetailAnswer(conn, answerNo);
		close(conn);
		return n;
	} // 3) answer 상세조회
	
	public int increaseCount(String answerNo) {
		Connection conn = getConnection();
		int result = new AnswerDao().increaseCount(conn, answerNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		} return result;
		
	}// 4) 게시판 조회수 증가
		
	public int deleteAnswer(String answerNo) {
		Connection conn = getConnection();
		int result = new AnswerDao().deleteAnswer(conn, answerNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}//   삭제
	

	public int updateAnswer(Answer n) {
		Connection conn = getConnection();
		int result = new AnswerDao().updateAnswer(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	} //수정
	
	
}
