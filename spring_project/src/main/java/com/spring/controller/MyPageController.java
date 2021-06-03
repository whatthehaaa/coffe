package com.spring.controller;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.CartDAO;
import com.spring.dao.CoffeeMemberDAO;
import com.spring.service.MypageServiceImpl;

@Controller
public class MyPageController {
	@Autowired
	private CoffeeMemberDAO memberDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private MypageServiceImpl mypageService;
	/**
	 * Ż�� ���� ������
	 * @return
	 */
	@RequestMapping(value="/cart_list_del.do", method=RequestMethod.GET)
	public ModelAndView delcartList(String chklist) {
		System.out.println("chklist--->" + chklist);
		ModelAndView mv = new ModelAndView();
		
		//String chklist --> Array
		StringTokenizer st = new StringTokenizer(chklist,",");
		String[] dellist = new String[st.countTokens()];
		for(int i=0;i<dellist.length;i++) {
			dellist[i] = st.nextToken();
		}
		
		int result = mypageService.getSelectDelete(dellist);
		
		mv.setViewName("redirect:/admin/notice_list.do");
		return mv;
	}
	
	
	/**
	 * Ż�� ������
	 * @return
	 */
	@RequestMapping(value="/delAccount.do", method=RequestMethod.GET)
	public String delAccount() {
		return "/mypage/delAccount";
	}
	/**
	 * ���Ÿ�� ������
	 * @return
	 */
	@RequestMapping(value="/mypage/buying_list.do", method=RequestMethod.GET)
	public String buying_list() {
		return "/mypage/buying/buying_list";
	}
	/**
	 * ȸ������ ���� ������
	 * @return
	 */
	@RequestMapping(value="/mypage/userInfo.do", method=RequestMethod.GET)
	public String userInfo() {
		return "/mypage/user/userInfo";
	}
	/**
	 * ��ٱ��� ���� ó��
	
	@RequestMapping(value="/mypage/cart_list_del.do", method=RequestMethod.GET)
	public String getcartDelete() {
		return
	}
	 */
	
	/**
	 * ��ٱ��� ������
	 * @return
	 */
	@RequestMapping(value="/mypage/cart_list.do", method=RequestMethod.GET)
	public String CartList() {
		return "/mypage/cart/cart_list";
	}
	/**
	 * ����������
	 * @return
	 */
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "/mypage/mypage";
	}
}
