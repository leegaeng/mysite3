<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
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

		$("em").css("color", "#FF6666");
		$(".wordcnt").css({
			"color" : "gray",
			"fontSize" : "8px",
			"textAlign" : "center"
		});

		$("textarea").keyup(function() {

			var length = $(this).val().length;
			$("label").text(length);

		});

	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="user">
				<form id="insert-form" name="insertForm" method="post"
					action="/mysite3/board/insert">
					<input type="hidden" name="member_no" value="${authMember.no}">
					<table id="inserttable">
						<tr>
							<td><em> * </em>작성자</td>
							<td><input id="member_name" name="member_name" type="text"
								value="${authMember.name}"></td>
						</tr>
						<tr>
							<td><em> * </em>제목</td>
							<td><input id="title" name="title" type="text"></td>
						</tr>
						<tr>
							<td><em> * </em>내용
								<p class="wordcnt">
									<label>0</label>/100
								</p></td>
							<td><textarea rows="5" cols="55" name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="reset" value="취소"><input
								type="submit" value="등록"></td>
						</tr>
					</table>

					<p>
				</form>
			</div>
		</div>
		<div id="navigation">
			<c:import url="/WEB-INF/views/include/navigation.jsp">
				<c:param name="type" value="main"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>
