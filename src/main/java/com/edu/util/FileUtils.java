package com.edu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "D:\\upload";
	
	public List<Map<String, Object>> parseInsertFileInfo(
			MultipartHttpServletRequest multipartHttpServletRequest) 
					throws Exception{
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.
						substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() 
						+ originalFileExtension;
				
				file = new File(filePath, storedFileName);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("original_name", originalFileName);
				fileInfoMap.put("stored_name", storedFileName);
				fileInfoMap.put("file_size", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
			
		}
		
		return fileList;
	} // 메서드 종료
	
	public void parseUpdateFileInfo(String tempFileName) {
		
		File file = new File(filePath + "/" + tempFileName);
		
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		
	}
	
}
