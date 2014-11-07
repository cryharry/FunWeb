<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*, java.sql.Timestamp" %>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
	// 파일업로드 : 특정 폴더, 디비 데이터
	// request 정보를 가지고 파일 업로드, 정보저장
	// WebContent 밑에 upload 폴더 만들어 => 파일이 업로드
	// 업로드할 폴더의 위치(물리적위치)
	String realPath = request.getRealPath("upload");
	System.out.println(realPath);
	int maxSize = 5*1024*1024; //5M
	MultipartRequest multi =
		new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
	// 객체 생성 boardBean
	BoardBean boardbean = new BoardBean();
	// 폼 -> 자바빈 저장
	boardbean.setContent(multi.getParameter("content"));
	boardbean.setName(multi.getParameter("name"));
	boardbean.setPasswd(multi.getParameter("passwd"));
	boardbean.setSubject(multi.getParameter("subject"));
	// 업로드폴더 업로드된 파일이름
	boardbean.setFile(multi.getFilesystemName("file"));
	// 원파일이름
	multi.getOriginalFileName("file");
	// set메서드 호출 date  ip
	boardbean.setDate(new Timestamp(System.currentTimeMillis()));
	boardbean.setIp(request.getRemoteAddr());
	
	// 디비파일만들기 패키지 board 파일이름 BoardDAO
	// 디비객체 생성 boarddao
	BoardDAO boarddao=new BoardDAO();
	// 메서드호출 insertBoard(boardbean)
	boarddao.insertBoard(boardbean);
	// 이동 notice.jsp이동
%>
<script>
	alert("글쓰기성공");
	location.href="notice.jsp";
</script>


