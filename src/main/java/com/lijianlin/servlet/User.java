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

@WebServlet("/user")
public class User extends HttpServlet {
    //重写HttpServlet方法
    public User(){super();}
    //doGet请求方式
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //duPost请求方式
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("userLogin")==null){
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();
            UserInfoBO user = ApplicantDAO.modifyUserLogin(email,password);
            if (user==null){

                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
            request.getSession().setAttribute("userLogin",user);
        }

        ApplicantDAO dao = new ApplicantDAO();
        List<UserInfoBO> userInfoBOS = dao.UserSelect();
        request.setAttribute("users",userInfoBOS);
        request.getRequestDispatcher("user.jsp").forward(request,response);//请求转发
    }
}
