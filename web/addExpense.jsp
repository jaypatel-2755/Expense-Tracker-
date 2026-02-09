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
    <title>Add Expense</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h2>Add Expense</h2>

    <form action="AddExpenseServlet" method="post">

        <label for="amount">Amount</label>
        <input type="number" id="amount" name="amount" required>

        <label for="category">Category</label>
        <select id="category" name="category" required>
            <option value="">-- Select Category --</option>
            <option value="Food">Food</option>
            <option value="Travel">Travel</option>
            <option value="Shopping">Shopping</option>
            <option value="Rent">Rent</option>
            <option value="Other">Other</option>
        </select>

        <label for="date">Date</label>
        <input type="date" id="date" name="date" required>

        <button type="submit" class="btn">Add Expense</button>

    </form>

    <form action="dashboard.jsp">
        <button type="submit" class="btn secondary">Back to Dashboard</button>
    </form>

</div>

</body>
</html>
