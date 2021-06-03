package com.spring.dao;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.vo.CoffeeMemberVO;
import com.spring.vo.SessionVO;


public class CoffeeMemberDAO extends DBConn{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.mypage";
	
	private static String namespace_member="mapper.member";
	
	
	
	/**
	 * ������������ - ����Ʈ ī��Ʈ 
	 */
	public int getListCount(String sname, String svalue) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("sname", sname);
		param.put("svalue", svalue);
		return sqlSession.selectOne(namespace_member+".listcountajax", param);
	}

	/**
	 *  ������ ������ - ȸ�� �˻� ��� int String valueof
	 */
	public ArrayList<CoffeeMemberVO> getSearchList(String sname, String svalue, int start, int end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("sname", sname);
		param.put("svalue", svalue);
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<CoffeeMemberVO> list = sqlSession.selectList(namespace_member+".searchlist", param);
		return (ArrayList<CoffeeMemberVO>)list;
	}		
	
	/**
	
	 * ���������� - ȸ������ �����ϱ�
	 */
    
	public boolean getUpdate(CoffeeMemberVO vo) {
		boolean result = false;
		try {
			String sql="update coffee_member set name =?, pass=?, email=?, hp=? where id=?";

			getPreparedStatement(sql);

			 pstmt.setString(1, vo.getName());
			 pstmt.setString(2, vo.getPass());
			 pstmt.setString(3, vo.getEmail());
			 pstmt.setString(4, vo.getHp());
			 pstmt.setString(5, vo.getId());
			
			int val = pstmt.executeUpdate();
			if(val!=0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * ���������� - ȸ�� Ż���ϱ�
	 */
	public boolean getDelete(String id) {
		boolean result = false;
		try {
			String sql="delete from coffee_member where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			int val = pstmt.executeUpdate();
			if(val!=0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * login 
	 */
	public SessionVO getLogin(CoffeeMemberVO vo) {
		return sqlSession.selectOne(namespace_member+".login",vo);
	}
	
	/**
	 * ȸ������ - ID�ߺ�üũ
	 */
	public int getIdCheck(String id) {
		return sqlSession.selectOne(namespace_member+".idCheck",id);
	}
	/**
	 * ���̵�ã��
	 */
	public CoffeeMemberVO findId(String name,String hp) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("name", name);
		param.put("hp", hp);
		return sqlSession.selectOne(namespace_member+".findId",param);
	}
	/**
	 * ��й�ȣã��
	 */
	public CoffeeMemberVO findPass(String id) {
		return sqlSession.selectOne(namespace_member+".findPass",id);
	}
	/**
	 * ���̵� resultã��
	 */
	public int findName_result(String name) {
		return sqlSession.selectOne(namespace_member+".findName",name);
	}
	/**
	 * ��ȭ��ȣ result ã��
	 */
	public int findHp_result(String hp) {
		return sqlSession.selectOne(namespace_member+".findHp",hp);
	}
	/**
	 * Insert : ȸ������
	 */
	public boolean getInsert(CoffeeMemberVO vo) {
		boolean result = false;
		
		int value = sqlSession.insert(namespace_member+".join",vo);
		if(value != 0) {
			result = true;
		}
		return result;
	}
	

	
}
