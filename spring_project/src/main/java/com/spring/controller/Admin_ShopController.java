package com.spring.controller;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.AdminShopServiceImpl;
import com.spring.vo.ProductContentVO;
import com.spring.vo.ProductVO;

@Controller
public class Admin_ShopController {
	@Autowired
	private AdminShopServiceImpl AdminShopService;
	
	/**
	 * ��ǰ ������â ����
	 * @return
	 */
	@RequestMapping(value = "/admin_product_content.do", method = RequestMethod.GET)
	public ModelAndView product_content(String pid) {
		return AdminShopService.getContent(pid);
	}// shopmain2
	
	
	
	/**
	 * ��������
	 */
	@RequestMapping(value="/admin/product_delete_proc.do",method = RequestMethod.GET)
	public ModelAndView product_delete_proc(String chklist) {
		//String chklist -->Array
		ModelAndView mv = new ModelAndView();
			
				StringTokenizer st = new StringTokenizer(chklist,",");
				String[] dellist = new String[st.countTokens()];
				for(int i=0;i<dellist.length;i++) {
					dellist[i]=st.nextToken();
				}
				int result=AdminShopService.getResultDelete(dellist);
				
				if(result != 0) {
				mv.setViewName("redirect:/admin/product_list.do");
				}
				
		return mv;
				
	}
	
	
	/** product_list_proc */
	@ResponseBody
	@RequestMapping(value = "admin/admin_product_list_proc.do", produces="application/json;charset=UTF-8",method = RequestMethod.GET)
	public String product_list_proc(String sname, String svalue, String rpage) {
		return AdminShopService.getSearchList(sname,svalue,rpage);
	}  
	
	
	
	
	/**
	 * ��ǰâ ��ϰ��
	 */
	@RequestMapping(value="admin/product_list.do", method = RequestMethod.GET)
	public ModelAndView admin_product_list(String rpage) {
		return AdminShopService.getList(rpage);
	}
	
	/**
	 * �μ�Ʈ proc
	 */
	@RequestMapping(value="/shop_insert_proc.do",method = RequestMethod.POST)
	public ModelAndView shop_insert_proc(ProductVO vo,HttpServletRequest request){
		return AdminShopService.getResultInsert(vo,request);
	}
	
	/**
	 * ��ǰ �μ�Ʈâ ���
	 * @return
	 */
	@RequestMapping(value = "/admin_product_insert.do", method = RequestMethod.GET)
	public String product_insert() {
		return "admin/shop/Product_insert";
	}// shopmain2
	
	@RequestMapping(value = "/productContent_insert.do", method = RequestMethod.GET)
	public ModelAndView productContent_insert(String pid) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("pid",pid);
		mv.setViewName("admin/shop/Product_Content");
		return mv;
	}// shopContent
	
	/**
	 * �μ�Ʈ proc
	 */
	@RequestMapping(value="/productContent_insert_proc.do",method = RequestMethod.POST)
	public ModelAndView productContent_insert_proc(ProductContentVO vo){
		System.out.println("ss -->" +vo.getAroma());
		return AdminShopService.getContentInsert(vo);
	}
}
