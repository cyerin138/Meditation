package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.RentVO;

public class RentDAO {
	public RentDAO() {
		
	}
	
	public ArrayList<RentVO> getRentalList (String userId) {
		ArrayList<RentVO> list = new ArrayList<>();
		
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sqlAll = "select * from rent_book order by rent_no asc";
		String sqlId = "select * from rent_book where member_id = ? order by rent_no asc";
		
		try {
			conn = JDBCUtil.getConnection();
			 if(userId.equals("admin")) {
				 pstmt = conn.prepareStatement(sqlAll);
			 } else {
				 pstmt = conn.prepareStatement(sqlId);
				 pstmt.setString(1, userId);
			 }
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 RentVO vo = new RentVO();
				 vo.setRentNo(rs.getInt("rent_no"));
				 vo.setMemberId(rs.getString("member_id"));
				 vo.setBookNo(rs.getInt("book_no"));
				 vo.setMemberName(rs.getString("member_name"));
				 vo.setBookTitle(rs.getString("title"));
				 list.add(vo);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public RentVO makeRentData(String userId, int bookNo) {
		RentVO vo = null;
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.member_name , b.title from lib_member a, lib_book b where a.member_id = ? and b.book_no = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, bookNo);			
			rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				vo = new RentVO();
				 vo.setMemberId(userId);
				 vo.setBookNo(bookNo);
				 vo.setMemberName(rs.getString("member_name"));
				 vo.setBookTitle(rs.getString("title"));
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return vo;
		
	}
	
	public int rentBook(RentVO vo ) {
		int result = 0;
		Connection conn = null;
		
		PreparedStatement pstmt = null;

		String sql = "insert into rent_book (rent_no, member_id, book_no , member_name , title) values (rent_seq.nextval, ?,?,?,?)";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getMemberId());
			pstmt.setInt(2,vo.getBookNo());
			pstmt.setString(3,vo.getMemberName());
			pstmt.setString(4,vo.getBookTitle());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return result;
		
	}
	
	public int deleteRent (int bookNo) {
		int result = 0;
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		String sql = "delete from rent_book where book_no = ? ";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bookNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return result;
	}
}
