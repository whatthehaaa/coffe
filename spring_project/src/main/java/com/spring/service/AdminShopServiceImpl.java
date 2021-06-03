package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.dao.ProductDAO;
import com.spring.vo.ProductContentVO;
import com.spring.vo.ProductVO;

public class AdminShopServiceImpl implements AdminShopService{
	@Autowired
	private ProductDAO ProductDAO;
	
	
	
	/** ������ �������� */
	public ModelAndView getContent(String pid) {
		ModelAndView mv = new ModelAndView();
		
		ProductVO vo = ProductDAO.getAdminContent(pid);
		mv.addObject("vo",vo);
		mv.setViewName("admin/shop/aproduct_content");
		
		return mv;
	}
	
	/**
	 * �˻� ��� ��������
	 * @param sname
	 * @param svalue
	 * @param rpage
	 * @return
	 */
	public String getSearchList(String sname, String svalue, String rpage) {
		
		//2-1. ���������� ���� start, end count ���ϱ�
		//1������(1~10), 2������(11~20) ...
		int start = 0;
		int end = 0;
		int pageSize = 12; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ� row
		int dbCount = ProductDAO.getListCount(sname, svalue); //DB���� �� ��ü�ο�� ���
		
	//System.out.println("dbCount--->>" + dbCount);	
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
		
		
		ArrayList<ProductVO> list = ProductDAO.getSearchList(sname,svalue,String.valueOf(start),String.valueOf(end));

		// list ��ü�� �����͸� JSON ��ü�� ��ȯ�۾� �ʿ� ---> JSON ���̺귯�� ��ġ(gson)
		JsonArray jarry = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson = new Gson();

		for (ProductVO vo : list) {
			JsonObject jobj = new JsonObject();
			jobj.addProperty("rno", vo.getRno());
			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("pmphoto", vo.getPmphoto());
			jobj.addProperty("pmsphoto", vo.getPmsphoto());
			jobj.addProperty("psub1", vo.getPsub1());
			jobj.addProperty("psub2", vo.getPsub2());
			jobj.addProperty("psub3", vo.getPsub3());
			jobj.addProperty("ptitle", vo.getPtitle());
			jobj.addProperty("phash", vo.getPhash());
			jobj.addProperty("pprice", vo.getPprice100());
			jobj.addProperty("pkind1", vo.getPkind1());
			jobj.addProperty("pkind2", vo.getPkind2());
			jobj.addProperty("pdate", vo.getPdate());
		
			jarry.add(jobj);
		}
		
		jdata.add("jlist", jarry);
		jdata.addProperty("dbcount", dbCount);
		jdata.addProperty("reqpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		
		return gson.toJson(jdata);
	}
	
	
	
	
	/**
	 * ����Ʈ ��������
	 */
	public ModelAndView getList(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		
		int start = 0;
		int end = 0;
		int pageSize = 12; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ� row
		int dbCount = ProductDAO.getListCount(); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û������
		
		//2-2. ��ü������ �� ���ϱ� - ȭ�����
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


		
		ArrayList<ProductVO> list = ProductDAO.getAdminProductList(String.valueOf(start),String.valueOf(end));
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		mv.setViewName("admin/shop/Product_list");
			
		return mv;
	}
	

	
	/**
	 * ��������
	 */
	public int getResultDelete(String[] dellist){

		return ProductDAO.getResultDelete(dellist);
	}
	
	/**
	 * insert ����
	 */
	public ModelAndView getResultInsert(ProductVO vo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if(vo.getFile1().getSize() != 0) {
			// ���� ����
		
			//rfname �ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			System.out.println((vo.getFile1().getOriginalFilename()));
			System.out.println((uuid +"_"+vo.getFile1().getOriginalFilename()));
			
			vo.setPmphoto(vo.getFile1().getOriginalFilename());
			vo.setPmsphoto(uuid +"_"+vo.getFile1().getOriginalFilename());
			
			vo.setPhphoto(vo.getFile2().getOriginalFilename());
			vo.setPhsphoto(uuid +"_"+vo.getFile2().getOriginalFilename());
			
			boolean result = false;
			result = ProductDAO.productInsert(vo);
			
			if(result) {
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				
				System.out.println(root_path + attach_path + uuid +"_"+vo.getPmphoto());
				System.out.println(root_path + attach_path + uuid +"_"+vo.getPhphoto());
				try {
					
				File file1 
				= new File(root_path + attach_path +vo.getPmsphoto());
				vo.getFile1().transferTo(file1);
				
				File file2 
				= new File(root_path + attach_path +vo.getPhsphoto());
				vo.getFile2().transferTo(file2);
				
				
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
				mv.setViewName("redirect://admin/product_list.do");
			}else {
				mv.setViewName("error");
			}
			
			
		}
		
		
		
		
		
		
		return mv;
		
	}
	

	public ModelAndView getContentInsert(ProductContentVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		result =ProductDAO.getContentInsert(vo);
		if(result) {
			mv.setViewName("redirect://admin/product_list.do");
		}else {
			mv.setViewName("error");
		}
		  
		return mv;
		
	
	}
	
}
