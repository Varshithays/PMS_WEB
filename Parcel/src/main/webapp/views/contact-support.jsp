<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Support - Parcel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar"></div>
        <div class="main-content">
            <div class="container">
                <h1>Contact Support</h1>
                <div class="support-info">
                    <h2>Customer Support Details</h2>
                    <p><strong>Contact Number:</strong> +91 8901825611</p>
                    <p><strong>Email:</strong> support@parcelmanagementsystem.com</p>
                    <p><strong>Address:</strong> 123 Parcel Street, Shipping City, SC 12345</p>
                </div>
                <div class="support-form">
                    <h2>Send us a message</h2>
                    <form id="support-form">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="subject">Subject:</label>
                            <input type="text" id="subject" name="subject" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message:</label>
                            <textarea id="message" name="message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            updateNavigation();
            document.getElementById('support-form').addEventListener('submit', function(e) {
                e.preventDefault();
                alert('Your message has been sent. We will get back to you soon.');
                this.reset();
            });
        });
    </script>
</body>
</html>