package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MemberServiceImpl;

@Controller
public class Admin_memberController {

	@Autowired
	private MemberServiceImpl memberservice;
	
	/**
	 * ȸ������ - ȸ�� ��ü ����Ʈ(ajax ȣ��) // ResponseBody �κ������� ���� 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/member_list_ajax_proc.do", 
			method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public String member_list_ajax_proc(String sname, String svalue, String rpage) {
		return memberservice.getMemberListAjaxProc(sname, svalue, rpage); //gson.toJson(String���� ��ȯ�� ��ü)
	}
	/**
	 * ȸ������ - ȸ�� ��ü ����Ʈ
	 * @return
	 */
	@RequestMapping(value="/admin/member_list.do", method=RequestMethod.GET)
	public ModelAndView member_list(String rpage) {
		return memberservice.getMemberListAjax(); //�˻����
}
	/**
	 * ������������ 
	 * @return
	 */
	@RequestMapping(value="/admin.do", method=RequestMethod.GET) 
	public String admin() {
		return "/admin/admin";
	}
}