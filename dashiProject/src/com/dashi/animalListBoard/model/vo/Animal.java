package com.dashi.animalListBoard.model.vo;

public class Animal {

	// 동물테이블에 존재하는 컬럼
	private String entNo;		// 입소번호
	private String adoptStatus;	// 입양여부 Y | N
	private String adoptDate; 	// 입양일
	
	// 입소테이블이랑 조인해서 가져올 정보
	private String animalVariety;	// 동물 품종
	private String animalName;		// 동물 이름
	private String animalGender;	// 동물 성별
	private int animalAge;			// 동물 나이
	private String animalVaccin;	// 접종여부  Y | N
	private String animalNeutral;	// 중성화여부  Y | N
	private String animalDisease;	// 질병유무
	private String animalIssue;		// 특이사항
	private String animalType;		// D:강아지 C:고양이 E:기타
	private String entDate;			// 입소일
	
	public Animal() {}

	public Animal(String entNo, String adoptStatus, String adoptDate, String animalVariety, String animalName,
			String animalGender, int animalAge, String animalVaccin, String animalNeutral, String animalDisease,
			String animalIssue, String animalType, String entDate) {
		super();
		this.entNo = entNo;
		this.adoptStatus = adoptStatus;
		this.adoptDate = adoptDate;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalVaccin = animalVaccin;
		this.animalNeutral = animalNeutral;
		this.animalDisease = animalDisease;
		this.animalIssue = animalIssue;
		this.animalType = animalType;
		this.entDate = entDate;
	}

	// 동물 목록 조회용 정보담을 객체
	
	public Animal(String entNo, String adoptStatus, String animalVariety, String animalName, String animalType,
			String entDate) {
		super();
		this.entNo = entNo;
		this.adoptStatus = adoptStatus;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalType = animalType;
		this.entDate = entDate;
	}
	
	public Animal(String entNo, String adoptStatus, String adoptDate, String animalVariety, String animalName,
			String animalGender, int animalAge, String animalVaccin, String animalNeutral, String animalDisease,
			String animalIssue, String entDate) {
		super();
		this.entNo = entNo;
		this.adoptStatus = adoptStatus;
		this.adoptDate = adoptDate;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalVaccin = animalVaccin;
		this.animalNeutral = animalNeutral;
		this.animalDisease = animalDisease;
		this.animalIssue = animalIssue;
		this.entDate = entDate;
	}

	public String getEntNo() {
		return entNo;
	}


	public String getAdoptStatus() {
		return adoptStatus;
	}

	public void setAdoptStatus(String adoptStatus) {
		this.adoptStatus = adoptStatus;
	}

	public String getAdoptDate() {
		return adoptDate;
	}

	public void setAdoptDate(String adoptDate) {
		this.adoptDate = adoptDate;
	}

	public String getAnimalVariety() {
		return animalVariety;
	}

	public void setAnimalVariety(String animalVariety) {
		this.animalVariety = animalVariety;
	}

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public String getAnimalGender() {
		return animalGender;
	}

	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public String getAnimalVaccin() {
		return animalVaccin;
	}

	public void setAnimalVaccin(String animalVaccin) {
		this.animalVaccin = animalVaccin;
	}

	public String getAnimalNeutral() {
		return animalNeutral;
	}

	public void setAnimalNeutral(String animalNeutral) {
		this.animalNeutral = animalNeutral;
	}

	public String getAnimalDisease() {
		return animalDisease;
	}

	public void setAnimalDisease(String animalDisease) {
		this.animalDisease = animalDisease;
	}

	public String getAnimalIssue() {
		return animalIssue;
	}

	public void setAnimalIssue(String animalIssue) {
		this.animalIssue = animalIssue;
	}

	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	public String getEntDate() {
		return entDate;
	}

	public void setEntDate(String entDate) {
		this.entDate = entDate;
	}

	@Override
	public String toString() {
		return "Animal [entNo=" + entNo + ", adoptStatus=" + adoptStatus + ", adoptDate=" + adoptDate
				+ ", animalVariety=" + animalVariety + ", animalName=" + animalName + ", animalGender=" + animalGender
				+ ", animalAge=" + animalAge + ", animalVaccin=" + animalVaccin + ", animalNeutral=" + animalNeutral
				+ ", animalDisease=" + animalDisease + ", animalIssue=" + animalIssue + ", animalType=" + animalType
				+ ", entDate=" + entDate + "]";
	}

	
}
