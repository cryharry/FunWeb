/*
 * MemberDAO.java 2014. 10. 29.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package member;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
/**
 * Class 내용 기술
 *
 * @author : user
 *
 */
public class MemberDAO {
    Context initCtx = null;
    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
    
    private Connection dbConn() throws Exception {
        initCtx = new InitialContext();
        ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
            
        conn = ds.getConnection();
        return conn;
    }
    
    public void insertMember(MemberBean memberBean) {
        try {
            conn = dbConn();
            sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getId());
            pstmt.setString(2, memberBean.getPasswd());
            pstmt.setString(3, memberBean.getName());
            pstmt.setTimestamp(4, memberBean.getReg_date());
            pstmt.setInt(5, memberBean.getAge());
            pstmt.setString(6, memberBean.getGender());
            pstmt.setString(7, memberBean.getEmail());
            pstmt.setString(8, memberBean.getAddress());
            pstmt.setString(9, memberBean.getTel());
            pstmt.setString(10, memberBean.getMtel());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
    }
}
