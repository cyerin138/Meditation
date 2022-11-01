<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

MemberDAO dao = new MemberDAO();
boolean isExist = dao.existID(request.getParameter("id"));

if (isExist) {


%>
<script> 

alert('이미 존재하는 ID 입니다. 다시 입력해주세요.'); 
history.go(-1);
alert(<%= isExist%>)

</script>
<%

} else {

%>

<script> 

alert('사용 가능한 ID입니다.');
alert(<%= isExist%>)
history.go(-1);

</script>
<%


}
%>
</body>
</html>