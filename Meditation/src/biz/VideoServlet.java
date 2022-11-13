package biz;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.VideoDAO;
import vo.MemberVO;
import vo.VideoVO;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/video")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		int maxSize = 1024*1024* 1024;
		String encType = "utf-8";
		
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("upload");
		
		File folder = new File(realFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request,realFolder, maxSize,encType,new DefaultFileRenamePolicy() );
			
			Enumeration params = multi.getParameterNames();
			
			while(params.hasMoreElements()) {
				String name = (String) params.nextElement();
				String value = multi.getParameter(name);
				out.println(name + " = " + value + "<br>");
			}
			
			 out.println("-------------------<br>");

			    Enumeration files = multi.getFileNames();

			    while(files.hasMoreElements()) {
			        String name = (String)files.nextElement();
			        String filename = multi.getFilesystemName(name);
			        String original = multi.getOriginalFileName(name);
			        String type = multi.getContentType(name);
			        File file = multi.getFile(name);


			        out.println("파라미터 이름" + name + "<br>");
			        out.println("실제 파일 이름" + original + "<br>");
			        out.println("저장된 파일 이름" + filename + "<br>");
			        out.println("파일 타입 이름" + type + "<br>");

				    if(file!= null) {
				        out.println("크기: " + file.length() + "<br>");
				    }
			    }

			}catch (IOException ioe) {
				System.out.println(ioe);
			} catch (Exception ex) {
				System.out.println(ex);
			}
			
		
		
		int result = 0;

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("loginOK");
		VideoDAO dao = new VideoDAO();
		VideoVO vo = new VideoVO();
		
		vo.setCategory(request.getParameter("category"));
		vo.setName(login.getName());
		vo.setTitle(request.getParameter("title"));
		vo.setText(request.getParameter("text"));
		vo.setVideoUrl(request.getParameter("video"));
		vo.setImgUrl(request.getParameter("img"));

		result = dao.insertVideo(vo);
		if (result > 0) {
			out.println("<script>alert('영상 업로드에 성공했습니다.')</script>");
			out.print("<script>window.location=document.referrer</script> ");
		} else {
			out.println("<script>alert('영상 업로드에 실패했습니다.')</script>");
			out.print("<script>window.location=document.referrer</script> ");

		}
	}

}
