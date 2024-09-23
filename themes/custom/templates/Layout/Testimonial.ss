<div class="layout-container">
    <div class="content-left">
        <div class="hero-section">
            <h3>$HeroSubhead</h3>
            <h1>$HeroHeadline</h1>
        </div>
        <div class="testimonial-container">
            <% loop $TestimonialObjects.limit(2) %>
                <div class="testimonial-box">
                    <h2>$Title</h2>
                    <p class="subtitle">$Description</p>
                    <a href="#" class="learn-more">Learn More</a>
                </div>
            <% end_loop %>
        </div>
    </div>
    <div class="content-right">
        <div class="image-stack">
            <img src="assets/images/e1.png" alt="E1 Image" class="right-image">
            <% with $RandomHeroImage %> <!-- Use 'first' to confirm if Random is not working -->
                <% if $Image.Exists %>
                    <img src="$Image.URL" alt="image" class="hero-image">
                <% else %>
                    <p>First image is not available.</p>
                <% end_if %>
            <% end_with %>
        </div>
    </div>
</div>
<div class="quote-section">
    <% loop $QuoteObjects %>
        <div class="quote-box">
            <img src="assets/images/quote_mark.png" alt="Quote Mark" class="quote-image">
            <p class="quote-content">$Content</p>
            <p class="quote-name">$Name</p>
        </div>
    <% end_loop %>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const quotes = document.querySelectorAll('.quote-box');
    let currentIndex = 0;

    function showQuote(index) {
        quotes.forEach((quote, i) => {
            quote.classList.remove('active');
            if (i === index) {
                quote.classList.add('active');
            }
        });
    }

    function nextQuote() {
        currentIndex = (currentIndex + 1) % quotes.length; // Loop back to start
        showQuote(currentIndex);
    }

    showQuote(currentIndex); // Show the first quote initially
    setInterval(nextQuote, 3000); // Change quotes every 3 seconds
});
</script>