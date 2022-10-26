package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;
import vo.BookVO;
import vo.MemberVO;

public class MemberDAO {
	public MemberDAO() {

	}

	public MemberVO getMemberData(String id) {
		MemberVO vo = null;
		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql = "select * from lib_member where member_id =?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPwd(rs.getString("member_pwd"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setMemberAddr(rs.getString("member_addr"));
				vo.setMemberAge(rs.getInt("member_age"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return vo;
	}
	
	public boolean existID(String id) {
		boolean isExist = false;
		
		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;
		String sql = "select * from lib_member where member_id =?";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return isExist;
	}
	
	public int removeMember(String id) {
		int result = 0;
		Connection conn = null;

		PreparedStatement pstmt = null;

		String sql = "delete from lib_member where member_id = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertMember(MemberVO data) {
		int result = 0;
		Connection conn = null;

		PreparedStatement pstmt = null;
		String sql = "insert into lib_member(member_id, member_pwd, member_name , member_addr , member_age) values (?,?,?,?,?)";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, data.getMemberId());
			pstmt.setString(2, data.getMemberPwd());
			pstmt.setString(3, data.getMemberName());
			pstmt.setString(4, data.getMemberAddr());
			pstmt.setInt(5, data.getMemberAge());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
