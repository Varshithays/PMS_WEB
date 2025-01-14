<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Previous Bookings - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">

</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
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
                        <!-- Booking data will be populated here -->
                    </tbody>
                </table>
                <div id="pagination">
                    <button id="prev-page" class="btn btn-secondary">Previous</button>
                    <span id="page-info"></span>
                    <button id="next-page" class="btn btn-secondary">Next</button>
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
      <jsp:include page="footer.jsp" />
</body>
</html>

    