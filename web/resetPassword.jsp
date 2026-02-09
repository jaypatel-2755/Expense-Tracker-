<%
    String email = (String) request.getAttribute("email");
    if (email == null) {
        response.sendRedirect("forgotPassword.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>Reset Password</h2>

    <form action="resetPassword" method="post">


    <input type="hidden" name="email"
           value="<%= request.getAttribute("email") %>">

    <label>New Password</label>
    <input type="password" name="password" required>

    <button class="btn">Reset Password</button>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">
            <%= request.getAttribute("error") %>
        </p>
    <% } %>

    </form>

</div>

</body>
</html>
