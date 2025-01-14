<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Tracking - Parcel Management System</title>
     <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
    
</head>
<body>
    <div class="sidebar"></div>
    <div class="main-content">
        <div class="container">
            <h1>Track Your Parcel</h1>
            <form id="tracking-form">
                <div class="form-group">
                    <label for="booking-id">Booking ID:</label>
                    <input type="text" id="booking-id" name="booking-id" required>
                </div>
                <button type="submit">Track</button>
            </form>
            <div id="tracking-result"></div>
        </div>
    </div>
    <script src="script.js"></script>
    
</body>
</html>

    