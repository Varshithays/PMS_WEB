<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Home - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
         
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>Welcome, Officer</h1>
                <p class="mb-4">Manage parcel services and track shipments from here.</p>
                
                <div class="dashboard-summary">
                    <div class="summary-card">
                        <h3><i class="fas fa-box"></i> Pending Pickups</h3>
                        <p id="pending-pickups">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-truck"></i> In Transit</h3>
                        <p id="in-transit">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-check-circle"></i> Delivered Today</h3>
                        <p id="delivered-today">Loading...</p>
                    </div>
                    <div class="summary-card">
                        <h3><i class="fas fa-exclamation-triangle"></i> Issues Reported</h3>
                        <p id="issues-reported">Loading...</p>
                    </div>
                </div>

                <h2>Recent Activity</h2>
                <table id="recent-activity" class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer ID</th>
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
    <script src="script.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            updateNavigation();
            loadOfficerDashboardData();
        });

        function loadOfficerDashboardData() {
            // Simulating data loading
            setTimeout(() => {
                document.getElementById('pending-pickups').textContent = '5';
                document.getElementById('in-transit').textContent = '12';
                document.getElementById('delivered-today').textContent = '8';
                document.getElementById('issues-reported').textContent = '2';

                const recentActivity = [
                    { id: 'B001', customerId: 'C001', date: '2023-05-01', status: 'Delivered' },
                    { id: 'B002', customerId: 'C002', date: '2023-05-03', status: 'In Transit' },
                    { id: 'B003', customerId: 'C003', date: '2023-05-05', status: 'Pending Pickup' },
                    { id: 'B004', customerId: 'C004', date: '2023-05-06', status: 'Issue Reported' },
                ];

                const activityTable = document.getElementById('recent-activity').getElementsByTagName('tbody')[0];
                recentActivity.forEach(activity => {
                    const row = activityTable.insertRow();
                    row.innerHTML = `
                        <td>${activity.id}</td>
                        <td>${activity.customerId}</td>
                        <td>${activity.date}</td>
                        <td>${activity.status}</td>
                        <td>
                            <a href="tracking.html?id=${activity.id}" class="btn btn-primary btn-sm">Track</a>
                            <a href="delivery-status.html?id=${activity.id}" class="btn btn-secondary btn-sm">Update</a>
                        </td>
                    `;
                });
            }, 1000);
        }
    </script>
</body>
</html>

