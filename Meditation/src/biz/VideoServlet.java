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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//비디오 업로드 서블렛
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("loginOK");
		VideoDAO dao = new VideoDAO();
		VideoVO vo = new VideoVO();

		//크기 제한
		int maxSize = 1024 * 1024 * 1024;
		
		//원래 방식 대로는 .metadata로 들어가서 이미지와 비디오를 가져오기 매우 난이도가 생겨서 그 방식으로는 차마 하지 못했어요 ㅠㅠ 죄송합니다 
		//파일 경로를 이곳에 옮겨주시면 됩니다 !!
		String savePath = "C:\\Users\\SEC\\OneDrive\\바탕 화면\\Meditation\\Meditation\\WebContent\\resources\\upload";

		try {
			// 파일을 가져오기 위해 multipartrequest를 사용함 (request.parameter로 하면 이미지나 영상이 안 다운 받아짐 
			MultipartRequest multi = new MultipartRequest(request,savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

			vo.setCategory(multi.getParameter("category"));
			vo.setName(login.getName());
			vo.setTitle(multi.getParameter("title"));
			vo.setText(multi.getParameter("text"));
			vo.setVideoUrl(multi.getFilesystemName("video"));
			vo.setImgUrl(multi.getFilesystemName("img"));

			int result = 0;		
			
			result = dao.insertVideo(vo);
			if (result > 0) {
				out.println("<script>alert('영상 업로드에 성공했습니다.')</script>");
				response.sendRedirect(request.getContextPath() + "/category/videos.jsp?category=" + multi.getParameter("category"));
				
			} else {
				out.println("<script>alert('영상 업로드에 실패했습니다.')</script>");
				out.println("<script>history.back() </script> ");
			}

		} catch (IOException ioe) {
			System.out.println(ioe);
		} catch (Exception ex) {
			System.out.println(ex);
		}
		
	}

}
