package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.dao.ImageVO;
import com.itbank.dao.StoreReviewDAO;
import com.itbank.dao.StoreReviewVO;

@Service
public class StoreReviewService {
	@Autowired
	private StoreReviewDAO dao;
	private static final String filePath = "/upload/";

	public String upload(MultipartHttpServletRequest mpRequest,String userid, StoreReviewVO vo, int key) {

		String url = null;

		try {
			MultipartFile mpfile = mpRequest.getFile("file");

			String originalFilename = mpfile.getOriginalFilename();

			String extName = originalFilename.substring(originalFilename.lastIndexOf("."));

			Long size = mpfile.getSize();
			vo.setWriter(userid);
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + extName;

			File file = new File(filePath + storedFileName);

			mpfile.transferTo(file);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ORG_FILE_NAME", originalFilename);
			map.put("STORED_FILE_NAME", storedFileName);
			map.put("FILESIZE", size);
			map.put("content", vo.getContent());
			map.put("writer", vo.getWriter());
			map.put("score", vo.getScore());
			map.put("key", key);
			int row = dao.insert(map);

			if (row == 1)
				url = filePath + storedFileName;

		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return url;
	}

	public List<StoreReviewVO> getFileList(int key) {
		return dao.view(key);
	}


public double getavg(int key) {
		return dao.getAvg(key);
	}
	
	public List<StoreReviewVO> getMyStoreReview(int key){
		return dao.getMyStoreReview(key);
	}
	
}
