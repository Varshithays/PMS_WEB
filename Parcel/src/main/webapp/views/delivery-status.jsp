<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Status Update - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
     <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <div class="app-container">
        <jsp:include page="sidebar.jsp" />
        <div class="main-content">
            <div class="container">
                <h1>Update Delivery Status</h1>
                <form action="UpdateStatusServlet" id="status-update-form">
                    <div class="form-group">
                        <label for="booking-id">Booking ID:</label>
                        <input type="text" id="booking-id" name="booking-id" required>
                    </div>
                    <div class="form-group">
                        <label for="status">New Status:</label>
                        <select id="status" name="status" required>
                            <option value="Picked up">Picked up</option>
                            <option value="In Transit">In Transit</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Returned">Returned</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Status</button>
                </form>
               
                    <div id="update-result">${updateMessage}</div>
             
            </div>
        </div>
    </div>
    <script src="script.js"></script>
 <jsp:include page="footer.jsp" />
</body>
</html>