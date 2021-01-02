package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ApplicantUserDeleteServlet")
public class ApplicantUserDeleteServlet extends HttpServlet {

    //重写HttpServlet方法
    public ApplicantUserDeleteServlet(){super();}
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

        //2.获取请求参数s
        String userId = request.getParameter("id").trim();//使用trim避免id前面出现空格
        //3.保存用户信息
        ApplicantDAO dao = new ApplicantDAO();
        Boolean aBoolean = dao.UserDeleteSave(Integer.parseInt(userId));//拿到ID并调转到UserDeleteServlet方法
        //修改成功，调转到user
        if(aBoolean){
            request.getRequestDispatcher("/user").forward(request,response);
        }
    }
}
