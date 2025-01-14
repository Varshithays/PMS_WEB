<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Bill - Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="sidebar"></div>
    <div class="main-content">
        <div class="container">
            <h1>Pay Bill</h1>
            <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-danger"><%=request.getAttribute("error")%></div>
            <% } %>
            
            <div id="bill-details">
                <h2>Booking Details</h2>
                <p><strong>Booking ID:</strong> <%=request.getAttribute("bookingId")%></p>
                <p><strong>Receiver Name:</strong> <%=request.getAttribute("receiverName")%></p>
                <p><strong>Bill Amount:</strong> ₹<%=request.getAttribute("billAmount")%></p>
            </div>

            <form id="payment-form" action="<%=request.getContextPath()%>/PaymentServlet" method="post">
                <input type="hidden" name="bookingId" value="<%=request.getAttribute("bookingId")%>">
                <div class="form-group">
                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" name="cardNumber" required maxlength="16">
                </div>
                <div class="form-group">
                    <label for="card-holder">Card Holder Name:</label>
                    <input type="text" id="card-holder" name="cardHolder" required>
                </div>
                <div class="form-group">
                    <label for="expiry-date">Expiry Date:</label>
                    <input type="text" id="expiry-date" name="expiryDate" required placeholder="MM/YY">
                </div>
                <div class="form-group">
                    <label for="cvv">CVV:</label>
                    <input type="password" id="cvv" name="cvv" required maxlength="3">
                </div>
                <button type="submit">Make Payment</button>
            </form>
        </div>
    </div>
     <jsp:include page="footer.jsp" />
</body>

</html>