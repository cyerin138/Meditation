<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
     <!-- 영상 업로드 -->
     <section id="upload">
        <div class="upload-wrap container-12">
            <form action="<%=request.getContextPath()%>/video" method="post" name="videoForm" enctype="multipart/form-data">
            <%
        		request.setCharacterEncoding("UTF-8");
				String category = request.getParameter("category");
				
				//카테고리 체크
				String categoryName = "";
				switch (category) {
					case "M" :
						categoryName = "명상";
						break;
					case "P" :
						categoryName = "전생체험";
						break;
					case "F" :
						categoryName = "주파수";
						break;
				}
			%>
				
			<input type="hidden" name="category" value="<%=category%>">
            
            <div class="d-flex align-items-center justify-content-between upload-content">

                <p class="upload-title m-0"><%=categoryName%> 영상 업로드</p>
                <div class="upload-box d-flex justify-content-between align-items-center">
					<div class="custom-file">
						<input class="upload-name v-name" value="Video File..." placeholder="Video File...">
						<label for="video">Browse</label> 
						<input type="file" id="video" class="upload-file video-file" name="video" required accept=".mp4">
					</div>
					<div class="custom-file  ml-3">
						<input class="upload-name img-name" value="Image File..." placeholder="Image File...">
						<label for="img">Browse</label> 
						<input type="file" id="img" class="upload-file img-file" name="img" required accept=".gif, .jpg, .png, .jpeg">
					</div>
                    <button onclick="check()" class="upload-submit ml-3">
                       		업로드 
                        <div class="d-flex align-items-center justify-content-center ml-2">

                            <i class="fa-solid fa-paper-plane"></i>
                        </div>
                    </button>
                </div>
            </div>
            <input type="text" name="title" class="upload-text mb-3" placeholder="TITLE" minlength="1" maxlength="50"> <br>
            <textarea name="text" id="textArea" cols="40" rows="10" placeholder="CONTENT" class="upload-textarea w-100" minlength="1" maxlength="75"></textarea>

        </form>
        </div>
    </section>
    
    
    <script>
	$(".video-file").on('change',function(){
  		let fileName = $(".video-file").val();
  		$('.v-name').val(fileName);
	});
	$(".img-file").on('change',function(){
  		let fileName = $(".img-file").val();
  		$('.img-name').val(fileName);
	});

    //값이 비였는지 체크
	function check() {
		if(document.videoForm.video.value == "") {
			alert("비디오를 입력해주세요")
			document.videoForm.video.focus();
			return;
			
		}if(document.videoForm.img.value == "") {
			alert("이미지를 입력해주세요")
			document.videoForm.img.focus();
			return;
			
		}if(document.videoForm.title.value == "") {
			alert("제목을 입력해주세요")
			document.videoForm.title.focus();
			return;
			
		}if(document.videoForm.text.value == "") {
			alert("내용을 입력해주세요")
			document.videoForm.text.focus();
			return;
			
		}
		
		document.videoForm.submit();
	}
</script>
<%@ include file="../footer.jsp" %>