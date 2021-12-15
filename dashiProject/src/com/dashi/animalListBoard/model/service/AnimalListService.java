package com.dashi.animalListBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.animalListBoard.model.dao.AnimalListDao;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.PageInfo;

public class AnimalListService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AnimalListDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Animal> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Animal> list = new AnimalListDao().selectList(conn, pi);
		close(conn);
		return list;
	}
}
