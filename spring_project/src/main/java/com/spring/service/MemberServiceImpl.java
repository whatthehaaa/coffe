package com.spring.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.dao.CoffeeMemberDAO;
import com.spring.vo.CoffeeMemberVO;
import com.spring.vo.SessionVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CoffeeMemberDAO coffee_memberDAO;
	
	
	/**
	 * ȸ������Ʈ ��� - �˻���� ó��
	 */
	public String getMemberListAjaxProc(String sname, String svalue, String rpage) {
			CoffeeMemberDAO dao = new CoffeeMemberDAO();
		
		//String sname = request.getParameter("sname");
		//String svalue = request.getParameter("svalue");

		//start, end ���ϱ�
		//1. ������ ��������
		//String rpage = request.getParameter("rpage");
		
		//2-1. ���������� ���� start, end count ���ϱ�
		//1������(1~10), 2������(11~20) ...
		int start = 0;
		int end = 0;
		int pageSize = 3; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ� row
		int dbCount = dao.getListCount(sname, svalue); //DB���� �� ��ü�ο�� ���
		System.out.println("dbCount--->>" + dbCount);	
		int reqPage = 1; //��û������
		
		//2-2. ��ü������ �� ���ϱ� - ȭ�����
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != ""){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}	
			
		ArrayList<CoffeeMemberVO> list = coffee_memberDAO.getSearchList(sname,svalue,start,end);


		JsonArray jarry = new JsonArray();
			JsonObject jdata = new JsonObject();
			Gson gson =new Gson();
		
		for(CoffeeMemberVO vo:list){
			JsonObject jobj = new JsonObject();		

			jobj.addProperty("rno", vo.getRno());  
			jobj.addProperty("id", vo.getId());  
			jobj.addProperty("name", vo.getName());  
			jobj.addProperty("hp", vo.getHp());  
			jobj.addProperty("mdate", vo.getMdate());  
			
			jarry.add(jobj);		
		}
		
		jdata.add("jlist", jarry);
		jdata.addProperty("dbcount", dbCount);
		jdata.addProperty("reqpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		return gson.toJson(jdata);
	}
	
	
	/**
	 *  ������������ - ȸ������Ʈ ���
	 */
	public ModelAndView getMemberListAjax() {
		ModelAndView mv= new ModelAndView();//�˻����
		mv.setViewName("/admin/member/member_list_ajax");
		return mv;
	}
	
	
	/*
	 * ���̵�  ã��
	 */
	@Override
	public ModelAndView getFineId(String name,String hp) {
		ModelAndView mv = new ModelAndView();
		CoffeeMemberVO vo = coffee_memberDAO.findId(name,hp);
		if(vo != null) {
			mv.addObject("id", vo.getId());
			mv.setViewName("/find_id_pw/find_id_pw");
		}else {
			mv.addObject("failId", "failId");
			mv.setViewName("/find_id_pw/find_id_pw");
		}
		return mv;
	}
	/*
	 * ��й�ȣ  ã��
	 */
	@Override
	public ModelAndView getFindPass(String id) {
		ModelAndView mv = new ModelAndView();
		CoffeeMemberVO vo = coffee_memberDAO.findPass(id);
		if(vo != null) {
			mv.addObject("pass", vo.getPass());
			mv.setViewName("/find_id_pw/find_id_pw");
		}else {
			mv.addObject("failPass", "failPass");
			mv.setViewName("/find_id_pw/find_id_pw");
		}
		return mv;
	}
	/*
	 * �̸� result ã��
	 */
	@Override
	public String getResultName(String name) {
		int result = coffee_memberDAO.findName_result(name);
		return String.valueOf(result);
	}
	/*
	 * ��ȭ��ȣ result ã��
	 */
	@Override
	public String getResultHp(String hp) {
		int result = coffee_memberDAO.findHp_result(hp);
		return String.valueOf(result);
	}
	/**
	 * �α��� ó��
	 */
	@Override
	public String getResultLogin(CoffeeMemberVO vo, HttpSession session) {
		SessionVO svo = coffee_memberDAO.getLogin(vo);
		String result = "";

		if(svo.getResult() != 0) {
			session.setAttribute("svo", svo);
			result = "index";
		}else {
			result = "errorPage";
		}

		return result;
	}
	/**
	 * ���̵� �ߺ�üũ
	 */
	@Override
	public String getResultIdCheck(String id) {
		int result = coffee_memberDAO.getIdCheck(id);
		return String.valueOf(result);
	}

	/**
	 * ȸ������ ó��
	 */
	@Override
	public String getResultJoin(CoffeeMemberVO vo) {
		String result = "";
		//DB������ ����
	   boolean join_result = coffee_memberDAO.getInsert(vo);

	   if(join_result){
	      //ȸ�����Լ���(views���� depth�� ���)
	      result = "index";
	   }else{
	      //ȸ�����Խ���- ���� ������ �����߻�: ������������ ������ ������ ȣ��
	      result = "errorPage";
	   }  
	   return result;
	}

}