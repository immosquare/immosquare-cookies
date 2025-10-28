# [2.0.0] - 2025-10-28
- update sass function for sass 3.x compatilibty

## [2.0.0] - 2025-01-01

### Breaking Changes
- **BREAKING**: Removed `link` parameter, replaced with `privacy_policy_link` and `cookie_policy_link`
- **BREAKING**: Complete CSS redesign with new modern aesthetics
- **BREAKING**: New responsive breakpoints and layout changes

### New Features
- **Smart Cookie Management**: Added `cookies_to_remove` parameter to automatically remove specified cookies when consent is refused
- **Enhanced Domain Support**: Cookie removal now works with complex domains (.co.uk, .gouv.fr, etc.)
- **Improved Browser Compatibility**: Uses both `expires` and `Max-Age=0` for reliable cookie removal
- **Better JSON Parsing**: Fixed array parameter handling in JavaScript
- **Modern Responsive Design**: Complete visual overhaul with card-based layout and subtle shadows

### Technical Improvements
- Fixed critical bug in JSON parsing for `cookies_to_remove` array
- Enhanced cookie cleanup with multiple domain variations
- Improved accessibility and mobile experience
- Zero external JavaScript dependencies
- CSS custom properties for easy theming

### Migration
- See [docs/2.0-Upgrade.md](docs/2.0-Upgrade.md) for complete migration guide
- Update `link:` parameter to `privacy_policy_link:` and `cookie_policy_link:`
- Review custom CSS overrides due to design changes

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
