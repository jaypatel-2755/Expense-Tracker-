<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Monthly Report</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h2>Monthly Report</h2>

    <form action="MonthlyReportServlet" method="get">

        <label for="month">Select Month</label>
        <input type="month" id="month" name="month" required>

        <button type="submit" class="btn">View Report</button>

    </form>

    <%
        Double income = (Double) request.getAttribute("income");
        Double expense = (Double) request.getAttribute("expense");

        if (income != null && expense != null) {
            double balance = income - expense;
    %>

    <table>
        <tr>
            <th>Total Income</th>
            <th>Total Expense</th>
            <th>Balance</th>
        </tr>
        <tr>
            <td>₹ <%= income %></td>
            <td>₹ <%= expense %></td>
            <td>₹ <%= balance %></td>
        </tr>
    </table>

    <% } %>

    <form action="dashboard.jsp">
        <button type="submit" class="btn secondary">Back to Dashboard</button>
    </form>

</div>

</body>
</html>
