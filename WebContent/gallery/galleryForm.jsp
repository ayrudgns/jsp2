<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery : 파일 업로드 연습</title>
</head>


<script type="text/javascript">
	function fileValid() {
		const imgfile = document.forms[0].pic;		// document.getElementById('imgfile');도 가능하다.
		const maxSize = 1 * 1024 * 1024;
		
		// let isValild = true;
		// button 타입은 submit으로 하고, form태그의 onsubmit 속성에 유효성 검사 함수를 설정할 때는 isValid 변수가 필요하지 않다.
		console.log(document.forms[0].pic.value);
		
		if(imgfile.value == "" || imgfile.value == null) {
			alert("파일첨부는 필수입니다.");
			// isValid = false;
			return false;			// onsubmit 속성으로 호출된 함수에서 return false 이면 submit 하지 않는다.
		} else {
			if(!imgfile.value.match(/(.*?).(jpg|png|gif|jpeg)$/)) {		// 정규표현식으로 확장자 검사하기
				alert("파일 형식은 jpg, png, gif만 가능합니다.");
				// isValid = false;
				return false;
			}
			if(imgfile.files[0].size > maxSize) {		// imgfile.value는 선택한 파일명, imgfile.files[i]는 선택한 파일!
		// imgfile.value는 선택한 파일명, imgfile.files[0] 다중 선택 가능하므로 파일 자체를 인덱스로 지정한다.
				alert("최대 파일의 크기는 1MB입니다.");
				// isValid = false;
				return false;			
			}
		}
	}

</script>
<body>
	<h3>이미지 파일 업로드하기</h3>
	<hr>
	<!-- 파일을 업로드할 때는 반드시  method="post" enctype="multipart/form-data" -->
	<form action="gallerySave.jsp" method="post" enctype="multipart/form-data" onsubmit="return fileValid()">
		<input type="text" name="title" placeholder="제목을 입력하세요."><br>
		<input type="file" name="pic" accept="image/jpeg, image/png" id="imgfile">
		<!-- 
			웹에서는 파일의 형식을 확장자로만 구분하지 않고 MIME 형식을 사용한다. 
			image/*, image/png, image/jpeg, video/* 등
			accept 속성은 파일 선택 창에서 초기 형식이다. -> *.* 모든 파일로 변경 및 파일 전송도 가능!
		-->
		<button>전송</button>
		<!-- 
			1. form 요소의 file 타입으로 클라이언트가 파일을 선택한다.
			2. 서버 페이지에서는 file 타입 요소로 전달된 파일을 다른 파라미터(입력값)와 함께 전송받는다. (업로드)
					ㄴ 서버에서 업로드 폴더 설정이 필요함! (예시 : D:\Iclass\upload)
			3. 2번에서 파일 전송에 필요한 Request 처리가 별도로 필요하다. -> MultipartRequest 클래스
					ㄴ pom.xml에 dependency 추가함!
		-->		
	</form>
</body>
</html>