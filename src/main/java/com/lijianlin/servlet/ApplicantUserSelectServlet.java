package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.UserInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ApplicantUserSelectServlet")
public class ApplicantUserSelectServlet extends HttpServlet {
    //重写HttpServlet方法
    public ApplicantUserSelectServlet(){super();}
    //doGet请求方式
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //duPost请求方式
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("id").trim();
        int id=Integer.parseInt(ids);
        ApplicantDAO dao = new ApplicantDAO();
        UserInfoBO userInfoBO = dao.UserUpdate(id);
        request.setAttribute("user",userInfoBO);
        request.getRequestDispatcher("user_update.jsp").forward(request,response);
    }
}
