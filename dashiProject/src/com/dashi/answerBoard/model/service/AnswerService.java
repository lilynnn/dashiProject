package com.dashi.answerBoard.model.service;

import java.sql.Connection;

import com.dashi.answerBoard.model.dao.AnswerDao;

public class AnswerService {
	
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
