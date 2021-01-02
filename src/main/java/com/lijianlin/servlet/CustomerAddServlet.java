package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CustomerAddServlet")
public class CustomerAddServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置请求和响应编码
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();//打印输出文本格式

        //2.获取请求参数
        String cnam = request.getParameter("cnam");//根据参数名称获取参数值
        String cadd = request.getParameter("cadd");//根据参数名称获取参数值
        String cpeo = request.getParameter("cpeo");
        String ctel = request.getParameter("ctel");
        String cmai = request.getParameter("cmai");

        //3.判断用户是否已经被添加
        ApplicantDAO dao = new ApplicantDAO();
        boolean flag = dao.isExistEail(cnam);
        if(flag){
            //客户已存在，进行错误提示
            out.print("<script type='text/javasctipt'>");
            out.print("alert('客户已添加，请重新输入)");
            out.print("</script>");
        }else{
            //保存用户信息
            dao.CustomerInsert(cnam,cadd,cpeo,ctel,cmai);
            //ApplicantDAO中注册成功，重定向进行用户信息展示
            response.sendRedirect("/oms/Customer");
        }
        }


}
