<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home - Parcel Management System</title>
       <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>Welcome to Your Dashboard</h1>
                <p class="mb-4">Here you can manage your parcels and track your shipments.</p>
                
                <div class="dashboard-summary">
                    <div class="summary-card">
                        <h3><i class="fas fa-box"></i> Active Shipments</h3>
                        <p id="active-shipments">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-history"></i> Total Bookings</h3>
                        <p id="total-bookings">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-truck"></i> Delivered Parcels</h3>
                        <p id="delivered-parcels">Loading...</p>
                    </div>
                </div>

                <h2>Recent Activity</h2>
                <table id="recent-activity" class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Recent activity will be populated here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/script.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            updateNavigation();
            loadDashboardData();
        });

        function loadDashboardData() {
            // Simulating data loading
            setTimeout(() => {
                document.getElementById('active-shipments').textContent = '3';
                document.getElementById('total-bookings').textContent = '12';
                document.getElementById('delivered-parcels').textContent = '8';

                const recentActivity = [
                    { id: 'B001', date: '2023-05-01', status: 'Delivered' },
                    { id: 'B002', date: '2023-05-03', status: 'In Transit' },
                    { id: 'B003', date: '2023-05-05', status: 'Booked' },
                ];

                const activityTable = document.getElementById('recent-activity').getElementsByTagName('tbody')[0];
                recentActivity.forEach(activity => {
                    const row = activityTable.insertRow();
                    row.innerHTML = `
                        <td>${activity.id}</td>
                        <td>${activity.date}</td>
                        <td>${activity.status}</td>
                        <td><a href="tracking.html?id=${activity.id}" class="btn btn-primary btn-sm">Track</a></td>
                    `;
                });
            }, 1000);
        }
    </script>
</body>
</html>