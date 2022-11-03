<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <h1>회원가입</h1>
    <form action="<%=request.getContextPath()%>/register" method="post" name ="memberForm">
        <input type="text" name="id" class="id" placeholder="아이디를 입력해주세요">
        <input type="password" name="pwd" class="pwd" placeholder="비밀번호를 입력해주세요"> <br>
        <input type="text" name="name" class="name" placeholder="이름을 입력해주세요">

        <input type="button" onclick="check()" value="등록">

    </form>
<script>
	function check() {
		if(document.memberForm.id.value == "") {
			alert("아이디를 입력해주세요")
			document.memberForm.id.focus();
			return;
			
		}if(document.memberForm.pw.value == "") {
			alert("비밀번호를 입력해주세요")
			document.memberForm.pw.focus();
			return;
			
		}if(document.memberForm.name.value == "") {
			alert("이름을 입력해주세요")
			document.memberForm.name.focus();
			return;
			
		}
		
		document.memberForm.submit();
	}
</script>
<%@ include file = "../footer.jsp" %>
