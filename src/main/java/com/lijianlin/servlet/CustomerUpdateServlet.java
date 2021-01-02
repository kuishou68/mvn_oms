package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.CustomerInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CustomerUpdateServlet")
public class CustomerUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("------------------------------------------");
        //1.设置请求和响应编码
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        //2.获取请求参数
        String cid = request.getParameter("cid").trim();  //getParameter("cid");这是前台获取的name，cid必须小写，否者获取不到前台的值。
        System.out.println("测试"+cid);
        String cnam = request.getParameter("cnam");
        String cadd = request.getParameter("cadd");
        String cpeo = request.getParameter("cpeo");
        String ctel = request.getParameter("ctel");
        String cmail = request.getParameter("cmai");

        CustomerInfoBO customerInfoBO=new CustomerInfoBO(Integer.parseInt(cid),cnam,cadd,cpeo,ctel,cmail);

        //3.保存用户信息
        ApplicantDAO dao = new ApplicantDAO();
        dao.CustomerUpdateSave(customerInfoBO);
//        request.getRequestDispatcher("/Customer").forward(request,response);
        response.sendRedirect("/oms/Customer"); //重定向网页
    }
}
