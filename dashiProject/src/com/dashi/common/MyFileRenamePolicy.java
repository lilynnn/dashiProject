package com.dashi.common;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	// 파일명 수정하는 메소드( 예시 : 파일업로드일(RRRRMMDD) + 시간(HHMISS) + 5자리 랜덤값)
	// 리턴값 : 수정된 파일
	
	@Override
	public File rename(File originFile) {
		// TODO Auto-generated method stub
		
		//원본파일명("aaa.jpg")
		String originName = originFile.getName();
		
		// 1. 파일업로드시간(RRRRMMDDHHMISS) (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		

		// 3. 원본파일의 확장자(String ext)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changeName) ;
	}

}
