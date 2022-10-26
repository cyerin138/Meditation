<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../menu.jsp" %>

<h2>회원가입 화면</h2>
<form action="/register" method="post">
    <table width="500px" border="1" align="center">
        <tr>
            <td>회원 ID</td>
            <td><input type="text" name="memberId"></td>
        </tr>
        <tr>
            <td>회원 PWD</td>
            <td><input type="password" name="memberPwd"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="addr"></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><input type="number" name="age"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="가입"> &nbsp; &nbsp;
                <input type="reset" value="취소">
            </td>
           
        </tr>
    </table>
</form>
<%@ include file = "../footer.jsp" %>
