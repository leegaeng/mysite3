<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite3/assets/css/board.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="/mysite3/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {

		$("#deleteview").click(function() {

			var con = confirm("정말로 삭제하시겠습니까?");
			if (con) {
				location.href = "/mysite3/board/delete/" + $("#no").val();
			}

		});

		$("#updateview").click(function() {

			var con = confirm("정말로 수정하시겠습니까?");
			if (con) {
				$("#boardview_form").submit();
			}

		});

		$("#list").click(function() {
			location.href = "/mysite3/board/list";
		}

		)

	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="board">

				<form action="/mysite3/board/update" method="post"
					id="boardview_form">
					<input type="hidden" value="${b.no}" name="no" id="no">

					<ul>
						<li>
							<table class="boardview">
								<tr>
									<td>제목</td>
									<c:if test="${b.member_no != authMember.no}">
										<td colspan="5">${b.title}</td>
									</c:if>
									<c:if test="${b.member_no == authMember.no}">
										<td colspan="5"><input type="text" name="title"
											id="boardviewtitle" value="${b.title}"></td>
									</c:if>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${b.member_name}</td>
									<td>등록일</td>
									<td>${b.reg_date}</td>
									<td>조회수</td>
									<td>${b.view_cnt}</td>
								</tr>
								<tr>
									<td>내용</td>
									<c:if test="${b.member_no != authMember.no}">
										<td colspan="5">${b.content}</td>
									</c:if>
									<c:if test="${b.member_no == authMember.no}">
										<td colspan="5"><textarea id="boardviewcontent"
												name="content" rows="10" cols="50">${b.content}</textarea></td>
									</c:if>
								</tr>


							</table> <c:if test="${b.member_no == authMember.no}">
								<input type="button" value="수정" id="updateview">
								<input type="button" value="삭제" id="deleteview">
							</c:if> <c:if test="${b.member_no != authMember.no}">
								<input type="button" value="목록으로" id="list">
							</c:if>
						</li>
					</ul>
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