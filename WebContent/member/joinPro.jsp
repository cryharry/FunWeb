<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 자바빈 만들기 패키지 member 파일이름 MemberBean
	// 액션태그 객체 생성 memberBean
	// 액션태그 폼 => 자바빈 저장
	%>
	<jsp:useBean id="memberBean" class="member.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />
	<%
	// 가입날짜 setReg_date 메서드 호출
	memberBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	// 디비작업 파일 만들기 패키지 member 파일이름 MemberDAO
	// 디비객체 생성 memberDAO
	MemberDAO memberDAO = new MemberDAO();
	// 메서드 호출 insertMember(memberBean);
	memberDAO.insertMember(memberBean);
	// login.jsp이동
	response.sendRedirect("login.jsp");
%>