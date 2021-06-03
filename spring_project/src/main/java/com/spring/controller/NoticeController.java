package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.NoticeService;
import com.spring.vo.TestNoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice.do",method=RequestMethod.GET)
	public ModelAndView notice(String rpage) {
		return noticeService.getList(rpage);
	}
	
	@RequestMapping(value="/notice_delete.do",method=RequestMethod.GET)
	public ModelAndView delete(String nid) {
		return noticeService.getResultDelete(nid);
	}
	
	@RequestMapping(value="/notice_page.do",method=RequestMethod.GET)
	public ModelAndView notice_page(String id) {
		return (ModelAndView)noticeService.getContent(id);
	}
	

	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String board_write(){
		return "notice_write";
	}
	
	@RequestMapping(value = "/notice_update.do", method = RequestMethod.GET)
	public ModelAndView notice_update(String nid) {
		return (ModelAndView)noticeService.getUpdate(nid);
	}
	
	@RequestMapping(value = "/notice_update_proc.do", method = RequestMethod.POST)
	public ModelAndView notice_update_proc(TestNoticeVO vo,HttpServletRequest request,String nid) {
		return (ModelAndView)noticeService.getResultUpdate(vo,request,nid);
	}
	
	@RequestMapping(value = "/notice_write_proc.do", method = RequestMethod.POST)
	public ModelAndView notice_write_proc(TestNoticeVO vo,HttpServletRequest request){
		return (ModelAndView)noticeService.getResultWrite(vo,request);
	}
	
	
}

