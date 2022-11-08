<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <!-- 비밀번호 변경 -->
    <section id="login">
        <div class="login-wrap position-relative">
            <div class="login-box position-absolute sign-box">
                <div class="login-content text-center sign-content">

  				<%
	                String id = request.getParameter("id");
                %>
                    <h1>닉네임 변경</h1>
                    <form action="<%=request.getContextPath()%>/nameChange" method="post" name ="memberForm">
                        <input type="text" name="id" class="l-id" placeholder="ID" value="<%= id %>" readonly><br>
                        <input type="text" name="name" class="l-name" placeholder="NEW NAME"> <br>                        
                        <input type="button" value="CHANGE" onclick="check()" class="name-btn">
                        
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <script>
	function check() {
		if(document.memberForm.name.value == "") {
			alert("이름을 입력해주세요")
			document.memberForm.name.focus();
			return;			
		}
		document.memberForm.submit();
		
	}
</script>

<%@ include file = "../footer.jsp" %>
