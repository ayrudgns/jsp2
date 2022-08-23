<%@page import="dao.GalleryDao"%>
<%@page import="board.vo.Gallery"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = "D:\\Iclass\\upload";		// 파일 업로드 경로
											// ** 서버의 업로드 경로에 대한 url 지정이 필요하다. -> server.xml
	int size = 10 * 1024 * 1024;		// 10MB, 전송 파일의 최대 크기
	
	MultipartRequest multiRequest = new MultipartRequest(request, path, size, "UTF-8", 
										new DefaultFileRenamePolicy());
	// DefaultFileRenamePolicy 객체 : 업로드한 파일명이 중복될 경우, 파일명을 변경해주는 정책을 설정함.
	// 					ㄴ 해쉬값(랜덤 문자열)을 이용하거나 업로드 날짜 / 시간을 이용하여 파일명을 변경할 수 있다.
	
	// request 객체 대신에 multiRequest 사용! -> 파일 전송을 처리하는 객체
	String title = multiRequest.getParameter("title");
	String filename = multiRequest.getFilesystemName("pic");	// file 타입의 파일명 가져오는 메소드
	
	// 파일 자체는 서버의 업로드 폴더에 보관하고, 파일명은 DB 테이블에 저장한다.
	Gallery vo = new Gallery(0, title, null, filename);
	GalleryDao dao = GalleryDao.getInstance();
	
	dao.insert(vo);
	response.sendRedirect("galleryAction.jsp");		// 업로드한 이미지 보기!
	


%>