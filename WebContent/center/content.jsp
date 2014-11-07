<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.List, java.text.SimpleDateFormat" %>
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
<%@ include file="../inc/top.jsp" %>
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
	// 파라미터 num pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	//디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	// num에 해당하는 글 가져오기
	BoardBean boardBean = boardDAO.getBoard(num);
%>
<!-- 게시판 -->
<article>
	<h1>Notice Content</h1>
	<table id="notice">
		<tr>
			<td>글번호</td>
			<td><%=boardBean.getNum() %></td>
			<td>조회수</td>
			<td><%=boardBean.getReadcount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=boardBean.getName() %></td>
			<td>작성일</td>
			<td><%=boardBean.getDate() %></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><%=boardBean.getSubject() %></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td colspan="3"><%=boardBean.getContent() %></td>
		</tr>
	</table>
	<div id="table_search">
	<%
		if(id != null) {
		%>
			<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp'">
			<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp'">
			<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp'">
		<%
		}
	%>
		<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
	</div>
	<div class="clear"></div>
</article>
</div>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@ include file="../inc/bottom.jsp" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>