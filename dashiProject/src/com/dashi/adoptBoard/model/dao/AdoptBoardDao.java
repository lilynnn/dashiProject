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
				at = new Attachment();
				at.setAttachNo(rset.getString("ATTACH_NO"));
				at.setRefNo(rset.getString("REF_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setPath(rset.getString("PATH"));
				
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
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachList");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getPath());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setInt(4, at.getAttachLevel());
				
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
	
}
