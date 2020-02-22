package com.itbank.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.dao.ImageDAO;
import com.itbank.dao.ImageVO;
import com.itbank.dao.MemberVO;

@Service
public class ImageService {
@Autowired private ImageDAO dao;	

	public String uploadBLOB(List<MultipartFile> files, int key) {
		int num = 1;
		for (MultipartFile mpfile : files) {
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				String originalFileName = mpfile.getOriginalFilename();
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");

				byte[] filedata = mpfile.getBytes();
				map.put("oriname", mpfile.getOriginalFilename());
				map.put("storename", storedFileName);
				map.put("filedata", filedata);
				map.put("key", key);
				map.put("type", "store");
				map.put("num",num);
				if(!map.get("oriname").equals("")) {
					dao.insert(map);
					num++;
				}
			} catch (IOException e) {
				
			}
		}
		return "";
	}

	public byte[] selectBlob(int key, int num) {
		ImageVO vo = dao.selectBlob(key, num);
		if (vo==null) return null;
		else return vo.getFILEDATA();
	}
	public ImageVO getImageBlob(String key) {
		ImageVO vo = dao.selectImageBLOB(key); 
		return vo;
	}
	public List<ImageVO> blobAll(int key){
		return dao.blobAll(key);
	}
}
