<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/project/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/project/js/am-pagination.js"></script>  
<link rel="stylesheet" type="text/css" href="http://localhost:9000/project/css/shopMain.css">
<link rel="stylesheet" href = "http://localhost:9000/project/css/am-pagination.css">
<style>
   div.admin_shop_content{
   		margin:auto;
   }
	div.admin_product_list{
	/*	border:1px solid purple; */
		text-align:auto;
		width:1000px;
		margin:auto;
		height:800px;
		padding-top:10px;
	}
	div.admin_product_list div.product_TitleName{
	/*	border:1px solid red; */
		text-align:center;
	}
	div.admin_product_list div.product_TitleName h2{
		border-bottom:1px solid gray;
		border-top:1px solid gray;
		display:inline-block;
		width:900px;
		height:60px;
		font-Size:30px;
		padding-top:20px;
	}
	div.admin_product_list div.search{
	/*	border:1px solid blue; */
		height:40px;
		text-align:right;
		padding-right:50px;
		padding-top:5px;
	}
	div.admin_product_list div.search select{
		text-align:center;
		border:1px solid gray;
		border-radius:4px;
		width:80px;
		height:30px;
	}
	div.admin_product_list div.search input[type='text']{
		border:1px solid gray;
		border-radius:4px;
		width:150px;
		height:25px;
	}
	div.admin_product_list div.search button{
		border-radius:4px;
		width:50px;
		height:28px;
		margin-top:3px;
	}
	table.product_table{
	/*	border:1px solid orange; */
		width:90%;
		margin:auto;
		
	}
	table.product_table td a{
		color:black;
		text-decoration:none;
	}
	table.product_table tr:hover{
		text-decoration:underline;
	}
	table.product_table tr:first-child:hover{
		text-decoration:none;
	}
	 table.product_table,
	 table.product_table tr,
	 table.product_table td,
	 table.product_table th{
		border:1px solid gray;
		border-collapse: collapse;
	}
	table.product_table td{
		text-align:center;
		width:180px;
		height:40px;
	}
	table.product_table th{
		text-align:center;
		width:180px;
		height:40px;
	}
	 table.product_table td button{
		border:1px solid gray;
		border-radius:4px;
		background-color:white;
		width:100px;
		height:30px;
		margin:10px;
	}
	table.product_table td img{
		width:100px;
		height:40px;
	}
	
	/** admin aside */
	div.admin_shop_content{
		width:1500px;
	}
	div.admin_shop_content>aside.adminaside{
		margin-top:50px;
		width:200px;
		height:600px;
		border-right:1px solid gray;
		margin-left:50px;
		float:left;
	}
	aside.adminaside h2{
		 border-bottom:2px solid gray;
		 height:60px;
		 padding-top:30px;
		 font-Size:30px;
		 font-weight:70;
		 margin-top:20px;
	}
	aside.adminaside ul.adminaside_ul{
		list-style:none;
		margin-top:100px;
		/* border:1px solid blue; */
		margin-top:0;
	}
	
	aside.adminaside ul.adminaside_ul li{
		
		border-bottom:1px solid gray;
		padding : 5px;
		font-size:20px;
		font-weight:70;
		 padding:5px;
	}
	
	aside.adminaside ul.adminaside_ul li div.choose{
		display:inline-block;
		padding-right:3px;
		padding:5px;
	}
	 
	aside.adminaside ul.adminaside_ul li div.choose:hover{
		 -webkit-transform: scale(1.5,1.5);
    	-moz-transform: scale(1.5,1.5);
    	-o-transform: scale(1.5,1.5);
   		 -ms-transform: scale(1.5,1.5);
   		 transform: scale(1.5,1.5);
	} 
</style>
<script>
	$(document).ready(function(){	
		
		//???????????? ????????????
		$("#all").change(function(){
			//var all_check = $("#all").is(":checked");
			if($(this).is(":checked")){
				$(".part").prop("checked",true);
			}else{
				$(".part").prop("checked",false);
			}
			
		}); //change

		//???????????? ??????
		$("#btnDelete").click(function(){
			var choice = confirm("????????? ?????????????????????????");
			if(choice){
				var chk_list = new Array();
				$("input[type=checkbox]:checked").each(function(i){
					if($(this).attr("id") != "all"){
						chk_list[i] = $(this).attr("id");
					}
				});
				
				$(location).attr("href","http://localhost:9000/project/admin/product_delete_proc.do?chklist="+chk_list);
				//??????????????? - nid 
				//?????????????????? ????????? ???????????? ???????????? ?????????????????? ??????
				//????????? ???????????? ??????
			}
		});
		
		
		/**????????? ?????? ??? ?????? ?????? ????????? ?????? **/
   		admin_product_list("total", "","");
		
		
		
		
		$("#sname").change(function(){
			if($("#sname").val()=="total"){
				$("#svalue").val("");
			}
		});
		
		
	// ????????? ?????? ?????? 
	function page(dbcount, reqpage, pagesize){
			//????????? ?????? ??? ?????? 		
			var pager = jQuery("#ampaginationsm").pagination({
				maxSize : 5,			
				totals: dbcount,
				page : reqpage,
				pageSize : pagesize,
				
				lastText : '&raquo;&raquo;',
				firstText : '&laquo;&laquo',
				prevTest : '&laquo;',
				nextTest : '&raquo;',
				
				btnSize : 'sm' 			
			}); 
			
			//
			jQuery("#ampaginationsm").on('am.pagination.change',function(e){
				admin_product_list($("#sname").val(), $("#svalue").val(),e.page);
			});
		}//page
		
		
		
		/** ?????? ?????? ????????? ?????? **/
		$("#btnsearch").click(function(){
			if($("#sname").val() !="total" && $("#svalue").val() == ""){
				alert("????????? ???????????? ????????? ?????????");
				$("#svalue").focus();
				return false;
			}else{
				var sname = $("#sname").val();
				var svalue = $("#svalue").val();
				
				admin_product_list(sname, svalue,"");
			}
		});
		
		
		
		
		
		// Ajax??? ????????? ???????????? ????????? ?????? 
		function admin_product_list(sname, svalue, rpage){
			
			
			$.ajax({
				url :"admin_product_list_proc.do?sname="+sname+"&svalue="+svalue+"&rpage="+rpage,
				success:function(result){
					var jdata = result;
					
					//2-1. DHTML??? ???????????? ????????? ?????? ??? ??????
					var output = "<table class='product_table'>"
						output += "<tr>"
						output += "<th><input type='checkbox' id='all'></th>"
						output += "<th>?????????</th><th>??????</th><th>?????????</th><th>?????????</th><th>????????????</th><th>??????</th>"
						output += "</tr>"
					for(var i in jdata.jlist){
						output += "<tr>"
						output += "<td><input type='checkbox' name='chk' id="+jdata.jlist[i].pid+"class='part'></td>"
						output += "<td><a href='http://localhost:9000/project/admin_product_content.do?pid="+jdata.jlist[i].pid+"'>"+jdata.jlist[i].ptitle+"</td></a>"
						output += "<td>"+jdata.jlist[i].pprice+"</td>"
						output += "<td>"+jdata.jlist[i].pkind1+"</td>"
						output += "<td>"+jdata.jlist[i].pkind2+"</td>"
						if(jdata.jlist[i].psub1 != null){
						output += "<td><img src = 'http://localhost:9000/project/images/"+jdata.jlist[i].psub1+"'></td>" // ????????? O,X??? ??????????????? 
						}else{
							output += "<td></td>"
						}
						output += "<td>"+jdata.jlist[i].pdate+"</td>" 
						output += "</tr>"
		
					}
					
					output += '<tr><td colspan="7"> <div id="ampaginationsm"></div> </td></tr>'
					output += "<tr><td colspan='7'>"
					output += "<a href='http://localhost:9000/project/admin_product_insert.do'><button type='button'>????????????</button></a>"
					output += "<button type='button' id='btnDelete'>????????????</button>"
					output += "</td></tr></table>"
					
					$("table.product_table").remove();
					$("div.search").after(output);
					
					page(jdata.dbcount, jdata.reqpage, jdata.pagesize);
					
				}//success
				
			});//ajax
			
		}   
		
	});//ready

	
	
</script>
</head>
<body>
<jsp:include page="../../header.jsp" />
<div class="admin_shop_content">
<aside class="adminaside">
	<h2>???????????????</h2>
	<ul class=adminaside_ul>
		
		<li><a href="http://localhost:9000/project/admin/member_list.do"><div class="choose">????????????</div></a></li>
		<li><a href="http://localhost:9000/project/admin/product_list.do"><div class="choose">????????????</div></a></li>
		<li><div class="choose">??????????????????</div></li>
	</ul>
</aside>
<div class="admin_product_list">
	<div class="product_TitleName">
		<h2>????????????</h2>
	</div>
	 <div class="search">
				<select id='sname'>
				<option value='total'>??????</option>
				<option value='pkind1'>?????????</option>
				<option value='pkind2'>?????????</option>
				</select>
				<input type='text' id='svalue'>
				<button id="btnsearch">??????</button>
				</div>
	</div>
	

</div>

<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>