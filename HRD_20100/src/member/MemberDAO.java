package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.JDBCUtil;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt   = null;
	ResultSet rs = null;
	
	final String FINDE_MAX = "select max(custno) from member_tbl_02";
	final String INSERT_MEMBER = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	
	public int maxCustno() {
		
		int max = 0;
		try {			
			con = JDBCUtil.getConnection();			
			pstmt = con.prepareStatement(FINDE_MAX);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 max = rs.getInt(1) + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return max;
		
	}
	
	
	public int register(MemberVO vo) {
		int cnt = 0;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_MEMBER);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setDate(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			
			cnt = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	
}
