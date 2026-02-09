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
    <title>Add Income</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h2>Add Income</h2>

    <form action="AddIncomeServlet" method="post">

        <label for="amount">Amount</label>
        <input type="number" id="amount" name="amount" required>

        <label for="category">Source</label>
        <input type="text" id="category" name="category" required>

        <label for="date">Date</label>
        <input type="date" id="date" name="date" required>

        <button type="submit" class="btn">Add Income</button>

    </form>

    <form action="dashboard.jsp">
        <button type="submit" class="btn secondary">Back to Dashboard</button>
    </form>

</div>

</body>
</html>
