package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ApplicantRegisterServlet")
public class ApplicantRegisterServlet extends HttpServlet {

    //重写HttpServlet方法
    public ApplicantRegisterServlet(){super();}
    //doGet请求方式
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //duPost请求方式
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //2.获取请求参数
        String user_name = request.getParameter("user_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //3.判断邮箱是否已被注册
        ApplicantDAO dao= new ApplicantDAO();
        boolean flag = dao.isExistEail(email);
        if(flag){
            //邮箱已注册，进行错误提示
            out.print("<script type='text/javascript'>");
            out.print("alert('邮箱已被注册，请重新输入！');");
            out.print("</script>");
        }else{

            //邮箱未被注册，保存到注册用户信息
            dao.save(user_name,email,password);
            //注册成功，重定向登录页面
            response.sendRedirect("login.jsp");
        }
    }
}
