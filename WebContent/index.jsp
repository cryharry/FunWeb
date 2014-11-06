<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*, java.util.List, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<header>
<%
String id = (String)session.getAttribute("id");
if(id == null) { // 세션값없음
%>
	<div id="login"><a href="member/login.jsp">login</a> | <a href="member/join.jsp">join</a></div>
<%} else { // 세션값 있음 %> 
	<div id="login"><font color="blue"><%=id %></font>님 <a href="member/logout.jsp">logout</a> | <a href="member/join.jsp">join</a></div>
<%} %> 
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="index.jsp">HOME</a></li>
	<li><a href="company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BoardDAO boardDAO = new BoardDAO();
	int count = boardDAO.getBoardCount();
	List<BoardBean> boardList = null;
	if(count != 0) {
	    boardList = boardDAO.getBoards(1, 5);
	    for(int i=0; i<boardList.size(); i++) {
	        BoardBean boardBean = boardList.get(i);
	        %>
	        	<tr>
	        		<td class="contxt">
	        		<%
					int wid = 0;
					if(boardBean.getRe_lev()>0) { //답변글
						wid = 10*boardBean.getRe_lev();
					%>
						<img src="images/center/level.gif" width="<%=wid%>">
						<img src="images/center/re.gif">
					<%
					}
					%>
	        			<a href="#"><%=boardBean.getSubject() %></a>
	        		</td>
	        		<td><%=sdf.format(boardBean.getDate()) %></td>
	        	</tr>
	        <%
	    }
	} else {
%>
	<tr>
		<td class="contxt" colspan="2">게시판 글 없음</td>
	</tr>
<%
	}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<footer>
<hr>
<div id="copy">All contents Copyright 2011 FunWeb 2011 FunWeb 
Inc. all rights reserved<br>
Contact mail:funweb@funwebbiz.com Tel +82 64 123 4315
Fax +82 64 123 4321</div>
<div id="social"><img src="images/facebook.gif" width="33" 
height="33" alt="Facebook">
<img src="images/twitter.gif" width="34" height="34"
alt="Twitter"></div>
</footer>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>