# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Ruby gem called `immosquare-cookies` v2.0.0 that provides a modern, customizable GDPR-compliant cookie consent banner for Rails applications. It's designed as a Rails Engine with advanced cookie management capabilities and a modern responsive design.

## Architecture

The gem follows the standard Rails Engine pattern:

- **Engine**: `lib/immosquare-cookies/engine.rb` - Main Rails Engine class
- **Main Module**: `lib/immosquare-cookies.rb` - Entry point that loads the engine
- **Version**: `lib/immosquare-cookies/version.rb` - Gem version (currently 2.0.0)
- **View Partial**: `app/views/immosquare-cookies/_consent_banner.html.erb` - The main cookie banner template
- **Stylesheet**: `app/assets/stylesheets/immosquare-cookies.scss` - Banner styling with CSS custom properties
- **Localization**: `config/locales/` - Translation files for 7 languages (en, fr, es, it, nl, zh, zh-TW)

## Key Components

### Cookie Banner (`_consent_banner.html.erb`)
- Renders a fixed-position banner at bottom-left of screen
- **Smart cookie management**: Automatically removes specified cookies when consent is refused
- Configurable options: duration, links, text, styling, cookies to remove
- JavaScript handles user consent and advanced cookie cleanup
- Shows only when consent cookie is not set
- Supports separate privacy policy and cookie policy links
- JSON parsing for `cookies_to_remove` array parameter

### Styling (`immosquare-cookies.scss`)
- Uses CSS custom properties for theming
- Responsive design with mobile breakpoints
- Modern card-based design with shadows and transitions
- SCSS with nested selectors and functions

### Internationalization
The gem supports 7 languages with complete translation keys:
- `document_title` - Banner header
- `refuse`/`accept` - Button labels  
- `text` - Main banner content (supports `%{duration_months}` interpolation)
- `link_text`, `privacy_policy`, `cookie_policy` - Link texts

## Development Commands

**Gem Development:**
```bash
# Install dependencies
bundle install

# Build gem
gem build immosquare-cookies.gemspec

# Install locally built gem
gem install immosquare-cookies-0.1.8.gem
```

**Integration Commands (for Rails apps using this gem):**
```bash
# Add to Gemfile
gem "immosquare-cookies"

# Install
bundle install

# For Rails 5: Add to application.css
*= require immosquare-cookies

# For Rails 6+: Use with cssbundling-rails
# Set up compile_sass.rb script as documented in README
```

## Usage in Rails Applications

The gem is used by rendering the partial in layouts or views:

```ruby
<%= render("immosquare-cookies/consent_banner") %>

# With custom options
<%= render("immosquare-cookies/consent_banner", 
    duration_months: 3,
    privacy_policy_link: "https://example.com/privacy",
    cookie_policy_link: "https://example.com/cookies") %>
```

## Configuration Options

The banner accepts these parameters:
- `key`: Cookie name (default: "_immosquare_consented")
- `duration_months`: Cookie duration 1-12 months (default: 6)  
- `site_name`: Display name (default: request.host)
- `text`, `refuse`, `accept`: Custom button/text labels
- `privacy_policy_link`, `cookie_policy_link`: External links
- `cookies_to_remove`: Array of cookie names to remove on refusal (default: [])
- `target`: Link target (default: "_blank")

### Breaking Changes in v2.0.0
- `link` parameter removed → replaced with `privacy_policy_link` and `cookie_policy_link`
- Complete design overhaul with new CSS
- New `cookies_to_remove` functionality for automatic cookie cleanup

## Important Notes

- No test framework is configured - this is a simple gem with minimal logic
- Uses `immosquare-cleaner` and `ruby-lsp` for development  
- Compatible with Ruby >= 2.6.0
- Designed to work with Rails asset pipeline or modern bundling systems
- JavaScript is embedded directly in the ERB template for simplicity