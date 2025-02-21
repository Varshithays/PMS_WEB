<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Retrieve session details
    String username = (String) session.getAttribute("userName");
    String userAddress = (String) session.getAttribute("userAddress");
    String userContact = (String) session.getAttribute("userContact");

   
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Service - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
    <script src="<%= request.getContextPath() %>/script.js" defer></script>
</head>
<body>
    <div class="app-container">
       
 <jsp:include page="sidebar.jsp" />
        <div class="main-content">
            <div class="container">
                <h1>Book a Service</h1>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <form id="booking-form" action="<%= request.getContextPath() %>/BookingServlet" method="post">
                    <h2>Sender Information</h2>
                    <div class="form-group">
                        <label for="sender-name">Name:</label>
                        <input type="text" id="sender-name" name="senderName" 
                               value="<%= username %>" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="sender-address">Address:</label>
                        <textarea id="sender-address" name="senderAddress" required readonly>
                            <%= userAddress %>
                        </textarea>
                    </div>
                    <div class="form-group">
                        <label for="sender-contact">Contact:</label>
                        <input type="tel" id="sender-contact" name="senderContact" 
                               value="<%= userContact %>" required readonly>
                    </div>

                    <h2>Receiver Information</h2>
                    <div class="form-group">
                        <label for="receiver-name">Name:</label>
                        <input type="text" id="receiver-name" name="receiverName" required>
                    </div>
                    <div class="form-group">
                        <label for="receiver-address">Address:</label>
                        <textarea id="receiver-address" name="receiverAddress" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="receiver-pincode">Pin Code:</label>
                        <input type="text" id="receiver-pincode" name="receiverPincode" required pattern="\\d{6}">
                    </div>
                    <div class="form-group">
                        <label for="receiver-contact">Contact:</label>
                        <input type="tel" id="receiver-contact" name="receiverContact" 
                               required pattern="[6-9]\\d{9}">
                    </div>

                    <h2>Parcel Details</h2>
                    <div class="form-group">
                        <label for="parcel-size">Size:</label>
                        <select id="parcel-size" name="parcelSize" required>
                            <option value="small">Small</option>
                            <option value="medium">Medium</option>
                            <option value="large">Large</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="parcel-weight">Weight (gms):</label>
                        <input type="number" id="parcel-weight" name="parcelWeight" 
                               required min="0.1" step="0.1">
                    </div>
                    <div class="form-group">
                        <label for="parcel-contents">Contents Description:</label>
                        <textarea id="parcel-contents" name="parcelContents" required></textarea>
                    </div>
                    
                     <h2>Shipping Options</h2>
                    <div class="form-group">
                        <label for="delivery-speed">Delivery Speed:</label>
                        <select id="delivery-speed" name="delivery-speed" required>
                            <option value="standard">Standard</option>
                            <option value="express">Express</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="packaging">Packaging Preference:</label>
                        <select id="packaging" name="packaging" required>
                            <option value="standard">Standard Packaging</option>
                            <option value="custom">Custom Packaging</option>
                            <option value="eco">Eco-friendly Packaging</option>
                            <option value="fragile">Fragile Item Handling</option>
                        </select>
                    </div>

                    <h2>Date and Time Selection</h2>
                    <div class="form-group">
                        <label for="pickup-time">Preferred Pickup Time:</label>
                        <input type="datetime-local" id="pickup-time" name="pickup-time" required>
                    </div>

                    <h2>Additional Services</h2>
                    <div class="form-group">
                        <label for="insurance">Insurance:</label>
                        <select id="insurance" name="insurance">
                            <option value="none">No Insurance</option>
                            <option value="basic">Basic Insurance</option>
                            <option value="premium">Premium Insurance</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Book Service</button>
                </form>
            </div>
        </div>
    </div>
     <jsp:include page="footer.jsp" />
</body>
</html>
