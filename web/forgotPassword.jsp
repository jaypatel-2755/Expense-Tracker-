<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>Forgot Password</h2>

    <form action="forgotPassword" method="post">

    <label>Email</label>
    <input type="email" name="email" required>

    <button class="btn">Reset Link</button>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
    </form>


    <a href="login.jsp" class="link">Back to Login</a>
</div>

</body>
</html>
