<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
 	 <!-- 비밀번호 변경-->
      <section id="member">
		<div class="member-wrap pwd-wrap position-relative">  
			<div class="member-box position-absolute">
				<div class="member-content text-center">
					<div class="position-absolute">
                        <%
                        String id = request.getParameter("id");
                        %>
						
						<p class="member-title">PW변경</p>
                        <form action="<%=request.getContextPath()%>/pwdChange" method="post" name ="memberForm">
                            <input type="text" name="id" class="l-id" placeholder="ID" value="<%= id %>" readonly><br>
                            <input type="password" name="pwd" class="l-pwd" placeholder="NEW PASSWORD"> <br>
                            <input type="password" name="cpwd" class="l-c-pwd" placeholder="CONFIRM PASSWORD"> <br>
                            
                            <input type="button" value="CHANGE" onclick="check()" class="cpwd-btn">
                            
                        </form>
					</div>
				</div>
			</div>
			<img src="./resources/imgs/forest1.jpg" alt="visual">
		</div>
	</section>
    
    <script>
	function check() {
		if(document.memberForm.pwd.value == "") {
			alert("비밀번호를 입력해주세요")
			document.memberForm.pwd.focus();
			return;
			
		}if(document.memberForm.cpwd.value == "") {
			alert("비밀번호를 입력해주세요")
			document.memberForm.cpwd.focus();
			return;
			
		}if(document.memberForm.pwd.value == document.memberForm.cpwd.value) {
			
			document.memberForm.submit();
		} else {
			alert("비밀번호와 비밀번호 확인이 같지 않습니다.");
		}
		
	}
</script>

<%@ include file = "../footer.jsp" %>
