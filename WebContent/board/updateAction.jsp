<%@page import="board.dao.FreeboardDao"%>
<%@page import="board.vo.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pageNo = request.getParameter("page");
	String password = request.getParameter("password");
	
	FreeboardDao dao = FreeboardDao.getInstance();
	Freeboard vo = dao.getDetail(idx);
	
	String href;
	String message;
	if(vo.getPassword().equals(password)) {
		request.setAttribute("vo", vo);
		request.setAttribute("page", pageNo);
		pageContext.forward("updateView.jsp");
	} else {
		out.print("<script>");
		out.print("alert('글 비밀번호가 틀립니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>















