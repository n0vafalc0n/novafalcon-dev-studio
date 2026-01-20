// Scroll-based animations
const animatedElements = document.querySelectorAll('.animate-on-scroll');

const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('show');
        }
    });
}, { threshold: 0.3 });

animatedElements.forEach(el => observer.observe(el));

// Auto-update copyright year
document.getElementById("year").textContent = new Date().getFullYear();
