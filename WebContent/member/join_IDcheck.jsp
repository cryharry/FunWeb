<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 파라미터값 가져오기 id = userid
	String id = request.getParameter("userid");
	// 디비객체 생성 memberDAO
	MemberDAO memberDAO = new MemberDAO();
	// int check = 메서드호출 IdCheck(id)
	int check = memberDAO.IdCheck(id);
	// check==1 아이디있음 아이디중복 "사용중인 ID입니다."
	if(check == 1) {
	    %>
	    <script>
	    	alert("사용중인 ID입니다.");
	    	window.close();
	    </script>
	    <%
	}
	// check==0 아이디없음 "사용가능한 ID입니다."
	else {
	    %>
	    <script>
	    	alert("사용가능한 ID입니다.");
	    	window.close();
	    </script>
	    <%
	}
%>
</body>
</html>