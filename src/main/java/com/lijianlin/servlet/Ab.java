package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.UserInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ab")
public class Ab extends HttpServlet {

    //重写HttpServlet方法
    public Ab(){super();}
    //doGet请求方式
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //duPost请求方式
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ApplicantDAO dao = new ApplicantDAO();
        List<UserInfoBO> userInfoBOS = dao.UserSelect();
        request.setAttribute("users",userInfoBOS);
        request.getRequestDispatcher("user.jsp").forward(request,response);
    }
}
