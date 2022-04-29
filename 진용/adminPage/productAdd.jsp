<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");

%>
<%
    String user_id = null;
    if (session.getAttribute("user_id") != null) {
    	user_id = (String) session.getAttribute("user_id");
    }
%>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script> <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js">
    </script> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-5.1.3-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../fontstyle/fontello-4581031e/css/fontello.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">

<style type="text/css">
	/* body{font-size: small;} */
	#scroll{
		position: sticky;
		top: 0;
		background-color: white;
		background-color: rgba( 255, 255, 255, 0.5 );
	}
	#lastnav{
		padding-right: 50px;
	}
	.breadcrumb {
		 background: white; 
	}
	a:link { color:black; }
	a:visited { color:black; }
	a:hover { color:mute;}
	a:active { color:black; }
</style>
</head>
	<script src="board.js" type="text/javascript"></script>
<script>
 cnt=1;
 function input_append(ff){
   cnt++;
   app = document.getElementById("append");
   app.innerHTML +="<tr><td>"+cnt+"</td><td colspan=2> <input type=file name=product_img"+cnt+" size=40 maxlength=100 class="+"form-control"+"></td></tr>";
   //document.product_frm.submit();
 }
</script>
<script type="text/javascript">

function product_check_ok(){
	if(document.product_frm.product_name.value.length == 0){
		alert("상품이름을입력하세요");
		document.product_frm.product_name.focus();
		return;
	}	
	if(document.product_frm.product_price.value.length == 0){
		alert("가격을입력하세요");
		document.product_frm.product_price.focus();
		return;
	}	
	if(document.product_frm.product_stock.value.length == 0){
		alert("상품수량을입력하세요");
		document.product_frm.product_stock.focus();
		return;
	}	
	if(document.product_frm.product_desc.value.length == 0){
		alert("상품수량을입력하세요");
		document.product_frm.product_desc.focus();
		return;
	}	
	
	if(document.product_frm.category_code.value.length == 0){
		alert("상품수량을입력하세요");
		document.product_frm.category_code.focus();
		return;
	}	
	/* $("#editCart").on("click", function() {} */
	
	/* var product_name = $('#product_count').val();
	var product_price = $('#product_number').val();
	var product_stock = $('#cart_number').val();
	var product_desc = $('#cart_number').val();
	var product_desc = $('#category_code').val(); */
	
	
	//var product_desc = $('#category_code').val();
	
	
	
	// userUpdate.jsp의 form action값으로 submit함
	document.product_frm.submit();
}



</script>
<body>
<!-- 스크롤 네비바 시작 -->
<%-- <%
	if(((String)session.getAttribute("user_id"))!=null){
		user_id =(String)session.getAttribute("user_id");
	}
%> --%>
<%-- <jsp:include page="../main/mainHeader.jsp"></jsp:include> --%> 

<!-- Breadcrumb 시작 -->
<center>
<div style="width: 1100px;">
	<nav aria-label="breadcrumb" style="float: right;">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../main/main.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="../adminPage/adminPage.jsp">Admin page</a></li>
			<li class="breadcrumb-item active" aria-current="page">Product registration</li>
		</ol>
	</nav>
</div>
</center>
<!-- Breadcrumb 끝 -->
<br><br><br>
	<center>
	<div class="table-responsive" >
		<div style="width:900px; padding-right: 700px; text-align: left;">
		<p>
		<h2>Product</h2>
		상품 등록
		</p>
		</div>	
<form   name="product_frm" action="productAddOK.jsp" method="post" enctype="multipart/form-data">
	<table id="append" class="table" style="width: 900px;">
		<tr>
			<td>상품이름</td>
			<td><input type="text" name="product_name" id="product_name" class="form-control" style="width: 300px;"></td>
		</tr>
		<tr>
			<td>상품가격</td>
			
			<td><input type="text" name="product_price" id="product_price" class="form-control" style="width: 100px;"></td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td><input type="text" name="product_stock" id="product_stock" class="form-control" style="width: 100px;"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea rows="100" cols="100" name="product_desc" id="product_desc" class="form-control" style="height: 100px;"></textarea>
			<!-- <input type="text" name="product_desc" id="product_desc" style="width: 700px; height: 300px;" class="form-control"> --></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<select name="category_code" class="form-select" style="width: 100px;"> 
					<option value="상의">상의</option>
					<option value="하의">하의</option>
					<option value="신발">신발</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품이미지</td>
			<td><input  type="file" name="product_img1" size="40" maxlength="100" id="product_img1" class="form-control"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="사진 추가" onclick="input_append(this.form)" class="btn btn-outline-dark"></td>
		</tr>
	</table>
	<br><br>
			<input type="button" value="상품등록" onclick="product_check_ok()" class="btn btn-outline-dark">
</form>
</div>
</center>
<br><br><br><br>
<%-- <jsp:include page="../main/mainfooter.jsp"></jsp:include> --%>
</body>
</html>