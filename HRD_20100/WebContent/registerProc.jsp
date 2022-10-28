<%@page import="member.MemberDAO"%>
<%@page import="member.MemberVO"%>
<%@page import="java.sql.Date"%>
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
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		int y = Integer.parseInt(joindate.substring(0, 4));
		int m = Integer.parseInt(joindate.substring(4, 6));
		int d = Integer.parseInt(joindate.substring(6, 8));
		String date = y + "-" + m + "-" + d;
		Date rdate = Date.valueOf(date); 
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberVO vo = new MemberVO(custno, custname, phone, address, rdate, grade, city);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.register(vo);
			
		if(cnt > 0) {
			
		
	%>
	
	<script type="text/javascript">
	alert("회원등록이 완료 되었습니다!")
	location.href="index.jsp";
	</script>
	<%
	
	
		} else {
	
	%>
	<script type="text/javascript">
		alert("회원등록이 실패 되었습니다.")
		history.go(-1);
		
		
		
	</script>
	
	<% } %>

</body>
</html>