<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/project/js/jquery-3.5.1.min.js"></script>
<style>
	div.shopinsert{
		border:1px solid red;
		text-align:center;
		margin:30px;
		
	}
	div.shopinsert div.bigname{
	/*	border:1px solid red; */
		height:50px;
		padding-top:20px;
		
	}
	div.shopinsert div.bigname h2{
		border-bottom:1px solid gray;
		display:inline-block;
		width:400px;
		padding-bottom:5px;
		
	}
	div.shopinsert div.shopInsertContent{
		text-align:center;
	/*	border:1px solid red; */
	}
	div.shopinsert div.shopInsertContent ul.big{
		list-style:none;
	/*	border:1px solid green; */
		width:900px;
		margin:auto;
	}
	
	div.shopinsert div.shopInsertContent ul.big>li{
		margin:auto;
	/*	border:1px solid blue; */
		padding:10px;
		width:50%;
		clear:left;
		height:30px;
		
		
	}
	div.shopInsertContent ul.big>li>label{
		border:1px solid white;
		border-bottom :1px solid gray;
		height:30px;
		width:130px;
		padding-top:5px;
		display:inline-block;
		float:left;
	}
	
	div.shopinsert div.shopInsertContent ul.big>li>input[type='text']{
		border: 1px solid white;
		border-bottom: 1px solid gray;
		height:23px;
		width:200px;
		padding:5px;
		display:inline-block;
	}
	
	div.shopinsert div.shopInsertContent ul.big>li>select{
		border: 1px solid white;
		border-bottom: 1px solid gray;
		height:30px;
		width:200px;
		padding-top:5px;
		margin-top:5px;
	}
	div.shopinsert div.shopInsertContent ul.big>li>div.radio{
		border-bottom:1px solid gray;
		display:inline-block;
		height:30px;
		width:200px;
		margin:5px 0;
	}
	div.shopinsert div.shopInsertContent ul.big>li>button.btnStylep{
		border:1px solid gray;
		border-radius:4px;
		background-color:white;
		width:100px;
		height:30px;
		margin:0 10px;
		
	}
	div.shopinsert div.shopInsertContent ul.big>li.picture{
	/*	border-top:1px solid red; */
		height:230px;
		text-align:center;
	}
	div.shopinsert div.shopInsertContent ul.big>li.picture input[type='file']{
	/**	border:1px solid red; */
		padding-left:60px;
		padding-bottom:5px;
	}
	div.shopinsert div.shopInsertContent ul.big>li>div.picture{
	/*	border:1px solid green; */
		height:200px;
		width:200px;
		margin:auto;
		margin-bottom:5px;
		
	}
	div.shopinsert div.shopInsertContent ul.big>li>div.picture img{
		height:200px;
		width:200px;
		margin:auto;
	}
	div.shopinsert div.shopInsertContent ul.big>li p{
		 border-bottom:1px solid gray;
		 margin:auto;
		 display:inline-block;
		 width:200px;
		 height:30px;
		 padding:0px;
	}
	div.shopinsert div.shopInsertContent  a{
		color:black;
		text-decoration:none;
	}
	
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) button{
		width:50px;
		height:40px;
		float:right;
	}
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) ul{
	/*	border:1px solid red; */
		text-align:center;
		list-style:none;
	}
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) ul li{
	/*	border:1px solid red; */
		padding:5px 0;
	}
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) ul li{
	/*	border:1px solid red; */
		padding:5px 0;
	}
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) ul li label{
		border-bottom:1px solid gray;
		display:inline-block;
		width:80px;
		height:28px;
		margin:0,10px;
		
	}
	div.shopinsert div.shopInsertContent ul.big>li:nth-child(5) ul li input[type='text']{
		border: 1px solid white;
		border-bottom:1px solid gray;
		display:inline-block;
		width:200px;
		height:35px;
		padding:2px 0;
	}
	
	
	
</style>
<script>
$(document).ready(function(){
	$(".moreul").hide();
	
	$("#productInsert").click(function(){
			shopinsertForm.submit();
			});
	$("#more").click(function(){
		if($(".moreul").is(":visible")){
			$(".price").css('height','30');
			$(".moreul").hide();
		}else{
			$(".price").css('height','180');
			$(".moreul").show();
		}
		
		var pkind1= $("#pkind1").val();
		
	});
	
	$("#file1").on("change", ImgFileSelect1);
	$("#file2").on("change", ImgFileSelect2);
	
	});
	

	
	
	
	
function sub(type, select){
	$('#pkind2').empty();
	
	
	if(type=='coffee'){
		$('#pkind2').append("<option value=''>??????????????????</option>");
		$('#pkind2').append("<option value='???????????????'>???????????????</option>");
		$('#pkind2').append("<option value='?????????'>?????????</option>");
		$('#pkind2').append("<option value='????????????'>????????????</option>");
		$('#pkind2').append("<option value='????????????'>????????????</option>");
		$('#pkind2').append("<option value='????????????'>????????????</option>");
		$('#pkind2').append("<option value='????????????'>????????????</option>");
	}else if(type == 'goods'){
		$('#pkind2').append("<option value='????????????'>????????????</option>");
		$('#pkind2').append("<option value='??????????????????'>??????????????????</option>");
		$('#pkind2').append("<option value='???????????????'>???????????????</option>");
		$('#pkind2').append("<option value='???????????????'>???????????????</option>");
		$('#pkind2').append("<option value='??????'>??????</option>");
	}
	document.getElementById("pkind2").style.display="";

		
};
	
function psub3_val(obj){
	getObj = obj[obj.selectedIndex].innerHTML;
	$("input[name='psub3']").val(getObj+".png");
}


function ImgFileSelect1(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		sel_file = f;
		var reader= new FileReader();
		reader.onload = function(e){
			$("#img1").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
	
}

function ImgFileSelect2(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		sel_file = f;
		var reader= new FileReader();
		reader.onload = function(e){
			$("#img2").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
	
}


</script>
</head>
<body>
<jsp:include page="../../header.jsp" />
<div class="shopinsert">
	<div class="bigname">
	<h2>????????????</h2>
	</div>
	<div class="shopInsertContent">
	<form name="shopinsertForm" action="shop_insert_proc.do" method="post" enctype="multipart/form-data">
	<ul class="big">
		<li>
			<label>?????????</label>
			<input type='text' id="ptitle" name="ptitle">
		</li>
		<li>
			<label>?????????</label>
			<select id="pkind1" name="pkind1" onchange='sub(this.value)'>
				<option>???????????? ??????????????????</option>
				<option value="coffee">??????</option>
				<option value="goods">??????</option>
				<option value="tea">???</option>
			</select>
		</li>
		<li>
			<label>?????????</label>
		
			<select id="pkind2" name="pkind2" onchange="psub3_val(this)">
				<option>???????????? ??????????????????</option>
			</select>
		
		</li>
		<li>
			<label>????????????</label>
			<input type='text' placeholder="#000 ???????????? ??????????????????" id="phash" name="phash">
		</li>
		<li class="price">
			<label>????????????</label>
			<input type='text' placeholder="????????? ??????????????????" id="pprice100" name="pprice100">
			<button type="button" id="more">more</button>
				<ul class="moreul">
					<li>
						<label>200g ??????</label>
						<input type='text' placeholder="????????? ??????????????????" id="pprice200" name="pprice200">
					</li>
					<li>
						<label>500g ??????</label>
						<input type='text' placeholder="????????? ??????????????????" id="pprice500" name="pprice500">
					</li>
					<li>
						<label>1kg ??????</label>
						<input type='text' placeholder="????????? ??????????????????" id="pprice1000" name="pprice1000">
					</li>	
						
				</ul>
		</li>
	
		<li>
			<label>????????????</label>
			<div class="radio">
			<input type="radio" name="psub1" value="???????????????_??????.png">O
			<input type="radio" name="psub1" value="">X
			</div>
		</li>
		<li>
			<label>?????????</label>
			<div class="radio">
			<input type="radio" name="psub2" value="????????????.png">????????????
			<input type="radio" name="psub2" value="">?????????
			</div>
		</li>
		<li>
			<label>????????????</label>
			<input type='text' placeholder="????????? ???????????? ???????????????." id="psub3" name="psub3" readonly>
		</li>
		
		<li>
			<p>????????????</p>
			
			
		</li>
		<li class="picture">
			<input type ="file" name="file1" id="file1">
		<div class="picture" id="mphoto">
			<img id="img1" />
		</div>
		</li>
		<li>
			<p>???????????????????????????</p>
		</li>
		<li class="picture">
			<input type ="file" name="file2" id="file2">
		<div class="picture">
			<img id="img2"/>
		</div>
		</li>
		<li >
			<button type="button" id="productInsert" class="btnStylep">????????????</button>
			<button type="button" id="productList"  class="btnStylep"><a href="http://localhost:9000/project/admin/product_list.do">????????????</a></button>
		</li>
	</ul>
	</form>
	</div>


</div>
<jsp:include page="../../footer.jsp" />
</body>
</html>