<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">

</head>
<body>
<div class="navbar">
        <a href="#" class="navbar-brand">Parcel Management System</a>
    </div>
    <div class="auth-container">
        <h1>Customer Registration</h1>

        <!-- Display Success Message -->
        <% if ("success".equals(request.getAttribute("status"))) { %>
            <div class="alert alert-success">
                Registration successful! <a href="<%= request.getContextPath() %>/login">Login here</a>.
            </div>
        <% } %>

        <!-- Display Error Message -->
        <% if ("error".equals(request.getAttribute("status"))) { %>
            <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/register" method="post">
            <!-- Name Field -->
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" maxlength="50" required>
                <% if (request.getAttribute("nameError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("nameError") %></small>
                <% } %>
            </div>

            <!-- Email Field -->
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
                <% if (request.getAttribute("emailError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("emailError") %></small>
                <% } %>
            </div>
<div class="form-group">
    <label for="mobile">Mobile Number:</label>
    <div style="display: flex; gap: 5px;">
        <select id="countryCode" name="countryCode" required>
            <option value="+1" <%= "+1".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+1 (USA/Canada)</option>
            <option value="+44" <%= "+44".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+44 (UK)</option>
            <option value="+91" <%= "+91".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+91 (India)</option>
          share
        </select>
        <input type="tel" id="mobile" name="mobile" value="<%= request.getParameter("mobile") != null ? request.getParameter("mobile") : "" %>" pattern="\\d{10}" required>
    </div>
    <% if (request.getAttribute("mobileError") != null) { %>
        <small class="text-danger"><%= request.getAttribute("mobileError") %></small>
    <% } %>
</div>


            <!-- Address -->
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" required><%= request.getParameter("address") != null ? request.getParameter("address") : "" %></textarea>
                <% if (request.getAttribute("addressError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("addressError") %></small>
                <% } %>
            </div>

            <!-- Username -->
            <div class="form-group">
                <label for="username">User ID:</label>
                <input type="text" id="username" name="username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" minlength="5" maxlength="20" required>
                <% if (request.getAttribute("usernameError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("usernameError") %></small>
                <% } %>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" minlength="8" maxlength="30" required>
                <% if (request.getAttribute("passwordError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("passwordError") %></small>
                <% } %>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" minlength="8" maxlength="30" required>
                <% if (request.getAttribute("confirmPasswordError") != null) { %>
                    <small class="text-danger"><%= request.getAttribute("confirmPasswordError") %></small>
                <% } %>
            </div>
            <div class="formgroup">
					<input type="checkbox" id="emailNotifications"
						name="emailNotifications" id="emailNotifications" /> <label
						class="notification" for="emailNotifications">Receive email
						notifications related to delivery</label>
				</div>

            <!-- Submit and Reset Buttons -->
            <button type="submit" class="btn">Register</button>
            <button type="reset" class="btn">Reset</button>
        </form>
        <div class="mt-4">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
