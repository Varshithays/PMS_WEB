<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%-- <%@ page import="java.util.List, compmsmodels.Booking" %>--%>
<%
    // Retrieve user session details
    String username = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("role");

    if (username == null || !"customer".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Fetch booking data from request
    // List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");

    if (currentPage == null) currentPage = 1;
    if (totalPages == null) totalPages = 1;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Previous Bookings - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <div class="app-container">
       <jsp:include page="sidebar.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
                <h1>Your Previous Bookings</h1>
                <table id="bookings-table" class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Booking Date</th>
                            <th>Receiver Name</th>
                            <th>Delivery Address</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
        <%--                <% if (bookings != null && !bookings.isEmpty()) { %>
                            <% for (Booking booking : bookings) { %>
                                <tr>
                                    <td><%= booking.getBookingId() %></td>
                                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(booking.getPickupTime()) %></td>
                                    <td><%= booking.getReceiverName() %></td>
                                    <td><%= booking.getReceiverAddress() %></td>
                                    <td>₹<%= booking.getAmount() %></td>
                                    <td><%= booking.getStatus() %></td>
                                </tr>
                            <% } %>
                        <% } else { %> 
                            <tr>
                                <td colspan="6" class="text-center">No previous bookings found.</td>
                            </tr>
                        <% } %>--%>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div id="pagination">
                    <% if (currentPage > 1) { %>
                        <a href="?page=<%= currentPage - 1 %>" class="btn btn-secondary">Previous</a>
                    <% } %>
                    <span id="page-info">Page <%= currentPage %> of <%= totalPages %></span>
                    <% if (currentPage < totalPages) { %>
                        <a href="?page=<%= currentPage + 1 %>" class="btn btn-secondary">Next</a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/script.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
