<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Retrieve user session details
    String username = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("role");

    if (username == null || !"customer".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
    <script src="<%= request.getContextPath() %>/script.js" defer></script>
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>Welcome to Your Dashboard, <%= username %></h1>
                <p class="mb-4">Here you can manage your parcels and track your shipments.</p>
                
                <div class="dashboard-summary">
                    <div class="summary-card">
                        <h3><i class="fas fa-box"></i> Active Shipments</h3>
                        <p id="active-shipments">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-history"></i> Total Bookings</h3>
                        <p id="total-bookings">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-truck"></i> Delivered Parcels</h3>
                        <p id="delivered-parcels">Loading...</p>
                    </div>
                </div>

                <h2>Recent Activity</h2>
                <table id="recent-activity" class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
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
     <script src="<%= request.getContextPath() %>/script.js" defer></script>
</body>
</html>
