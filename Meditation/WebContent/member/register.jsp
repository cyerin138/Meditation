<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <h1>회원가입</h1>
    <form action="" method="post">
        <input type="text" name="id" class="id" placeholder="아이디를 입력해주세요">
        <a href="">중복체크</a><br>
        <input type="password" name="pw" class="pw" placeholder="비밀번호를 입력해주세요"> <br>
        <input type="text" name="name" class="name" placeholder="이름을 입력해주세요">

        <input type="submit" value="등록">

    </form>

<%@ include file = "../footer.jsp" %>
