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