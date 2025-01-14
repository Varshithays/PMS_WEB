<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice - Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="sidebar"></div>
    <div class="main-content">
        <div class="container">
            <h1>Invoice</h1>
            <div id="invoice-details">
           
                    <h2>Booking ID: ${booking.bookingId}</h2>
                    <p><strong>Receiver Name:</strong> ${booking.receiverName}</p>
                    <p><strong>Receiver Address:</strong> ${booking.receiverAddress}</p>
                    <p><strong>Receiver Pin:</strong> ${booking.receiverPincode}</p>
                    <p><strong>Receiver Mobile:</strong> ${booking.receiverContact}</p>
                    <p><strong>Parcel Weight:</strong> ${booking.parcelWeight}g</p>
                    <p><strong>Parcel Contents Description:</strong> ${booking.parcelContents}</p>
                    <p><strong>Parcel Delivery Type:</strong> ${booking.deliverySpeed}</p>
                    <p><strong>Parcel Packing Preference:</strong> ${booking.packaging}</p>
                    <p><strong>Parcel Pickup Time:</strong> ${booking.pickupTime}</p>
                    <p><strong>Parcel Service Cost:</strong> ₹${booking.amount}</p>
                    <p><strong>Parcel Payment Time:</strong> ${booking.paymentTime}</p>
                </div>
            <button onclick="window.print()" class="btn btn-primary">Print Invoice</button>
        </div>
    </div>
    <script src="main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const bookingId = urlParams.get('bookingId');

            if (!bookingId) {
                alert('No booking ID provided.');
                window.location.href = 'customer-home.html';
                return;
            }

            const bookings = JSON.parse(localStorage.getItem('bookings')) || [];
            const booking = bookings.find(b => b.bookingId === bookingId);

            if (!booking) {
                alert('Booking not found.');
                window.location.href = 'customer-home.html';
                return;
            }

            const invoiceDetails = document.getElementById('invoice-details');
            invoiceDetails.innerHTML = `
                <h2>Booking ID: ${booking.bookingId}</h2>
                <p><strong>Receiver Name:</strong> ${booking.receiverName}</p>
                <p><strong>Receiver Address:</strong> ${booking.receiverAddress}</p>
                <p><strong>Receiver Pin:</strong> ${booking.receiverPincode}</p>
                <p><strong>Receiver Mobile:</strong> ${booking.receiverContact}</p>
                <p><strong>Parcel Weight:</strong> ${booking.parcelWeight}g</p>
                <p><strong>Parcel Contents Description:</strong> ${booking.parcelContents}</p>
                <p><strong>Parcel Delivery Type:</strong> ${booking.deliverySpeed}</p>
                <p><strong>Parcel Packing Preference:</strong> ${booking.packaging}</p>
                <p><strong>Parcel Pickup Time:</strong> ${new Date(booking.pickupTime).toLocaleString()}</p>
                <p><strong>Parcel Service Cost:</strong> ₹${(Math.random() * 100 + 50).toFixed(2)}</p>
                <p><strong>Parcel Payment Time:</strong> ${new Date().toLocaleString()}</p>
            `;
        });
    </script>
</body>
</html>

    