<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
	// 업로드
	// multi => 자바빈 저장
	String realPath = request.getRealPath("upload");
	System.out.println(realPath);
	int maxSize = 5*1024*1024; //5M
	MultipartRequest multi =
		new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	// 객체 생성 boardBean
	BoardBean boardBean = new BoardBean();
	// multi => 자바빈 저장
	boardBean.setNum(Integer.parseInt(multi.getParameter("num")));
	System.out.println(multi.getParameter("num"));
	boardBean.setContent(multi.getParameter("content"));
	boardBean.setName(multi.getParameter("name"));
	boardBean.setPasswd(multi.getParameter("passwd"));
	boardBean.setSubject(multi.getParameter("subject"));
	// 업로드폴더 업로드된 파일이름
	if(multi.getFilesystemName("file") != null) {
	    boardBean.setFile(multi.getFilesystemName("file"));
	} else {
	    boardBean.setFile(multi.getParameter("file2"));
	}
	// pageNum 가져오기
	String pageNum = request.getParameter("pageNum");
	// 디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	// int check = 메서드 호출 updateBoard(boardBean)
	int check = boardDAO.updateBoard(boardBean);
	// check==1 업데이트 성공 fnotice.jsp?pageNum=
	if(check == 1) {
	    response.sendRedirect("fnotice.jsp?pageNum="+pageNum);
	}
	// check==0 비밀번호 틀림 뒤로이동
	else {
	    %>
	    	<script>
	    		alert("비밀번호 틀림");
	    		history.back();
	    	</script>
	    <%
	}
%>