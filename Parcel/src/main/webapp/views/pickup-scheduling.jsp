<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pickup Scheduling - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>Schedule Pickup</h1>
             <form action="SchedulePickupServlet" method="post" id="pickup-form">
                    <div class="form-group">
                        <label for="booking-id">Booking ID:</label>
                        <input type="text" id="booking-id" name="booking-id" required>
                    </div>
                    <div class="form-group">
                        <label for="pickup-date">Pickup Date and Time:</label>
                        <input type="datetime-local" id="pickup-date" name="pickup-date" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Schedule Pickup</button>
                </form>
               <c:if test="${not empty scheduleMessage}">
                    <div id="schedule-result">${scheduleMessage}</div>
                </c:if>
            </div>
        </div>
    </div>
    <script src="main.js"></script>
    <script>
 // Set minimum date to 1 hour from now
    document.addEventListener('DOMContentLoaded', function() {
        const now = new Date();
        now.setHours(now.getHours() + 1);
        document.getElementById('pickup-date').min = now.toISOString().slice(0, 16);
    });
    </script>
     <jsp:include page="footer.jsp" />
</body>
</html>

    