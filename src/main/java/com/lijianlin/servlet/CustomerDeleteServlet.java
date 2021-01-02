package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CustomerDeleteServlet")
public class CustomerDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置请求和响应编码
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //2.获取请求参数
        String cid = request.getParameter("id");
        //3.保存客户信息
        ApplicantDAO dao = new ApplicantDAO();
        Boolean aBoolean = dao.CustomerDeleteSave(Integer.parseInt(cid));//拿到id跳转到CustomerDeleteSave方法
        //修改成功，跳转到
        if(aBoolean){
            request.getRequestDispatcher("/Customer").forward(request,response);
        }
    }
}
