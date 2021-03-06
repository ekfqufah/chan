<%@page import="java.sql.Timestamp"%>
<%@page import="login.UserDBBean"%>
<%@page import="notice.QnABean"%>
<%@page import="notice.QnADBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%

	String user_id = null;
	String pageNum = null;
	if(((String)session.getAttribute("user_id"))!=null){
		user_id =(String)session.getAttribute("user_id");
		System.out.print(user_id);
	}
	
	if(pageNum == null){
		pageNum = "1";
	}
	
 	pageNum = request.getParameter("pageNum");
 	
 	String select = request.getParameter("pageChange");
	boolean isAdPage = true;
	if (select == null) {
		isAdPage = false;
	}
%>
<%
	QnADBBean qnaDB = QnADBBean.getInstance();
	ArrayList<QnABean> boards = qnaDB.getList(pageNum);
	
	UserDBBean udb = new UserDBBean();
	boolean isAdmin = udb.isAdmin(user_id);
	
	int n_num=0, n_hit=0;
	String n_title, n_content;
	Timestamp n_date;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	

%>
<!doctype html>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <script src="board.js" type="text/javascript"></script> 
<style> 
	#container, #ntc, #navi { 
		min-width: 1100px; 
		max-width: 1280px; 
		margin: 0 auto; /* ????????? ????????? ?????? */ 
		font-family: "Malgun Gothic",??????;
		font-size: 12px;
	}
	#ntc{
		padding-top: 3%;
	} 
	p{
		font-size: small;
	} 
	#list { 
		text-align: left; 
	} 
	#title { 
		text-align: left; 
	} 
	#write { 
		text-align: right; 
	} /* Bootstrap ?????? */ 
	.table > thead > tr > td { 
		text-align: center; 
	} 
	.table-hover > tbody > tr:hover { 
		background-color: #eeeeef; 
	} 
	.table > tbody > tr > td { 
		text-align: center; 
	} 
	a:link { color: black; text-decoration: none;}
 	a:visited { color: gray; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
	nav > #paging { 
		text-align: center; 
	} 
</style>
<% if(!isAdPage){ %>
 <jsp:include page="../main/mainHeader.jsp"></jsp:include>
 <% } %>
</head>
<body>
<div id="navi" style= "--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
	<ul class="breadcrumb" style="float: right;">
		<li class="breadcrumb-item"><a href="../main/main.jsp">Home</a></li>
		<li class="breadcrumb-item"><a href="../customer_service/customer_service.jsp">Customer Service</a></li>
		<li class="breadcrumb-item active">Q & A</li>
	</ul>
</div>
<% if(!isAdPage){ %>
<div id="ntc">
	<h4 id="list">Q & A</h4>
	<p>????????? ??????, ?????? ?????? ??????, ?????? ??????, ????????? ?????? ??? ?????? ????????? ???????????? ???????????????~</p>
</div>
<% } %>
<div id="container">
	<table class="table table-hover"> 
			<tr>
				<td width="90px">?????????</td>
				<td width="90px">??????</td>
				<td width="300px">??????</td>
				<td width="90px">?????????</td>
				<td width="150px">?????????</td>
				<td width="90px">?????????</td>
				<td width="80px">????????????</td>
				<td width="90px">?????????</td>
			</tr>
			<% //???????????? 3??? ????????????	
			for(int i=0; i<boards.size(); i++){
				
				if(i<3){
					QnABean list = boards.get(i);
					n_num = list.getN_num();
					n_title = list.getN_title();
					n_content = list.getN_content();
					if(n_num == 0) {
						continue;
					}
			%>
			<tr bgcolor="#F7F7F7">
				<td> ?????? </td>
				<td> &nbsp; </td>
				<td id="title">
					<a href="notice_show.jsp?n_num=<%= n_num %>&pageNum=<%= pageNum %>">
						<%= n_title %>
					</a>
				</td>
				<td>
					<%  if(user_id!=null) { 
							if(user_id.equals("admin")){	
					%>
							<%= user_id %>	
					<% 	}}else {%>
							admin
					<% }%>
				</td>
				<td> &nbsp; </td>
				<td> &nbsp; </td>
				<td> &nbsp; </td>
				<td> &nbsp; </td>
			</tr>
						
			<tr>
			    <%
					} else {
						QnABean list = boards.get(i);
						boolean isMine = false;
				%>
				
				<td> <%= list.getB_id() %> </td>
				<td> <%= list.getB_category() %> </td>
				<td id="title"> <!-- ???????????? ?????? ???????????? ??? ????????? ?????? -->
				<%
						if(list.getB_level() > 0) {	
							for(int j=0; j<list.getB_level(); j++){
				%>				&nbsp;
				<% 		} %>
					<img src='../images/outline_subdirectory_arrow_right_black_24dp.png'>
				<% 	}	%>
					<a href="qnaShow.jsp?b_id=<%= list.getB_id() %>&pageNum=<%= pageNum %>">
						<%= list.getB_title() %> 
					</a>
				</td>
				<td> 
					<%= list.getU_id() %> 
				</td>
				<td> 
					<%= sdf.format(list.getB_date()) %> 
				</td>
				<td> 
					<%= list.getB_view() %>  
				</td>
				<% 	
					//???????????? ?????? ??? ????????? ??????
					if (list.getB_fsize() > 0) {
				%>		
						<td><img src='../images/zip.gif'></td>	
				<% 	} else { %>
						<td>&nbsp;</td>
				<% 	}
					//???????????? ?????? ????????? ??????
					if (list.getB_secret().equals("0")) {
				%>		<td>&nbsp;</td>
				<% 	} else { %>
						<td><img src='../images/outline_lock_black_24dp.png'></td>	
				<% 	} %>	
			</tr>
		<% 			 
			}
		}	
		%>
		<tr>
			<td colspan="8" id="write">
				<% if (user_id != null) { %> <!-- ????????? ?????? ????????? ??????  -->
				<input type="button" class="btn btn-dark"
					value="&nbsp;&nbsp;&nbsp;?????????&nbsp;&nbsp;&nbsp;" onClick="canWrite('<%= user_id == null ? "" : user_id %>')"
					style="cursor: pointer;">
				<% } %>
			</td>
		</tr>
	</table>      
	<div > 
	<nav id="paging"> 
		<ul class="pagination justify-content-center"> 
			<li class="page-item"><a class="page-link" href="#">??????</a></li> 
			<li class="page-item"><a class="page-link" href="qnaList.jsp?pageNum=1">1</a></li> 
			<li class="page-item"><a class="page-link" href="qnaList.jsp?pageNum=2">2</a></li> 
			<li class="page-item"><a class="page-link" href="qnaList.jsp?pageNum=3">3</a></li> 
			<li class="page-item"><a class="page-link" href="#">??????</a></li> 
		</ul> 
	</nav>
	</div> 
</div>  
</body>
<% if(!isAdPage){ %>
<jsp:include page="../main/mainfooter.jsp"></jsp:include>
<% } %>
</html>
<% QnABean.pageNumber(3); %>