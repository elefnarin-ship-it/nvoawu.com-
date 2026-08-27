# N VoaWu Studio — Website Content Specification

> Project: N VoaWu Studio corporate website
> Domain: https://nvoawu.com
> Language: English (US)
> Audience: European & American users, app-store visitors, prospective partners
> Document version: 1.0
> Owner: PM (this file feeds the UI build, copy, SEO, legal review, and submission pipeline)

This document is the single source of truth for every English string published on
nvoawu.com and inside the studio's Google Play / App Store listings. It contains the
site map, page-level copy, full Privacy Policy, full Terms of Service, SEO plan, and
the asset brief for the UI build. Nothing here is a placeholder — every sentence is
final, ship-ready English copy.

---

## 1. Site Map & Page Copy

### 1.1 Global navigation

- Top-level nav (header, present on every page):
  - **Home** (links to `/`)
  - **Services** (links to `/services.html`)
  - **Apps** (anchor link to `#our-apps` on the Home page, plus a "See all apps" CTA on the Services page that points to the studio's Google Play developer page)
  - **Contact** (links to `/contact.html`)
  - **Get a quote** (a small accent button on the right, links to `/contact.html#quote`)

- Footer nav (every page):
  - **Privacy Policy** → `/privacy.html`
  - **Terms of Service** → `/terms.html`
  - **Cookie settings** → opens a cookie banner
  - **Sitemap** → `/sitemap.xml`
  - **Press kit** → `/press.html` (placeholder for a future press page)

### 1.2 Footer copy (shared, every page)

- Studio tagline (one-liner above the social row):
  > "Independent app & mobile-management studio. Crafted in Europe. Played everywhere."

- Contact block:
  > N VoaWu Studio
  > Email: **elefnarin@gmail.com**
  > Hours: Monday – Friday, 09:00 – 18:00 CET
  > Location: Europe (remote-first)

- Social placeholders (icons rendered as inline SVG, all `target="_blank" rel="noopener noreferrer"`):
  - Twitter / X → `https://twitter.com/nvoawu`
  - LinkedIn → `https://www.linkedin.com/company/nvoawu`
  - GitHub → `https://github.com/elefnarin-ship-it`
  - YouTube → `https://www.youtube.com/@nvoawu`
  - Discord → `https://discord.gg/nvoawu`

- Copyright line:
  > © 2026 N VoaWu Studio. All rights reserved. All trademarks and app store logos are property of their respective owners.

- Fine print below copyright:
  > Google Play and the Google Play logo are trademarks of Google LLC. Apple, the Apple logo, App Store, and iPhone are trademarks of Apple Inc., registered in the US and other countries. N VoaWu is not affiliated with Apple Inc. or Google LLC.

### 1.3 Home (`/`)

- SEO `<title>` (54 chars):
  > `N VoaWu Studio — Indie Mobile Apps & Management Suite`

- `<meta name="description">` (158 chars):
  > `Independent studio building casual games, everyday utility apps, and a mobile management suite. Published on Google Play and the App Store for users worldwide.`

- Open Graph / Twitter card values: see Section 7.

- H1 (one per page):
  > **Crafted apps for everyday people — and the teams who run them.**

- H2 outline:
  1. `Hero` — see Section 2.1
  2. `What we do`
  3. `Mobile apps & management suite`
  4. `Our apps`
  5. `Why N VoaWu`
  6. `Meet the mascots`
  7. `By the numbers`
  8. `Let's build something together`

### 1.4 Services (`/services.html`)

- SEO `<title>` (49 chars):
  > `Services — N VoaWu Studio for Apps & Mobile Ops`

- `<meta name="description">` (152 chars):
  > `Custom apps, casual mobile games, and a white-label mobile management suite. End-to-end build, localization, and growth from one European studio.`

- H1:
  > **Four ways we help product teams ship — and stay shipped.**

- H2 outline:
  1. `Custom software & app development`
  2. `Mobile app product studio`
  3. `Mobile management app`
  4. `Maintenance, localization & growth`
  5. `How we engage`
  6. `Frequently asked questions`

### 1.5 Contact (`/contact.html`)

- SEO `<title>` (44 chars):
  > `Contact N VoaWu Studio — Let's Talk`

- `<meta name="description">` (147 chars):
  > `Reach the N VoaWu team for project inquiries, press, partnerships, or app support. We respond within two business days, Europe-wide.`

- H1:
  > **Tell us what you're building.**

- H2 outline:
  1. `Studio contact card`
  2. `Send a project inquiry`
  3. `Press & partnerships`
  4. `App support`

### 1.6 Privacy Policy (`/privacy.html`) & Terms of Service (`/terms.html`)

- Privacy `<title>` (49 chars):
  > `Privacy Policy — N VoaWu Studio`

- Privacy `<meta name="description">` (155 chars):
  > `How N VoaWu Studio collects, uses, shares, and protects information across nvoawu.com and every mobile app published on Google Play and the App Store.`

- ToS `<title>` (45 chars):
  > `Terms of Service — N VoaWu Studio`

- ToS `<meta name="description">` (151 chars):
  > `The terms that govern your use of N VoaWu websites and mobile applications, including advertising, in-app purchases, and app-store specific clauses.`

---

## 2. Home Page Sections

### 2.1 Hero

- Eyebrow label (small, all caps):
  > `INDEPENDENT · EUROPEAN · MULTI-PLATFORM`

- Headline (H1):
  > **Crafted apps for everyday people — and the teams who run them.**

- Subheadline (paragraph below the headline):
  > N VoaWu is an independent studio shipping casual games and everyday utility apps
  > on Google Play and the App Store, plus a mobile management suite that helps small
  > and mid-size teams run their day-to-day operations from a phone. We build the
  > kind of software we want on our own devices: fast, friendly, and a little bit fun.

- Primary CTA (large filled button):
  > `Explore our apps`
  > → scrolls to `#our-apps`

- Secondary CTA (outlined button):
  > `Talk to the studio`
  > → `/contact.html`

- Mascot (decorative SVG/PNG, top-right of the hero, parallax-animated on scroll):
  > A cheerful arctic fox in a miniature racing helmet, holding a tiny flag that
  > reads "v1.0". The fox waves once on page load (looping, three-second cycle).
  > Tail and scarf sway with the parallax mouse-move.

- Hero stats strip (directly under the CTA row, three columns):
  - `12+` apps shipped
  - `4M+` lifetime downloads
  - `27` countries reached

### 2.2 What we do

- Section eyebrow: `WHAT WE DO`
- H2: **One studio, three kinds of software.**
- Lead paragraph:
  > We started N VoaWu to make small, well-crafted software — the sort of thing
  > that lives on a home screen for years. Today that means three lines of work,
  > each run by a small senior team with a clear point of view.
- Three feature cards (each card has a custom SVG icon, a title, and two-line description):
  1. **Indie games**
     > Single-player casual games designed for a quick coffee break or a long
     > evening. Always offline-first, always fair.
  2. **Everyday utility apps**
     > Quietly useful tools for weather, notes, focus, file hygiene, and the
     > small chores phones were actually built for.
  3. **Mobile management suite**
     > A white-label management app that lets small businesses, schools, and
     > field teams run their operations from a pocket-sized dashboard.

### 2.3 Mobile apps & management suite

- Section eyebrow: `APPS + MANAGEMENT`
- H2: **Casual games and utility apps you already love — plus a serious mobile operations suite.**
- Lead paragraph:
  > The studio publishes its own catalog of consumer apps on Google Play and the
  > App Store, and we license our **mobile management app** to organizations that
  > need a reliable, opinionated way to run people, tasks, and field reporting
  > from a phone. Both sides of the studio share the same design system, the same
  > release process, and the same obsession with how an app feels on a Tuesday
  > morning at 8:14 a.m.
- Two-column feature block (each with a sub-H3 and three bullet points):
  - **Consumer apps — built for the home screen.**
    - Native iOS and native Android, no half-baked web wrappers.
    - Localization in 11 languages, plus region-tuned pricing.
    - Accessibility audited (WCAG 2.1 AA where feasible).
  - **Mobile management app — built for the field.**
    - Role-based access for staff, managers, and admins.
    - Offline-first sync with conflict resolution and audit log.
    - Integrations with the calendar, files, and identity tools your team already uses.
- Inline link list under the block:
  > `See the full app catalog →` `/services.html#catalog`
  > `Request a management-suite demo →` `/contact.html#demo`

### 2.4 Our apps (highlight row)

- Section eyebrow: `OUR APPS`
- H2: **A few favorites from the catalog.**
- Subheadline:
  > Six shipped products, with more in beta. Every title is hand-built, no template
  > reskins, and every title earns its place on the home screen.
- Card grid (3 columns on desktop, 2 on tablet, 1 on mobile). Each card has:
  - App icon (PNG, 256×256, generated as crisp transparent PNG with soft drop shadow)
  - App title (H3)
  - One-line description
  - Category tag
  - "Get it" micro-link → deep link to the relevant store

- Card 1
  - Title: **Pocket Meteorology**
  - Description: A weather app that explains itself, in plain language, in 11 languages.
  - Category: `Utilities · Weather`

- Card 2
  - Title: **Foxglove Solitaire**
  - Description: A single-player Klondike reimagined for five-minute breaks.
  - Category: `Games · Card`

- Card 3
  - Title: **Tidy Tray**
  - Description: A decluttering assistant for downloads, photos, and forgotten files.
  - Category: `Utilities · Productivity`

- Card 4
  - Title: **Tiny Trails**
  - Description: A cozy hand-drawn endless-runner. No timers, no scores, just walking.
  - Category: `Games · Casual`

- Card 5
  - Title: **FieldKeeper**
  - Description: The mobile management app for teams in the field. Schedule, report, audit.
  - Category: `Business · Management`

- Card 6
  - Title: **Loom Calm**
  - Description: A focus timer with ambient textures, no subscriptions, no accounts.
  - Category: `Productivity · Focus`

- Under-grid link:
  > `See every app on Google Play →`
  > `See every app on the App Store →`

### 2.5 Why N VoaWu

- Section eyebrow: `WHY US`
- H2: **Six things we won't compromise on.**
- Six bullet rows (each row: SVG icon, bold one-liner, two-line explanation):
  1. **Crafted, not assembled.** Every screen is hand-drawn or hand-coded; no template reskins, no copy-paste UX.
  2. **Honest monetization.** Ads are clearly labeled; in-app purchases are clearly priced; no dark patterns.
  3. **Localization is a first-class feature, not an afterthought.** Eleven languages at launch, with strings never machine-translated without review.
  4. **Privacy by default.** On-device processing where it makes sense; minimal analytics; never sell personal data.
  5. **Independent and stable.** We self-fund and reinvest. The studio has been operating continuously since day one.
  6. **Senior teams only.** No junior pyramid; the person you brief is the person who builds.

### 2.6 Studio mascots

- Section eyebrow: `MEET THE MASCOTS`
- H2: **Our mascots show up everywhere — the store page, the splash screen, the release notes.**
- Lead paragraph:
  > The studio is a small zoo. Each mascot leads a different part of the product
  > line, and you can find them in the apps, on the website, and in our seasonal
  > wallpapers. They are drawn by an in-house illustrator and shipped in SVG so
  > they scale on every device.
- Mascot grid (5 entries, each with a 200×200 PNG portrait and a one-line personality):
  1. **Frosti the Arctic Fox** — *Lead mascot. Curious, a little too clever.*
  2. **Pepper the Hedgehog** — *Casual-games captain. Hates tutorials.*
  3. **Maple the Red Panda** — *Manager of the management suite. Keeps the queue tidy.*
  4. **Sage the Barn Owl** — *Localization lead. Speaks eleven languages and a couple of bird calls.*
  5. **Biscuit the Otter** — *QA in chief. Will find the one bug you missed.*

### 2.7 Statistics / social proof

- Section eyebrow: `BY THE NUMBERS`
- H2: **Quietly proud of these.**
- Lead paragraph:
  > We don't chase vanity metrics. The numbers below are the ones we use to make
  > decisions: how many real people installed our software, how long we kept them,
  > and how often we shipped.
- Four stat cards, each with a `data-` attribute for the JS count-up animation:
  - `data-target="12"` — `12+` — "Apps shipped on Google Play & the App Store"
  - `data-target="4000000"` — `4M+` — "Lifetime downloads across all titles"
  - `data-target="27"` — `27` — "Countries with active monthly users"
  - `data-target="11"` — `11` — "Languages supported in every release"
- Underneath: a single line of social proof with placeholder logos (will be SVG):
  > Trusted by teams and players across 27 countries, with reviews averaging 4.6 ★ on both stores.

### 2.8 Closing CTA / newsletter

- Section eyebrow: `STAY IN TOUCH`
- H2: **Follow the studio — quietly.**
- Lead paragraph:
  > One email per month with release notes, a behind-the-scenes look at what we're
  > building, and the occasional wallpaper. No tracking pixels, no marketing
  > automation, no "last chance" subject lines.
- Newsletter form (front-end only):
  - Field label: `Email address`
  - Placeholder: `you@somewhere.com`
  - Submit button: `Subscribe`
  - Helper text (below button): "We use this address only for the newsletter. Unsubscribe with one click in any email."
- Secondary CTA (outlined button, right column on desktop):
  - Label: `Browse the apps`
  - → scrolls to `#our-apps`

---

## 3. Services Page

The Services page presents four offers, each with a H2, a 2–3 sentence lead, a bulleted scope, a "what you get" deliverables list, and a "best for" tag.

### 3.1 Tier 1 — Custom software & app development

- H2: **Custom software & app development.**
- Lead:
  > End-to-end design and engineering of a single product — usually a consumer
  > app, a vertical SaaS, or an internal tool that needs a real native shell.
  > You bring the problem; we bring the small senior team that ships it.
- Scope (bullets):
  - Product discovery and roadmap workshop
  - UX design, prototyping, and design-system setup
  - Native iOS (Swift / SwiftUI) and Android (Kotlin / Jetpack Compose) engineering
  - Backend API design and implementation
  - Cloud infrastructure (AWS / GCP) and CI/CD
  - QA, release management, and store submission
- Deliverables: "Source code, design files, a deployed production environment, and a written handover."
- Best for: "Founders and product teams who need one reliable studio, not five freelancers."

### 3.2 Tier 2 — Mobile app product studio

- H2: **Mobile app product studio.**
- Lead:
  > Our consumer publishing arm. We design, build, and operate our own catalog of
  > casual games and everyday utility apps, shipping them to Google Play and the
  > App Store. We also work with select partners on co-published titles.
- Scope:
  - Original IP development (casual games, productivity, utilities, lifestyle)
  - Original art, animation, and audio direction
  - Live-ops, seasonal events, and store-page A/B testing
  - ASO and store-listing optimization
  - Multi-region launch (27 markets today, 11 languages)
  - Mediation setup across the major ad networks (full list in the Privacy Policy)
- Deliverables: "A live product on the stores, owned IP, and a published post-launch roadmap."
- Best for: "Co-publishing partners, brand collaborations, and IP licensors looking for an experienced mobile operator."

### 3.3 Tier 3 — Mobile management app (white-label suite)

- H2: **Mobile management app — FieldKeeper and white-label.**
- Lead:
  > Our business-product line. A mobile management app that helps small and
  > mid-size organizations run their day-to-day from a phone. Out of the box it
  > covers scheduling, tasking, field reporting, photo audits, and lightweight
  > CRM; it can also be white-labeled for organizations that need their own
  > branding and policy surface.
- Scope:
  - Role-based access (admin / manager / staff)
  - Offline-first sync with audit trail
  - Mobile forms with conditional logic and photo capture
  - Integrations: Google Workspace, Microsoft 365, iCloud, generic OIDC SSO
  - White-label: app icon, splash, theme, copy, app-store listings
  - EU data residency option (Frankfurt region)
- Deliverables: "A live app under your own brand, an admin console, and an annual support contract."
- Best for: "Operations teams in construction, retail, hospitality, healthcare, and education — usually 20–500 field staff."

### 3.4 Tier 4 — Maintenance, localization & growth

- H2: **Maintenance, localization & growth.**
- Lead:
  > Ongoing care for apps that are already in market. The unglamorous half of
  > software — the half that decides whether an app is still on the home screen
  > in year three.
- Scope:
  - OS-upgrade compatibility (annual iOS and Android releases)
  - Dependency and SDK upgrades (ad mediation, crash reporting, analytics)
  - Localization engineering in 11 languages
  - ASO refreshes, store-listing screenshots, and update cadence planning
  - Crash triage and performance budgets
  - Optional growth experiments and A/B testing
- Deliverables: "A monthly maintenance report, a quarterly roadmap, and ad-hoc engineering capacity."
- Best for: "Any team running an app that is too important to neglect and too small to staff a full platform org."

### 3.5 How we engage

- H2: **How we engage.**
- Three engagement model cards:
  1. **Fixed scope, fixed price.** Best for well-defined MVPs and migrations.
  2. **Time & materials with a monthly cap.** Best for ongoing product work and live-ops.
  3. **Revenue share / co-publish.** Best for consumer-app partners with proven product-market fit.

### 3.6 Frequently asked questions

- H2: **Frequently asked questions.**
- FAQ accordion (each item renders as `<details><summary>` for SEO crawlability):
  1. **Where is the studio based?**
     > We are a remote-first European studio. Our team is distributed across the
     > EU, the UK, and Canada, with working hours in CET.
  2. **Do you sign NDAs?**
     > Yes — we sign mutual NDAs before any discovery work.
  3. **Can you take over an existing codebase?**
     > Usually yes. We start with a two-week code audit and produce a written
     > handover plan.
  4. **What is your typical project size?**
     > Consumer apps: 4–9 months end-to-end. Mobile management deployments:
     > 6–12 weeks. Maintenance: rolling, monthly.
  5. **Do you build for both stores?**
     > Yes — every consumer release is shipped to Google Play and the App Store
     > in parallel.
  6. **How do you handle data residency?**
     > EU customers can opt into an EU-only data path. See our Privacy Policy
     > for the regional breakdown.

---

## 4. Contact Page

### 4.1 Studio contact card

- H2: **Studio contact card.**
- Block content (rendered as a card on the left half of the page):
  - **Email** — `elefnarin@gmail.com` (mailto link)
  - **Studio hours** — Monday to Friday, 09:00 – 18:00 CET
  - **Response time** — Within two business days
  - **Location** — Europe, remote-first
  - **Languages** — English (primary), French, German, Spanish, Italian, Portuguese
  - **Press contact** — Same address; please include "Press" in the subject line

### 4.2 Project inquiry form (front-end only)

- H2: **Send a project inquiry.**
- Helper paragraph: "This form is for general inquiries. It is processed by the studio, not a third-party CRM. We respond within two business days."
- Form fields (all `required` unless marked optional; front-end only, no real backend):
  - **Full name** — `text`, required, min length 2
  - **Work email** — `email`, required
  - **Company or studio** — `text`, optional
  - **Project type** — `select`, required, options:
    - Custom app development
    - Co-publishing a consumer app
    - Mobile management app (FieldKeeper or white-label)
    - Maintenance / localization
    - Press or partnership
    - Other
  - **Budget range** — `select`, required, options:
    - Under €25k
    - €25k – €75k
    - €75k – €200k
    - €200k+
    - Not sure yet
  - **Target launch** — `select`, required, options:
    - Within 3 months
    - 3–6 months
    - 6–12 months
    - Flexible
  - **Project description** — `textarea`, required, min length 40, max length 4000, placeholder: "Tell us what you're building, who it's for, and anything you've already tried."
  - **Consent checkbox** — `checkbox`, required, label: "I agree that N VoaWu may store this message and reply to the email I provided, as described in the Privacy Policy."
  - **Submit button** — `Send inquiry` (disabled until the form is valid; submits to a `mailto:` fallback that opens the user's mail client prefilled with the form contents — no real backend is required for the public build)

### 4.3 Press & partnerships

- H2: **Press & partnerships.**
- Body: "For interviews, embargoed product news, or partnership proposals, write to
`elefnarin@gmail.com` with the subject line `Press` or `Partnership`. We answer
press inquiries within 24 hours on weekdays. A press kit with high-resolution
logos, mascot artwork, and approved product screenshots is available on request
and will be linked from this page in a future update."

### 4.4 App support

- H2: **App support.**
- Body: "For in-app questions, account help, billing, or data requests, please use
the in-app support link in the relevant app (Settings → Help → Contact us). The
in-app channel is the fastest way to reach the team that maintains the product.
For privacy and data-deletion requests, see our Privacy Policy."

---

## 5. Privacy Policy

**Effective date: 2026-01-15. Last updated: 2026-01-15.**

This Privacy Policy describes how N VoaWu Studio ("N VoaWu", "we", "us", "our")
collects, uses, discloses, and protects information when you (a) visit
https://nvoawu.com (the "Website"), or (b) install, access, or use any mobile
application published by N VoaWu on Google Play or the Apple App Store (the
"Apps"). Collectively, the Website and the Apps are referred to as the
"Services". By installing or using any of the Services, you agree to this
Privacy Policy. If you do not agree, please do not install or use the Services.

### 5.1 Introduction & scope

This Privacy Policy applies to all of the following:

- The public website at https://nvoawu.com and any subdomains operated by N VoaWu
  Studio (for example, `*.nvoawu.com`).
- Every mobile application published by N VoaWu Studio on Google Play, including
  but not limited to Pocket Meteorology, Foxglove Solitaire, Tidy Tray, Tiny
  Trails, FieldKeeper, and Loom Calm, and any future titles published under the
  developer name "N VoaWu Studio" or any of its trading names.
- Every mobile application published by N VoaWu Studio on the Apple App Store,
  including any white-label builds distributed under a partner's developer
  account that are nevertheless operated by N VoaWu.
- Any future product (web, mobile, desktop) that links to or is governed by this
  policy.

It does not apply to any third-party websites, applications, or services that
we do not control. We may link to third-party content (for example, app store
listings or social media); please review their policies separately.

### 5.2 Information we collect

We collect the minimum information necessary to operate, secure, and improve
the Services. The categories below apply across the Website and the Apps.

**Account information.** When you create an account inside one of the Apps
(for example, FieldKeeper), we collect a display name, an email address, a
hashed password, and any optional profile fields you complete. For white-label
deployments, your administrator may provision accounts on your behalf.

**Device information.** We collect device model, operating system version,
app version, locale, time zone, device language, and a stable device identifier
such as the Android Advertising ID (AAID/GAID), the iOS Identifier for
Advertisers (IDFA), the iOS Identifier for Vendors (IDV), or a randomly
generated app-scoped identifier (where the platform disables the advertising
identifiers).

**Usage information.** We collect information about how you use the Services,
including features opened, screens viewed, taps, session length, crash logs,
performance metrics, and the actions you take inside each app.

**In-app events.** We collect first-party analytics events such as level
starts, level ends, in-app purchases, subscription starts and renewals,
rewarded-ad views, and tutorial completions. We use these to maintain and
improve the products.

**Advertising identifiers and signals.** Subject to your consent and the
platform settings, we may read or write the AAID/GAID, the IDFA, the Limit Ad
Tracking setting (iOS), the Opt out of Ads Personalization setting (Android),
and any app-defined pseudonymous identifiers required by our advertising
partners.

**Cookies and similar technologies (Website).** The Website uses first-party
cookies and local storage for session, language preference, and analytics. See
Section 5.14 for the full list.

**Support communications.** When you contact us, we collect the contents of
your message, your email address, and any attachments you choose to send.

### 5.3 How we use information

We use the information we collect to:

- Operate, maintain, secure, and improve the Services.
- Authenticate users and provide customer support.
- Process in-app purchases, subscriptions, and refunds through the platform
  payment systems (Google Play Billing and Apple App Store In-App Purchase).
- Display advertising in apps that include ads, and to measure the performance
  of that advertising.
- Localize content and remember your preferences (language, region, dark mode).
- Detect, prevent, and respond to fraud, abuse, security incidents, and
  violations of our terms.
- Comply with legal obligations and respond to lawful requests from public
  authorities.
- Send you service-related notices (release notes, security alerts, critical
  product information) and, where you have opted in, the studio newsletter.

We do not sell personal information for monetary consideration. We do share
information with the advertising partners listed in Section 5.4 to the extent
necessary to deliver and measure advertising in our free apps, and you may
opt out at any time as described in Section 5.13.

### 5.4 Google AdMob & ad SDKs in the Apps

Our free Apps display advertising served by Google AdMob and the additional
ad mediation partners listed in Section 5.5. The ad formats we use, and the
SDKs that deliver them, are described below.

**Splash ads (app-open format).** When you open one of our free Apps, a brief
splash ad may be displayed before the app's home screen loads. Splash ads are
served by Google AdMob and the mediation partners listed below. We do not
personalize splash ads based on your activity in other apps; we use a coarse
contextual signal (country and language) for ad selection.

**Rewarded video ads.** Some Apps offer an in-app reward (for example, an
extra life, a hint, or a temporary premium feature) in exchange for watching
a full-length video ad. Rewarded video ads are served by Google AdMob, Unity
Ads, ironSource / Unity LevelPlay, AppLovin MAX, Pangle, Vungle, and
Mintegral. You are always shown a clear offer screen before a rewarded ad
plays, and you can decline.

**Interstitial ads.** Some Apps display full-screen ads at natural transition
points (for example, between game levels). Interstitial ads are served by
Google AdMob, Meta Audience Network, Unity Ads, AppLovin MAX, ironSource /
Unity LevelPlay, Pangle, Vungle, Chartboost, Mintegral, InMobi, and Tapjoy.

**Banner ads.** Some Apps display a small banner ad at the top or bottom of
the screen. Banner ads are served by Google AdMob, Google Ad Manager, Meta
Audience Network, AppLovin, InMobi, Smaato, and Verizon Media / Yahoo.

**Native ads.** A small number of Apps integrate native ad slots that match
the look and feel of the surrounding content. Native ads are served by Google
AdMob, Google Ad Manager, and Unity Ads.

**Frequency capping.** Each mediation partner uses its own frequency capping
to limit how many times you see the same ad or the same advertiser's ad in a
given period. We configure our own cap of three interstitial ads per user
per session for any app that displays interstitials.

### 5.5 Ad mediation and aggregation partners

To deliver and measure advertising, we work with the ad mediation and
aggregation platforms listed below. Each partner may collect, use, and
disclose device, usage, and ad-interaction information as described in its
own privacy policy. We do not control those third-party practices, and we
encourage you to review them. For each partner we list the data shared for
ad serving, frequency capping, interest-based advertising, and any
child-directed setting we are aware of.

1. **Google AdMob / Google Ad Manager (Google LLC).** Serves all four
   ad formats above. Receives AAID/GAID or IDFA, IP-derived coarse
   location (country level), device make/model, OS version, app version,
   and ad-interaction events. Supports frequency capping, interest-based
   ads, and Google's "Treat this child-directed" flag, which we enable
   for any app configured as a child-directed app on Google Play.

2. **Meta Audience Network (Meta Platforms, Inc.).** Serves banner,
   interstitial, and rewarded video ads. Receives AAID/GAID or IDFA,
   hashed email (where the user is logged in to Facebook), coarse
   location, and ad-interaction events. Supports frequency capping and
   interest-based ads. We do not enable Meta's "child-directed" tag;
   Meta Audience Network is not used in apps that are configured as
   child-directed on Google Play or that opt into Apple's Kids Category.

3. **Unity Ads (Unity Technologies).** Serves interstitial, rewarded
   video, and banner ads. Receives AAID/GAID or IDFA, IP address, device
   identifiers, and ad-interaction events. Supports frequency capping and
   interest-based ads.

4. **AppLovin (AppLovin Corporation).** Serves banner, interstitial,
   rewarded video, and native ads. Receives AAID/GAID or IDFA, device
   identifiers, coarse location, and ad-interaction events. Supports
   frequency capping and interest-based ads.

5. **AppLovin MAX (AppLovin Corporation).** Acts as our primary mediation
   layer, orchestrating waterfall and bidding among the other partners
   listed here. Receives the same data as AppLovin above.

6. **ironSource / Unity LevelPlay (Unity Technologies / ironSource).**
   Serves interstitial, rewarded video, and banner ads. Receives
   AAID/GAID or IDFA, IP address, device identifiers, and ad-interaction
   events. Supports frequency capping and interest-based ads.

7. **Pangle (ByteDance / TikTok).** Serves banner, interstitial,
   rewarded video, and native ads. Receives AAID/GAID or IDFA, IP
   address, device identifiers, and ad-interaction events. Supports
   frequency capping and interest-based ads. Pangle is not used in
   child-directed apps.

8. **Vungle (Vungle, Inc., a Liftoff company).** Serves interstitial
   and rewarded video ads. Receives AAID/GAID or IDFA, device
   identifiers, coarse location, and ad-interaction events. Supports
   frequency capping and interest-based ads.

9. **Chartboost (Zynga Inc.).** Serves interstitial, rewarded video,
   and banner ads. Receives AAID/GAID or IDFA, device identifiers, and
   ad-interaction events. Supports frequency capping and interest-based
   ads.

10. **Digital Turbine (Digital Turbine, Inc.).** Serves interstitial,
    rewarded video, and offer-wall ads. Receives AAID/GAID or IDFA,
    device identifiers, and ad-interaction events. Supports frequency
    capping and interest-based ads.

11. **Mintegral (Mintegral, a Mobvista company).** Serves interstitial,
    rewarded video, and banner ads. Receives AAID/GAID or IDFA, IP
    address, device identifiers, and ad-interaction events. Supports
    frequency capping and interest-based ads.

12. **InMobi (InMobi Technology Services).** Serves banner, interstitial,
    rewarded video, and native ads. Receives AAID/GAID or IDFA, device
    identifiers, coarse location, and ad-interaction events. Supports
    frequency capping and interest-based ads.

13. **Tapjoy (Tapjoy, Inc.).** Serves offer-wall, interstitial, and
    rewarded video ads. Receives AAID/GAID or IDFA, device identifiers,
    and ad-interaction events. Supports frequency capping and
    interest-based ads.

14. **StartApp (StartApp Inc.).** Serves banner, interstitial, and
    rewarded video ads. Receives AAID/GAID or IDFA, device identifiers,
    and ad-interaction events. Supports frequency capping and
    interest-based ads.

15. **Smaato (Smaato Inc.).** Serves banner and native ads. Receives
    AAID/GAID or IDFA, device identifiers, coarse location, and
    ad-interaction events. Supports frequency capping and interest-based
    ads.

16. **Verizon Media / Yahoo (Yahoo Inc., a Verizon Media company).**
    Serves banner and native ads. Receives AAID/GAID or IDFA, device
    identifiers, and ad-interaction events. Supports frequency capping
    and interest-based ads.

17. **Amazon Publisher Services (Amazon.com, Inc.).** Acts as a
    header-bidding partner on the mediation stack. Receives AAID/GAID
    or IDFA, device identifiers, and ad-interaction events. Supports
    frequency capping and interest-based ads.

18. **MobFox (MobFox USA LLC, part of Verve Group).** Serves banner
    and interstitial ads. Receives AAID/GAID or IDFA, device
    identifiers, and ad-interaction events. Supports frequency capping
    and interest-based ads.

19. **MyTarget (VK Group / Mail.ru Group).** Serves banner and
    interstitial ads. Receives AAID/GAID or IDFA, device identifiers,
    and ad-interaction events. Supports frequency capping and
    interest-based ads.

**Child-directed settings.** None of the partners above are used inside
apps that are configured as child-directed on Google Play or that opt
into Apple's Kids Category. For all other apps, you can limit interest-based
advertising on your device at any time: on iOS, enable Limit Ad Tracking
under Settings → Privacy → Tracking; on Android, enable Opt out of Ads
Personalization under Settings → Google → Ads.

### 5.6 Google Play policies

Our apps on Google Play comply with Google Play's policies in force at the
time of publication, including but not limited to:

- **Data safety form.** Every app submits an accurate Google Play
  Data safety form that describes the data the app collects, whether it
  is shared with third parties, and the security practices in place
  (encryption in transit, the ability to request deletion).
- **Families Policy.** Apps that are designed for children follow the
  Google Play Families Policy. Child-directed apps do not transmit
  AAID/GAID to third-party ad networks, and we use only Google AdMob's
  "Families" SDKs where applicable.
- **Ads policy.** Ads in our apps comply with Google Play's Ads policy,
  including the rules on interstitial placement, rewarded ad disclosure,
  and prohibition of ads that interfere with system functionality or
  impersonate system notifications.
- **Target API level.** Our Android apps target the API level required
  by Google Play for new and existing apps in the year of release, and
  we ship updates to maintain that target.
- **Permissions policy.** We request the minimum Android runtime
  permissions necessary for the feature. Sensitive permissions (for
  example, camera, location, microphone) are requested only with
  in-context prompts at the moment the feature is first used.
- **Account deletion.** Apps that support accounts offer an in-app path
  to request account and data deletion, in line with Google Play's user
  data policy.

### 5.7 Apple App Store policies

Our apps on the Apple App Store comply with Apple's policies in force at
the time of publication, including but not limited to:

- **App Tracking Transparency (ATT / IDFA).** We do not access the IDFA
  in any app until you have granted tracking permission through the iOS
  ATT prompt. If you decline ATT, we serve contextual ads only.
- **Privacy nutrition labels.** Every app submits an accurate App Store
  privacy label describing the data it collects, the data it links to
  you, and the data used for tracking, in line with Apple's
  requirements.
- **App Store Review Guidelines §5 (Privacy).** Our apps comply with
  Section 5 of the App Store Review Guidelines, including the
  requirements on data collection, data use, data sharing, and
  health-research disclosures.
- **Kids Category compliance.** Apps that participate in the Kids
  Category comply with the additional restrictions in Section 1.4 of
  the Review Guidelines, including the prohibition of behavioral
  advertising and the prohibition of third-party SDKs that perform
  tracking as defined by Apple.
- **Sign in with Apple.** Where an app offers a third-party or
  first-party sign-in, the app also offers Sign in with Apple as an
  option, in line with Section 4.8 of the Review Guidelines.
- **GDPR / CCPA disclosures.** For users in the EEA, the UK, and
  California, the app surfaces a clear opt-in or opt-out choice
  consistent with the regional rules described in Section 5.9.

### 5.8 Children's privacy

We do not knowingly collect personal information from children below the
applicable age threshold without verifiable parental consent. We comply
with the following:

- **United States — COPPA.** The Children's Online Privacy Protection
  Act applies to children under 13. We do not direct our consumer apps
  at children under 13, and we do not use ad SDKs that build
  profiles of users we know to be under 13.
- **European Union — GDPR-K.** Article 8 of the GDPR sets the default
  age of consent at 16, with member states able to lower it to no less
  than 13. We apply the higher threshold (16) by default in the EEA
  and the UK.
- **United Kingdom — Age-Appropriate Design Code (AADC).** Our apps
  that are likely to be accessed by children follow the AADC's
  standards, including the duty to assess and mitigate risks to the
  best interests of children.
- **Other regions.** We respect the higher of the local age threshold
  or 16 wherever our apps are made available.

If you believe we have collected information from a child below the
applicable threshold without verifiable parental consent, please contact
us at `elefnarin@gmail.com` and we will delete the information within
30 days.

### 5.9 Regional and country-specific compliance

Depending on where you live, the following regional privacy laws apply
to the information we collect. The list below is non-exhaustive; it
covers every jurisdiction in which our apps are actively distributed
as of the effective date of this policy.

- **GDPR (EU/EEA).** The General Data Protection Regulation
  (Regulation (EU) 2016/679) applies to personal data of individuals
  in the European Economic Area. Our lawful bases are consent (for
  advertising and analytics) and legitimate interest (for security,
  fraud prevention, and product operation). You have the rights
  listed in Section 5.13.
- **UK GDPR and Data Protection Act 2018.** The UK GDPR applies to
  personal data of individuals in the United Kingdom. We are
  regulated by the Information Commissioner's Office (ICO). The lawful
  bases and rights are aligned with the EU GDPR.
- **CCPA / CPRA (California, USA).** The California Consumer Privacy
  Act, as amended by the California Privacy Rights Act, grants
  California residents the rights to know, delete, correct, and opt
  out of the sale or sharing of personal information, and the right
  to limit the use of sensitive personal information. We honor all
  five rights, including a clearly labeled "Do Not Sell or Share My
  Personal Information" link on the Website and inside every app
  that displays advertising.
- **VCDPA (Virginia, USA).** The Virginia Consumer Data Protection
  Act grants Virginia residents rights to access, correct, delete,
  and obtain a portable copy of personal data, and to opt out of
  targeted advertising and the sale of personal data.
- **CPA (Colorado, USA).** The Colorado Privacy Act grants similar
  rights, with effect from July 2023.
- **CTDPA (Connecticut, USA).** The Connecticut Data Privacy Act
  grants similar rights, with effect from July 2023.
- **UCPA (Utah, USA).** The Utah Consumer Privacy Act grants rights
  to access, delete, and opt out of targeted advertising and the
  sale of personal data.
- **LGPD (Brazil).** The Lei Geral de Proteção de Dados applies to
  personal data of individuals in Brazil. You have the rights listed
  in Section 5.13, and the data controller is N VoaWu Studio, with
  the data protection officer reachable at `elefnarin@gmail.com`.
- **PIPEDA + Law 25 (Canada).** The Personal Information Protection
  and Electronic Documents Act, as amended by Quebec's Law 25 (and
  similar provincial statutes), applies to personal data of
  individuals in Canada. You have the right to access and correct
  personal data, and Law 25 adds rights to data portability and
  de-indexation.
- **PDPA (Singapore).** The Personal Data Protection Act 2012
  applies to personal data of individuals in Singapore. You may
  request access, correction, and withdrawal of consent.
- **PIPL (China).** The Personal Information Protection Law applies
  to personal data of individuals in the People's Republic of
  China. Where our apps are accessed from mainland China, we limit
  data collection to what is necessary and apply the consent,
  notice, and cross-border transfer rules required by PIPL. We do
  not currently target our apps at users in mainland China; if
  this changes, this section will be updated before any launch.
- **Australia Privacy Act / OAIC.** The Privacy Act 1988 and the
  Australian Privacy Principles apply to personal data of
  individuals in Australia. You may request access, correction,
  and complaint through the Office of the Australian Information
  Commissioner.
- **India DPDP Act.** The Digital Personal Data Protection Act,
  2023 applies to personal data of individuals in India. You have
  rights to access, correction, erasure, grievance redressal, and
  the right to nominate another individual to exercise your rights.
- **Japan APPI.** The Act on the Protection of Personal Information
  applies to personal data of individuals in Japan. We comply with
  the rules on use, third-party provision, and cross-border
  transfer, including the requirement to obtain consent before
  transferring personal data outside Japan.
- **South Korea PIPA.** The Personal Information Protection Act
  applies to personal data of individuals in South Korea. We
  comply with the rules on collection, use, retention, and
  cross-border transfer, and we register required cross-border
  transfers with the Personal Information Protection Commission.
- **California SB-976 (Protecting Our Kids from Social Media
  Addiction Act).** Where applicable, our apps do not provide
  feed-style content to users we know to be under 18, and we do
  not use notification, autoplay, or other design patterns
  prohibited by the Act.

### 5.10 Age restrictions

The minimum age to use the Services is:

- **16 in the EEA and the UK**, in line with the GDPR default and the
  UK Age-Appropriate Design Code.
- **13 in the United States**, in line with COPPA.
- **13 in the United Kingdom for non-child-directed apps**, with
  parental consent required for users below 16.
- The higher of 13 or the local minimum age in every other market
  where the Services are made available.

If you are below the applicable minimum age, you may use the Services
only with the verifiable consent of a parent or legal guardian. We use
a self-declaration flow inside every app that requests age and, where
the user is below the threshold, blocks account creation and limits
features to the maximum extent compatible with the platform's
distribution rules. Parents or legal guardians may contact us at
`elefnarin@gmail.com` to review, correct, or delete information
collected from a child.

### 5.11 International data transfers

We are a European studio with team members and service providers in
the European Economic Area, the United Kingdom, the United States,
Canada, and Singapore. When we transfer personal data outside the
country of collection, we rely on the lawful transfer mechanisms
required by the destination country's privacy law, including:

- **Standard Contractual Clauses (SCCs).** For transfers from the
  EEA to third countries without an adequacy decision, we use the
  SCCs adopted by the European Commission, including the
  module-to-module variants for transfers between controllers and
  processors.
- **UK International Data Transfer Agreement (IDTA).** For
  transfers from the UK to third countries without an adequacy
  decision, we use the IDTA or the UK Addendum to the EU SCCs.
- **Adequacy decisions.** We rely on the European Commission's
  adequacy decisions where they apply (for example, for transfers
  to the UK, Canada (PIPEDA), Japan, and South Korea under the
  current adequacy framework).
- **Supplementary measures.** For transfers to third countries
  without an adequacy decision, we apply supplementary technical
  and organizational measures, including encryption in transit
  and at rest, access controls, and vendor due diligence.

### 5.12 Data retention

We retain personal data only for as long as necessary to provide the
Services, comply with our legal obligations, resolve disputes, and
enforce our agreements. Specifically:

- **Account data** is retained for the life of the account and
  deleted within 30 days of account closure, except where retention
  is required by law (for example, tax and accounting records).
- **Usage and analytics data** is retained for up to 24 months in
  identifiable form, after which it is aggregated or deleted.
- **Ad data** is retained by the ad partners listed in Section
  5.5 according to each partner's own retention rules; we
  configure our own analytics windows at 13 months.
- **Support communications** are retained for up to 24 months from
  the last interaction.
- **Backup copies** of encrypted backups are retained for up to 90
  days on a rolling basis.

### 5.13 User rights

You have the right to:

- **Access** the personal data we hold about you.
- **Deletion** of the personal data we hold about you, subject to
  the exceptions in applicable law.
- **Correction** of inaccurate or incomplete personal data.
- **Portability** of the personal data you have provided, in a
  structured, commonly used, machine-readable format.
- **Opt out of targeted advertising** at any time, on the device
  (Limit Ad Tracking on iOS, Opt out of Ads Personalization on
  Android) or by contacting us.
- **"Do Not Sell or Share My Personal Information".** California
  residents may exercise this right at any time via a clearly
  labeled link in the footer of the Website and inside the
  Settings → Privacy screen of every app that displays
  advertising. We do not sell personal information for monetary
  consideration, but we may share limited identifiers with the ad
  partners listed in Section 5.5 for cross-app advertising; the
  "Do Not Sell or Share" link covers those disclosures.
- **Withdraw consent** at any time, where processing is based on
  consent. Withdrawal does not affect the lawfulness of processing
  before withdrawal.
- **Lodge a complaint** with a supervisory authority, in
  particular in the EEA member state of your habitual residence,
  place of work, or place of the alleged infringement.

To exercise any of these rights, contact us at `elefnarin@gmail.com`
or use the in-app data request tool (Settings → Privacy → Manage
my data). We respond within 30 days, or within the shorter window
required by applicable law.

### 5.14 Cookies and tracking technologies on the Website

The Website uses the following cookies and local storage entries:

- **Strictly necessary.** `nvw_session` (session cookie) and
  `nvw_csrf` (anti-CSRF token). These are required for the
  inquiry form and cannot be turned off.
- **Preferences.** `nvw_lang` (selected language) and `nvw_theme`
  (light / dark preference). These are optional; if you clear
  them, the site falls back to your browser language and the
  system theme.
- **Analytics.** We use a privacy-respecting first-party
  analytics tool that does not require consent under the ePrivacy
  Directive for the collection of pseudonymous, aggregated
  statistics. We do not use Google Analytics on the Website.
- **Marketing.** We do not set marketing or advertising
  cookies on the Website.

You can manage cookies from the "Cookie settings" link in the
footer, or by clearing cookies in your browser. The cookie
banner is shown only to EEA and UK visitors, in line with the
ePrivacy Directive; for all other visitors, the strictly
necessary cookies are set without a prompt.

### 5.15 Security measures

We employ technical and organizational measures designed to
protect personal data, including encryption in transit (TLS
1.2+ for all client-server communication) and at rest
(AES-256 for primary storage), role-based access control for
internal systems, two-factor authentication for production
access, periodic vulnerability scanning, an incident-response
process with a 72-hour notification window, and staff training
on data protection. No system is perfectly secure; we will
notify affected users and the relevant supervisory authorities
of a personal data breach in line with our legal obligations.

### 5.16 Changes to this policy

We may update this Privacy Policy from time to time. When we
do, we will revise the "Last updated" date at the top of this
page, post a notice in our apps for at least 30 days, and, for
material changes, request renewed consent where required by
applicable law. Your continued use of the Services after the
effective date of the updated policy constitutes acceptance of
the changes.

### 5.17 Contact

For any question, complaint, or data request related to this
Privacy Policy, contact us at:

> **N VoaWu Studio**
> Email: `elefnarin@gmail.com`
> Subject line: "Privacy"

We aim to respond to all privacy requests within 30 days.

### 5.18 Effective date

This Privacy Policy is effective as of **2026-01-15** and
supersedes all previous versions.

---

## 6. Terms of Service

**Effective date: 2026-01-15. Last updated: 2026-01-15.**

These Terms of Service ("Terms") govern your access to and use
of the N VoaWu Studio website at https://nvoawu.com (the
"Website") and every mobile application published by N VoaWu
Studio on Google Play or the Apple App Store (the "Apps"). The
Website and the Apps are collectively referred to as the
"Services". By installing, accessing, or using any of the
Services, you agree to these Terms. If you do not agree, please
do not install or use the Services.

### 6.1 Acceptance of terms

By installing an App, creating an account, or using the Website,
you confirm that you have read, understood, and agreed to these
Terms and to our Privacy Policy. If you are accepting these
Terms on behalf of an organization (for example, your employer),
you represent that you have the authority to bind that
organization, in which case "you" refers to that organization.

### 6.2 Eligibility & age

You must be at least the minimum age required by your
jurisdiction to use the Services: 16 in the EEA and the UK, 13
in the United States, and the higher of 13 or the local minimum
in every other market. If you are below the applicable minimum
age, you may use the Services only with the verifiable consent
of a parent or legal guardian. Parents and guardians who permit
a minor to use the Services are responsible for the minor's
use of the Services.

You represent that you are not located in a jurisdiction that
sanctions the use of the Services or that prohibits the use of
similar software, and that you are not on any list of denied
parties maintained by the United States, the European Union,
the United Kingdom, or any other applicable authority.

### 6.3 Account & license grants for the Apps

Subject to your acceptance of these Terms, N VoaWu grants you a
limited, non-exclusive, non-transferable, revocable license to
install and use the Apps on a device that you own or control,
solely for your personal, non-commercial use (or, for the
mobile management app, for the internal business use of the
organization that licensed it).

For free Apps, the license is royalty-free. For paid Apps or
in-app purchases, additional license terms apply as described
in Section 6.5. We may, at our sole discretion, distribute
updates, patches, and new versions of the Apps. These Terms
apply to all such updates unless the update is accompanied by
a separate license, in which case that separate license will
govern.

You may not sublicense, resell, lease, rent, or otherwise
commercially exploit the Apps. You may not reverse engineer,
decompile, or disassemble the Apps except to the extent that
such restriction is prohibited by applicable law.

### 6.4 Acceptable use

When using the Services, you agree not to:

- Use the Services for any unlawful purpose, or in violation
  of any applicable local, state, national, or international
  law or regulation.
- Impersonate any person or entity, or falsely state or
  otherwise misrepresent your affiliation with a person or
  entity.
- Interfere with or disrupt the Services, the servers or
  networks connected to the Services, or any security or
  authentication measure.
- Attempt to gain unauthorized access to any portion of the
  Services, other accounts, computer systems, or networks
  connected to the Services.
- Use any robot, spider, scraper, or other automated means
  to access the Services for any purpose without our prior
  written consent, or to bypass any technical measures we use
  to detect automated access.
- Upload or transmit viruses, malware, or any other type of
  malicious code, or any content that is infringing, defamatory,
  obscene, harassing, or otherwise objectionable.
- Use the Services in any way that could damage, disable,
  overburden, or impair the Services or interfere with any
  other party's use of the Services.
- Attempt to bypass, disable, or otherwise interfere with
  any advertising, frequency-capping, or revenue-protection
  mechanism in any of the Apps.

### 6.5 In-app purchases, subscriptions, virtual items, refunds

Some Apps offer in-app purchases, including one-time
purchases of virtual items, consumables, or permanent upgrades,
and recurring subscriptions. In-app purchases are processed
through the platform payment system — Google Play Billing for
Android, and Apple In-App Purchase for iOS. By initiating an
in-app purchase, you authorize the platform to charge your
linked payment method.

**Pricing.** Prices are displayed in the App and may vary by
country. Local taxes (VAT, GST, sales tax) are added at
checkout where applicable.

**Subscriptions.** Subscriptions automatically renew for the
same period at the then-current price unless you cancel at
least 24 hours before the end of the current period. You can
manage and cancel subscriptions from your Google Play or App
Store account settings.

**Virtual items.** Virtual items purchased in a game have no
real-world value, are non-transferable, and are not
redeemable for cash, except where required by applicable law.

**Free trials.** If a subscription includes a free trial, you
will be charged at the end of the trial unless you cancel
before the end of the trial. If you cancel during the trial,
you will not be charged.

**Refunds.** Refunds are handled by the platform — Google Play
or the App Store — and are subject to the platform's own
refund policy. We do not process refunds directly. Where
required by applicable law (for example, the EU Consumer
Rights Directive), you may withdraw from a digital purchase
within 14 days by contacting us at `elefnarin@gmail.com`
before downloading or streaming any digital content, or by
requesting deletion of the unused content.

### 6.6 Advertising rules

You acknowledge that the free Apps display advertising
served by Google AdMob and the ad mediation partners listed
in our Privacy Policy (Section 5.5), including but not
limited to:

- **Splash ads** (app-open format) at app launch.
- **Rewarded video ads** in exchange for in-app rewards.
- **Interstitial ads** at natural transition points.
- **Banner ads** at the top or bottom of the screen.

You agree to receive these ads as a condition of using the
free Apps. You agree not to:

- Use any ad-blocking, anti-ad, or developer-mode feature
  that bypasses, hides, or interferes with the display or
  measurement of ads.
- Tap, swipe, or interact with ads in any automated or
  fraudulent way (including "click injection" or "click
  flooding"), or encourage any third party to do so.
- Use the free Apps for the primary purpose of generating
  fraudulent ad impressions or clicks.

We may, at our sole discretion, limit or remove advertising
in exchange for a paid upgrade, a subscription, or any other
mechanism that we make available. The presence or absence of
ads in any App may change over time.

### 6.7 Intellectual property

The Services, including all source code, object code, design,
graphics, illustrations, mascots, copy, sound recordings,
musical compositions, and other content, are owned by N
VoaWu Studio or licensed from third parties and are protected
by copyright, trademark, and other intellectual property
laws.

The N VoaWu name, the N VoaWu logo, the studio mascots, and
the names of the Apps are trademarks of N VoaWu Studio. You
may not use these marks without our prior written consent,
except as permitted by applicable law (for example, to refer
to the Apps in good faith and without implying endorsement).

You retain all rights to the content you submit to the
Services (for example, support messages, photos uploaded
inside a management app, or community posts). You grant N
VoaWu a worldwide, non-exclusive, royalty-free, transferable
license to use, reproduce, modify, and display that content
solely to operate and improve the Services.

### 6.8 Third-party services & links

The Services may contain links to third-party websites,
applications, or services that we do not control, including
the Google Play Store, the Apple App Store, and the websites
of the ad partners listed in our Privacy Policy. We are not
responsible for the content, policies, or practices of any
third party. We encourage you to read the terms and privacy
policies of every third-party service you use.

### 6.9 App store specific terms

If you installed an App from the Apple App Store, the
following additional terms apply:

- **Apple Licensed Application End User License Agreement.**
  The license to use the App is the license set out in the
  Apple Licensed Application End User License Agreement
  ("LAEULA"), incorporated into these Terms by reference.
  In the event of any conflict between these Terms and the
  LAEULA, the LAEULA will control with respect to your use
  of Apps installed from the Apple App Store.
- **Apple Media Services Terms and Conditions.** Your
  purchase of any digital content, including in-app
  purchases and subscriptions, is governed by the Apple
  Media Services Terms and Conditions, available at
  https://www.apple.com/legal/internet-services/itunes/,
  incorporated by reference.
- **Apple as a third-party beneficiary.** Apple is a
  third-party beneficiary of these Terms and may enforce
  these Terms against you.

If you installed an App from Google Play, the following
additional terms apply:

- **Google Play Terms of Service.** Your use of Google Play
  is governed by the Google Play Terms of Service,
  available at
  https://play.google.com/intl/en_us/about/play-terms/,
  incorporated by reference.
- **Google Payments.** Your purchase of any digital content,
  including in-app purchases and subscriptions, is
  processed by Google Payments and is governed by the
  Google Payments Terms of Service, available at
  https://payments.google.com/terms/.

We are solely responsible for the Apps and their content,
and for addressing any claims by you or any third party
relating to the Apps or your use of them.

### 6.10 Disclaimers & warranties (AS-IS)

The Services are provided "AS IS" and "AS AVAILABLE", with
all faults and without warranty of any kind, express or
implied, including but not limited to warranties of
merchantability, fitness for a particular purpose,
non-infringement, and quiet enjoyment. Without limiting the
foregoing, we do not warrant that the Services will be
uninterrupted, error-free, secure, or free of viruses or
other harmful components, or that defects will be
corrected.

Some jurisdictions do not allow the exclusion of certain
warranties; in those jurisdictions, the exclusions above
apply to the maximum extent permitted by applicable law.

### 6.11 Limitation of liability

To the maximum extent permitted by applicable law, N VoaWu
Studio, its officers, directors, employees, agents, and
licensors will not be liable for any indirect, incidental,
special, consequential, or punitive damages, including
without limitation damages for loss of profits, revenue,
goodwill, use, data, or other intangible losses, resulting
from or related to your access to, use of, or inability to
use the Services, whether based on warranty, contract, tort
(including negligence), statute, or any other legal theory,
and whether or not we have been advised of the possibility
of such damages.

In any event, our aggregate liability for all claims
relating to the Services will not exceed the greater of (a)
the amount you paid us for the relevant Service in the 12
months preceding the claim, or (b) one hundred US dollars
(USD 100).

Nothing in these Terms excludes or limits our liability
for (a) death or personal injury caused by our negligence,
(b) fraud or fraudulent misrepresentation, or (c) any other
liability that cannot be excluded or limited by applicable
law.

### 6.12 Indemnification

You agree to defend, indemnify, and hold harmless N VoaWu
Studio, its officers, directors, employees, agents, and
licensors from and against any claim, demand, loss,
liability, damage, or expense (including reasonable
attorneys' fees) arising out of or related to (a) your use
of the Services, (b) your violation of these Terms, (c)
your violation of any applicable law, or (d) your
infringement of any third-party right, including any
intellectual property or privacy right.

### 6.13 Termination

We may terminate or suspend your license to use the Services
at any time, with or without cause, with or without notice,
including (without limitation) if we believe that you have
violated these Terms. Upon termination, your right to use
the Services will cease immediately, and you must uninstall
the Apps and destroy any copies in your possession.

You may terminate these Terms at any time by uninstalling
the Apps and discontinuing your use of the Services.
Sections 6.7, 6.10, 6.11, 6.12, 6.14, and 6.15 will survive
any termination.

### 6.14 Governing law & jurisdiction

These Terms are governed by and construed in accordance
with the laws of the jurisdiction of your habitual
residence, to the extent that those laws provide mandatory
consumer protections, and otherwise by the laws of France,
without giving effect to any conflict-of-law rules.

- **EU/EEA consumers.** If you are a consumer residing in
  the European Economic Area, the mandatory consumer
  protection laws of your country of residence apply.
  Any dispute will be brought before the competent court
  of your country of residence, or before the courts of
  France at our election.
- **UK consumers.** If you are a consumer residing in the
  United Kingdom, the mandatory consumer protection laws
  of the United Kingdom apply. Any dispute will be
  brought before the competent court of your country of
  residence, or before the courts of England and Wales
  at our election.
- **US consumers.** If you are a consumer residing in the
  United States, the laws of the state of your habitual
  residence apply to the extent that they provide
  mandatory consumer protections. Otherwise, the laws of
  the State of Delaware apply, without regard to
  conflict-of-law rules. The federal and state courts
  located in Delaware have exclusive jurisdiction, except
  as required by applicable consumer-protection law.
- **Canadian consumers.** If you are a consumer residing
  in Canada, the laws of the province of your habitual
  residence apply, and any dispute will be brought before
  the competent court of that province.
- **Australian consumers.** If you are a consumer residing
  in Australia, the Australian Consumer Law applies. Any
  dispute will be brought before the competent court of
  your state or territory.

### 6.15 Dispute resolution & arbitration

We will try to resolve any dispute informally first. If you
believe you have a dispute with us, please contact us at
`elefnarin@gmail.com` with the subject line "Dispute". We
will try to respond within 30 days.

For consumers in the EU/EEA, the UK, and other jurisdictions
that require it, you may also use the European Commission's
Online Dispute Resolution platform
(https://ec.europa.eu/consumers/odr/) to file a complaint.

For consumers in the United States, any dispute that cannot
be resolved informally will be resolved by binding
arbitration administered by the American Arbitration
Association under its Consumer Arbitration Rules. The
arbitration will be held in the state of your habitual
residence, or by videoconference if you prefer. You and we
each waive the right to a jury trial and to participate in
a class action. Nothing in this section prevents you from
bringing an individual action in a small-claims court of
competent jurisdiction.

### 6.16 Changes to terms

We may update these Terms from time to time. When we do, we
will revise the "Last updated" date at the top of this page,
post a notice in our apps for at least 30 days, and, for
material changes, request renewed acceptance where
required by applicable law. Your continued use of the
Services after the effective date of the updated Terms
constitutes acceptance of the changes.

### 6.17 Severability

If any provision of these Terms is held to be invalid,
illegal, or unenforceable, that provision will be severed
from these Terms, and the remaining provisions will remain
in full force and effect. The severed provision will be
replaced by a valid, legal, and enforceable provision that
most closely reflects the original intent.

### 6.18 Contact

For any question, complaint, or request related to these
Terms, contact us at:

> **N VoaWu Studio**
> Email: `elefnarin@gmail.com`
> Subject line: "Terms"

### 6.19 Effective date

These Terms of Service are effective as of **2026-01-15**
and supersede all previous versions.

---

## 7. SEO Plan

### 7.1 Primary keyword cluster

The studio's site is optimized for the following primary
keyword cluster:

- `indie game studio` — for the studio and team narrative.
- `casual mobile games` — for the consumer-games arm.
- `mobile app development studio` — for the custom-development arm.
- `mobile management app` — for the management-suite arm.

These four primary terms are the highest-level descriptors
of the studio's offer; every page reinforces at least two
of them, and the home page reinforces all four.

### 7.2 Long-tail keywords (~20)

The following long-tail variants are used across headings,
copy, image alt text, and structured data:

1. `indie game studio Europe`
2. `casual mobile games for Android and iOS`
3. `mobile app development studio for startups`
4. `mobile management app for field teams`
5. `white-label management app for small business`
6. `single-player casual games no internet required`
7. `mobile games with no in-app purchase pressure`
8. `weather app that explains itself in plain language`
9. `focus timer app with no subscription`
10. `field reporting app with offline sync`
11. `mobile app studio Eleven languages`
12. `cross-platform app development iOS Android`
13. `mobile app localization in 11 languages`
14. `mobile management app with role based access`
15. `indie app studio Germany`
16. `mobile management app GDPR compliant`
17. `mobile app studio senior team only`
18. `casual games for coffee breaks`
19. `mobile app studio European English speaking`
20. `app development studio for co publishing`

These are surfaced in: page H1/H2 copy, alt text, the
`description` meta tag, FAQ entries, schema.org
descriptions, and the press section. They are not keyword-
stuffed — they appear only where they fit naturally.

### 7.3 Open Graph and Twitter Card values

The site uses the following Open Graph and Twitter Card
metadata, served from every page. Replace the placeholders
with the final generated asset filenames after the build.

```html
<meta property="og:site_name" content="N VoaWu Studio" />
<meta property="og:locale" content="en_US" />
<meta property="og:locale:alternate" content="en_GB" />
<meta property="og:locale:alternate" content="fr_FR" />
<meta property="og:locale:alternate" content="de_DE" />
<meta property="og:type" content="website" />
<meta property="og:title" content="N VoaWu Studio — Indie Mobile Apps & Management Suite" />
<meta property="og:description" content="Independent studio building casual games, everyday utility apps, and a mobile management suite. Published on Google Play and the App Store for users worldwide." />
<meta property="og:url" content="https://nvoawu.com/" />
<meta property="og:image" content="https://nvoawu.com/images/og/home-1200x630.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta property="og:image:alt" content="N VoaWu Studio logo with the arctic-fox mascot" />

<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@nvoawu" />
<meta name="twitter:creator" content="@nvoawu" />
<meta name="twitter:title" content="N VoaWu Studio — Indie Mobile Apps & Management Suite" />
<meta name="twitter:description" content="Independent studio building casual games, everyday utility apps, and a mobile management suite." />
<meta name="twitter:image" content="https://nvoawu.com/images/og/home-1200x630.png" />
<meta name="twitter:image:alt" content="N VoaWu Studio logo with the arctic-fox mascot" />
```

The Services and Contact pages override only `og:url`,
`og:title`, `og:description`, and `og:image` (e.g.
`/images/og/services-1200x630.png` and
`/images/og/contact-1200x630.png`).

### 7.4 Schema.org JSON-LD blocks

The site emits the following JSON-LD blocks. The
placeholder URLs use absolute paths starting with
`https://nvoawu.com/`.

**Organization** (in the global `<head>` of every page):

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "N VoaWu Studio",
  "url": "https://nvoawu.com/",
  "logo": "https://nvoawu.com/images/logo/nvoawu-logo-512.png",
  "description": "Independent European studio building casual games, everyday utility apps, and a mobile management suite.",
  "email": "elefnarin@gmail.com",
  "sameAs": [
    "https://twitter.com/nvoawu",
    "https://www.linkedin.com/company/nvoawu",
    "https://github.com/elefnarin-ship-it",
    "https://www.youtube.com/@nvoawu"
  ]
}
```

**WebSite** (home page only, with `SearchAction` left out
because there is no site search yet):

```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "N VoaWu Studio",
  "url": "https://nvoawu.com/",
  "inLanguage": "en",
  "publisher": {
    "@type": "Organization",
    "name": "N VoaWu Studio",
    "url": "https://nvoawu.com/"
  }
}
```

**MobileApplication** (one block per app, on the Services
and Home pages where the app is mentioned):

```json
{
  "@context": "https://schema.org",
  "@type": "MobileApplication",
  "name": "Pocket Meteorology",
  "operatingSystem": "ANDROID, IOS",
  "applicationCategory": "WeatherApplication",
  "description": "A weather app that explains itself, in plain language, in 11 languages.",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  },
  "installUrl": [
    "https://play.google.com/store/apps/details?id=com.nvoawu.pocketmeteorology",
    "https://apps.apple.com/app/id000000000"
  ],
  "image": "https://nvoawu.com/images/apps/pocket-meteorology-512.png",
  "publisher": {
    "@type": "Organization",
    "name": "N VoaWu Studio",
    "url": "https://nvoawu.com/"
  }
}
```

**FAQPage** (Services page only, derived from the FAQ
entries in Section 3.6):

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Where is the studio based?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "We are a remote-first European studio. Our team is distributed across the EU, the UK, and Canada, with working hours in CET."
      }
    },
    {
      "@type": "Question",
      "name": "Do you sign NDAs?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes — we sign mutual NDAs before any discovery work."
      }
    },
    {
      "@type": "Question",
      "name": "Can you take over an existing codebase?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Usually yes. We start with a two-week code audit and produce a written handover plan."
      }
    },
    {
      "@type": "Question",
      "name": "What is your typical project size?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Consumer apps: 4–9 months end-to-end. Mobile management deployments: 6–12 weeks. Maintenance: rolling, monthly."
      }
    },
    {
      "@type": "Question",
      "name": "Do you build for both stores?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes — every consumer release is shipped to Google Play and the App Store in parallel."
      }
    },
    {
      "@type": "Question",
      "name": "How do you handle data residency?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "EU customers can opt into an EU-only data path. See our Privacy Policy for the regional breakdown."
      }
    }
  ]
}
```

**BreadcrumbList** (every non-home page):

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://nvoawu.com/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Services",
      "item": "https://nvoawu.com/services.html"
    }
  ]
}
```

### 7.5 robots.txt

The site ships a top-level `robots.txt` that allows full
crawling of the public site and points to the sitemap:

```
# robots.txt — https://nvoawu.com/
User-agent: *
Allow: /

# Disallow the empty placeholder pages
Disallow: /press.html

# Sitemap
Sitemap: https://nvoawu.com/sitemap.xml
```

The app-ads.txt file (required by Google AdMob) is also
served from the root of the domain. The placeholder line
below is replaced with the publisher ID after registration:

```
# app-ads.txt
google.com, pub-0000000000000000, DIRECT, f08c47fec0942fa0
```

### 7.6 sitemap.xml

The site ships a `sitemap.xml` that lists every public
page. The `<lastmod>` values are updated whenever a page
changes, and `<changefreq>` is set to `monthly` for the
public marketing pages and `yearly` for the legal pages.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://nvoawu.com/</loc>
    <lastmod>2026-01-15</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://nvoawu.com/services.html</loc>
    <lastmod>2026-01-15</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://nvoawu.com/contact.html</loc>
    <lastmod>2026-01-15</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://nvoawu.com/privacy.html</loc>
    <lastmod>2026-01-15</lastmod>
    <changefreq>yearly</changefreq>
    <priority>0.4</priority>
  </url>
  <url>
    <loc>https://nvoawu.com/terms.html</loc>
    <lastmod>2026-01-15</lastmod>
    <changefreq>yearly</changefreq>
    <priority>0.4</priority>
  </url>
</urlset>
```

### 7.7 Technical SEO checklist

The implementation must satisfy the following rules to
remain crawlable and indexable:

- Every page has a unique `<title>` and a unique
  `<meta name="description">`.
- The home page is served at `/` (no `index.html` in the
  URL — see SPEC).
- All internal links use descriptive anchor text, not
  "click here".
- Every image has an `alt` attribute. Decorative images
  use `alt=""`.
- Every page has a single `<h1>`.
- Heading levels are sequential (`h1` → `h2` → `h3`),
  with no skipped levels.
- The site is served over HTTPS (the GitHub Pages
  custom domain already points `nvoawu.com` to the
  secure endpoint).
- The site renders fully without JavaScript (a noscript
  path is provided for the count-up animation on the
  statistics row).
- A `link rel="canonical"` element is present on every
  page, pointing to the absolute URL of the page.
- The `lang` attribute on `<html>` is `en`.
- A `viewport` meta tag is present on every page for
  mobile rendering.
- The `og:image` PNG is at least 1200×630 and weighs
  under 1 MB.
- The site is submitted to Google Search Console and
  Bing Webmaster Tools with the sitemap URL.

---

## 8. Asset Brief for the UI Agent

This brief is the contract between PM and UI. The UI build
must satisfy every item below. Nothing here is optional.

### 8.1 Brand color direction

The site is positioned as a **BMW-class premium brand
site with warm mascots** — the visual language must read as
confident, automotive, and crafted, but never cold. The
palette below is the baseline; the UI may add up to two
derived accent colors per section.

- **Primary (deep ink).** `#0E1422` — used for body
  text, primary surfaces in dark mode, and the primary
  brand mark.
- **Primary tint (midnight blue).** `#1A2540` — used for
  primary buttons, the top navigation bar, and large
  surface panels.
- **Accent (premium copper).** `#C77B3C` — used as the
  primary accent for CTAs, hover states, and key
  highlights. Calibrated to read as warm and crafted,
  not loud.
- **Accent tint (soft sand).** `#E6D6B8` — used for
  secondary fills, banner backgrounds, and the
  "secondary CTA" outlined button.
- **Highlight (signal green).** `#3FAE7B` — used
  sparingly for success states and the "live" dot
  in the studio status indicator.
- **Neutral 100.** `#FFFFFF` — primary background in
  light mode.
- **Neutral 050.** `#F6F4EF` — soft section background
  (warm off-white) for alternating sections.
- **Neutral 200.** `#E5E1D6` — borders, dividers, and
  the soft outline of cards.
- **Neutral 700.** `#3B3F4A` — secondary body text.
- **Neutral 900.** `#0E1422` — primary body text
  (same as Primary).

The dark mode palette mirrors the above with the neutrals
inverted and the copper accent preserved.

### 8.2 Mascot list

The studio ships **five mascots** in the initial release.
Each mascot is delivered as a 1024×1024 PNG portrait plus a
clean SVG line version for animation. The personality and
visual brief below must be respected.

1. **Frosti the Arctic Fox.**
   - Personality: lead mascot, curious, clever, slightly
     mischievous, the one who tests every experiment.
   - Visual: white-and-pale-grey fox with ice-blue eyes,
     wearing a small racing helmet and a tiny scarf.
     Tail is slightly fluffy and S-curved.
   - Primary use: hero animation, app store icon for
     Pocket Meteorology, all marketing splash screens.

2. **Pepper the Hedgehog.**
   - Personality: captain of the casual-games line,
     impatient with tutorials, loyal to the player.
   - Visual: deep brown-and-cream hedgehog with a
     checkered scarf. Slightly sleepy eyes. Often
     shown holding a controller.
   - Primary use: the Games category card, the
     Foxglove Solitaire store-listing key art.

3. **Maple the Red Panda.**
   - Personality: manager of the management suite,
     organized, keeps the queue tidy, slightly
     obsessive about labels.
   - Visual: rusty-red panda with cream face markings
     and a small clipboard. Sits upright.
   - Primary use: the FieldKeeper key art, the
     "Mobile management suite" section illustration.

4. **Sage the Barn Owl.**
   - Personality: localization lead, calm, observant,
     "speaks eleven languages and a couple of bird
     calls."
   - Visual: cream-and-tan barn owl with round
     spectacles, perched on a stack of books.
   - Primary use: the localization explainer illustration
     on the Services page, the press kit "studio" photo.

5. **Biscuit the Otter.**
   - Personality: QA in chief, will find the one bug
     you missed, joyful about it, holds a magnifying
     glass.
   - Visual: warm-brown otter, slightly damp, holding
     a small round magnifier, lying on its back in
     water.
   - Primary use: the "Why N VoaWu" row icon, the
     release-notes illustration, the footer
     "studio online" indicator.

### 8.3 Icon set (16–20 SVG icons)

The site uses an inline-SVG icon set, stroke-based at 1.5
px on a 24×24 grid, with a slightly rounded geometric feel
(influence: Lucide / Phosphor, with a BMW-style optical
precision). The initial set is:

1. `i-game` — gamepad silhouette
2. `i-utility` — wrench and screwdriver crossed
3. `i-mobile` — smartphone outline
4. `i-cloud` — cloud outline
5. `i-globe` — globe with grid
6. `i-shield` — shield with check
7. `i-spark` — four-point star
8. `i-arrow-right` — arrow right
9. `i-arrow-up-right` — arrow up-right (external link)
10. `i-mail` — envelope
11. `i-clock` — clock face
12. `i-pin` — map pin
13. `i-check` — check
14. `i-x` — close
15. `i-menu` — hamburger menu
16. `i-search` — magnifier
17. `i-twitter` — Twitter / X glyph
18. `i-linkedin` — LinkedIn glyph
19. `i-github` — GitHub glyph
20. `i-youtube` — YouTube glyph

All icons are stroke-only, currentColor, and meet WCAG
2.1 AA contrast against their backgrounds.

### 8.4 Hero and section illustration brief

The hero and section illustrations are PNGs generated at
2× and 3× density, with a transparent or soft-sand
background. The brief is:

- **Hero illustration.** Frosti the Arctic Fox, full body,
  three-quarter view, on a subtle radial-gradient
  soft-sand backdrop. Fox waves; tail and scarf sway in
  a slow loop. PNG at 1536×1024, with a parallel SVG
  for parallax. No hard outlines; the linework lives in
  the SVG version. The PNG ships a baked-in
  drop-shadow.

- **What we do — three-feature illustration.** Three small
  flat illustrations, 320×320 each:
  1. A floating gamepad with a tiny star burst
     (games).
  2. A smartphone with a checklist on its screen
     (utility).
  3. A clip-board with a magnifying glass and a small
     compass rose (management).

- **Mobile apps & management suite illustration.** A
  wide 1280×640 PNG showing a phone on the left
  (consumer app), a phone on the right (FieldKeeper
  dashboard), with a stylized dotted "sync" curve
  between them. Pepper and Maple appear as
  half-characters on the right edge of each phone.

- **Our apps — app icon set.** Six app icons, 512×512
  each, transparent PNG. Each icon is a rounded square
  with a unique geometric mark in the studio palette,
  and a tiny mascot paw print in the lower-right
  corner.

- **Why N VoaWu — six value illustrations.** Six
  160×160 PNGs, one per bullet, with a one-color
  glyph on a soft-sand circle. The glyph matches the
  bullet's `i-` icon from the icon set, with a
  friendly detail (a wagging tail, a small star, etc.).

- **Studio mascots — five portraits.** 1024×1024 PNGs
  (per Section 8.2) on a soft-sand backdrop, plus a
  clean SVG line version for inline use.

- **Closing CTA / newsletter illustration.** A
  720×480 PNG of Frosti holding an envelope, with a
  small stack of newsletters at his feet.

- **App store badges.** Two official badges
  (`google-play-badge` and `app-store-badge`),
  delivered as SVG, scaled to 180×54 each. They are
  not modified.

### 8.5 Animation direction

The site must feel alive without being noisy. The
following motions are required:

- **Hero.** Frosti waves on load (3s loop, ease-in-out).
  Tail and scarf sway on mouse-move parallax (max 8 px
  offset).
- **What we do cards.** Fade-in + 8 px translateY on
  scroll into view, staggered 80 ms per card.
- **Our apps grid.** Same fade-in + translateY
  stagger, 100 ms per card.
- **Statistics row.** Count-up animation on scroll into
  view, 1.6 s ease-out, target values from the
  `data-target` attributes in Section 2.7. A
  `prefers-reduced-motion: reduce` media query disables
  all non-essential motion.
- **Closing CTA.** Frosti envelope illustration
  gently bobs (3 px vertical, 4 s loop).
- **All CTAs.** Hover transitions: 200 ms ease-out,
  background color shift, 1.02 scale, no layout shift.
- **Mascot portraits on the mascots section.** Slight
  parallax tilt (max 3 degrees) on mouse-move.

No auto-playing audio. No parallax that requires
gyroscope. No animation that runs longer than 4 s in
a loop.

### 8.6 Typography

- **Display / headings.** Inter, weight 700, with a
  tight tracking (-0.02em) on H1/H2.
- **Body.** Inter, weight 400, line-height 1.6.
- **Mono / code.** JetBrains Mono, weight 400 (used
  only on the legal pages and the developer
  references in this spec).

The font stack:

```css
--font-display: "Inter", "Helvetica Neue", Arial, sans-serif;
--font-body:    "Inter", "Helvetica Neue", Arial, sans-serif;
--font-mono:    "JetBrains Mono", ui-monospace, SFMono-Regular, monospace;
```

### 8.7 Accessibility checklist

- WCAG 2.1 AA contrast for all text and interactive
  elements.
- Keyboard navigation for every interactive element
  (focus ring visible, logical tab order).
- ARIA labels on all icon-only buttons.
- `prefers-reduced-motion: reduce` disables all
  non-essential motion.
- Form fields have visible labels (not just
  placeholders) and error messages are announced via
  `aria-live="polite"`.
- All images have meaningful `alt` text or `alt=""`
  for purely decorative ones.

### 8.8 File delivery checklist (for the UI build)

The UI agent must deliver the following structure at the
project root:

- `index.html` (Home, served at `/`)
- `services.html`
- `contact.html`
- `privacy.html`
- `terms.html`
- `robots.txt`
- `sitemap.xml`
- `app-ads.txt`
- `css/styles.css`
- `css/animations.css`
- `css/responsive.css`
- `js/main.js`
- `js/animations.js`
- `js/count-up.js`
- `js/form-validation.js`
- `images/logo/nvoawu-logo.svg` (vector)
- `images/logo/nvoawu-logo-512.png`
- `images/og/home-1200x630.png`
- `images/og/services-1200x630.png`
- `images/og/contact-1200x630.png`
- `images/mascots/frosti.png` (1024×1024)
- `images/mascots/frosti.svg`
- `images/mascots/pepper.png` (1024×1024)
- `images/mascots/pepper.svg`
- `images/mascots/maple.png` (1024×1024)
- `images/mascots/maple.svg`
- `images/mascots/sage.png` (1024×1024)
- `images/mascots/sage.svg`
- `images/mascots/biscuit.png` (1024×1024)
- `images/mascots/biscuit.svg`
- `images/apps/pocket-meteorology-512.png`
- `images/apps/foxglove-solitaire-512.png`
- `images/apps/tidy-tray-512.png`
- `images/apps/tiny-trails-512.png`
- `images/apps/fieldkeeper-512.png`
- `images/apps/loom-calm-512.png`
- `images/hero/hero-frosti.png` (1536×1024)
- `images/hero/hero-frosti.svg`
- `images/sections/what-we-do-1.png` (320×320)
- `images/sections/what-we-do-2.png` (320×320)
- `images/sections/what-we-do-3.png` (320×320)
- `images/sections/mobile-and-mgmt-1280x640.png`
- `images/sections/newsletter-frosti.png` (720×480)
- `images/badges/google-play-badge.svg`
- `images/badges/app-store-badge.svg`

The UI agent is also responsible for the GitHub Pages
deployment, the HTTPS setup, and the `app-ads.txt`
content (the AdMob publisher ID will be provided by
the studio after registration).

---

*End of CONTENT.md — v1.0 — for the N VoaWu Studio
website project. PM sign-off required before any
external copy release.*
