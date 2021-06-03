<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/** admin aside */
	div.admin_shop_content{
		width:1500px;
	}
	div.admin_shop_content>aside.adminaside{
		width:200px;
		height:600px;
		border:1px solid red;
		margin-left:50px;
		float:left;
	}
	aside.adminaside ul.adminaside_ul{
		list-style:none;
		margin-top:100px;
	}
	aside.adminaside ul.adminaside_ul li{
		
		border:1px solid gray;
		padding : 5px;
		font-size:18px;
	}
	
	
	
	 div.admin_member_content{
   		margin:auto;
   }
	div.admin_member_list{
		border:1px solid purple;
		text-align:auto;
		width:1000px;
		margin:auto;
		height:800px;
		padding-top:70px;
	}
	div.admin_member_list div.member_title{
		border:1px solid red;
		text-align:center;
	}
	div.admin_member_list div.member_title h1{
		border-bottom:1px solid gray;
		display:inline-block;
		width:200px;
		padding-bottom:3px;
	}
	
	div.admin_member_list{
		border:1px solid orange;
		width:90%;
		margin:auto;
	}
	
	div.admin_member_list table.member_list_table,
	div.admin_member_list table.member_list_table,
	div.admin_member_list table.member_list_table,
	div.admin_member_list table.member_list_table th{
		border:1px solid gray;
		border-collapse: collapse;
	}
	div.admin_member_list table.member_list_table td{
		text-align:center;
		width:180px;
		height:40px;
	}

	
</style>
<script src="http://localhost:9000/project/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/project/js/am-pagination.js"></script>  
<script>
	$(document).ready(function(){
		
		//페이지 번호 및 링크 		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,			
			totals:'${dbCount}',
			page : '${reqPage}',
			pageSize : '${pageSize}',
					
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo',
			prevTest : '&laquo;',
			nextTest : '&raquo;',
			
			btnSize : 'sm' 			
		}); 
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change',function(e){
			$(location).attr('href','http://localhost:9000/MyCGV/admin/member/member_list.do?rpage='+e.page);  
		});
		
	});
	
</script>
</head>
<body>
<!-- header -->
	<jsp:include page="../../header.jsp" />

<div class="admin_member_content">
<aside class="adminaside">
	<ul class=adminaside_ul>
		<li>회원관리</li>
		<li>상품관리</li>
		<li>공지사항관리</li>
	</ul>
</aside>
	<div class="member_list_table">
				<div class="member_title">
				<h1>회원리스트 </h1>		
				</div>		
			<div class="admin_member_list">
				<table class="member_list_table">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>성명</th>
						<th>핸드폰번호</th>
						<th>가입일자</th>
					</tr>
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.rno }</td>
						<td>${vo.id }</td>
						<td>${vo.name }</td>
						<td>${vo.hp }</td>
						<td>${vo.mdate }</td>						
					</tr>
					</c:forEach>
					<tr>
						<td colspan="5"> <div id="ampaginationsm"></div> </td>
					</tr>
				</table>
			</div>
	</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>