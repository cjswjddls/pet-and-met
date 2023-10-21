package com.kh.common;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ProfileImgRenamePolicy implements FileRenamePolicy {
	
	 private String memberNo;

	  public ProfileImgRenamePolicy(String memberNo) {
	      this.memberNo = memberNo;
	 }
	  
	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();		
		
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changename = memberNo + ext;
		
		return new File(originFile.getParent(), changename);
		
	}
}