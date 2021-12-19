package com.dashi.answerBoard.model.service;

import java.util.ArrayList;
import java.sql.Connection;
import static com.dashi.common.JDBCTemplate.*;

import com.dashi.answerBoard.model.dao.AnswerDao;
import com.dashi.answerBoard.model.vo.Answer;

public class AnswerService {
	
	// 1대1 전체조회 
	public ArrayList<Answer> selectAnswerList() {
		Connection conn = getConnection();
		
		ArrayList<Answer> list = new AnswerDao().selectAnswerList(conn);
		
		close(conn);
		
		return list;
		
	}
	

	//1대1 등록
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
	}
	
}
