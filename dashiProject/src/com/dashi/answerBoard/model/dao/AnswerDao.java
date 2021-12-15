package com.dashi.answerBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.dashi.common.JDBCTemplate.*;

public class AnswerDao {
	
	private Properties prop = new Properties();

	String filePath = AnswerDao.class.getResource("/db/sql/answer-mapper.xml").getPath();
	
	try {
		prop.loadFromXML(new FileInputStream(filePath));
	} catch (IOException e) {
		e.printStackTrace();
		}	
	}
}
