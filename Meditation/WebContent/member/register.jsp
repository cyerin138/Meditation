<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
	<!-- 회원가입-->
	<section id="member">
		<div class="member-wrap register-wrap position-relative">  
			<div class="member-box position-absolute">
				<div class="member-content text-center">
					<div class="position-absolute">

						
						<p class="member-title">회원가입</p>
						<form action="<%=request.getContextPath()%>/register" method="post" name ="memberForm">
							<input type="text" name="id" class="r-id" placeholder="ID" maxlength="10"> <br>
							<input type="password" name="pwd" class="r-pwd" placeholder="PASSWORD" maxlength="10"> <br>
							<input type="text" name="name" class="r-name" placeholder="NAME" maxlength="10"><br>
							
							<input type="button" onclick="check()" value="REGISTER" name="register-btn">
							
						</form>
					</div>
				</div>
			</div>
			<img src="<%=request.getContextPath()%>/resources/imgs/forest1.jpg" alt="forest">
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
