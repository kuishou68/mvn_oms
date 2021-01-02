package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ApplicantUserUpdateServlet")
public class ApplicantUserUpdateServlet extends HttpServlet {

    //重写HttpServlet方法
    public ApplicantUserUpdateServlet(){super();}
    //doGet请求方式
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //duPost请求方式
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置请求和响应编码
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //2.获取请求参数
        String userId = request.getParameter("user_id").trim();
        String userName = request.getParameter("user_name");
        String userType = request.getParameter("user_type");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String sex = request.getParameter("sex");

        //3.保存用户信息
        ApplicantDAO dao = new ApplicantDAO();
        boolean flag = dao.isExistEail(email);

        Boolean aBoolean = dao.UserUpdateSave(userName,userType,email,phoneNumber,Integer.parseInt(userId),sex);
        //修改成功，调转到user
        if(aBoolean){
            request.getRequestDispatcher("/user").forward(request,response);
        }
    }
}
