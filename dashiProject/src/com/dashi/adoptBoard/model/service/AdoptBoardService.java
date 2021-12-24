package com.dashi.adoptBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptBoard.model.dao.AdoptBoardDao;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;

public class AdoptBoardService {

	// 페이징처리할 게시글 수 얻어오는 메소드
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptBoardDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 메인페이지에 입양공고리스트 불러올 메소드
	public ArrayList<AdoptNotice> selectMainAdoptNotice(){
		Connection conn = getConnection();
		ArrayList<AdoptNotice> anList = new AdoptBoardDao().selectMainAdoptNotice(conn);
		close(conn);
		return anList;
	}
	
	
	// 입양공고 리스트 불러오는 메소드
	public ArrayList<AdoptNotice> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<AdoptNotice> selectNoticeThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().selectNoticeThumbnailList(conn, pi);
		close(conn);
		return list;
	}
	
	// 조회수 증가 메소드
	public int increaseCount(String boardNo) {
		
		Connection conn = getConnection();
		int result = new AdoptBoardDao().increaseCount(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 입양공고상세보기 메소드
	public AdoptNotice selectAdoptNotice(String boardNo) {
		Connection conn = getConnection();
		AdoptNotice an = new AdoptBoardDao().selectAdoptNotice(conn, boardNo);
		close(conn);
		return an;
	}
	
	// 첨부파일 불러오는 메소드
	public Attachment selectAttachment(String boardNo) {

		Connection conn = getConnection();
		Attachment at = new AdoptBoardDao().selectAttachment(conn, boardNo);
		close(conn);
		return at;
	}
	
	// 입양신청서 업로드 메소드
	public int insertAdoptApply(AdoptApply adp, Attachment at) {
		
		Connection conn = getConnection();
		
		// 신청서 업로드 확인
		int result1 = new AdoptBoardDao().insertAdoptApply(conn, adp);
		
		int result2 = 1;
		if(at != null) {
			result2 = new AdoptBoardDao().insertAttachment(conn, at);
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result1 * result2;
	}
		
	
	///////////////////입양공고 관련 메소드/////////////////////
	// 입양공고작성시 동물정보 불러오는 메소드(관)
	public Animal selectAnimalInfo(String animalNo) {
		Connection conn = getConnection();
		Animal a = new AdoptBoardDao().selectAnimalInfo(conn, animalNo);

		close(conn);
		return a;
	}
	
	// 입양공고 등록 메소드
	public int insertAdoptNotice(AdoptNotice adt, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new AdoptBoardDao().insertAdoptNotice(conn, adt);
		System.out.println("dao의 insertAdoptNotice메소드 확인하기");
		System.out.println("result1 :" + result1);
		// -----------여기까지 성공
		
		int result2 = new AdoptBoardDao().insertAttachmentList(conn, list);
		//int result2 = new BoardDao().insertAttachmentList(conn, list);
		System.out.println("result2 : "+result2);
		
		System.out.println("-------------------------------------------------------");
		if(result1>0 && result2>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1*result2;
	}
	
	// 관리페이지 입양공고 상세조회 메소드
	public AdoptNotice selectAdminAdoptNotice(String boardNo) {
		
		Connection conn = getConnection();
		AdoptNotice an = new AdoptBoardDao().selectAdminAdoptNotice(conn, boardNo);
		close(conn);
		return an;
	}
	
	// 관리자 입양공고상세조회시 첨부파일 리스트 불러올 메소드
	public ArrayList<Attachment> selectAttachmentList(String boardNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdoptBoardDao().selectAttachmentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	// 관리자 입양공고 삭제 메소드
	public int deleteAdoptNotice(String boardNo) {
		Connection conn = getConnection();
		int result = new AdoptBoardDao().deleteAdoptNotice(conn, boardNo);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 관리자 입양공고 수정 메소드
	public int updateAdoptNotice(AdoptNotice notice, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new AdoptBoardDao().updateAdoptNotice(conn, notice);
		System.out.println("service : "+result1);
		int result2 = 1;
		if(!list.isEmpty()) {
			result2 = new AdoptBoardDao().updateAttachmentList(conn, list);
		} 
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1*result2;
	}
	
	/////////////////입양신청관련메소드/////////////////////////
	
	// 입양신청글 갯수 알아오는 메소드
	public int selectAdoptApplyListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptBoardDao().selectAdoptApplyListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 관리자 입양신청리스트 알아오는 메소드
	public ArrayList<AdoptApply> selectAdoptApplyList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<AdoptApply> list = new AdoptBoardDao().selectAdoptApplyList(conn, pi);
		close(conn);
		return list;
	}
	
	// 입양신청서 상세보기
	public AdoptApply selectAdminAdoptApply(String boardNo) {
		Connection conn = getConnection();
		AdoptApply apply = new AdoptBoardDao().selectAdminAdoptApply(conn, boardNo);
		close(conn);
		return apply;
	}
	
	// 입양신청회원 상태변경(승인,반려 등) --> 질문하기!!
	public int adoptApplyStatusUpdate(int adpStatus, int memNo, String adpNo, String adtNo) {
		Connection conn = getConnection();
		
		// 입양공고에 상태 udpate
		int memGrade = 1;		// 멤버테이블에 업데이트할 등급
		String memAdoptYN = "N";	// 멤버테이블에 입양완료시 업데이트
		int adtYN = 1;			// 입양공고, 입양신청서에 업데이트
		String memPayYN = "N";	// 결제여부
		
		switch(adpStatus) {
		case 5:
		case 1: memGrade = 1; break;
		case 2: memGrade = 2; break;
		case 3: memGrade = 3; memPayYN="Y"; break;
		case 4: memGrade = 3; memPayYN="Y"; memAdoptYN = "Y"; break;
		}
		
		// adopt_apply 테이블에 업데이트(ADOPT_STATUS, PAY_STATUS)
		int result1 = new AdoptBoardDao().adoptApplyStatusUpdate(conn, adpStatus, adpNo, memPayYN);
		
		// adopt_notice 테이블에 업데이트(ADOPT_STATUS)
		int result2 = new AdoptBoardDao().adoptNoticeADTStatusUpdate(conn, adpStatus, adtNo);
		
		// adopt_animal 테이블에 업데이트(ADT_STATUS, ADOPT_DATE)
		int result3 = new AdoptBoardDao().adoptAnimalADTStatusUpdate(conn, memAdoptYN, adtNo);
		
		// mem_INFO 테이블에 업데이트(ADOPT_YN, PAY_YN, GRADE)
		int result4 = new AdoptBoardDao().adoptMemUpdate(conn, memAdoptYN, memGrade, memNo, memPayYN);
		
		System.out.println("adt apply : "+result1);
		System.out.println("adt notice : " + result2);
		System.out.println("adt animal : " + result3);
		System.out.println("adt member : " + result4);
		
		if(result1*result2*result3*result4>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1*result2*result3*result4;
	}
	
	
	// 입양신청서 검색하기
	public ArrayList<AdoptApply> searchAdoptApply(String categoryCtg, String searchCtg, String searchKey){
		Connection conn = getConnection();
		ArrayList<AdoptApply> list = new ArrayList<AdoptApply>();
		if(searchCtg.equals("adpNo")) {
			list = new AdoptBoardDao().searchAdoptApplyADPNO(conn, searchKey);
		} else if(searchCtg.equals("adtNo")){
			list = new AdoptBoardDao().searchAdoptApplyADTNO(conn, searchKey);
		} else if(searchCtg.equals("userId")){
			list = new AdoptBoardDao().searchAdoptApplyMEMID(conn, searchKey);
		}
		close(conn);
		return list;	
	}
	
	//입양신청서삭제하기
	public int deleteAdoptApply(String boardNo) {
		Connection conn = getConnection();
		int result = new AdoptBoardDao().deleteAdoptApply(conn, boardNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	// 입양공고검색하기
	public ArrayList<AdoptNotice> searchAdoptNotice(String searchCtg, String searchKey){
		int adtStatus = 0;
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		if(searchCtg.equals("adtTitle")) {
			list = new AdoptBoardDao().searchAdoptNoticeAdtTitle(conn, searchKey);
		
		}else if(searchCtg.equals("adtNo")) {
			list = new AdoptBoardDao().searchAdoptNoticeAdtNo(conn, searchKey);
		
		}else if(searchCtg.equals("adtStatus")) {
			
			if(searchKey.equals("승인대기")) {
				adtStatus = 1;
			}else if(searchKey.equals("신청승인")) {
				adtStatus = 2;
			}else if(searchKey.equals("결제대기")) {
				adtStatus = 2;
			}else if(searchKey.equals("결제완료")) {
				adtStatus = 3;
			}else if(searchKey.equals("입양완료")) {
				adtStatus = 4;
			}
		
			list = new AdoptBoardDao().searchAdoptNoticeAdtStatus(conn, adtStatus);
		} 
		close(conn);
		return list;
	}
	
	// 검색할 입양공고문 갯수
	public int selectSearchAdoptNoticeListCount(String animalCtg, String keyword) {
		Connection conn = getConnection();
		int listCount = new AdoptBoardDao().selectSearchAdoptNoticeListCount(conn, animalCtg, keyword);
		close(conn);
		return listCount;
	}
	
	// 사용자- 입양공고검색하기
	public ArrayList<AdoptNotice> searchAdoptNoticeList(PageInfo pi,String animalCtg, String keyword){
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().searchAdoptNoticeList(conn, pi, animalCtg, keyword);
		close(conn);
		return list;
		
	}
}
