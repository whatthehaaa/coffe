<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="css/gj.css">
<link rel="stylesheet" href="css/notice.css">
<link rel="stylesheet" href = "css/am-pagination.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/am-pagination.js"></script>
<script>
	$(document).ready(
			function() {

				//페이지 번호 및 링크 		
				var pager = jQuery("#ampaginationsm").pagination({
					maxSize : 5,
					totals : '${dbCount}',
					page : '${reqPage}',
					pageSize : '${pageSize}',

					lastText : '&raquo;&raquo;',
					firstText : '&laquo;&laquo',
					prevTest : '&laquo;',
					nextTest : '&raquo;',

					btnSize : 'sm'
				});

				//
				jQuery("#ampaginationsm").on(
						'am.pagination.change',
						function(e) {
							$(location).attr(
									'href',
									'http://localhost:9000/test/notice.do?rpage='
											+ e.page);
							//location.href('이동페이지');
						});

			});
</script>
</head>
<body>
	<div id="index_content">
		<section class="contentWrap">
			<div class="main_text_field">
				<h1 class="main_text">공지사항</h1>
				<p class="sub_text">
					<span>Bean's Story는 국내 브랜드의 자부심을 지키며</span> <br>대한민국 커피 문화를
					이끌어 나갑니다.
				</p>
			</div>
			<div class="list">
				<ul>
					<li><a href="notice.do" class="select_on">공지사항</a></li>
					<li><a href="event.do">이벤트</a></li>
					<li><a href="question.do">자주 묻는 질문</a></li>
				</ul>
				<ul>
					<li><a href="map.do">지도</a></li>
					<li><a href="youtube.do">유튜브</a></li>
				</ul>
			</div>

		</section>
		<section>
			<div class="notice_list">

				<div class="hnm_text">
					<h1>HOME > 공지사항</h1>
					<a href="https://open.kakao.com/o/smjXAuSc" target="_blank"
						class="kakao_info"> 카카오톡 1:1 문의 <img class="kakao">
						<a href="notice_write.do" class="write_btn">글쓰기</a>
					</a>
				</div>
				<div class="hnm2_text">
					<h1>Bean's Story의 공지사항을 확인하세요.</h1>
				</div>

				<div class="nline"></div>

				<ul class="n_board">
					<c:forEach var="vo" items="${list}">
						<li>

							<div class="e_img_board">
								<a href="notice_page.do?id=${vo.nid}"> <img
									src="upload/${vo.getNfile_t()}">
								</a>
							</div>

							<div class="e_content_board">
								<dt>
									<a href="notice_page.do?id=${vo.nid}">${vo.ntitle}</a>
								</dt>
								<dd>
									<span class="brown_txt">작성일 </span>${vo.ndate}
								</dd>
							</div>
						</li>
					</c:forEach>

				</ul>

				<!-- 
		 	<div class="n_textline1">			
			 	<div class ="notice_pagelist">
				<a href = "notice_page.do">공지사항 드립니다.</a>
				</div> -->


			<div id="ampaginationsm"></div>
				
				<div class="n_textline"></div>
			</div>
		</section>
	</div>

</body>
</html>