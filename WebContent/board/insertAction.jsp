<%@page import="board.vo.Freeboard"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	
	FreeboardDao dao = FreeboardDao.getInstance();
//	Freeboard vo = new Freeboard(0, "김땡땡", "1111", "글쓰기 테스트", "잘되나요?", 0, null, null, 0); 17일에 한거
	Freeboard vo = new Freeboard(0, writer, password, subject, content, 0, null, ip, 0);

	dao.insert(vo);
	response.sendRedirect("listAction.jsp");

%>