/* =========================================================================
   N VoaWu — hero.js
   Hero parallax (mouse-move on .parallax) + animated SVG stroke drawings
   ========================================================================= */

(function () {
  'use strict';

  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (prefersReduced) return;

  const $  = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));

  /* ------------------------------------------------------------------
     Mouse-move parallax (subtle)
     ------------------------------------------------------------------ */
  function initParallax() {
    const stage = $('.hero__art-frame');
    if (!stage) return;
    const layers = $$('.parallax', stage);
    if (!layers.length) return;

    let rect = stage.getBoundingClientRect();
    let ticking = false;

    const update = (mx, my) => {
      const cx = rect.left + rect.width / 2;
      const cy = rect.top + rect.height / 2;
      const dx = (mx - cx) / rect.width;
      const dy = (my - cy) / rect.height;
      layers.forEach((layer, i) => {
        const depth = parseFloat(layer.dataset.depth || (1 + i * 0.4)) || 1;
        const tx = Math.max(-12, Math.min(12, -dx * 18 * depth));
        const ty = Math.max(-12, Math.min(12, -dy * 18 * depth));
        layer.style.setProperty('--parallax-x', `${tx.toFixed(2)}px`);
        layer.style.setProperty('--parallax-y', `${ty.toFixed(2)}px`);
      });
    };

    const onMove = e => {
      if (ticking) return;
      ticking = true;
      requestAnimationFrame(() => {
        update(e.clientX, e.clientY);
        ticking = false;
      });
    };

    const onLeave = () => {
      layers.forEach(layer => {
        layer.style.setProperty('--parallax-x', '0px');
        layer.style.setProperty('--parallax-y', '0px');
      });
    };

    const onResize = () => { rect = stage.getBoundingClientRect(); };

    window.addEventListener('mousemove', onMove, { passive: true });
    window.addEventListener('scroll', onResize, { passive: true });
    window.addEventListener('resize', onResize);
    stage.addEventListener('mouseleave', onLeave);
  }

  /* ------------------------------------------------------------------
     Animated SVG strokes (path draw)
     ------------------------------------------------------------------ */
  function initStrokeAnim() {
    const targets = $$('.stroke-anim');
    if (!targets.length || !('IntersectionObserver' in window)) {
      targets.forEach(t => t.classList.add('is-visible'));
      return;
    }
    const obs = new IntersectionObserver(
      entries => {
        entries.forEach(entry => {
          if (!entry.isIntersecting) return;
          const root = entry.target;
          const elements = root.matches('path, line, circle, rect, polyline') ? [root] : $$('path, line, circle, rect, polyline', root);
          elements.forEach((el, i) => {
            try {
              const len = (el.getTotalLength && el.getTotalLength()) || 1000;
              el.style.setProperty('--stroke-len', len.toFixed(0));
              el.style.strokeDasharray = len.toFixed(0);
              el.style.strokeDashoffset = len.toFixed(0);
              el.style.transition = `stroke-dashoffset 1.4s cubic-bezier(0.2, 0, 0, 1) ${i * 60}ms`;
              requestAnimationFrame(() => {
                el.style.strokeDashoffset = '0';
              });
            } catch (_) { /* element not measurable, skip */ }
          });
          obs.unobserve(root);
        });
      },
      { threshold: 0.3 }
    );
    targets.forEach(t => obs.observe(t));
  }

  /* ------------------------------------------------------------------
     Boot
     ------------------------------------------------------------------ */
  function boot() {
    initParallax();
    initStrokeAnim();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else {
    boot();
  }
})();
