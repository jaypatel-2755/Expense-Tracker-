package com.expensetracker.servlet;

import com.expensetracker.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MonthlyReportServlet")
public class MonthlyReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String month = request.getParameter("month"); // format: yyyy-MM

        double income = 0;
        double expense = 0;

        try {
            Connection con = DBConnection.getConnection();

            // Income query
            String incomeSql =
                "SELECT SUM(amount) FROM transactions " +
                "WHERE user_id=? AND type='income' " +
                "AND DATE_FORMAT(trans_date, '%Y-%m')=?";

            PreparedStatement ps1 = con.prepareStatement(incomeSql);
            ps1.setInt(1, userId);
            ps1.setString(2, month);

            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                income = rs1.getDouble(1);
            }

            // Expense query
            String expenseSql =
                "SELECT SUM(amount) FROM transactions " +
                "WHERE user_id=? AND type='expense' " +
                "AND DATE_FORMAT(trans_date, '%Y-%m')=?";

            PreparedStatement ps2 = con.prepareStatement(expenseSql);
            ps2.setInt(1, userId);
            ps2.setString(2, month);

            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                expense = rs2.getDouble(1);
            }

            // Send data to JSP
            request.setAttribute("income", income);
            request.setAttribute("expense", expense);

            request.getRequestDispatcher("monthlyReport.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
