<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
		rel="stylesheet">
	<link rel="stylesheet" href="../../resources/css/reset.css">
	<link rel="stylesheet"
		href="../../resources/css/bulletinBoard/freeBoard.css">
	<title>자유 게시판</title>
	</head>
	<body>
		<div id="container">
			<header>
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</header>
			<main>
				<section id="top">
					<img src="../../resources/images/components/logoimage2.png" alt="">
					<h1>자유 게시판</h1>
				</section>
				<section id="mid">
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>추천수</th>
								<th>작성날짜 및 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="freeBoard" items="${requestScope.fList}">
								<tr>
									<td>${freeBoard.freeBoardNo }</td>
									<td><a href="/bulletinBoard/freeBoard/detail.do?freeBoardNo=${freeBoard.freeBoardNo}">${freeBoard.freeBoardTitle}</a></td>
									<td>${freeBoard.freeBoardWriter }</td>
									<td>${freeBoard.viewCount }</td>
									<td>${freeBoard.rcmndCount }</td>
									<td>${freeBoard.freeBoardDate }</td>
								</tr>
							</c:forEach>
						</tbody>
		
					</table>
				</section>
				<section id="pageNavi">${pageNavi }</section>
				<section id="btnArea">
					<div>  
					<% 			      
				      if (session.getAttribute("memberId") != null) { %>
				              <a class="write-btn" href="/bulletinBoard/freeBoard/insert.do">글작성</a>
				      <% } else { %>
							<a id="write-btn" class="write-btn" href="/member/login.do">글작성</a>
							
				       <% } %>
						
					</div>
				</section>
			</main>
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	
		<script>
		</script>
	</body>
</html>