package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.TestNoticeDAO;
import com.spring.vo.TestNoticeVO;

@Service("noticetService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private TestNoticeDAO noticeDAO;
		
	
	public ModelAndView getList(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 5; //�� �������� ��µǴ�? row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ�? row
		int dbCount = noticeDAO.getListCount(); //DB���� �� ��ü�ο��? ���?
		int reqPage = 1; //��û������
		
		//2-2. ��ü������ �� ���ϱ� - ȭ�����?
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}
		ArrayList<TestNoticeVO> list = noticeDAO.getList(start,end);
		
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);	//�? ?��?��?���? ?��?�� ?��?�� ?�� ?��겨줄 ?��?��?��
		mv.addObject("reqPage", reqPage);
		mv.setViewName("notice");	//?��?�� ?�� ?��?��?�� ?���?
	
		return mv;
	}

	public Object getContent(String id) {
		ModelAndView mv = new ModelAndView();
		TestNoticeVO vo = noticeDAO.getContent(id);
		mv.addObject("vo", vo);
		mv.setViewName("notice_page");

		return mv;
	}
	
	public Object getUpdate(String id) {		
		ModelAndView mv = new ModelAndView();
		TestNoticeVO vo = noticeDAO.getContent(id);
		mv.addObject("vo", vo);
		mv.setViewName("notice_update");

		return mv;
	}


	public Object getResultWrite(Object vo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		TestNoticeVO nvo = (TestNoticeVO) vo;
		
		
		if(nvo.getFile1().getSize()!=0 || nvo.getFile2().getSize()!=0 ) {
			//?��?��존재
			//1. efile, esfile ?���? ?��?�� -->vo.set~
			UUID uuid = UUID.randomUUID();	//?��버에 ???��?��?�� ?��?��?���? 중복방�?(esfile)
			
			nvo.setNfile(nvo.getFile1().getOriginalFilename());
			nvo.setNsfile(uuid+"_"+nvo.getFile1().getOriginalFilename());

			nvo.setNfile_t(nvo.getFile2().getOriginalFilename());
			nvo.setNsfile_t(uuid+"_"+nvo.getFile2().getOriginalFilename());
			
			//2. DB ???�� 
			boolean result = noticeDAO.getInsert(nvo);
			
			if(result) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				
				try {
					File file = new File(root_path+attach_path+nvo.getNsfile());
					File file_t = new File(root_path+attach_path+nvo.getNsfile_t());
					nvo.getFile1().transferTo(file);
					nvo.getFile2().transferTo(file_t);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				mv.setViewName("redirect:/notice.do");
			}else {
				
			}
		}
		
		return mv;
	}


	public Object getResultUpdate(Object vo,HttpServletRequest request,String nid) {	
		ModelAndView mv = new ModelAndView();
		TestNoticeVO nvo = (TestNoticeVO) vo;
		nvo.setNid(nid);
		
		if(nvo.getFile1().getSize()!=0 || nvo.getFile2().getSize()!=0 ) {
			//?��?��존재
			//1. efile, esfile ?���? ?��?�� -->vo.set~
			UUID uuid = UUID.randomUUID();	//?��버에 ???��?��?�� ?��?��?���? 중복방�?(esfile)
			
			nvo.setNfile(nvo.getFile1().getOriginalFilename());
			nvo.setNsfile(uuid+"_"+nvo.getFile1().getOriginalFilename());

			nvo.setNfile_t(nvo.getFile2().getOriginalFilename());
			nvo.setNsfile_t(uuid+"_"+nvo.getFile2().getOriginalFilename());
			
			//2. DB ???�� 
			boolean result = noticeDAO.getUpdate(nvo);
			
			if(result) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				
				try {
					File file = new File(root_path+attach_path+nvo.getNsfile());
					File file_t = new File(root_path+attach_path+nvo.getNsfile_t());
					nvo.getFile1().transferTo(file);
					nvo.getFile2().transferTo(file_t);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				mv.setViewName("redirect:/notice.do");
			}else {
				
			}
		}
		
		return mv;
	}

	@Override
	public ModelAndView getResultDelete(String nid) {
		ModelAndView mv = new ModelAndView();
		
		//String bid = request.getParameter("bid");
		//CgvBoardDAO dao = new CgvBoardDAO();
		boolean result = noticeDAO.getDelete(nid);
		
		if(result){
			mv.setViewName("redirect:/notice.do");
		}else{
			mv.setViewName("errorPage");
		}
		return mv;
	}
	



}
