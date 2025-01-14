<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Officer Tracking - Parcel Management System</title>
</head>
<body>

    <div class="sidebar"></div>
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
             <c:if test="${not empty trackingInfo}">
                    <h2>Tracking Information</h2>
                    <p><strong>Booking ID:</strong> ${trackingInfo.bookingId}</p>
                    <p><strong>Status:</strong> ${trackingInfo.status}</p>
                    <p><strong>Receiver Name:</strong> ${trackingInfo.receiverName}</p>
                    <p><strong>Delivery Address:</strong> ${trackingInfo.receiverAddress}</p>
                    <p><strong>Estimated Delivery:</strong> ${trackingInfo.estimatedDelivery}</p>
                </c:if></div>
        </div>
    </div>
    <script src="script.js"></script>
   
 <jsp:include page="footer.jsp" />
</body>
</html>