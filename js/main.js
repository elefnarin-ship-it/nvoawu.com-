/* =========================================================================
   N VoaWu — main.js
   Header behavior, mobile nav, smooth scroll, IntersectionObserver reveals,
   magnetic buttons, cookie banner, form validation.
   ========================================================================= */

(function () {
  'use strict';

  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const $  = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));

  /* ------------------------------------------------------------------
     Header: scrolled state + on-dark detection
     ------------------------------------------------------------------ */
  function initHeader() {
    const header = $('.site-header');
    if (!header) return;

    const setScrolled = () => {
      if (window.scrollY > 8) header.classList.add('is-scrolled');
      else header.classList.remove('is-scrolled');
    };
    setScrolled();
    window.addEventListener('scroll', setScrolled, { passive: true });

    // On-dark detection: any ancestor with .section--dark or .section--gradient
    // whose top is within the header band
    const darkSections = $$('.section--dark, .section--gradient, .page-hero, .hero, .legal__hero, .notfound');
    if (darkSections.length && 'IntersectionObserver' in window) {
      const obs = new IntersectionObserver(
        entries => {
          const onDark = entries.some(e => e.isIntersecting && e.intersectionRatio > 0);
          header.classList.toggle('is-on-dark', onDark);
        },
        { rootMargin: `-${parseInt(getComputedStyle(document.documentElement).getPropertyValue('--header-h')) || 72}px 0px -50% 0px`, threshold: [0, 0.1] }
      );
      darkSections.forEach(s => obs.observe(s));
    } else {
      header.classList.add('is-on-dark');
    }
  }

  /* ------------------------------------------------------------------
     Mobile nav
     ------------------------------------------------------------------ */
  function initMobileNav() {
    const toggle = $('.nav__toggle');
    const list   = $('.nav__list');
    if (!toggle || !list) return;

    const closeMenu = () => {
      list.classList.remove('is-open');
      toggle.setAttribute('aria-expanded', 'false');
      document.body.style.overflow = '';
    };

    toggle.addEventListener('click', () => {
      const open = list.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
      document.body.style.overflow = open ? 'hidden' : '';
    });

    list.addEventListener('click', e => {
      if (e.target.closest('a')) closeMenu();
    });

    // Close on resize back to desktop
    window.addEventListener('resize', () => {
      if (window.innerWidth > 880) closeMenu();
    });

    // Close on Escape
    document.addEventListener('keydown', e => {
      if (e.key === 'Escape') closeMenu();
    });
  }

  /* ------------------------------------------------------------------
     Smooth scroll for in-page anchors
     ------------------------------------------------------------------ */
  function initSmoothScroll() {
    document.addEventListener('click', e => {
      const link = e.target.closest('a[href^="#"]');
      if (!link) return;
      const href = link.getAttribute('href');
      if (!href || href === '#') return;
      const target = document.querySelector(href);
      if (!target) return;
      e.preventDefault();
      const headerH = parseInt(getComputedStyle(document.documentElement).getPropertyValue('--header-h')) || 72;
      const top = target.getBoundingClientRect().top + window.scrollY - headerH - 12;
      window.scrollTo({
        top,
        behavior: prefersReduced ? 'auto' : 'smooth'
      });
    });
  }

  /* ------------------------------------------------------------------
     IntersectionObserver scroll reveals
     ------------------------------------------------------------------ */
  function initReveals() {
    if (!('IntersectionObserver' in window)) {
      $$('.reveal, .stagger, .stroke-anim').forEach(el => el.classList.add('is-visible'));
      return;
    }
    const obs = new IntersectionObserver(
      entries => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            obs.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
    );
    $$('.reveal, .stagger, .stroke-anim').forEach(el => obs.observe(el));
  }

  /* ------------------------------------------------------------------
     Magnetic buttons
     ------------------------------------------------------------------ */
  function initMagneticButtons() {
    if (prefersReduced) return;
    const magnets = $$('.btn--magnetic');
    magnets.forEach(btn => {
      const strength = 0.18;
      const radius = 80;
      btn.addEventListener('mousemove', e => {
        const rect = btn.getBoundingClientRect();
        const x = e.clientX - rect.left - rect.width / 2;
        const y = e.clientY - rect.top - rect.height / 2;
        if (Math.hypot(x, y) > radius) return;
        btn.style.transform = `translate(${x * strength}px, ${y * strength}px) translateY(-2px)`;
      });
      btn.addEventListener('mouseleave', () => {
        btn.style.transform = '';
      });
    });
  }

  /* ------------------------------------------------------------------
     Cookie consent
     ------------------------------------------------------------------ */
  const COOKIE_KEY = 'nvw_consent_v1';

  function initCookieBanner() {
    const banner = $('.cookie-banner');
    if (!banner) return;

    const stored = (() => {
      try { return localStorage.getItem(COOKIE_KEY); } catch (_) { return null; }
    })();
    if (stored) return;

    // Show after a small delay so the page settles
    setTimeout(() => banner.classList.add('is-visible'), 1200);

    const accept = banner.querySelector('[data-cookie-accept]');
    const decline = banner.querySelector('[data-cookie-decline]');
    const close = banner.querySelector('[data-cookie-close]');

    const set = value => {
      try { localStorage.setItem(COOKIE_KEY, value); } catch (_) { /* noop */ }
      banner.classList.remove('is-visible');
    };

    if (accept)  accept.addEventListener('click',  () => set('accepted'));
    if (decline) decline.addEventListener('click', () => set('declined'));
    if (close)   close.addEventListener('click',   () => set('dismissed'));
  }

  /* Open cookie banner programmatically (from footer link) */
  function initCookieTrigger() {
    const triggers = $$('[data-cookie-open]');
    if (!triggers.length) return;
    triggers.forEach(t => t.addEventListener('click', e => {
      e.preventDefault();
      const banner = $('.cookie-banner');
      if (banner) banner.classList.add('is-visible');
    }));
  }

  /* ------------------------------------------------------------------
     Form validation (Contact form)
     ------------------------------------------------------------------ */
  function initContactForm() {
    const form = $('#contact-form');
    if (!form) return;

    const status = form.querySelector('.form__status');
    const submit = form.querySelector('button[type="submit"]');

    const setStatus = (msg, ok) => {
      if (!status) return;
      status.textContent = msg;
      status.classList.toggle('is-error', !ok);
      status.classList.add('is-visible');
    };

    const validate = () => {
      const required = $$('[required]', form);
      let ok = true;
      required.forEach(field => {
        const error = field.closest('.field')?.querySelector('.field__error');
        if (!field.checkValidity() || (field.type === 'checkbox' && !field.checked)) {
          ok = false;
          if (error) error.textContent = field.validationMessage || 'Please complete this field.';
          field.setAttribute('aria-invalid', 'true');
        } else {
          if (error) error.textContent = '';
          field.removeAttribute('aria-invalid');
        }
      });
      return ok;
    };

    form.addEventListener('input', e => {
      const field = e.target;
      if (!field.closest('.field')) return;
      const error = field.closest('.field').querySelector('.field__error');
      if (field.checkValidity()) {
        if (error) error.textContent = '';
        field.removeAttribute('aria-invalid');
      }
    });

    form.addEventListener('submit', e => {
      e.preventDefault();
      if (!validate()) {
        setStatus('Please fix the highlighted fields and try again.', false);
        return;
      }
      setStatus('Thanks — your message is ready. Opening your email client…', true);
      submit.disabled = true;
      submit.setAttribute('aria-busy', 'true');

      // Build a mailto fallback
      const data = new FormData(form);
      const subject = `N VoaWu inquiry — ${data.get('projectType') || 'Project'}`;
      const body = [
        `Name: ${data.get('name')}`,
        `Email: ${data.get('email')}`,
        `Company: ${data.get('company') || '—'}`,
        `Project type: ${data.get('projectType') || '—'}`,
        `Budget: ${data.get('budget') || '—'}`,
        `Target launch: ${data.get('timeline') || '—'}`,
        '',
        'Project description:',
        data.get('description') || ''
      ].join('\n');

      const mailto = `mailto:elefnarin@gmail.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
      // Open mail client in a new tab to avoid leaving the page
      window.location.href = mailto;

      setTimeout(() => {
        submit.disabled = false;
        submit.removeAttribute('aria-busy');
        setStatus('Thanks — we typically respond within two business days.', true);
        form.reset();
      }, 1200);
    });
  }

  /* ------------------------------------------------------------------
     Newsletter form
     ------------------------------------------------------------------ */
  function initNewsletter() {
    const form = $('#newsletter-form');
    if (!form) return;
    const status = form.querySelector('.cta-card__status');
    form.addEventListener('submit', e => {
      e.preventDefault();
      const email = form.querySelector('input[type="email"]');
      if (!email || !email.checkValidity()) return;
      if (status) {
        status.textContent = `Thanks — we'll send the next issue to ${email.value}.`;
        status.style.display = 'block';
      }
      form.reset();
    });
  }

  /* ------------------------------------------------------------------
     Theme auto-toggle for `prefers-color-scheme` (placeholder hook)
     ------------------------------------------------------------------ */
  function initTheme() {
    // No dark-mode toggle in v1; hook reserved for future.
  }

  /* ------------------------------------------------------------------
     Boot
     ------------------------------------------------------------------ */
  function boot() {
    initHeader();
    initMobileNav();
    initSmoothScroll();
    initReveals();
    initMagneticButtons();
    initCookieBanner();
    initCookieTrigger();
    initContactForm();
    initNewsletter();
    initTheme();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else {
    boot();
  }
})();
