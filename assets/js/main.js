/**
* Template Name: DevFolio - v4.10.0
* Template URL: https://bootstrapmade.com/devfolio-bootstrap-portfolio-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*
* Customised for PSFolio (pswork.in). Every vendor plugin below is optional:
* product pages only load Bootstrap, so each init is guarded.
*/
(function() {
  "use strict";

  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    let selectEl = select(el, all)
    if (selectEl) {
      if (all) {
        selectEl.forEach(e => e.addEventListener(type, listener))
      } else {
        selectEl.addEventListener(type, listener)
      }
    }
  }

  /**
   * Easy on scroll event listener
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener, { passive: true })
  }

  const prefersReducedMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches

  /**
   * Navbar links active state on scroll
   */
  let navbarlinks = select('#navbar .scrollto', true)
  const navbarlinksActive = () => {
    let position = window.scrollY + 200
    navbarlinks.forEach(navbarlink => {
      if (!navbarlink.hash) return
      let section = select(navbarlink.hash)
      if (!section) return
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        navbarlink.classList.add('active')
      } else {
        navbarlink.classList.remove('active')
      }
    })
  }
  window.addEventListener('load', navbarlinksActive)
  onscroll(document, navbarlinksActive)

  /**
   * Scrolls to an element with header offset
   */
  const scrollto = (el) => {
    let header = select('#header')
    let offset = header ? header.offsetHeight : 0

    if (header && !header.classList.contains('header-scrolled')) {
      offset -= 16
    }

    let target = select(el)
    if (!target) return
    let elementPos = target.offsetTop
    window.scrollTo({
      top: elementPos - offset,
      behavior: prefersReducedMotion ? 'auto' : 'smooth'
    })
  }

  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
      } else {
        selectHeader.classList.remove('header-scrolled')
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }

  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
    backtotop.addEventListener('click', (e) => {
      e.preventDefault()
      window.scrollTo({ top: 0, behavior: prefersReducedMotion ? 'auto' : 'smooth' })
    })
  }

  /**
   * Mobile nav toggle
   */
  const closeMobileNav = () => {
    let navbar = select('#navbar')
    let header = select('#header')
    let navbarToggle = select('.mobile-nav-toggle')
    if (!navbar || !navbar.classList.contains('navbar-mobile')) return
    navbar.classList.remove('navbar-mobile')
    if (navbarToggle) {
      navbarToggle.classList.add('bi-list')
      navbarToggle.classList.remove('bi-x')
    }
    if (header) {
      header.style.backdropFilter = ''
      header.style.webkitBackdropFilter = ''
    }
    document.body.style.overflow = ''
  }

  on('click', '.mobile-nav-toggle', function(e) {
    let navbar = select('#navbar')
    let header = select('#header')
    navbar.classList.toggle('navbar-mobile')
    this.classList.toggle('bi-list')
    this.classList.toggle('bi-x')
    // Remove backdrop-filter when mobile nav is open so position:fixed works correctly
    if (navbar.classList.contains('navbar-mobile')) {
      header.style.backdropFilter = 'none'
      header.style.webkitBackdropFilter = 'none'
      document.body.style.overflow = 'hidden'
    } else {
      header.style.backdropFilter = ''
      header.style.webkitBackdropFilter = ''
      document.body.style.overflow = ''
    }
  })

  // Close the mobile menu with Escape, or when any plain link inside it is used
  document.addEventListener('keydown', (e) => { if (e.key === 'Escape') closeMobileNav() })
  on('click', '#navbar a:not(.scrollto)', closeMobileNav, true)

  /**
   * Mobile nav dropdowns activate
   */
  on('click', '.navbar .dropdown > a', function(e) {
    if (select('#navbar').classList.contains('navbar-mobile')) {
      e.preventDefault()
      this.nextElementSibling.classList.toggle('dropdown-active')
    }
  }, true)

  /**
   * Scroll with offset on links with a class name .scrollto
   */
  on('click', '.scrollto', function(e) {
    if (select(this.hash)) {
      e.preventDefault()
      closeMobileNav()
      scrollto(this.hash)
    }
  }, true)

  /**
   * Scroll with offset on page load with hash links in the url
   */
  window.addEventListener('load', () => {
    if (window.location.hash) {
      if (select(window.location.hash)) {
        scrollto(window.location.hash)
      }
    }
  });

  /**
   * Intro type effect
   */
  const typed = select('.typed')
  if (typed && typeof Typed !== 'undefined') {
    let typed_strings = typed.getAttribute('data-typed-items')
    typed_strings = typed_strings.split(',').map(s => s.trim())
    new Typed('.typed', {
      strings: typed_strings,
      loop: true,
      typeSpeed: 100,
      backSpeed: 50,
      backDelay: 2000
    });
  } else if (typed) {
    typed.textContent = (typed.getAttribute('data-typed-items') || '').split(',')[0]
  }

  /**
   * Initiate portfolio lightbox
   */
  if (typeof GLightbox !== 'undefined' && select('.portfolio-lightbox')) {
    GLightbox({
      selector: '.portfolio-lightbox'
    });
  }

  /**
   * Testimonials slider
   */
  if (typeof Swiper !== 'undefined' && select('.testimonials-slider')) {
    new Swiper('.testimonials-slider', {
      speed: 600,
      loop: true,
      autoplay: prefersReducedMotion ? false : {
        delay: 6000,
        disableOnInteraction: false,
        pauseOnMouseEnter: true
      },
      slidesPerView: 1,
      autoHeight: true,
      grabCursor: true,
      pagination: {
        el: '.testimonials-slider .swiper-pagination',
        type: 'bullets',
        clickable: true
      },
      a11y: { enabled: true }
    });
  }

  /**
   * Portfolio details slider
   */
  if (typeof Swiper !== 'undefined' && select('.portfolio-details-slider')) {
    new Swiper('.portfolio-details-slider', {
      speed: 400,
      loop: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
      }
    });
  }

  /**
   * Preloader
   */
  let preloader = select('#preloader');
  if (preloader) {
    window.addEventListener('load', () => {
      preloader.remove()
    });
  }

  /**
   * Initiate Pure Counter
   */
  if (typeof PureCounter !== 'undefined') {
    new PureCounter();
  }

  /**
   * Footer year
   */
  select('.js-year', true).forEach(el => { el.textContent = new Date().getFullYear() })

  /**
   * Scroll Progress Bar
   */
  const createProgressBar = () => {
    const progressBar = document.createElement('div');
    progressBar.id = 'scroll-progress';
    progressBar.setAttribute('aria-hidden', 'true');
    document.body.appendChild(progressBar);
    return progressBar;
  };

  const progressBar = createProgressBar();
  let progressTicking = false;

  const updateProgressBar = () => {
    if (progressTicking) return;
    progressTicking = true;
    requestAnimationFrame(() => {
      const windowHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      const scrolled = windowHeight > 0 ? (window.scrollY / windowHeight) * 100 : 0;
      progressBar.style.width = scrolled + '%';
      progressTicking = false;
    });
  };

  window.addEventListener('scroll', updateProgressBar, { passive: true });
  window.addEventListener('resize', updateProgressBar);
  window.addEventListener('load', updateProgressBar);

  /**
   * Card Reveal Animations with Intersection Observer.
   * Uses classes (not inline styles) so CSS :hover transforms keep working after reveal.
   */
  const observeCards = () => {
    const cards = document.querySelectorAll('.bento-card, .product-card, .process-step, .faq-item');
    if (!cards.length) return;

    if (prefersReducedMotion || !('IntersectionObserver' in window)) {
      cards.forEach(card => card.classList.add('is-visible'));
      return;
    }

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.1,
      rootMargin: '0px 0px -40px 0px'
    });

    cards.forEach(card => {
      card.classList.add('reveal');
      observer.observe(card);
    });
  };

  observeCards();

  /**
   * Scroll indicator smooth scroll
   */
  const scrollIndicator = select('.scroll-indicator');
  if (scrollIndicator) {
    scrollIndicator.addEventListener('click', () => {
      if (select('#about')) scrollto('#about')
    });
  }

  /**
   * Network illuminated background animation
   */
  const initNetworkBackground = () => {
    const canvas = document.getElementById('network-canvas');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');
    let width = window.innerWidth;
    let height = window.innerHeight;

    canvas.width = width;
    canvas.height = height;

    const isSmallScreen = width < 768

    // Configuration
    const config = {
      particleCount: isSmallScreen ? 40 : 80,
      particleSpeed: 0.3,
      connectionDistance: isSmallScreen ? 120 : 150,
      particleColor: 'rgba(0, 102, 255, 0.6)',
      lineColor: 'rgba(0, 102, 255, 0.2)',
      glowColor: 'rgba(0, 102, 255, 0.8)',
      nodeRadius: 2
    };

    // Particle class
    class Particle {
      constructor() {
        this.x = Math.random() * width;
        this.y = Math.random() * height;
        this.vx = (Math.random() - 0.5) * config.particleSpeed;
        this.vy = (Math.random() - 0.5) * config.particleSpeed;
        this.radius = config.nodeRadius;
      }

      update() {
        this.x += this.vx;
        this.y += this.vy;

        // Bounce off edges
        if (this.x < 0 || this.x > width) this.vx *= -1;
        if (this.y < 0 || this.y > height) this.vy *= -1;

        // Keep within bounds
        this.x = Math.max(0, Math.min(width, this.x));
        this.y = Math.max(0, Math.min(height, this.y));
      }

      draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
        ctx.fillStyle = config.particleColor;
        ctx.fill();

        // Add glow effect
        ctx.shadowBlur = 10;
        ctx.shadowColor = config.glowColor;
        ctx.fill();
        ctx.shadowBlur = 0;
      }
    }

    // Create particles
    const particles = [];
    for (let i = 0; i < config.particleCount; i++) {
      particles.push(new Particle());
    }

    // Draw connections between nearby particles
    const drawConnections = () => {
      for (let i = 0; i < particles.length; i++) {
        for (let j = i + 1; j < particles.length; j++) {
          const dx = particles[i].x - particles[j].x;
          const dy = particles[i].y - particles[j].y;
          const distance = Math.sqrt(dx * dx + dy * dy);

          if (distance < config.connectionDistance) {
            const opacity = 1 - (distance / config.connectionDistance);
            ctx.beginPath();
            ctx.strokeStyle = `rgba(0, 102, 255, ${opacity * 0.2})`;
            ctx.lineWidth = 0.5;
            ctx.moveTo(particles[i].x, particles[i].y);
            ctx.lineTo(particles[j].x, particles[j].y);
            ctx.stroke();
          }
        }
      }
    };

    const drawFrame = () => {
      ctx.clearRect(0, 0, width, height);
      particles.forEach(particle => {
        particle.update();
        particle.draw();
      });
      drawConnections();
    };

    // Animation loop: paused when the tab is hidden or the hero is scrolled far away
    let rafId = null;
    const animate = () => {
      drawFrame();
      rafId = requestAnimationFrame(animate);
    };
    const start = () => { if (rafId === null) rafId = requestAnimationFrame(animate); };
    const stop = () => { if (rafId !== null) { cancelAnimationFrame(rafId); rafId = null; } };

    if (prefersReducedMotion) {
      drawFrame();
      return;
    }

    document.addEventListener('visibilitychange', () => {
      document.hidden ? stop() : start();
    });

    // Handle window resize
    let resizeTimer;
    window.addEventListener('resize', () => {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(() => {
        width = window.innerWidth;
        height = window.innerHeight;
        canvas.width = width;
        canvas.height = height;
        drawFrame();
      }, 150);
    });

    // Start animation
    start();
  };

  // Initialize network background on load
  window.addEventListener('load', initNetworkBackground);

})()
