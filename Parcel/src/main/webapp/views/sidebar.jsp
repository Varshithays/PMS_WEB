<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<%
    String userType = (String) session.getAttribute("userType");
    String username = (String) session.getAttribute("username");
%>
<div class="sidebar">
    <div class="logo">PMS</div>
    <div id="user-welcome">Welcome, <%= Objects.toString(username, "User") %></div>
    <% if ("customer".equals(userType)) { %>
        <a href="customer-home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="booking-service.jsp"><i class="fas fa-box"></i> Book Service</a>
        <a href="tracking.jsp"><i class="fas fa-search"></i> Track Parcel</a>
        <a href="customer-previous-bookings.jsp"><i class="fas fa-history"></i> Previous Bookings</a>
        <a href="contact-support.jsp"><i class="fas fa-headset"></i> Contact Support</a>
    <% } else if ("officer".equals(userType)) { %>
        <a href="officer-home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="officer-booking.jsp"><i class="fas fa-box"></i> Book Service</a>
        <a href="tracking.jsp"><i class="fas fa-search"></i> Tracking</a>
        <a href="delivery-status.jsp"><i class="fas fa-truck"></i> Update Status</a>
        <a href="officer-previous-bookings.jsp"><i class="fas fa-history"></i> View Bookings</a>
        <a href="pickup-scheduling.jsp"><i class="fas fa-calendar-alt"></i> Schedule Pickup</a>
    <% } %>
    <a href="#" id="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

