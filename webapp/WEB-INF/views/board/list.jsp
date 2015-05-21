<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="/mysite3/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#searchicon").click(
				function() {
					location.href = "/mysite3/board/search/"
							+ $("#searchfield").val();
				});

	});

	function logincheck() {

		var name = $("#authMember").val();

		if (name.length < 1) {
			alert("로그인 후 이용해주세요");
			location.href = "/mysite3/member/login";
			return false;

		}

	};
</script>
<link href="/mysite3/assets/css/board.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="board">
				<ul>
					<input type="text" id="searchfield" name="searchfield"
						placeholder="Search" value="${param.searchfield}" />
					<img src="/mysite3/assets/css/images/searchicon.jpg"
						id="searchicon">
					<li>
						<table>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>

							<c:forEach var="b" items="${list}">
								<tr>
									<td>${b.no}</td>
									<td><strong><a
											href="/mysite3/board/boardview/${b.no}">${b.title}</a></strong></td>
									<td>${b.member_name}</td>
									<td>${fn:substring(b.reg_date,0,10)}</td>
									<td>${b.view_cnt}</td>
								</tr>
							</c:forEach>

						</table> <c:if test="${empty list}">
							<table width=510>
								<tr>
									<td colspan=4>등록된 게시판 글이 없습니다.</td>
								</tr>
							</table>
						</c:if>
					</li>

				</ul>

				<form action="/mysite3/board/insert" method="get"
					onsubmit="return logincheck()">
					<input type="hidden" id="authMember" value="${authMember.name}">
					<input type="submit" name="write" value="글쓰기">
				</form>
			</div>
		</div>
		<div id="navigation">
			<c:import url="/WEB-INF/views/include/navigation.jsp">
				<c:param name="type" value="board"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<p>(c)opyright 2014</p>
		</div>
	</div>
</body>
</html>