package biz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.BookVO;

/**
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String isbn = request.getParameter("isbn");
		
		BookDAO dao = new BookDAO();
		BookVO vo = dao.getBookData(isbn);
		
		if( vo != null) {
			request.setAttribute("selectBook", vo);
			request.getRequestDispatcher("/book/bookUpdate.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("/book/bookList.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BookVO vo = new BookVO();
		vo.setIsbn(request.getParameter("isbn"));
		vo.setTitle(request.getParameter("title"));
		vo.setAuthor(request.getParameter("author"));
		vo.setCompany(request.getParameter("company"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		
		BookDAO dao = new BookDAO();
		int n = dao.updateBookData(vo);
		
		if(n >= 0) {
			response.sendRedirect("/listBook");
		} else {
			response.sendRedirect("/book/bookUpdate.jsp");
		}
		
	}

}
