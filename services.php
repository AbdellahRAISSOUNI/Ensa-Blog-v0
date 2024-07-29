<?php
include 'partials/header.php';

?>

<section class="services-page">
  <div class="container">
    <h1 class="services-title">Our Services</h1>
    
    <div class="services-grid">
      <div class="service-card">
        <div class="card-content">
          <div class="icon-container">
            <i class="fas fa-graduation-cap"></i>
          </div>
          <h2>Academic Resources</h2>
          <p>Access a wealth of study materials, lecture notes, and academic guides tailored for ENSA students.</p>
        </div>
      </div>
      
      <div class="service-card">
        <div class="card-content">
          <div class="icon-container">
            <i class="fas fa-users"></i>
          </div>
          <h2>Community Engagement</h2>
          <p>Connect with fellow ENSA students, share experiences, and collaborate on projects in our vibrant community.</p>
        </div>
      </div>
      
      <div class="service-card">
        <div class="card-content">
          <div class="icon-container">
            <i class="fas fa-laptop-code"></i>
          </div>
          <h2>Tech Insights</h2>
          <p>Stay updated with the latest trends in technology and engineering through our curated articles and resources.</p>
        </div>
      </div>
      
      <div class="service-card">
        <div class="card-content">
          <div class="icon-container">
            <i class="fas fa-project-diagram"></i>
          </div>
          <h2>Project Showcase</h2>
          <p>Showcase your projects, gain visibility, and learn from innovative work done by other ENSA students.</p>
        </div>
      </div>
    </div>
    
    <div class="cta-section">
      <h2>Ready to Elevate Your Academic Journey?</h2>
      <p>Join Ensa - Blog and unlock a world of opportunities in applied sciences.</p>
      <a href="<?= ROOT_URL ?>contact.php" class="cta-button">Get Started</a>
    </div>
  </div>
</section>


    <?php

include 'partials/footer.php';

?>