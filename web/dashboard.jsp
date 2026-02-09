<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>Dashboard</h2>

    <a href="addIncome.jsp" class="dashboard-btn">Add Income</a>
    <a href="addExpense.jsp" class="dashboard-btn">Add Expense</a>
    <a href="monthlyReport.jsp" class="dashboard-btn">Monthly Report</a>

    <form action="LogoutServlet" method="get">
        <button class="btn secondary">Logout</button>
    </form>
</div>

</body>
</html>

