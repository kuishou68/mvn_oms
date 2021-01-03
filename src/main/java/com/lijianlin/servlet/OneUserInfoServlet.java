package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/select/one/user")
public class OneUserInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId").trim();
        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");
        String nickName = ApplicantDAO.selectMeName(Integer.parseInt(userId));
        System.out.println("测试->"+nickName);
        resp.getWriter().write(nickName);
    }
}
