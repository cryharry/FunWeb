<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import=" board.*, java.util.List, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="../center/fnotice.jsp">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값 없으면 login.jsp이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
//디비객체 생성
BoardDAO boarddao=new BoardDAO();
//자바빈 = 메서드호출
BoardBean boardbean=boarddao.getBoard(num);
%>
<!-- 게시판 -->
<article>
<h1>File Notice Update</h1>
<form action="fupdatePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<table id="notice">
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" value="<%=boardbean.getName()%>">
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="subject" value="<%=boardbean.getSubject()%>">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea cols="40" rows="13" name="content"><%=boardbean.getContent() %></textarea>
		</td></tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd">
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<input type="file" name="file"><%=boardbean.getFile()%>
			<input type="hidden" name="file2" value="<%=boardbean.getFile()%>">
		</td>
	</tr>
	</table>
	<div id="table_search">
		<input type="submit" value="글수정">
		<input type="reset" value="다시쓰기">
		<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
	</div>
</form>

<div class="clear"></div>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>