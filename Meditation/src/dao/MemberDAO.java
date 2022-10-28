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
	final String SELECT_MEMBER = "select * from memer";
	final String DELETE_MEMBER = "delete from member where id = ?";
	final String UPDATE_MEMBER = "update from member where id = ?";
	final String MEMBER_CHECK = "select * from member where id =?";
	

	public MemberVO getMember(String id) {
		MemberVO vo = null;

		String sql = "select * from lib_member where member_id =?";
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
//				vo.setMemberId(rs.getString("member_id"));
//				vo.setMemberPwd(rs.getString("member_pwd"));
//				vo.setMemberName(rs.getString("member_name"));
//				vo.setMemberAddr(rs.getString("member_addr"));
//				vo.setMemberAge(rs.getInt("member_age"));

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
