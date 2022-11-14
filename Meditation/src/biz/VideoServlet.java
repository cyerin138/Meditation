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
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("loginOK");
		VideoDAO dao = new VideoDAO();
		VideoVO vo = new VideoVO();

		int maxSize = 1024 * 1024 * 1024;
		String encType = "utf-8";

//		ServletContext context = getServletContext();
//		String realFolder = context.getRealPath("upload");
		
//		String path = request.getSession().getServletContext().getRealPath("/resources/video/");

//		File folder = new File(realFolder);
//		if (!folder.exists()) {
//			folder.mkdir();
//		}

		try {
			MultipartRequest multi = null;

			multi = new MultipartRequest(request, request.getRealPath("/upload"), maxSize, encType, new DefaultFileRenamePolicy());

			vo.setCategory(multi.getParameter("category"));
			vo.setName(login.getName());
			vo.setTitle(multi.getParameter("title"));
			vo.setText(multi.getParameter("text"));
			vo.setVideoUrl(multi.getFile("video").getName());
			vo.setImgUrl(multi.getFile("img").getName());

//			Enumeration params = multi.getParameterNames();
//
//			while (params.hasMoreElements()) {
//				String name = (String) params.nextElement();
//				String value = multi.getParameter(name);
//			}
//
//			Enumeration files = multi.getFileNames();
//
//			while (files.hasMoreElements()) {
//				String name = (String) files.nextElement();
//				String filename = multi.getFilesystemName(name);
//				String original = multi.getOriginalFileName(name);
//				String type = multi.getContentType(name);
//				File file = multi.getFile(name);
//
//			}
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
