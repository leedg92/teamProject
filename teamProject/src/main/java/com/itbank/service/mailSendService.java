package com.itbank.service;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.itbank.dao.MemberVO;
import com.itbank.exception.memberNotFoundException;

@Service
public class mailSendService {
	@Autowired private JavaMailSenderImpl mailSender; 
	@Autowired private MemberService memberservice;

	public boolean sendNewPwMail(String userid) throws FileNotFoundException, URISyntaxException {	// �ӽú�й�ȣ�� ���Ϸ� �߱�

	 try{
		  SimpleMailMessage message = new SimpleMailMessage();
		  
		  MemberVO vo = memberservice.getMemberById(userid);
		  if (vo==null) return false;
		  
		  message.setFrom("4wh.project@gmail.com");
		  message.setTo(vo.getEmail());
		  message.setSubject("맛.zip 임시비밀번호 발급");
		  
		  Random rand = new Random();
		  int newpass = 1000 + rand.nextInt(9000);
	
		  String msg = "임시 비밀번호가 발급되었습니다. \n로그인 후 마이페이지에서 비밀번호를 변경해 주세요.\n***임시비밀번호 : "+newpass;
		  message.setText(msg);

		  mailSender.send(message);
	 }catch(Exception e){
	  e.printStackTrace();
	 }   
	 return true;

	}
}
