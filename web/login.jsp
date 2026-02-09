<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>User Login</h2>

    <form action="LoginServlet" method="post">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit" class="btn">Login</button>
    </form>

    <!-- IMPORTANT: outside form -->
    <a href="register.jsp" class="link">Register</a>
    <a href="forgotPassword.jsp" class="link">Forgot Password?</a>
</div>

</body>
</html>
