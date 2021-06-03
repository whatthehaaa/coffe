package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.CoffeeMemberDAO;
import com.spring.service.MemberServiceImpl;
import com.spring.vo.CoffeeMemberVO;

@Controller
public class JoinController {
	@Autowired
	private MemberServiceImpl memberService;
	/**
	 * ȸ������ - ID �ߺ�üũ ó��
	 */
	@RequestMapping(value="/idCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String id) {
		return memberService.getResultIdCheck(id);
	}
	
	/**
	 * ȸ������ ó��
	 */
		@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
		public String join_proc(CoffeeMemberVO vo) {
			return memberService.getResultJoin(vo);
	} 

	/**
	 * ȸ������ ����� ȭ��
	 * @return
	 */
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
}
