<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Retrieve user session details
    String username = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("role");

    if (username == null || !"officer".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Home - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
    <script src="<%= request.getContextPath() %>/script.js" defer></script>
</head>
<body>
    <div class="app-container">
       <jsp:include page="sidebar.jsp" />
        <div class="main-content">
            <div class="container">
                <h1>Welcome, Officer</h1>
                <p class="mb-4">Manage parcel services and track shipments from here.</p>
                
                <div class="dashboard-summary">
                    <div class="summary-card">
                        <h3><i class="fas fa-box"></i> Pending Pickups</h3>
                        <p id="pending-pickups">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-truck"></i> In Transit</h3>
                        <p id="in-transit">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-check-circle"></i> Delivered Today</h3>
                        <p id="delivered-today">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-exclamation-triangle"></i> Issues Reported</h3>
                        <p id="issues-reported">Loading...</p>
                    </div>
                </div>

                <h2>Recent Activity</h2>
                <table id="recent-activity" class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Recent activity will be populated here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
