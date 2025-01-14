<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Previous Bookings - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>All Previous Bookings</h1>
                <form id="search-form">
                    <div class="form-group">
                        <label for="search-customer-id">Search by Customer ID:</label>
                        <input type="text" id="search-customer-id" name="search-customer-id">
                    </div>
                    <div class="form-group">
                        <label for="start-date">Start Date:</label>
                        <input type="date" id="start-date" name="start-date">
                    </div>
                    <div class="form-group">
                        <label for="end-date">End Date:</label>
                        <input type="date" id="end-date" name="end-date">
                    </div>
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
                <table id="bookings-table" class="table">
                    <thead>
                        <tr>
                            <th>Customer ID</th>
                            <th>Booking ID</th>
                            <th>Booking Date</th>
                            <th>Sender Name</th>
                            <th>Sender Contact</th>
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
    <script src="main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const bookingsTable = document.getElementById('bookings-table').getElementsByTagName('tbody')[0];
            const prevPageBtn = document.getElementById('prev-page');
            const nextPageBtn = document.getElementById('next-page');
            const pageInfo = document.getElementById('page-info');
            const searchForm = document.getElementById('search-form');

            const itemsPerPage = 10;
            let currentPage = 1;
            let filteredBookings = [];

            function displayBookings(page) {
                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;
                const pageBookings = filteredBookings.slice(startIndex, endIndex);

                bookingsTable.innerHTML = '';
                pageBookings.forEach(booking => {
                    const row = bookingsTable.insertRow();
                    row.innerHTML = `
                        <td>${booking.customerId || booking.senderId || 'N/A'}</td>
                        <td>${booking.bookingId}</td>
                        <td>${new Date(booking.pickupTime).toLocaleDateString()}</td>
                        <td>${booking.senderName || 'N/A'}</td>
                        <td>${booking.senderContact || 'N/A'}</td>
                        <td>${booking.receiverName}</td>
                        <td>${booking.receiverAddress}</td>
                        <td>₹${(Math.random() * 100 + 5000).toFixed(2)}</td>
                        <td>${booking.status}</td>
                    `;
                });

                pageInfo.textContent = `Page ${page} of ${Math.ceil(filteredBookings.length / itemsPerPage)}`;
                prevPageBtn.disabled = page === 1;
                nextPageBtn.disabled = endIndex >= filteredBookings.length;
            }

            searchForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const customerId = document.getElementById('search-customer-id').value;
                const startDate = document.getElementById('start-date').value;
                const endDate = document.getElementById('end-date').value;

                const bookings = JSON.parse(localStorage.getItem('bookings')) || [];
                filteredBookings = bookings.filter(booking => {
                    const bookingDate = new Date(booking.pickupTime);
                    return (
                        (!customerId || booking.customerId === customerId || booking.senderId === customerId) &&
                        (!startDate || bookingDate >= new Date(startDate)) &&
                        (!endDate || bookingDate <= new Date(endDate))
                    );
                });

                currentPage = 1;
                displayBookings(currentPage);
            });

            prevPageBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    displayBookings(currentPage);
                }
            });

            nextPageBtn.addEventListener('click', () => {
                if (currentPage < Math.ceil(filteredBookings.length / itemsPerPage)) {
                    currentPage++;
                    displayBookings(currentPage);
                }
            });

          
            displayBookings(currentPage);
        });
    </script>
</body>
</html>

    