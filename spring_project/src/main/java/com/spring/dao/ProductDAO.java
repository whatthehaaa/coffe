package com.spring.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.vo.ProductContentVO;
import com.spring.vo.ProductVO;

public class ProductDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace="mapper.shop";
	
	
	public boolean getContentInsert(ProductContentVO vo) {
		
		boolean result = false;
		int val = sqlSession.insert(namespace+".insertProductContent",vo);
		if(val != 0) result = true;
		return result;
		
		
	}
	
	
	public ProductVO getAdminContent(String pid) {
		return (ProductVO)sqlSession.selectOne(namespace+".selectContent",pid);
	}
	
	


	public ProductVO getProductContent(String pid) {
		
		return (ProductVO)sqlSession.selectOne(namespace+".selectProduct",pid);
	}
	
	
	
	
	/**
	 * ���� �����ϱ�
	 */
	public int getResultDelete(String[] dellist) {
		
		return sqlSession.delete(namespace+".deleteproduct",dellist);	
	}
	
	
	
	/**
	 * ��ǰ ����Ʈ �ҷ�����
	 */
	public ArrayList<ProductVO> getAdminProductList(String start,String end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".adminshoplist",param);
		
		return (ArrayList<ProductVO>) list;
	}
	
	
	/**
	 * ��ǰ �Է� 
	 * @param vo
	 * @return
	 */
	
	public boolean productInsert(ProductVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace+".insertProduct",vo);
		if(val != 0) result = true;
		return result;
		
	}
	
	
	

	/**
	 * ��ü ����Ʈ ī��Ʈ
	 */
	public int getListCount() {
		return sqlSession.selectOne(namespace+".listcount");
	}
	

	
	
	
	
	/** ��з� �� ����������� */
	public ArrayList<ProductVO> getList(String pkind1,String start,String end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("pkind1", pkind1);
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".shoplist1",param);
		return (ArrayList<ProductVO>)list;

	}
	
	/**
	 * �Һз� ���� ������ ���
	 */
	
	public ArrayList<ProductVO> getLists(String pkind1,String pkind2,String start,String end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("pkind1", pkind1);
		param.put("pkind2", pkind2);
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".shoplist2",param);
		return (ArrayList<ProductVO>) list;
	}
	
	
	
	

	/**
	 * �˻��� ��� ��������
	 */
	public ArrayList<ProductVO> getSearchList(String sname,String svalue, String start,String end){
		
		Map<String,String> param = new HashMap<String,String>();
		
		param.put("sname", sname);
		param.put("svalue", svalue);
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".searchlist",param);
		
		return (ArrayList<ProductVO>) list;
		
	/**	try {
			String str="";
			if(sname != "total") {
				str="where "+sname+"='"+ svalue+"'";
			}
			String sql = "select * from"
						+"(select rownum rno, pid,pmphoto,psub1,psub2,psub3,ptitle,phash,pprice100,pkind1,pkind2 from product "
						+ str+ ")"+"and between "+start +"and"+end ;
			getStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setRno(rs.getInt(1));
				vo.setPid(rs.getString(2));
				vo.setPmphoto(rs.getString(3));
				vo.setPsub1(rs.getString(4));
				vo.setPsub2(rs.getString(5));
				vo.setPsub3(rs.getString(6));
				vo.setPtitle(rs.getString(7));
				vo.setPhash(rs.getString(8));
				vo.setPprice100(rs.getString(9));
				vo.setPkind1(rs.getString(10));
				vo.setPkind2(rs.getString(12));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list; **/
	}
	
	/**
	 * ��ü �ο�� ��������
	 */
	public int getListCount(String sname,String svalue) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("sname", sname);
		param.put("svalue", svalue);
		
		return sqlSession.selectOne(namespace+".listcountajax",param);
		
	}
	
	
	/**
	 * product ����Ʈ �������°� ����
	 * @return
	 */
	public ArrayList<ProductVO> getList(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		try {
			String sql="select pid,pmphoto,pmsphoto,psub1,psub1s,psub2,psub2s,psub3,psub3s,phash,pprice100,pdate,ptitle from product";
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO vo = new ProductVO();
				vo.setPid(rs.getString(1));
				vo.setPmphoto(rs.getString(2));
				vo.setPmsphoto(rs.getString(3));
				vo.setPsub1(rs.getString(4));
				vo.setPsub1s(rs.getString(5));
				vo.setPsub2(rs.getString(6));
				vo.setPsub2s(rs.getString(7));
				vo.setPsub3(rs.getString(8));
				vo.setPsub3s(rs.getString(9));
				vo.setPhash(rs.getString(10));
				vo.setPprice100(rs.getString(11));
				vo.setPdate(rs.getString(12));
				vo.setPtitle(rs.getString(13));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
