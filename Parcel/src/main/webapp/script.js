let currentUserType = 'customer'; // Default user type
   document.addEventListener('DOMContentLoaded', function() {
       const customerTab = document.getElementById('customerTab');
       const officerTab = document.getElementById('officerTab');
       const userTypeInput = document.getElementById('userType');
       const registerLink = document.getElementById('registerLink');

       customerTab.addEventListener('click', () => switchTab('customer'));
       officerTab.addEventListener('click', () => switchTab('officer'));


       function switchTab(userType) {
           
           customerTab.classList.toggle('active', userType === 'customer');
           officerTab.classList.toggle('active', userType === 'officer');

          
           userTypeInput.value = userType;

         
           registerLink.style.display = userType === 'customer' ? 'block' : 'none';
       }
   });
 
   // For Validations
   function validateUsername(username) {
     return username.length >= 5 && username.length <= 20;
   }

   function validatePassword(password) {
     const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,30})/;
     return regex.test(password);
   }

   function validateEmail(email) {
     const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
     return regex.test(email);
   }

   function validateMobile(mobile) {
     const regex = /^[6-9]\d{9}$/;
     return regex.test(mobile);
   }

   //this for generating booking id based on timestamp(current time) and random number
   function generateBookingId() {
     const timestamp = Date.now().toString().slice(-10);
     const random = Math.floor(Math.random() * 100).toString().padStart(2, '0');
     return timestamp + random;
   }

   // this for generating customer id based on name and mobile
   function generateCustomerId(name, mobile) {
     const namePrefix = name.replace(/\s+/g, '').slice(0, 3).toUpperCase();
     const mobileSuffix = mobile.slice(-3);
     return namePrefix + mobileSuffix;
   }

   // Redirecting 
   if (!isLoggedIn() && !window.location.href.includes('login.html') && !window.location.href.includes('register.html')) {
     window.location.href = 'login.html';
   }

   document.addEventListener('DOMContentLoaded', updateNavigation);

   function updateNavigation() {
       const userType = document.getElementById('userType').value;
       const sidebar = document.getElementById('sidebar');
       if (userType === 'customer') {
           sidebar.innerHTML += `
               <a href="customer-home.jsp"><i class="fas fa-home"></i> Home</a>
               <a href="booking-service.jsp"><i class="fas fa-box"></i> Book Service</a>
               <a href="tracking.jsp"><i class="fas fa-search"></i> Track Parcel</a>
               <a href="customer-previous-bookings.jsp"><i class="fas fa-history"></i> Previous Bookings</a>
               <a href="contact-support.jsp"><i class="fas fa-headset"></i> Contact Support</a>
           `;
       } else if (userType === 'officer') {
           sidebar.innerHTML += `
               <a href="officer-home.jsp"><i class="fas fa-home"></i> Home</a>
               <a href="officer-booking.jsp"><i class="fas fa-box"></i> Book Service</a>
               <a href="tracking.jsp"><i class="fas fa-search"></i> Tracking</a>
               <a href="delivery-status.jsp"><i class="fas fa-truck"></i> Update Status</a>
               <a href="officer-previous-bookings.jsp"><i class="fas fa-history"></i> View Bookings</a>
               <a href="pickup-scheduling.jsp"><i class="fas fa-calendar-alt"></i> Schedule Pickup</a>
           `;
       }
       sidebar.innerHTML += `<a href="login.jsp" id="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>`;
       document.getElementById('logout-btn').addEventListener('click', logout);
   }

   
   document.getElementById('loginForm').addEventListener('submit', (e) => {
       e.preventDefault();
       const username = document.getElementById('username').value.trim();
       const password = document.getElementById('password').value;

       if (!validateUsername(username)) {
           alert('Invalid username. Must be between 5 and 20 characters.');
           return;
       }

       if (!validatePassword(password)) {
           alert('Invalid password. Must be between 8 and 30 characters, and contain at least one uppercase letter, one lowercase letter, and one special character.');
           return;
       }

       const button = document.getElementById('loginButton');
       button.disabled = true;
       button.textContent = 'Logging in...';

       if (currentUserType === 'officer') {
           const officer = officerCredentials.find(cred => cred.username === username && cred.password === password);
           if (officer) {
               login(username, 'officer');
               window.location.href = 'officer-home.jsp';
           } else {
               alert('Invalid officer credentials.');
               resetLoginButton(button);
           }
       } else {
           setTimeout(() => {
               login(username, 'customer');
               window.location.href = 'customer-home.jsp';
           }, 1000);
       }
   });

   function resetLoginButton(button) {
       button.disabled = false;
       button.textContent = 'Login';
   }
   const user = sessionStorage.getItem('user');
   if (user) {
       const userObj = JSON.parse(user);
       window.location.href = userObj.role === 'officer' ? 'officer-home.html' : 'customer-home.html';
   }

