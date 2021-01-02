package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.CustomerInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CustomerSelectServlet")
public class CustomerSelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("id").trim();
        int id = Integer.parseInt(ids);
        ApplicantDAO dao = new ApplicantDAO();

        CustomerInfoBO CustomerInfoBO = dao.CustomerUpdate(id);
        System.out.println(CustomerInfoBO);
        request.setAttribute("user",CustomerInfoBO);
        request.setAttribute("hello","hello");
        request.getRequestDispatcher("/customer_update.jsp").forward(request,response);
    }
}
