<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file = "header.jsp" %>
<section>
<table>
<thead>
<tr>
<th>사용자 ID</th>
<th>사용자 이름</th>
<th>삭제</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${memberList }">
<tr>
<td>${item.userId}</td>
<td>${item.userName}</td>
<td><a class="del" href="${pageContext.request.contextPath}/memberDelete?userId=${item.userId}">삭제</a></td>
</tr>

</c:forEach>

</tbody>
</table>
<br>
<a class="home"  href="${pageContext.request.contextPath}/index.jsp">홈으로</a>
</section>

<%@ include file = "footer.jsp" %>