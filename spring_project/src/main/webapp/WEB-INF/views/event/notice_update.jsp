<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_page</title>
<link rel="stylesheet" href="css/event_write.css">
<link rel="stylesheet" href="css/gj.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){ 
	$("#btnNoticeWrite").click(function(){
	if($("#ntitle").val().length==0){ alert("제목을 입력하세요."); $("#ntitle").focus(); return false; }
	if($("#ncontent").val().length==0){ alert("내용을 입력하세요."); $("#ncontent").focus(); return false; }
	if($("#ndate").val().length==0){ alert("공지일을 입력하세요."); $("#ndate").focus(); return false; }
	if($("#file1").val().length==0){ alert("파일을 등록하세요."); $("#file1").focus(); return false; }
	if($("#file2").val().length==0){ alert("파일을 등록하세요."); $("#file2").focus(); return false; }
	});
	});
</script>
</head>
<body>
	<div id="index_content">
		<section class="contentWrap">
			<div class="main_text_field">
				<h1 class="main_text">공지 사항</h1>
				<p class="sub_text">
					<span>Bean's Story</span> <br>공지 작성
				</p>
			</div>
			<div class="list">
				<ul>
					<li><a href="notice.do">공지사항</a></li>
					<li><a href="event.do" >이벤트</a></li>
					<li><a href="question.do">자주 묻는 질문</a></li>
				</ul>
				<ul>
					<li><a href="map.do">지도</a></li>
					<li><a href="youtube.do">유튜브</a></li>
				</ul>
			</div>

		</section>
		<section>
			<div class="event_page">

				<div class="event_text">
					<h1>HOME > 공지사항 > 공지사항</h1>
					<a href="https://open.kakao.com/o/smjXAuSc" target="_blank"
						class="kakao_info"> 카카오톡 1:1 문의 <img class="kakao">
					</a>
				</div>

				<div class="eline"></div>
				<div>
					<form name="notice_update_form"  action="notice_update_proc.do" method="post" 
						 class="notice_write" enctype="multipart/form-data">				
						<ul>
							<li>
								<input type="hidden" name="nid" id="nid" value="${vo.nid }">
								<label>제목</label>
								<input type="text" name="ntitle" id="ntitle" value="${vo.ntitle }">
							</li>
							<li>
								<label>공지일</label>
								<input type="date" name="ndate" id="ndate" min="0000" max="9999" value="${vo.ndate }">
							</li>
							<li>
								<label>내용</label>
								<textarea name="ncontent" id="ncontent" style="margin: 0px; width: 90%; height: 300px;">${vo.ncontent }</textarea>
							</li>
							<li>
								<label>이미지</label>
								<input type="file" name="file1" id="file1">
							</li>
							<li>
								<label>썸네일</label>
								<input type="file" name="file2" id="file2">
							</li>
							<li>
								<button type="submit" class="btn_style" id="btnNoticeWrite">등록</button>
								<button type="reset" class="btn_style">취소</button>							
							</li>
						</ul>
					</form>
				</div>
				
				
				
				
				
				
				
				
				<%-- <div class="event_text2">
					<h1 class="event_title">${vo.etitle}</h1>
					<h1 class="event_date">기간 : ${vo.edate } ~ ${vo.edate2 }</h1>
				</div>
				
				<div class="e_state_board">
							<span class="end${vo.eend}">
								<c:choose>
								<c:when test="${vo.eend eq 0}">
								    진행
								</c:when>
								<c:when test="${vo.eend eq 1}">
								    종료
								</c:when>
							</c:choose>
							</span>
				</div>

				<div class="e2line"></div>
					
				<div class="event_page_text">
					<h1>
					${vo.econtent }
					</h1>
					<div class="event_page_img">
						<img src="images/${vo.esfile}">
					</div>

				</div> --%>

				<div class="e_textline">
					<div class="ep_list">
						<a href="http://localhost:9000/test/notice.do">목록보기</a>
					</div>
				</div>



				<div class="e_textline2"></div>

				
			</div>

		</section>
	</div>


</body>
</html>