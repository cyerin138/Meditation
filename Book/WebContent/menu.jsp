<%@page import="vo.MemberVO"%>
<%@page import="vo.BookVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
	text-decoration: none;
}

.wrapper {
	width: 100%;
	min-height: 100%;
	margin: 0 auto;
	padding: 10px
}

header {
	height: 100px;
	text-align: center;
	line-height: 80px;
	background-color: #0b5da1;
	color: white;
	padding: 10px;
	margin-bottom: 40px;
}

.row {
	margin: 1em auto;
	display: flex;
	justify-content: flex-start;
	flex-wrap: wrap;
}

.side_menu {
	position: relative;
	width: 150px;
	height: 300px;
}

.side_menu a {
	position: absolute;
	width: 200px;
	padding: 10px;
	line-height: 30px;
	font-size: 15px;
	text-align: center;
	font-weight: bold;
	color: white;
	border-radius: 0 5px 5px 0;
}

.content {
	/*width: 80%;*/
	text-align: center;
}

#intro {
	top: 0px;
	background-color: #4CAF50;
}

#login, #logout {
	top: 55px;
	background-color: #2196F3;
}

#search {
	top: 110px;
	background-color: #f44336;
}

#rental {
	top: 165px;
	background-color: #f5ce42;
	color: black;
}

#quit {
	top: 220px;
	background-color: #555;
}

footer {
	position: absolute;
	width: 100%;
	height: 50px;
	left: 0;
	bottom: 0;
	background-color: #c2d6d6;
	text-align: center;
	line-height: 50px;
}

.content table {
	margin: 50px auto;
}

h1, h2, h3, h4, h5, h6 {
	margin-bottom: 40px;
}
</style>
</head>
<body>


	<div class="wrapper">
		<header>
			<h1>양영디지털 고등학교 도서관 홈페이지</h1>
		</header>
		<div class="row">
			<div class="side_menu">
				<%
 MemberVO login = (MemberVO) session.getAttribute("loginOK");
%>

				<a href="/index.jsp" id="intro">처음으로</a>

				<%
 if (login == null)  {
%>
				<a href="/login/login.jsp" id="login">로그인</a> <a
					href="/book/searchBook.jsp" id="search">도서 검색</a> <a id="rental">도서대출현황</a>
				<a id="quit">회원탈퇴</a>

				<%
 } else {
%>

				<a href="/logout" id="logout">로그아웃 (<%=login.getMemberId() %>)</a> 
				<a href="/book/searchBook.jsp" id="search">도서 검색</a> 
				<a href="/rentalBook" id="rental">도서대출현황</a> 
					<a href="/quit" id="quit">회원탈퇴</a>



				<%

 }
%>



			</div>

	</div>

			<div class="content">