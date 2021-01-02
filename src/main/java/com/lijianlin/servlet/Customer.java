package com.lijianlin.servlet;

import com.lijianlin.dao.ApplicantDAO;
import com.lijianlin.entity.CustomerInfoBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Customer")
public class Customer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ApplicantDAO dao = new ApplicantDAO();
        List<CustomerInfoBO> CustomerInfoBOS = dao.CustomerSelect();
        request.setAttribute("customer",CustomerInfoBOS);
        request.getRequestDispatcher("customer.jsp").forward(request,response);
    }
}
