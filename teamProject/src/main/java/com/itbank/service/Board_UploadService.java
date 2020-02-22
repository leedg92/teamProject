package com.itbank.service;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.dao.CommunityVO;
import com.itbank.dao.CommunityDAO;

@Service
public class Board_UploadService {
	private static final String filePath = "/upload/";
	@Autowired
	private CommunityDAO dao;

	

	public String upload(MultipartFile file, CommunityVO vo) {
		String originalFileName = null;
		String extName = null;
		String storedFileName = null;
		byte[] fileData = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
				originalFileName = file.getOriginalFilename();
				extName = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + extName;
				fileData = file.getBytes();
	
			int row = 0;
			int crow = 0;

			map.put("ORG_FILE_NAME", originalFileName);
			map.put("STORED_FILE_NAME", storedFileName);
			map.put("FILEDATA", fileData);
			map.put("userid", vo.getUserid());
			map.put("title", vo.getTitle());
			map.put("username", vo.getUsername());
			map.put("context", vo.getContext());
			map.put("bnum", vo.getBnum());
			map.put("address", vo.getAddress());
			if(vo.getRestaurant() == null) {
				map.put("restaurant", "등록된 주소가 없습니다.");
			}else{
			map.put("restaurant", vo.getRestaurant());
			}

			row = dao.insert(map);
			crow = dao.cinsert(map);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return storedFileName;
	}


}
