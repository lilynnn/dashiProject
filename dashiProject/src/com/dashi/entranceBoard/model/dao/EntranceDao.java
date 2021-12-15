package com.dashi.entranceBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.dashi.common.JDBCTemplate.*;


public class EntranceDao {
	
	private Properties prop = new Properties();
	
	String filePath = EntranceDao.class.getResource("/db/sql/entrance-mapper.xml").getPath();
	
	try {
		prop.loadFromXML(new FileInputStream(filePath));
	} catch (IOException e) {
		e.printStackTrace();
		}
	}
}
