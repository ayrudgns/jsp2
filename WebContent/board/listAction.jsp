<%@page import="board.vo.PageVo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="board.vo.Freeboard"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo;
	// 페이지 번호를 파라미터로 받는다.
	if(request.getParameter("page") == null) {
		pageNo = 1;
	} else {
		pageNo = Integer.parseInt(request.getParameter("page"));
	}

	FreeboardDao dao = FreeboardDao.getInstance();
	int pageSize = 10;		// 한 페이지에 10개의 글을 보여준다.
	
	// 아래 2줄 명령은 PageVo 객체로 대체한다.
//	int startNo = ((pageNo - 1) * pageSize + 1);		// pageNo = 1, 2, 3, 4, 5, ...
											// startNo = ?			1, 11, 21, 31, 41, ...	
//	int endNo = (startNo + (pageSize - 1));		// endNo = ?		10, 20, 30, 40, 50, ...
	
	PageVo pages = new PageVo(pageNo, dao.getCount(), pageSize);
		
	Map<String, Integer> map = new HashMap<>();
	
	map.put("startNo", pages.getStartNo());
	map.put("endNo", pages.getEndNo());
												
	List<Freeboard> list = dao.getPageList(map);
	request.setAttribute("list", list);
	request.setAttribute("today", LocalDate.now());
	
	// 페이지 번호를 애트리뷰트로 저장
	request.setAttribute("page", pageNo);		// PageVo를 작성하면 아래 Line의 pagelist로 대체할 수 있다.
	request.setAttribute("pagelist", pages);
	
	
	pageContext.forward("listView.jsp");
%>

<!-- 
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=1
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=6
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=10
-->
