<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.spring.dao.*,java.util.*,com.spring.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%

	String pkind1 = request.getParameter("pkind1");
	String pkind2 = request.getParameter("pkind2");
	int i=0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean's Story Shop</title>
<script src="http://localhost:9000/project/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/project/css/shopMain.css">
<link rel="stylesheet" type="text/css" href = "http://localhost:9000/project/css/am-pagination.css">
<script src="http://localhost:9000/project/js/am-pagination.js"></script>   
<script>
	$(document).ready(function(){
		
		choose();
		
		function choose(){
		  var kind1 = "<%= pkind1 %>";
			
		 if(kind1 != "null"){
			 var item = "<%= pkind1 %>";
				if(item == "coffee"){
					$("#subulcoffee").show();
					$("#subulgoods").hide();
				}else if(item == "goods"){
					$("#subulcoffee").hide();
					$("#subulgoods").show();
				}
		}else{
			$("#subulcoffee").hide();
			$("#subulgoods").hide();
		}
		}//choose
		
		$("#subCoffeeTitle").click(function(){
			if($("#subulcoffee").is(":visible")){
				$("#subulcoffee").hide();
			}else{
				$("#subulcoffee").show();
				$(location).attr('href','http://localhost:9000/project/shopMain3_1.do?pkind1=coffee');
			}
		}); // CoffeeClick
		
		$("#subGoodsTitle").click(function(){
			if($("#subulgoods").is(":visible")){
				$("#subulgoods").hide();
			}else{
				$("#subulgoods").show();
				$(location).attr('href','http://localhost:9000/project/shopMain3_1.do?pkind1=goods');
			}
		}); //GoodsClick
	
		$("#<%=pkind2%>").css('background','lightgray');
		
		var pkind1 = "<%= pkind1 %>";
		var pkind2 = "<%= pkind2 %>";
		
		if(pkind1=='coffee'){
			$('#subCoffeeTitle').css('text-decoration','underline');
		}else if(pkind1=='goods'){
			$('#subGoodsTitle').css('text-decoration','underline');
		}
		
		
		//????????? ?????? ??? ?????? 		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,	
			totals:10,
			page:1,
			pageSize:12, 
		/*	totals:'${dbCount}',
			page : '${reqPage}',
			pageSize : '${pageSize}', */
					
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo',
			prevTest : '&laquo;',
			nextTest : '&raquo;',
			
			btnSize : 'sm' 			
		}); 
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change',function(e){
			$(location).attr('href','http://localhost:9000/project/shopMain3_2.do?pkind1=<%= pkind1%>&&pkind2=<%= pkind2%>&&rpage='+e.page);  
			//location.href('???????????????');
		});
		
		
		/** ?????? ?????? ????????? ?????? **/
		$("#btnsearch").click(function(){		
				$(location).attr('href','http://localhost:9000/project/shopMain2.do');
			
		});
		
	});//ready
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="content">
<div class="color">
</div>
	<aside class="side">
		<div class="sidecontent">
			<ul class="all">
				<a href="http://localhost:9000/project/index.do"><img src="http://localhost:9000/project/images/logo.png"></a>
				<li class="allli">
					<h3 id="subCoffeeTitle">??????</h3>
					<ul class="subul" id="subulcoffee">
							<li class="subli" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=???????????????">???????????????</a></li>
							<li class="subli" id="?????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=?????????">?????????</a></li>
							<li class="subli" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>
							<li class="subli" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">?????????/????????????</a></li>				
							<li class="subli" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>				
							<li class="subli" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>	
						</ul>						
				</li>
				<li class="allli">
					<h3 id="subGoodsTitle">????????????</h3>
						<ul class="subul" id="subulgoods">
							<li class="subli" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=????????????">????????????</a></li>
							<li class="subli" id="??????????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=??????????????????">??????????????????</a></li>
							<li class="subli" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=???????????????">???????????????</a></li>
							<li class="subli" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=???????????????">???????????????</a></li>				
							<li class="subli" id="??????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=??????">Bean's Story ??????</a></li>				
						</ul>
					
				</li>
				<li class="allli"><h3>????????????</h3></li>
				<li class="allli"><h3>?????????</h3></li>
			</ul>		
		</div>
	</aside>
	<div class="shopMain">
		<div class="shopMainTop">
		<% if(pkind1 != null) {%> <%= pkind1 %> <% if(pkind2 != null) { %> > <%= pkind2 %> <% } } else {}%> 
		</div>
		<div class="shopMainCenterMenu">
			<% if(pkind1 != null) {%>
			<% if( pkind1.equals("coffee")  ) { %>
			<ul>
				<h2><% if(pkind2 != null) { %>
						<%= pkind2 %>
					<% }else { %>
						??????
					<% } %>				
				</h2>
				<li class="underline" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=???????????????">???????????????</a></li>
				<li class="underline" id="?????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=?????????">?????????</a></li>
				<li class="underline" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>
				<li class="underline" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">?????????/????????????</a></li>				
				<li class="underline" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>				
				<li class="underline" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=coffee&&pkind2=????????????">????????????</a></li>
			</ul>
			<% } else if(pkind1.equals("goods")){%>
			<ul>
				<h2><% if(pkind2 != null) { %>
						<%= pkind2 %>
					<% }else { %>
						????????????
					<% } %>				
				</h2>
				<li class="underline" id="????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=????????????">????????????</a></li>
				<li class="underline" id="??????????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=??????????????????">??????????????????</a></li>
				<li class="underline" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=???????????????">???????????????</a></li>
				<li class="underline" id="???????????????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=???????????????">???????????????</a></li>				
				<li class="underline" id="??????"><a href="http://localhost:9000/project/shopMain3_2.do?pkind1=goods&&pkind2=??????">Bean's Story ??????</a></li>				
			</ul>
			<%  } %>
			<% } //kind1??? null??? ????????? %>
		</div> 
		<div class="shopMainCenter">
		<div class="subMainCenter">
			<div class="search">
				<button id="btnsearch">????????????</button>
				</div>
				<div  class='orders'>
			<!--  	<span id='pdate'>New</span>
				<span id='ptitle' class='left'>Name</span> 
				<span id='pprice' class='left'>LowPrice</span> 
				<span id='pprice' class='left'>HighPrice</span>
			    <span id='name' class='left'>Review</span>  -->
				</div>	   
		<table class="shopMainCenterTable">
		  <c:forEach var="vo"  items="${list}">
		  	<% if(i%4==0) {%>
				<tr>	
				<%} %>	
		   		<td>
				    <img src = 'http://localhost:9000/project/resources/upload/${vo.pmsphoto }' 
				    onmouseover="this.src='http://localhost:9000/project/resources/upload/${vo.phsphoto }'"
					onmouseout="this.src='http://localhost:9000/project/resources/upload/${vo.pmsphoto }'">
				    <div class='event'>
					   <div class='event'>
					    <div class='a'>
					       <c:if test ="${!empty vo.psub1 }">
					    		<img src = 'http://localhost:9000/project/images/${vo.psub1 }'>
					  		</c:if>
					  	</div>
					   	<div class='b'>
					   		<c:if test ="${!empty vo.psub2 }">
					   			<img src = 'http://localhost:9000/project/images/${vo.psub2 }'>
					    	</c:if>
					    </div>
					    <div class='c'>
					   		<c:if test ="${!empty vo.psub3 }">
					   			<img src = 'http://localhost:9000/project/images/${vo.psub3 }'>
					    	</c:if>
					    </div>
					 </div>
					 </div>
					    <div class='title'>
					   		 <a href="http://localhost:9000/project/shopContent.do?pid=${vo.pid }"> ${vo.ptitle }</a>
					    </div>
					    <div class='gray'>
					 		${vo.phash }
					   </div>
					    <div class='price'>
					   		<c:if test ="${!empty vo.psub1 }">
						    <div class='beforeprice'>
								${vo.pprice100 }
							</div>
							</c:if>
							<c:if test ="${empty vo.psub1 }">
								<div class='nowprice'>
									${vo.pprice100 }
								</div>
							</c:if>
							<div class='nowprice'>
								<c:if test ="${!empty vo.psub1 }">
									${vo.pprice100 }
								</c:if>
							</div>
							<div class='discount'>
							 <c:if test ="${!empty vo.psub1 }">
								[10%]
							</c:if>
							</div>
						</div>
						<div class='review'>
							??????: 17
						</div>
		   		 </td>
		   	<% if(i%4==3) {%>
				</tr>	
			<%} %>		 
		   	<% i++; %>	
		    </c:forEach>
		    <tr>
		 	   <td colspan="4"> <div id="ampaginationsm"></div> </td>
		    </tr>
		    </table>
		
	</div>
</div>
</div>
<!-- footer -->
<jsp:include page="../footer.jsp" />
</body>
</html>