<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <form action="<%=request.getContextPath()%>/quit" method="post">
        <h1>정말 계정 삭제?</h1>
        <input type="text" name="id" class="id" placeholder="아이디를 입력해주세요"> <br>
        <input type="password" name="pwd" class="pwd" placeholder="비밀번호를 입력해주세요"> <br>

        <input type="submit" value="삭제">

    </form>

<%@ include file = "../footer.jsp" %>
