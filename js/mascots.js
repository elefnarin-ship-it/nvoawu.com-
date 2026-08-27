/* =========================================================================
   N VoaWu — mascots.js
   Randomize mascot hover reactions + click wobble
   ========================================================================= */

(function () {
  'use strict';

  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const $  = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));

  const reactions = [
    'Hello! 🦊',
    'Hi there! ✨',
    'Peek-a-boo! 🐼',
    'Welcome! 🚀',
    'Glad you stopped by 🎮',
    'Stay a while 🐱',
    'Cozy vibes only 🐰',
    'Onward! 🐻',
    'You found me! 🦊',
    'All systems go 🚀',
    'Purrs and pixels 🐱',
    'Sharp and shiny 🐼'
  ];

  function init() {
    const mascots = $$('.mascot-card, .hero__art-mascot');
    if (!mascots.length) return;

    // Pre-pick a reaction per mascot so it's stable on hover
    const reaction = new Map();
    mascots.forEach((m, i) => reaction.set(m, reactions[i % reactions.length]));

    if (prefersReduced) return;

    mascots.forEach(m => {
      m.addEventListener('mouseenter', () => {
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
        const art = m.querySelector('.mascot-card__art, .hero__art-mascot svg');
        if (!art) return;
        const txt = reaction.get(m) || 'Hello! ✨';
        const bubble = document.createElement('span');
        bubble.className = 'mascot-bubble';
        bubble.textContent = txt;
        m.appendChild(bubble);
        setTimeout(() => bubble.classList.add('is-out'), 1600);
        setTimeout(() => bubble.remove(), 2200);
      });

      m.addEventListener('click', () => {
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
        m.classList.remove('is-wobble');
        // Force reflow so animation re-triggers
        void m.offsetWidth;
        m.classList.add('is-wobble');
        setTimeout(() => m.classList.remove('is-wobble'), 600);
      });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
