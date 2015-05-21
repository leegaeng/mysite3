<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sds.icto.mysite.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a href="/mysite3/index"><h1>MySite</h1></a>
<ul>

	<c:choose>
		<c:when test="${empty authMember}">
			<li><a href="/mysite3/member/login">로그인</a>
			<li>
			<li><a href="/mysite3/member/join">회원가입</a>
			<li>
		</c:when>
		<c:when test="${!empty authMember}">
			<li><a href="/mysite3/member/uinfo">회원정보수정</a>
			<li>
			<li><a href="/mysite3/member/logout">로그아웃</a>
			<li>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${!empty authMember}">
			<li>${authMember.name}님 안녕하세요^^</li>
		</c:when>
		<c:when test="${empty authMember}">
			<li>손님 반갑습니다! </li>
		</c:when>

	</c:choose>
	
</ul>