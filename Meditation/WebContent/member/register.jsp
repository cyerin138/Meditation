<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
	<!-- 회원가입 -->
	<section id="register">
		<div class="register-wrap position-relative">
			<div class="register-box position-absolute sign-box">

				<div class="register-content text-center sign-content">
					
					<h1>회원가입</h1>
					<form action="<%=request.getContextPath()%>/register" method="post" name ="memberForm">
						<input type="text" name="id" class="r-id" placeholder="ID"> <br>
						<input type="password" name="pwd" class="r-pwd" placeholder="PASSWORD"> <br>
						<input type="text" name="name" class="r-name" placeholder="NAME"><br>
						
						<input type="button" onclick="check()" value="REGISTER" name="register-btn">
						
					</form>
					
				</div>
			</div>
		</div>
	</section>
<script>
	function check() {
		if(document.memberForm.id.value == "") {
			alert("아이디를 입력해주세요")
			document.memberForm.id.focus();
			return;
			
		}if(document.memberForm.pwd.value == "") {
			alert("비밀번호를 입력해주세요")
			document.memberForm.pwd.focus();
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
