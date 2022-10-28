<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<%

	MemberDAO dao = new MemberDAO();
	int max = dao.maxCustno();



%>

<section>
	<h2>홈쇼핑 회원 등록</h2>

	<form action="registerProc.jsp" method="get" name="registerForm">
		<table border=1>
			<tbody>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" value="<%= max %>" name="custno"
						class="custno" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" class="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" class="phone"></td>
				</tr>
				<tr>
					<td>통신사 [SK, KT, LG]</td>
					<td><input type="radio" name="address" checked value="SK">
						SK <input type="radio" name="address" value="KT"> KT <input
						type="radio" name="address" value="LG"> LG</td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP , B:일반 , C:직업]</td>
					<td><select name="grade">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
					</select></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td><input type="button" value="등록" onclick="check()"></td>
					<td><a href="select.jsp">조회</a></td>
				</tr>
			</tbody>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp" />
<script type="text/javascript">
function check() {
	if(document.registerForm.custname.value == "") {
		alert("회원 성명이 입력되지 않았습니다.")
		document.registerForm.custname.focus();
		return;
		
	}if(document.registerForm.phone.value == "") {
		alert("회원 전화이 입력되지 않았습니다.")
		document.registerForm.phone.focus();
		return;
		
	}if(document.registerForm.address.value == "") {
		alert("통신사가 입력되지 않았습니다.")
		document.registerForm.address.focus();
		return;
		
	}if(document.registerForm.joindate.value == "") {
		alert("가입날짜가 입력되지 않았습니다.")
		document.registerForm.joindate.focus();
		return;
	}
	if(document.registerForm.grade.value == "") {
		alert("고객 등급이 입력되지 않았습니다.")
		document.registerForm.grade.focus();
		return;
	}
	if(document.registerForm.city.value == "") {
		alert("도시코드가 입력되지 않았습니다.")
		document.registerForm.city.focus();
		return;
	}
	
	document.registerForm.submit();
}

</script>