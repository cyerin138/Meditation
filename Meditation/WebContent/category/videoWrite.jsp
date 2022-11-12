<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
     <!-- 영상 업로드 -->
     <section id="upload">
        <div class="upload-wrap container-12">
            <form action="/video" method="post">
            
            	<%
            			String category = request.getParameter("category");
				%>
				
			<input type="hidden" name="category" value="<%=category%>">
            
            <div class="d-flex align-items-center justify-content-between upload-content">

                <p class="upload-title m-0">전생체험 영상 업로드</p>
                <div class="upload-box d-flex justify-content-between align-items-center">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input upload-file" name="" id="validatedCustomFile" required>
                        <label class="custom-file-label upload-label" for="validatedCustomFile">영상 가져오기</label>
                      </div>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input upload-file" name="" id="validatedCustomFile" required>
                        <label class="custom-file-label upload-label" for="validatedCustomFile">이미지 가져오기</label>
                      </div>
                    <button type="submit" class="upload-submit ml-3">
                       		업로드 
                        <div class="d-flex align-items-center justify-content-center ml-2">

                            <i class="fa-solid fa-paper-plane"></i>
                        </div>
                    </button>
                </div>
            </div>
            <input type="text" name="title" class="upload-text mb-3" placeholder="TITLE"> <br>
            <textarea name="text" id="textArea" cols="40" rows="10" placeholder="CONTENT" class="upload-textarea w-100"></textarea>

        </form>
        </div>
    </section>
<%@ include file="../footer.jsp" %>