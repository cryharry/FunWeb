<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.List" %>
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
	//디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	//int count= getBoardCount()   //count(*)
	int count = boardDAO.getBoardCount();
	// 한 페이지 보여줄 글수
	int pageSize = 15;
	// 현 페이지 가져오기
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
	    pageNum = "1";
	}
	// 시작하는 행 구하기
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	// 끝나는 행 구하기
	int endRow = currentPage*pageSize;
	// 글이 있으면 디비 게시판 글 가져오기
	List<BoardBean> boardList = null;
	if(count != 0) {
	    boardList = boardDAO.getBoards(startRow, pageSize);
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	// 가상번호 계산
	int number = 0;
	number = count-(currentPage-1)*pageSize;
%>
<!-- 게시판 -->
<article>
<h1>File Notice : [전체 글수<%=count %>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    if(count == 0) {
        %>
        <tr>
        	<td colspan="5">게시판 글 없음</td>
    	</tr>
        <%
    } else {
        for(int i=0; i<boardList.size(); i++) {
        BoardBean boardBean =  boardList.get(i);
        %>
        <tr onclick="location.href='fcontent.jsp?num=<%=boardBean.getNum()%>&pageNum=<%=pageNum%>'">
	    	<td><%=number-- %></td>
	        <td class="left">
	        <%
			int wid = 0;
			if(boardBean.getRe_lev()>0) { //답변글
				wid = 10*boardBean.getRe_lev();
			%>
				<img src="../images/center/level.gif" width="<%=wid%>">
				<img src="../images/center/re.gif">
			<%
			}
			%>
	        	<%=boardBean.getSubject() %>
	        </td>
	    	<td><%=boardBean.getName() %></td>
	    	<td><%=sdf.format(boardBean.getDate()) %></td>
	    	<td><%=boardBean.getReadcount() %></td>
    	</tr>
    <%
        }
    }
    %>
</table>
<%
	if(id != null) {
	    %>
	    <div id="table_search">
			<input type="button" value="글쓰기" class="btn" onclick="location.href='fwrite.jsp'">
		</div>
	    <%
	}
%>
<div id="table_search">
	<form action="noticeSearch.jsp">
	<input type="text" name="search" class="input_box">
	<input type="submit" value="search" class="btn">
</form>
</div>
<div class="clear"></div>
<div id="page_control">
<% 
if(count > 0) {
	// 전체 페이지수 구하기 글55 한 페이지에 보여줄 글 수 10
	int pageCount = count/pageSize+(count%pageSize==0?0:1); // 55/10 = 5+1(나머지있을경우)
	// 한화면에 보여줄 페이지수 설정
	int pageBlock = 3;
	// 시작페이지 번호 구하기
	int startPage = ((int)(currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1; 
	// 끝페이지 번호 구하기
	int endPage = startPage+pageBlock-1;
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	// [이전]
	if(startPage > pageBlock) {
		%><a href="fnotice.jsp?pageNum=<%=startPage-pageBlock%>">[PREV]</a><%
	}
	// [1] ~ [10]
	for(int i=startPage; i<=endPage; i++) {
		%><a href="fnotice.jsp?pageNum=<%=i%>">[<%=i %>]</a><%
	}
	// [다음]
	if(endPage < pageCount) {
		%><a href="fnotice.jsp?pageNum=<%=startPage+pageBlock%>">[NEXT]</a><%
	}
}
%>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@ include file="../inc/bottom.jsp" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>