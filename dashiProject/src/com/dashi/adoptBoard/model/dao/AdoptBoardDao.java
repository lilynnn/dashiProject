package com.dashi.adoptBoard.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;

public class AdoptBoardDao {
	
	private Properties prop = new Properties();
			
	public AdoptBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdoptBoardDao.class.getResource("/db/sql/adoptnotice-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 메인 화면 입양공고리스트 불러올 메소드
	public ArrayList<AdoptNotice> selectMainAdoptNotice(Connection conn){
		
		ArrayList<AdoptNotice> anList = new ArrayList<AdoptNotice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 5);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				anList.add(new AdoptNotice(rset.getString("ANLIST_NO"),
						 rset.getString("AN_TITLE"),
						 rset.getInt("VIEW_COUNT"),
						 rset.getInt("ADT_STATUS"),
						 rset.getString("ANIMAL_TYPE"),
						 rset.getString("ENT_NO"),
						 rset.getString("TITLEIMG")
						 ));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		return anList;
	}
	
	// 전체 입양공고글 수 알아오는 메소드
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 입양공고리스트 메소드
	public ArrayList<AdoptNotice> selectList(Connection conn, PageInfo pi){
		
		// select -> ResultSet -> ArrayList<AdoptNotice>
		
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO")
										,rset.getString("AN_TITLE")
										,rset.getString("WRITE_DATE")
										,rset.getInt("VIEW_COUNT")
										,rset.getString("ENT_NO")
										,rset.getInt("ADT_STATUS")
										,rset.getString("ANIMAL_TYPE")
										));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 사용자 입양공고 썸네일리스트
	public ArrayList<AdoptNotice> selectNoticeThumbnailList(Connection conn, PageInfo pi){
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeThumbnailList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO"),
										 rset.getString("AN_TITLE"),
										 rset.getInt("VIEW_COUNT"),
										 rset.getInt("ADT_STATUS"),
										 rset.getString("ANIMAL_TYPE"),
										 rset.getString("ENT_NO"),
										 rset.getString("TITLEIMG")
										 ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	// 조회수 증가용 메소드
	public int increaseCount(Connection conn, String boardNo) {
		// controller에서 커밋하기
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 입양공고상세보기  메소드
	public AdoptNotice selectAdoptNotice(Connection conn, String boardNo) {
		
		AdoptNotice an = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdoptNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			// animal정보 불러오는 걸로 바꾸기
			if(rset.next()) {
				an = new AdoptNotice(rset.getString("ANLIST_NO")
						,rset.getString("AN_TITLE")
						,rset.getString("AN_CONTENT")
						,rset.getString("WRITE_DATE")
						,rset.getInt("VIEW_COUNT")
						,rset.getString("ENT_NO")
						,rset.getString("ANIMAL_VARIETY")
						,rset.getString("ANIMAL_NAME")
						,rset.getString("ANIMAL_GENDER")
						,rset.getInt("ANIMAL_AGE")
						,rset.getString("ANIMAL_VACCINATED")	
						,rset.getString("ANIMAL_NEUTRALIZATION")
						,rset.getString("ANIMAL_DISEASE")
						,rset.getString("ANIMAL_ISSUE")
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return an;
	}
	
	// 입양신청서 insert 메소드
	public int insertAdoptApply(Connection conn, AdoptApply adp) {
		int result = 0;
		
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("insertAdoptApply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adp.getAnlistNo());
			pstmt.setInt(2, adp.getMemNo());
			pstmt.setString(3, adp.getMemName());
			pstmt.setString(4, adp.getAaTitle());
			pstmt.setString(5, adp.getAaName());
			pstmt.setInt(6, adp.getAaAge());
			pstmt.setString(7, adp.getAaGender());
			pstmt.setString(8, adp.getAaPhone());
			pstmt.setString(9, adp.getAaEmail());
			pstmt.setString(10, adp.getAaAddress());
			pstmt.setString(11, adp.getMarriageYN());
			pstmt.setString(12, adp.getAaJob());
			pstmt.setString(13, adp.getAdoptReason());
			pstmt.setString(14, adp.getParentExp());
			pstmt.setString(15, adp.getHavePetYN());
			pstmt.setString(16, adp.getPetType());
			pstmt.setString(17, adp.getPetAge());
			pstmt.setString(18, adp.getPetGender());
			pstmt.setString(19, adp.getPetNeutral());
			pstmt.setInt(20, adp.getaMate());
			pstmt.setInt(21, adp.getcMate());
			pstmt.setInt(22, adp.getChildAge());
			pstmt.setString(23, adp.getAgreeYPN());
			pstmt.setString(24, adp.getEventMngAni());
			pstmt.setString(25, adp.getEmptyHour());
			pstmt.setString(26, adp.getHouseType());
			pstmt.setString(27, adp.getHselfYN());
			pstmt.setString(28, adp.getAgreeNeiYN());
			pstmt.setInt(29, adp.getExpCost());
			
			result = pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 입양공고 상세보기시 불러올 첨부파일 사진리스트(동물사진)
	public Attachment selectAttachment(Connection conn, String boardNo){
		
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getString("ATTACH_NO"),
									rset.getString("REF_NO"),
									rset.getString("PATH"),
									rset.getString("ORIGIN_NAME"),
									rset.getString("CHANGE_NAME"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	// 사용자 입양신청시 서약서 첨부하기
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdpAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getPath());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 입양공고작성시 동물정보 불러올 메소드
	public Animal selectAnimalInfo(Connection conn, String animalNo) {
		
		Animal a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnimalInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				a = new Animal(rset.getString("ENT_NO"),
							   rset.getString("ADOPT_STATUS"),
							   rset.getString("ADOPT_DATE"),
							   rset.getString("ANIMAL_VARIETY"),
							   rset.getString("ANIMAL_NAME"),
							   rset.getString("ANIMAL_GENDER"),
							   rset.getInt("ANIMAL_AGE"),
							   rset.getString("ANIMAL_VACCINATED"),
							   rset.getString("ANIMAL_NEUTRALIZATION"),
							   rset.getString("ANIMAL_DISEASE"),
							   rset.getString("ANIMAL_ISSUE"),
							   rset.getString("ANIMAL_TYPE"),
							   rset.getString("ENT_DATE")
							   );
						
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
		
	}
	
	// 입양공고등록하는 메소드
	public int insertAdoptNotice(Connection conn, AdoptNotice adt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdoptNotice");
		
		System.out.println("dao adt : "+ adt);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adt.getAnTitle());
			pstmt.setString(2, adt.getAnContent());
			pstmt.setString(3, adt.getEntNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//입양공고등록시 첨부파일 insert
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachList");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getRefNo());
				pstmt.setString(2, at.getPath());
				pstmt.setString(3, at.getOriginName());
				pstmt.setString(4, at.getChangeName());
				pstmt.setInt(5, at.getAttachLevel());
				
				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 입양공고상세보기 
	public AdoptNotice selectAdminAdoptNotice(Connection conn, String boardNo) {
		
		AdoptNotice an = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdoptNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				an = new AdoptNotice(rset.getString("ANLIST_NO"),
									 rset.getString("AN_TITLE"),
									 rset.getString("AN_CONTENT"),
									 rset.getString("WRITE_DATE"),
									 rset.getInt("VIEW_COUNT"),
									 rset.getInt("ADT_STATUS"),
									 rset.getString("POST_STATUS"),
									 rset.getString("ANIMAL_TYPE"),
									 rset.getString("ENT_NO"),
									 rset.getString("ANIMAL_VARIETY"),
									 rset.getString("ANIMAL_NAME"),
									 rset.getString("ANIMAL_GENDER"),
									 rset.getInt("ANIMAL_AGE"),
									 rset.getString("ANIMAL_VACCINATED"),
									 rset.getString("ANIMAL_NEUTRALIZATION"),
									 rset.getString("ANIMAL_DISEASE"),
									 rset.getString("ANIMAL_ISSUE")
									);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return an;
	}
	
	// 관리자 입양공고상세보기시 첨부파일리스트 조회
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String boardNo){
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachNo(rset.getString("ATTACH_NO"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setPath(rset.getString("path"));
				at.setAttachLevel(rset.getInt("attach_level"));
				list.add(at);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	// 입양공고삭제하기
	public int deleteAdoptNotice(Connection conn, String boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAdoptNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 입양공고 수정하기
	public int updateAdoptNotice(Connection conn, AdoptNotice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println("antitle : " + notice.getAnTitle());
		System.out.println("anContent : " + notice.getAnContent());
		System.out.println("anlistNo : "+notice.getAnlistNo());
		String sql = prop.getProperty("updateAdoptNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getAnTitle());
			pstmt.setString(2, notice.getAnContent());
			pstmt.setString(3, notice.getAnlistNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 입양공고 수정하기시 첨부파일 update
	public int updateAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		//첨부파일리스트가 비어있지 않을 때. 즉, update할게 있을 때
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getPath());
				pstmt.setInt(4,at.getAttachLevel());
				pstmt.setString(5, at.getAttachNo());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	/////////////////입양신청관련메소드/////////////////////
	public int selectAdoptApplyListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdoptApplyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<AdoptApply> selectAdoptApplyList(Connection conn, PageInfo pi){
		ArrayList<AdoptApply> list = new ArrayList<AdoptApply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptApplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptApply(rset.getString("AALIST_NO"),
										rset.getString("ANLIST_NO"),
										rset.getInt("MEM_NO"),
										rset.getString("AA_TITLE"),
										rset.getInt("ADT_STATUS"),
										rset.getString("MEM_ID"),
										rset.getString("APPLY_DATE")));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 관리자 입양신청서 상세보기
	public AdoptApply selectAdminAdoptApply(Connection conn, String boardNo) {
		
		AdoptApply apply = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminAdoptApply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				apply = new AdoptApply(rset.getString("AALIST_NO"),
									rset.getString("ANLIST_NO"),
									rset.getInt("MEM_NO"),
									rset.getString("MEM_NAME"),
									rset.getString("AA_TITLE"),
									rset.getString("PAY_STATUS"),
									rset.getInt("ADT_STATUS"),
									rset.getString("POST_STATUS"),
									rset.getString("AA_NAME"),
									rset.getInt("AA_AGE"),
									rset.getString("AA_GENDER"),
									rset.getString("AA_PHONE"),
									rset.getString("AA_EMAIL"),
									rset.getString("AA_ADDRESS"),
									rset.getString("MARRIAGE_YN"),
									rset.getString("AA_JOB"),
									rset.getString("ADOPT_REASON"),
									rset.getString("PARENT_EXP"),
									rset.getString("HAVE_PET_YN"),
									rset.getString("PET_TYPE"),
									rset.getString("PET_AGE"),
									rset.getString("PET_GENDER"),
									rset.getString("PET_NEUTRAL"),
									rset.getInt("A_MATE"),
									rset.getInt("C_MATE"),
									rset.getInt("CHILD_AGE"),
									rset.getString("AGREE_YPN"),
									rset.getString("EVENT_MNG_ANI"),
									rset.getString("EMPTYHOUR"),
									rset.getString("HOUSETYPE"),
									rset.getString("HSELF_YN"),
									rset.getString("AGREE_NEI_YN"),
									rset.getInt("EXP_COST"),
									rset.getString("MEM_ID"),
									rset.getString("APPLY_DATE")
									);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return apply;
	}
	
	// 입양신청서 승인시 입양신청테이블 정보 업데이트(ADOPT_STATUS, PAY_STATUS)
	public int adoptApplyStatusUpdate(Connection conn, int adpStatus, String adpNo, String memPayYN) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adoptApplyStatusUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adpStatus);
			pstmt.setString(2, memPayYN);
			pstmt.setString(3, adpNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	// 입양신청서 승인시 입양공고 테이블 정보 업데이트(ADOPT_STATUS)
	public int adoptNoticeADTStatusUpdate(Connection conn, int adpStatus, String adtNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adoptNoticeADTStatusUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adpStatus);
			pstmt.setString(2, adtNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 입양신청승인시 전체동물 테이블 업데이트(ADOPT_STATUS, ADOPT_DATE)
	public int adoptAnimalADTStatusUpdate(Connection conn, String memAdoptYN, String adtNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adoptAnimalADTStatusUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memAdoptYN);
			pstmt.setString(2, adtNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 입양신청승인시 멤버테이블 정보 업데이트()
	public int adoptMemUpdate(Connection conn, String memAdoptYN, int memGrade, int memNo, String memPayYN) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adoptMemUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memAdoptYN);
			pstmt.setString(2, memPayYN);
			pstmt.setInt(3, memGrade);
			pstmt.setInt(4, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 입양신청서 번호로 검색하기(입양신청글번호)
	public ArrayList<AdoptApply> searchAdoptApplyADPNO(Connection conn, PageInfo pi, String searchKey){
		
		ArrayList<AdoptApply> list = new ArrayList<AdoptApply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String keyword = "%"+searchKey+"%";
		System.out.println(keyword);
		
		String sql = prop.getProperty("searchAdoptApplyADPNO");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptApply(rset.getString("AALIST_NO"),
						rset.getString("ANLIST_NO"),
						rset.getInt("MEM_NO"),
						rset.getString("AA_TITLE"),
						rset.getInt("ADT_STATUS"),
						rset.getString("MEM_ID"),
						rset.getString("APPLY_DATE")));
			}
			
			System.out.println("dao검색결과 : " + list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;

	}
	
	// 입양신청서 입양공고번호로 검색
	public ArrayList<AdoptApply> searchAdoptApplyADTNO(Connection conn, PageInfo pi, String searchKey){
		
		ArrayList<AdoptApply> list = new ArrayList<AdoptApply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAdoptApplyADTNO");

		String key = "%"+searchKey+"%";
				
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptApply(rset.getString("AALIST_NO"),
						rset.getString("ANLIST_NO"),
						rset.getInt("MEM_NO"),
						rset.getString("AA_TITLE"),
						rset.getInt("ADT_STATUS"),
						rset.getString("MEM_ID"),
						rset.getString("APPLY_DATE")));
			}
			
			System.out.println("dao검색결과 : " + list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;

	}
	
	// 입양신청서 멤버아이디로 검색
	public ArrayList<AdoptApply> searchAdoptApplyMEMID(Connection conn, PageInfo pi, String searchKey){
		
		ArrayList<AdoptApply> list = new ArrayList<AdoptApply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAdoptApplyMEMID");

		String key = "%"+searchKey+"%";
				
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptApply(rset.getString("AALIST_NO"),
						rset.getString("ANLIST_NO"),
						rset.getInt("MEM_NO"),
						rset.getString("AA_TITLE"),
						rset.getInt("ADT_STATUS"),
						rset.getString("MEM_ID"),
						rset.getString("APPLY_DATE")));
			}
			
			System.out.println("dao검색결과 : " + list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;

	}
	
	// 입양신청서삭제하기
	public int deleteAdoptApply(Connection conn, String boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteAdoptApply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 입양공고글 제목키워드로 검색
	public ArrayList<AdoptNotice> searchAdoptNoticeAdtTitle(Connection conn,PageInfo pi, String searchKey){
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("searchAdoptNoticeAdtTitle");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
	
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO"),
										 rset.getString("AN_TITLE"),
										 rset.getString("WRITE_DATE"),
										 rset.getInt("VIEW_COUNT"),
										 rset.getInt("ADT_STATUS"),
										 rset.getString("ANIMAL_TYPE"),
										 rset.getString("ENT_NO")
										 ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	//관리자 입양공고글번호로 검색
	public ArrayList<AdoptNotice> searchAdoptNoticeAdtNo(Connection conn, PageInfo pi, String searchKey){
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("searchAdoptNoticeAdtNo");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
	
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO"),
										 rset.getString("AN_TITLE"),
										 rset.getString("WRITE_DATE"),
										 rset.getInt("VIEW_COUNT"),
										 rset.getInt("ADT_STATUS"),
										 rset.getString("ANIMAL_TYPE"),
										 rset.getString("ENT_NO")
										 ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//관리자 입양처리상태로 검색
	public ArrayList<AdoptNotice> searchAdoptNoticeAdtStatus(Connection conn, PageInfo pi, int adtStatus){
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAdoptNoticeAdtStatus");

		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adtStatus);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
	
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO"),
										 rset.getString("AN_TITLE"),
										 rset.getString("WRITE_DATE"),
										 rset.getInt("VIEW_COUNT"),
										 rset.getInt("ADT_STATUS"),
										 rset.getString("ANIMAL_TYPE"),
										 rset.getString("ENT_NO")
										 ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 사용자 입양공고 검색시 리스트 카운트
	public int selectSearchAdoptNoticeListCount(Connection conn, String animalCtg, String keyword) {
		int listCount = 0;
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchAdoptNoticeListCount");
		String key = "%"+keyword+"%";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalCtg);
			pstmt.setString(2, key);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;		
	}
	
	// 사용자 입양신청서 검색(페이징처리 완)
	public ArrayList<AdoptNotice> searchAdoptNoticeList(Connection conn, PageInfo pi, String animalCtg, String keyword){
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchAdoptNoticeList");
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalCtg);
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO"),
						 rset.getString("AN_TITLE"),
						 rset.getInt("VIEW_COUNT"),
						 rset.getInt("ADT_STATUS"),
						 rset.getString("ANIMAL_TYPE"),
						 rset.getString("ENT_NO"),
						 rset.getString("TITLEIMG")
						 ));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 관리자 입양공고 검색(제목으로 검색시) 게시글 갯수
	public int selectAdminAdoptNoticeSearchTitle(Connection conn, String searchKey) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminAdoptNoticeSearchTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 관리자 입양공고 검색(글번호로 검색시) 게시글 갯수
	public int selectAdminAdoptNoticeSearchAnNo(Connection conn, String searchKey) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminAdoptNoticeSearchAnNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 관리자 입양공고 검색(처리상태로 검색) 게시글 갯수
	public int selectAdminAdoptNoticeSearchAdtStatus(Connection conn, int adtStatus) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminAdoptNoticeSearchAdtStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adtStatus);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public String selectadtDate(Connection conn) {
		String adtDate = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectadtDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				adtDate = rset.getString("write_date");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return adtDate;
	}

	public String selectadpDate(Connection conn) {
		String adpDate = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectadpDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				adpDate = rset.getString("write_date");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return adpDate;
	}
	
	public int searchAdoptApplyADPNOCount(Connection conn, String searchKey) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptApplyADPNOCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCount;
		
	}
	
	public int searchAdoptApplyADTNOCount(Connection conn, String searchKey) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptApplyADTNOCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCount;
		
	}
	
	public int searchAdoptApplyMEMIDCount(Connection conn, String searchKey) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptApplyMEMIDCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCount;
		
	}

}
