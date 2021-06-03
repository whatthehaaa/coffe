<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/project/css/wook.css">
<script src="http://localhost:9000/project/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(".note-taste input").change(function(){
			if($(this).val()>5){
				alert("1~5사이에 숫자만 입력")
				$(this).val("").text("").focus();
			}
		});
		
	});
	

</script>


</head>
<body>
<jsp:include page="../../header.jsp" />

<div class="content" style="height:1300px;">
	<div style="text-align:center;margin-top:35px;">
		<h2>상품상세정보등록</h2>
	</div>
	<div class="product_content_insertMain"  >
		<form name="shopinsertForm" action="productContent_insert_proc.do" method="post" >
		<input type="hidden" value="${pid}" name="pid">
			<ul  class="main_ul" style=" list-style:none; padding-left:0px; margin:auto ; width:800px; ">
   
				<li>
					<label>상품(영어)</label>
					<input type='text' id="ptitle" name="ptitleEng">
				</li>
				<li>
					<label>상품설명</label>
					<textarea style="vertical-align:top;" class="product-content" rows="5" cols="10" name="productContent" id="productContent"placeholder="상품 설명"></textarea>
				</li>
			
				<li>
					<label>소분류</label>
				
					<select id="pkind" name="pkind">
						<option selected disabled hidden>소분류를 선택해주세요</option>
						<option value="singleorigin" >싱글오리진</option>
						<option value="blend">블렌드</option>
						<option value="decaffein">디카페인</option>
						<option value="coffeepack">커피팩</option>
						<option value="Dutch coffee">더치커피</option>
					</select>
				
				</li>
				<li>
					<label>테이스팅 노트 소제목</label>
					<input type="text" name="noteTitle">
				</li>			
				<li>
					<label style="vertical-align:top;">테이스팅 노트 설명</label>
					<textarea class="note-content" rows="5" cols="10" name="noteContent" id="noteContent"placeholder="테이스팅 노트 설명"></textarea>
				</li>		
				
				<li class="note-taste" id="note-taste">
					<label>커핑노트 맛 선택</label>
					<span>AROMA</span><input name="aroma" type="number" min='1' max='5' placeholder="1~5까지의 숫자"onKeyup="this.value=this.value.replace(/[^0-5]/g,'');">
					<span>BITTER</span><input name="bitter"type="number" min='1' max='5' placeholder="1~5까지의 숫자"onKeyup="this.value=this.value.replace(/[^0-5]/g,'');">
					<span >ACIDITY</span><input name="acid"type="number" min='1' max='5' placeholder="1~5까지의 숫자"onKeyup="this.value=this.value.replace(/[^0-5]/g,'');"><br><br>
					<span style="margin-left:175px;">SWEETNESS</span><input name="sweet" type="number" min='1' max='5' placeholder="1~5까지의 숫자"onKeyup="this.value=this.value.replace(/[^0-5]/g,'');">
					<span >BODY</span><input name="body" type="number" min='1' max='5' placeholder="1~5까지의 숫자"onKeyup="this.value=this.value.replace(/[^0-5]/g,'');">
				</li>
				<li>
					<label>로스팅 포인트 선택</label>
					<select name="roastingSel">
						<option selected disabled hidden>로스팅을 선택해 주세요</option>
						<option value="medium">미디엄</option>
						<option value="high">하이</option>
						<option value="city">시티</option>
						<option value="fullcity">풀시티</option>
						
					</select>
				</li>
				
				<li style="text-align:center;">
					<button type="submit" class="save_btn">저장하기</button>
					<a href="admin/product_list.do"><button type="button"class="previous-btn">목록으로</button></a>
					
				</li>	
			
			</ul>
		
		
		
		
		</form>
	</div><!-- product_content_insertMain -->










</div>
<jsp:include page="../../footer.jsp" />
</body>
</html>