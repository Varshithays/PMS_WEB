<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">

</head>
<body>
    <div class="navbar">
        <a href="#" class="navbar-brand">Parcel Management System</a>
    </div>
    <div class="auth-container">
        <h1>Login</h1>
        <div class="login-tabs">
            <button id="customerTab" class="btn btn-primary active">Customer</button>
            <button id="officerTab" class="btn btn-primary">Officer</button>
        </div>
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form id="loginForm" action="<%=request.getContextPath()%>/login" method="post">
            <div class="form-group">
                <label for="username">User ID:</label>
                <input type="text" id="username" name="username" required minlength="5" maxlength="20">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required minlength="8" maxlength="30">
            </div>
            <input type="hidden" id="userType" name="userType" value="customer">
            <button type="submit" id="loginButton" class="btn btn-primary">Login</button>
        </form>
        <div id="registerLink" class="mt-4 text-center">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
       <jsp:include page="footer.jsp" />
    <script src="script.js"></script>
   <script>
        document.getElementById('loginButton').addEventListener('click', function(event) {
            event.preventDefault();
            const userType = document.getElementById('userType').value;
            if (userType === 'customer') {
                window.location.href = 'customer-home.jsp';
            } else if (userType === 'officer') {
                window.location.href = 'officer-home.jsp';
            }
        });
    </script>
</body>
</html>

