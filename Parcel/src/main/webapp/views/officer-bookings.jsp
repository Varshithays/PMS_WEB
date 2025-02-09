<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Booking - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <div class="app-container">
        
<jsp:include page="sidebar.jsp" />
        <div class="main-content">
            <div class="container">
                <h1>Book a Service for Customer</h1>
                <form  id="officer-booking-form" action="OfficerBookingServlet" method="post">
                    <h2>Sender Information</h2>
                    <div class="form-group">
                        <label for="sender-name">Name:</label>
                        <input type="text" id="sender-name" name="sender-name" required>
                    </div>
                    <div class="form-group">
                        <label for="sender-address">Address:</label>
                        <textarea id="sender-address" name="sender-address" required></textarea>
                    </div>
                    
                    <div class="form-group">
    				<label for="sender-pincode">Sender Pin Code:</label>
    				<input type="text" id="sender-pincode" name="sender-pincode" required 
    				pattern="[0-9]{6}" title="Please enter a valid 6-digit pincode"></div>

                    <div class="form-group">
                        <label for="sender-contact">Contact:</label>
                        <input type="tel" id="sender-contact" name="sender-contact" required
                        pattern="[6-9][0-9]{9}" title="Please enter valid 10-digit mobile number">
                    </div>

                    <h2>Receiver Information</h2>
                    <div class="form-group">
                        <label for="receiver-name">Name:</label>
                        <input type="text" id="receiver-name" name="receiver-name" required>
                      
                    </div>
                    </div>
                    <div class="form-group">
                        <label for="receiver-address">Address:</label>
                        <textarea id="receiver-address" name="receiver-address" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="receiver-pincode">Pin Code:</label>
                        <input type="text" id="receiver-pincode" name="receiver-pincode" required
                          pattern="[0-9]{6}" title="Please enter valid 6-digit pincode">
                    </div>
                    <div class="form-group">
                        <label for="receiver-contact">Contact:</label>
                        <input type="tel" id="receiver-contact" name="receiver-contact" required pattern="[6-9][0-9]{9}" title="Please enter valid 10-digit mobile number">
                    </div>

                    <h2>Parcel Details</h2>
                    <div class="form-group">
                        <label for="parcel-size">Size:</label>
                        <select id="parcel-size" name="parcel-size" required>
                            <option value="small">Small</option>
                            <option value="medium">Medium</option>
                            <option value="large">Large</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="parcel-weight">Weight (gms):</label>
                        <input type="number" id="parcel-weight" name="parcel-weight" required min="0.1" step="0.1">
                    </div>
                    <div class="form-group">
                        <label for="parcel-contents">Contents Description:</label>
                        <textarea id="parcel-contents" name="parcel-contents" required></textarea>
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
                    <button type="submit" class="btn bth:hover">Book Service</button>
                </form>
            </div>
        </div>
    </div>
    <script src="main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const now = new Date();
            now.setHours(now.getHours() + 1);
            document.getElementById('pickup-time').min = now.toISOString().slice(0, 16);

            document.getElementById('officer-booking-form').addEventListener('submit', function(e) {
                e.preventDefault();

                const senderContact = document.getElementById('sender-contact').value;
                const receiverContact = document.getElementById('receiver-contact').value;

                if (!validateMobile(senderContact) || !validateMobile(receiverContact)) {
                    alert('Invalid contact number. Must start with 6-9 and be 10 digits long.');
                    return;
                }

                const pickupTime = new Date(document.getElementById('pickup-time').value);
                const currentTime = new Date();
                const timeDifference = (pickupTime - currentTime) / (1000 * 60 * 60); // difference in hours

                if (timeDifference < 1) {
                    alert('Pickup time must be at least 1 hour from the current time.');
                    return;
                }

             

               // this.reset();
            });
        });

       
        
    </script>
    
<jsp:include page="footer.jsp" />
</body>
</html>

    