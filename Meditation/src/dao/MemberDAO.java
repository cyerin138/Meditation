package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {
	public MemberDAO() {

	}
	
	Connection con = null;
	PreparedStatement pstmt   = null;
	ResultSet rs = null;
	
	final String INSERT_MEMBER = "insert into member values(?,?,?)";
	final String SELECT_MEMBER = "select * from member";
	final String DELETE_MEMBER = "delete from member where id = ?";
	final String UPDATE_MEMBER = "update from member where id = ?";
	final String MEMBER_CHECK = "select * from member where id =?";
	

	public MemberVO getMember(String id) {
		MemberVO vo = null;

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(MEMBER_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return vo;
	}
	
	public boolean existID(String id) {
		boolean isExist = false;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(MEMBER_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return isExist;
	}
	
	public int removeMember(String id) {
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(DELETE_MEMBER);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertMember(MemberVO vo) {
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_MEMBER);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
