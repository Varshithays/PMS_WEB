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
    <jsp:include page="sidebar.jsp" />
    <div class="main-content">
        <div class="container">
            <h1>Track Your Parcel</h1>
            <form id="tracking-form"action="TrackingServlet" method="get">
                <div class="form-group">
                    <label for="booking-id">Booking ID:</label>
                    <input type="text" id="booking-id" name="booking-id" required>
                </div>
                <button type="submit">Track</button>
            </form>
            <div id="tracking-result">
         
                    <h2>Tracking Information</h2>
                    <p><strong>Booking ID:</strong> ${trackingInfo.bookingId}</p>
                    <p><strong>Status:</strong> ${trackingInfo.status}</p>
                    <p><strong>Receiver Name:</strong> ${trackingInfo.receiverName}</p>
                    <p><strong>Delivery Address:</strong> ${trackingInfo.receiverAddress}</p>
                    <p><strong>Estimated Delivery:</strong> ${trackingInfo.estimatedDelivery}</p>
               </div>
        </div>
    </div>
    <script src="script.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>

    