package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ApplicantUserAddServlet")
public class ApplicantUserAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.设置请求和响应编码
        req.setCharacterEncoding("UTF8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        //2.获取请求参数
        String user_name = req.getParameter("user_name");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        String sex = req.getParameter("sex");

        //3.判断用户是否已经被注册
        ApplicantDAO dao = new ApplicantDAO();
        boolean flag = dao.isExistEail(email);
        if(flag){
            //用户邮箱已存在，进行错误提示
            out.print("<script type='text/javaascript'>");
            out.print("alert('用户已添加，请重新输入！');");
            out.print("</script>");
        }else{
            //保存注册用户信息
            dao.UserSave(user_name,email,phoneNumber,sex);
            //注册成功，进行用户信息展示
            req.getRequestDispatcher("user").forward(req,resp);
        }
    }
}
