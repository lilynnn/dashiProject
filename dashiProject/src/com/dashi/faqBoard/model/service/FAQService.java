package com.dashi.faqBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.faqBoard.model.dao.FAQDao;
import com.dashi.faqBoard.model.vo.FAQ;

public class FAQService {
	
	public ArrayList<FAQ> selectFAQList(){
		
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn);
		close(conn);
		return list;	
		
	} // faq전체조회
	
	
	
	

}
