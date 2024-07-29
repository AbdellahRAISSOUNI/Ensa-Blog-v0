<?php
include 'partials/header.php';

?>


<section class="contact-page">
  <div class="container">
    <h1 class="contact-title">Contact Me</h1>
    
    <div class="contact-grid">
      <div class="contact-info">
        <div class="info-card">
          <h2>Contact Information</h2>
          <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <p>National School of Applied Sciences, Tetouan, Morocco</p>
          </div>
          <div class="info-item">
            <i class="fas fa-envelope"></i>
            <p>adellahraissouni@gmail.com</p>
          </div>
          <div class="info-item">
            <i class="fas fa-phone"></i>
            <p>+212 (mobile phone can be requested by contacting me)</p>
          </div>
          <div class="social-links">
            <a href="https://github.com/AbdellahRAISSOUNI" class="social-icon"><i class="uil uil-github"></i></a>
            <a href="https://x.com" class="social-icon"><i class="uil uil-twitter"></i></a>
            <a href="https://www.linkedin.com/in/abdellah-raissouni-1419432a8/" class="social-icon"><i class="uil uil-linkedin"></i></a>
          </div>
        </div>
      </div>
      
      <div class="contact-form">
        <div class="form-card">
          <h2>Send me a message</h2>
          <form id="contactForm" action="send_email.php" method="post">
            <div class="form-group">
              <input type="text" id="name" name="name" required>
              <label for="name">Your Name</label>
            </div>
            <div class="form-group">
              <input type="email" id="email" name="email" required>
              <label for="email">Your Email</label>
            </div>
            <div class="form-group">
              <input type="text" id="subject" name="subject" required>
              <label for="subject">Subject</label>
            </div>
            <div class="form-group">
              <textarea id="message" name="message" required></textarea>
              <label for="message">Your Message</label>
            </div>
            <button type="submit" class="submit-btn">Send Message</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <div class="shape shape-1"></div>
  <div class="shape shape-2"></div>
</section>

<?php
include 'partials/footer.php';

?>