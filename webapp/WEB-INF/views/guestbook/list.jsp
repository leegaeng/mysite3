<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite3/assets/css/guestbook.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="guestbook">
				<form action="/mysite3/guestbook/insert" method="post">
					<input type="hidden" name="a" value="add">


					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"></td>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>

				<ul>
					<li><c:forEach var="g" items="${list}">
							<table>
								<tr>
									<td>${g.no}</td>
									<td>${g.name}</td>
									<td>${g.reg_date}</td>
									<td><a href="/mysite3/guestbook/delete/${g.no}">삭제</a></td>
								</tr>
								<tr>
									<td colspan=4>${g.message}</td>
								</tr>
							</table>

						</c:forEach> <c:if test="${empty list}">
							<table width=510 border=1>
								<tr>
									<td colspan=4>등록된 방명록이 없습니다.</td>
								</tr>
							</table>
						</c:if></li>

				</ul>
			</div>
		</div>
		<div id="navigation">
			<c:import url="/WEB-INF/views/include/navigation.jsp">
				<c:param name="type" value="guestbook"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<p>(c)opyright 2014</p>
		</div>
	</div>
</body>
</html>