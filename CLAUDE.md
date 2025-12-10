# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`immosquare-cookies` is a Ruby gem providing a GDPR-compliant cookie consent banner for Rails applications. It's a Rails Engine with multi-language support and automatic cookie cleanup on refusal.

## Development Commands

```bash
bundle install                           # Install dependencies
gem build immosquare-cookies.gemspec     # Build gem
gem install immosquare-cookies-*.gem     # Install locally built gem
```

## Architecture

Standard Rails Engine pattern:
- `lib/immosquare-cookies/engine.rb` - Rails Engine class
- `app/views/immosquare-cookies/_consent_banner.html.erb` - Main partial with embedded JavaScript
- `app/assets/stylesheets/immosquare-cookies.scss` - SCSS with CSS custom properties
- `config/locales/` - Translation files (en, fr, es, it, nl, zh, zh-TW)

### Key Implementation Details

**Conditional Rendering**: The banner only renders when `cookies[cookie_name].blank?` - see the `if` condition at end of `_consent_banner.html.erb:92`.

**Cookie Removal**: When consent is refused, JavaScript iterates through `cookies_to_remove` array and deletes cookies across multiple domain variations (current domain, `.example.com`, `.example.co.uk`).

**Parameter Handling**: Uses Ruby's `defined?()` to check if local variables are passed to the partial, with sensible defaults.

## Configuration Options

| Parameter | Default | Description |
|-----------|---------|-------------|
| `key` | `"_immosquare_consented"` | Cookie name for consent storage |
| `duration_months` | `6` | Cookie duration (1-12 months) |
| `site_name` | `request.host` | Display name in banner |
| `cookies_to_remove` | `[]` | Cookies to delete on refusal |
| `privacy_policy_link` | `nil` | Privacy policy URL |
| `cookie_policy_link` | `nil` | Cookie policy URL |
| `text`, `refuse`, `accept` | Localized | Override button/text labels |

## Notes

- No test framework - minimal logic gem
- JavaScript embedded in ERB for zero external dependencies
- SCSS uses `@use "sass:color"` for color manipulation
- Compatible with Ruby >= 2.6.0