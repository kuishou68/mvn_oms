package com.lijianlin.dao;

import com.lijianlin.entity.CustomerInfoBO;
import com.lijianlin.entity.UserInfoBO;
import com.lijianlin.util.DBUtil;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ApplicantDAO extends HttpServlet {

    //注册的业务处理
    // 1.验证email是否被注册
    public boolean isExistEail(String email) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//防止sql注入
        ResultSet rs = null;//查询结果返回对象
        String sql = "select * from sys_user where email= ?";
        try {
            pstmt = conn.prepareStatement(sql);//拼接SQL
            pstmt.setString(1, email);//把Email拼接到sql？值上
            rs = pstmt.executeQuery();  //执行sql语句
            if (rs.next())//如果查询成功，返回true
                return true;
        } catch (SQLException e) {
            e.printStackTrace();//捕获异常
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return false;
    }

    // 2.注册信息保存
    public void save(String user_name, String email, String password) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        String sql = "INSERT INTO sys_user(user_name,email,password) VALUES(?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    // 3.注册登录用户
    public int login(String email, String password) {
        int applicantID = 0;
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT user_id FROM sys_user WHERE email=? and password=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (rs.next())
                applicantID = rs.getInt("user_id");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return applicantID;
    }

    // 4.判断是否有该用户
    public boolean isExistResume(int applicantID) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from sys_user where email= ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            rs = pstmt.executeQuery();
            if (rs.next())
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return false;
    }

    //------------用户管理模块
    // 1.注册信息保存
    public void UserSave(String user_name, String email, String phoneNumber, String sex) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        String sql = "INSERT INTO sys_user(user_name,email,phoneNumber,sex) VALUES(?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_name);
            pstmt.setString(2, email);
            pstmt.setString(3, phoneNumber);
            pstmt.setString(4, sex);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    // 2.查询用户信息
    public List<UserInfoBO> UserSelect() {
        Connection conn = DBUtil.getConnection();
        String sql = "select * from sys_user";
        ArrayList<UserInfoBO> userInfoBOS = new ArrayList<>();
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String userName = rs.getString("user_name");
                String userType = rs.getString("user_type");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phonenumber");
                String status = rs.getString("status");
                String createTime = rs.getString("create_time");
                String sex = rs.getString("sex");

                UserInfoBO userInfoBO = new UserInfoBO(userId, userName, userType, email, phoneNumber, status, createTime,sex);
                userInfoBOS.add(userInfoBO);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userInfoBOS;
    }

    //3.回调查询用户信息
    public UserInfoBO UserUpdate(int id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * from sys_user where user_id=?";
        UserInfoBO userInfoBO = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String userName = rs.getString("user_name");
                String userType = rs.getString("user_type");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phonenumber");
                String status = rs.getString("status");
                String createTime = rs.getString("create_time");
                String sex = rs.getString("sex");
                userInfoBO = new UserInfoBO(userId, userName, userType, email, phoneNumber, status, createTime,sex);

            }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return userInfoBO;
    }

    //4.修改用户信息
    public Boolean UserUpdateSave(String user_name,String user_type, String email, String phonenumber, Integer id,String sex) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        Boolean isSousess = false;
        String sql = "UPDATE sys_user set user_name = ? ,user_type = ?, email = ?,phonenumber = ?,sex= ?  where user_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_name);
            pstmt.setString(2, user_type);
            pstmt.setString(3, email);
            pstmt.setString(4, phonenumber);
            pstmt.setString(5, sex);
            pstmt.setInt(6, id);    //id值得顺序要和上面sql语句相对应
            isSousess = pstmt.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
        return isSousess;
    }

    //5.删除用户信息
    public Boolean UserDeleteSave(Integer id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        Boolean isSousess = false;
        String sql = "delete from sys_user where user_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            isSousess = pstmt.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
        return isSousess;
    }


    //------------客户管理模块
    // 1.新增信息保存
    public void CustomerInsert(String Cnam, String Cadd, String Cpeo, String Ctel,String Cmai) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        String sql = "INSERT INTO customer(Cnam,Cadd,Cpeo,Ctel,Cmai) VALUES(?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Cnam);
            pstmt.setString(2, Cadd);
            pstmt.setString(3, Cpeo);
            pstmt.setString(4, Ctel);
            pstmt.setString(5, Cmai);

            pstmt.executeUpdate();
        }catch (MySQLIntegrityConstraintViolationException e){
            System.err.println("唯一建约束异常->"+e.getMessage());
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    // 2.查询客户信息
    public List<CustomerInfoBO> CustomerSelect() {
        Connection conn = DBUtil.getConnection();
        String sql = "select * from customer";
        ArrayList<CustomerInfoBO> CustomerInfoBOS = new ArrayList<>();
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                int Cid = rs.getInt("Cid");
                String Cnam = rs.getString("Cnam");
                String Cadd = rs.getString("Cadd");
                String Cpeo = rs.getString("Cpeo");
                String Ctel = rs.getString("Ctel");
                String Cmai = rs.getString("Cmai");

                CustomerInfoBO CustomerInfoBO = new CustomerInfoBO(Cid, Cnam, Cadd, Cpeo, Ctel, Cmai);
                CustomerInfoBOS.add(CustomerInfoBO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return CustomerInfoBOS;
    }

    //3.回调查询客户信息
    public CustomerInfoBO CustomerUpdate(int id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * from customer where cid=?";
        CustomerInfoBO customerInfoBO = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
                if (rs.next()) {
                    int Cid = rs.getInt("Cid");
                    String Cnam = rs.getString("Cnam");
                    String Cadd = rs.getString("Cadd");
                    String Cpeo = rs.getString("Cpeo");
                    String Ctel = rs.getString("Ctel");
                    String Cmai = rs.getString("Cmai");
                    customerInfoBO = new CustomerInfoBO(Cid, Cnam, Cadd, Cpeo, Ctel, Cmai);
                }

            } catch (SQLException e) {
                e.printStackTrace();

            } finally {
                DBUtil.closeJDBC(rs, pstmt, conn);
            }
            return customerInfoBO;
    }

    //修改客户信息
    public void CustomerUpdateSave(CustomerInfoBO customerInfoBO) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        Boolean isSousess = false;
        String sql = "UPDATE customer set cnam = ?, cadd = ?,cpeo = ?,ctel= ?,cmai =?  where cid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, customerInfoBO.getCnam());
            pstmt.setString(2, customerInfoBO.getCadd());
            pstmt.setString(3, customerInfoBO.getCpeo());
            pstmt.setString(4, customerInfoBO.getCtel());
            pstmt.setString(5, customerInfoBO.getCmai());
            pstmt.setInt(6, customerInfoBO.getCid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    //删除用户信息
    public Boolean CustomerDeleteSave(Integer id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;//方式sql注入
        Boolean isSousess = false;
        String sql = "delete from customer where Cid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            isSousess = pstmt.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
        return isSousess;
    }
}