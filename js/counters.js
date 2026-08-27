/* =========================================================================
   N VoaWu — counters.js
   rAF count-up for "By the numbers" stats
   ========================================================================= */

(function () {
  'use strict';

  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const $  = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));

  function format(value, target) {
    // Keep human-friendly suffixes like M+, k, +.
    if (target >= 1_000_000) {
      const m = value / 1_000_000;
      return (m % 1 === 0 ? m.toFixed(0) : m.toFixed(1)) + 'M';
    }
    if (target >= 1_000) {
      return Math.round(value).toLocaleString('en-US');
    }
    return Math.round(value).toString();
  }

  function countUp(el) {
    const target = parseInt(el.dataset.target, 10) || 0;
    const suffix = el.dataset.suffix || '';
    const duration = parseInt(el.dataset.duration, 10) || 1600;
    const start = performance.now();
    const ease = t => 1 - Math.pow(1 - t, 3); // easeOutCubic

    const step = now => {
      const elapsed = now - start;
      const t = Math.min(1, elapsed / duration);
      const value = target * ease(t);
      el.firstChild && el.firstChild.remove && el.firstChild.remove();
      el.textContent = format(value, target) + suffix;
      if (t < 1) requestAnimationFrame(step);
      else el.textContent = format(target, target) + suffix;
    };

    requestAnimationFrame(step);
  }

  function init() {
    const stats = $$('.stat__value[data-target]');
    if (!stats.length) return;

    if (prefersReduced) {
      stats.forEach(el => {
        const target = parseInt(el.dataset.target, 10) || 0;
        el.textContent = format(target, target) + (el.dataset.suffix || '');
      });
      return;
    }

    if (!('IntersectionObserver' in window)) {
      stats.forEach(countUp);
      return;
    }

    const obs = new IntersectionObserver(
      entries => {
        entries.forEach(entry => {
          if (!entry.isIntersecting) return;
          countUp(entry.target);
          obs.unobserve(entry.target);
        });
      },
      { threshold: 0.4 }
    );

    stats.forEach(el => obs.observe(el));
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
