// Auto year update
document.getElementById('year').textContent = new Date().getFullYear();

// Scroll animation
const animateElements = document.querySelectorAll('.animate-on-scroll');
const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if(entry.isIntersecting){
            entry.target.classList.add('active');
        }
    });
}, { threshold: 0.2 });

animateElements.forEach(el => observer.observe(el));

// --- QR Code for pitching ---
function showQRIfPitch() {
    const urlParams = new URLSearchParams(window.location.search);
    const isPitch = urlParams.get('pitch');
    if(isPitch === 'true'){
        document.getElementById('qrSection').style.display = 'block';
    }
}

// Run the function
showQRIfPitch();
