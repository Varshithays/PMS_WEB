<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - Parcel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #818181;
            display: block;
        }
        .sidebar a:hover {
            color: #f1f1f1;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3 class="text-center text-white mb-4">PMS</h3>
        <c:choose>
            <c:when test="${role eq 'Customer'}">
                <a href="<c:url value='/'/>"><i class="fas fa-home"></i> Home</a>
                <a href="<c:url value='/booking-service'/>"><i class="fas fa-box"></i> Booking Service</a>
                <a href="<c:url value='/invoice'/>"><i class="fas fa-file-invoice"></i> Invoice</a>
                <a href="<c:url value='/tracking'/>"><i class="fas fa-search"></i> Tracking</a>
                <a href="<c:url value='/previous-booking'/>"><i class="fas fa-history"></i> Previous Booking</a>
                <a href="<c:url value='/contact-support'/>"><i class="fas fa-headset"></i> Contact Support</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/'/>"><i class="fas fa-home"></i> Home</a>
                <a href="<c:url value='/booking-service'/>"><i class="fas fa-box"></i> Booking Service</a>
                <a href="<c:url value='/invoice'/>"><i class="fas fa-file-invoice"></i> Invoice</a>
                <a href="<c:url value='/tracking'/>"><i class="fas fa-search"></i> Tracking</a>
                <a href="<c:url value='/previous-booking'/>"><i class="fas fa-history"></i> Previous Booking</a>
                <a href="<c:url value='/delivery-status'/>"><i class="fas fa-truck"></i> Delivery Status</a>
                <a href="<c:url value='/pickup-scheduling'/>"><i class="fas fa-calendar-alt"></i> Pickup Scheduling</a>
            </c:otherwise>
        </c:choose>
        <a href="<c:url value='/logout'/>"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="content">
        <h2 class="mb-4">Welcome, ${name}</h2>
        <jsp:doBody/>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>