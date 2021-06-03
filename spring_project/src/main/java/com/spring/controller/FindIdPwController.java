package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MemberServiceImpl;
import com.spring.vo.CoffeeMemberVO;

@Controller
public class FindIdPwController {
	@Autowired
	private MemberServiceImpl memberService;
	
	/**
	 * �̸�ã�� - �̸� result ã��
	 */
	@RequestMapping(value="/nameCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public String findResultName(String name) {
		return memberService.getResultName(name);
	}
	
	/**
	 * ���̵� ��й�ȣ ã�� - ��ȭ��ȣ result ã��
	 */
	@RequestMapping(value="/hpCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String findResultHp(String hp) {
		return memberService.getResultHp(hp);
	} 
	/**
	 * ���̵� ��й�ȣ ã�� - ���̵�  ã��
	 */
	@RequestMapping(value="/find_id.do", method=RequestMethod.POST)
	public ModelAndView findId(String name,String hp) {
		return memberService.getFineId(name,hp);
	} 
	/**
	 * ���̵� ��й�ȣ ã�� - ��й�ȣ  ã��
	 */
	@RequestMapping(value="/find_pw.do", method=RequestMethod.POST)
	public ModelAndView findPass(String id) {
		return memberService.getFindPass(id);
	} 
	
	/**
	 * ���̵� ��й�ȣ ã��
	 */
	@RequestMapping(value="/find_id_pw.do", method=RequestMethod.GET)
	public String findidpw() {
		return "/find_id_pw/find_id_pw";
	} 

}
