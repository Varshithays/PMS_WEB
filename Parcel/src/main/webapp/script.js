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

