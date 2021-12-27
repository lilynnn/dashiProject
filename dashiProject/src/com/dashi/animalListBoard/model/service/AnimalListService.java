package com.dashi.animalListBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptBoard.model.dao.AdoptBoardDao;
import com.dashi.animalListBoard.model.dao.AnimalListDao;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;
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
	
	public Animal selectAnimalInfo(String animalNo) {
		Connection conn = getConnection();
		Animal a = new AnimalListDao().selectAnimalInfo(conn, animalNo);
		close(conn);
		return a;
	}
	
	// 수정확인하기
	public Attachment selectAttachment(String animalNo) {
		Connection conn = getConnection();
		Attachment at = new AnimalListDao().selectAttachment(conn, animalNo);
		close(conn);
		return at;
	}
	
	//첨부파일 list로 불러오기
	public ArrayList<Attachment> selectAttachmentList(String animalNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AnimalListDao().selectAttachmentList(conn, animalNo);
		close(conn);
		return list;
	}
	
	
	public int updateAnimalInfo(Animal a, Attachment at) {
		
		Connection conn = getConnection();
		int result1 = new AnimalListDao().updateAnimalInfo1(conn, a);
		int result2 = new AnimalListDao().updateAnimalInfo2(conn, a);
		
		int result3 = 1;
		
		if( at != null ) {	// 새로운 첨부파일이 존재하는 경우
			
			if(at.getAttachNo() != null) {	// 기존 첨부파일이 존재하는 경우
				result3 = new AnimalListDao().updateAttachment(conn, at);
			} else {	// 존재하지 않을 때
				result3 = new AnimalListDao().insertAttachment(conn, at);
			}
		}
		
		int animalResult = result1*result2;
		
		if( animalResult > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return animalResult*result3;
	
	}
	
	public String selectaniDate() {
		Connection conn = getConnection();
		String aniDate = new AnimalListDao().selectaniDate(conn);
		close(conn);
		return aniDate;
	}
	
	public int selectSearchAnimalListCount(String animalType, String key) {
		Connection conn = getConnection();

		int listCount = new AnimalListDao().selectSearchAnimalListCount(conn, animalType, key);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Animal> selectSearchAnimalList(PageInfo pi, String animalType, String key){
		Connection conn = getConnection();
		ArrayList<Animal> list = new AnimalListDao().selectSearchAnimalList(conn , pi, animalType, key);
		close(conn);
		return list;
	}
}
