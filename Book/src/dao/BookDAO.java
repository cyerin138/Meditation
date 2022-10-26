package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.BookVO;

public class BookDAO {
	public BookDAO() {
		
	}
	public ArrayList<BookVO> getBookList(String key) {
		ArrayList<BookVO> list = new ArrayList<>();
		
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		String str = "%" + key + "%";
		try {
			conn = JDBCUtil.getConnection();
			
			if(key.equals("all")) {
				sql = "select * from lib_book order by book_no asc";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "select * from lib_book where title like ? order by book_no asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setBookNo(rs.getInt("book_no"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setCompany(rs.getString("company"));
				vo.setPrice(rs.getInt("price"));
				vo.setRentaled(rs.getString("rentaled"));
				list.add(vo);
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public int setRentalField(int bookNo, String status) {
		
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		
		String sql = "update lib_book set rentaled = ? where book_no=?";
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  status);
			pstmt.setInt(2, bookNo);
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
		return result;
	}
	
	
	
	public int insertBookData(BookVO data) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into bookshop values(?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  data.getIsbn());
			pstmt.setString(2,  data.getTitle());
			pstmt.setString(3,  data.getAuthor());
			pstmt.setString(4,  data.getCompany());
			pstmt.setInt(5,  data.getPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return result;
	}
	
	public BookVO getBookData(String isbn) {
		BookVO vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bookshop where isbn=?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new BookVO();
				vo.setIsbn(rs.getString("isbn"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setCompany(rs.getString("company"));
				vo.setPrice(rs.getInt("price"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally  {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return vo ;
	}
	
	public int updateBookData(BookVO vo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update bookshop set title=? , author=? , company= ?, price =? where isbn = ?";
		
		try  {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getAuthor());
			pstmt.setString(3, vo.getCompany());
			pstmt.setInt(4, vo.getPrice());
			pstmt.setString(5, vo.getIsbn());
			
			result = pstmt.executeUpdate();
		} catch( SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return result;
	}
	
	
	public int deleteBookData(String isbn) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from bookshop where isbn = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return result;
	}
}
