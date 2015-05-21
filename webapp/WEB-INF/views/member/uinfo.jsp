<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite3/assets/css/user.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="/mysite3/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {

		$("#checkEmail").click(function() {
			$.ajax({
				url : "checkEmail/" + $("#email").val(),
				type : "get",
				dataType : "json",
				//	data : "",
				//			    contentType: "application/json",
				success : function(response) {
					var result = $.trim(response);
					if (result === "true") {
						$("#resultEmail").html("사용가능한 아이디입니다.");
					}

					if (result === "false") {
						$("#resultEmail").html("이미 존재하는 아이디입니다.");
					}
				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				}

			});

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
				<form id="uinfo-form" name="uinfoForm" method="post"
					action="/mysite3/member/update">
					<input type="hidden" name="no" value="${m.no}"> <label
						class="block-label" for="name">이름</label> <input id="name"
						name="name" type="text" value="${m.name}"><label
						class="block-label" for="email">이메일</label> <input id="email"
						name="email" type="text" value="${m.email}"> <input
						type="button" value="id 중복체크" id="checkEmail"> <label
						id="resultEmail"></label> <label class="block-label">패스워드</label>
					<input name="password" type="password" value="${m.password}">

					<fieldset>
						<legend>성별</legend>

						<label>여</label> <input type="radio" name="gender" value="female"
							checked="checked">

						<c:if test="${m.gender == 'male'}">
							<label>남</label>
							<input type="radio" name="gender" value="male" checked="checked">
						</c:if>
						<c:if test="${m.gender != 'male'}">
							<label>남</label>
							<input type="radio" name="gender" value="male">
						</c:if>
					</fieldset>

					<input type="submit" value="수정하기">

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