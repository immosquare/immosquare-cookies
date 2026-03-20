## [2.0.5] - 2026-03-20

### Changed
- **SCSS**: replaced Sass `color.adjust()` with native CSS `color-mix()`, removing the Dart Sass compiler requirement
- Removed unused CSS custom properties (`--immosquare-cookies-primary`, `--immosquare-cookies-secondary`)

## [2.0.4] - 2026-03-20

### Added
- Google Consent Mode v2: calls `gtag('consent', 'update', ...)` on accept/refuse with the 4 required signals (`analytics_storage`, `ad_storage`, `ad_user_data`, `ad_personalization`)

## [2.0.3] - 2026-02-20

### Fixed
- Turbo Drive compatibility: replaced `DOMContentLoaded` with an IIFE (Turbo replaces the `<body>` without re-firing the event)

## [2.0.2] - 2026-02-20

### Added
- Polish locale (`pl`)

### Fixed
- **Critical fix**: typo in `immosquare-cookies.en.yml` (`n:` → `en:`) — English locale was broken since 2.0.0

## [2.0.1] - 2025-10-28

### Changed
- **SCSS**: migrated to the new Sass module API (`@use "sass:color"` + `color.adjust()` instead of `darken()`) for Sass 3.x / Dart Sass 2.0 compatibility

## [2.0.0] - 2025-08-28

### Breaking Changes
- Removed `link` parameter, replaced by `privacy_policy_link` and `cookie_policy_link`
- Complete CSS redesign with modern card-based layout and shadows
- New responsive breakpoints

### Added
- `cookies_to_remove` parameter to automatically delete specified cookies on refuse
- Complex domain support (.co.uk, .gouv.fr, etc.) for cookie removal
- Dual removal via `expires` and `Max-Age=0` for browser compatibility
- Fixed JSON parsing of the `cookies_to_remove` array in JavaScript
- CSS custom properties for easy theming

### Migration
- Replace `link:` with `privacy_policy_link:` and `cookie_policy_link:`
- Review custom CSS overrides (classes and structure changed)

## [0.1.8] - 2025-08-28
- Update design for consent banner
- add new variables : duration_months & privacy_policy_link & cookie_policy_link

## [0.1.7] - 2025-08-28
- Update style, text and readme for consent banner

## [0.1.7] - 2025-06-18
- Add Traditional Chinese localization support

## [0.1.6] - 2024-07-15
- Improve css to avoid sass DEPRECATION WARNING

## [0.1.5] - 2023-09-22
- Change legals text

## [0.1.4] - 2023-09-22
- Add default text color

## [0.1.3] - 2023-09-22
- Add new locales : en, es, it, nl, zh

## [0.1.2] - 2023-09-22
- Add transparency to background-color

## [0.1.1] - 2023-09-22
- Remove all cookies and reload page if refuse

## [0.1.0] - 2023-09-22
- Initial release
