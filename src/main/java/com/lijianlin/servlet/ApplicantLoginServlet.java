package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.UserInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/ApplicantLoginServlet")
public class ApplicantLoginServlet extends HttpServlet {

    public ApplicantLoginServlet(){super();}//重写HttpServlet方法

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // 获取请求参数
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // 登录验证
        ApplicantDAO dao = new ApplicantDAO();
        int applicantID = dao.login(email,password);

        ArrayList<UserInfoBO> users = new ArrayList<>();

        String sql = "select * from system_user";

//        users.add(new UserInfoBO());
//        users.add(new UserInfoBO());
//        users.add(new UserInfoBO());

        request.setAttribute("userList",users);//带参转发，拿到user里面的数据

        request.getRequestDispatcher("user.jsp").forward(request,response);

        if(applicantID !=0 ){
            // 用户登录成功
            boolean exist = dao.isExistResume(applicantID);
            if(exist){
                // 若用户已存在，跳到首页
                response.sendRedirect("index.jsp");
            }else{
                // 若用户不存在，跳到简历填写向导页面
                response.sendRedirect("applicant/resumeGuide.html");
            }
        }else{
            // 用户登录信息错误，进行错误提示
            out.print("<script type='text/javascript'>");
            out.print("alert('用户名或密码错误，请重新输入！');");
            out.print("window.location='login.html';");
            out.print("</script>");
        }
    }
}
