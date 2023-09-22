# IMMO SQUARE Cookies Consent Banner
Easily integrate a customizable cookie consent banner in your Ruby on Rails application.

## 🌍 Available Languages

The gem is available in the following languages:
- 🇫🇷 French (fr)
- 🇬🇧 English (en)
- 🇪🇸 Spanish (es)
- 🇳🇱 Dutch (nl)
- 🇮🇹 Italian (it)
- 🇨🇳 Simplified Chinese (zh)

---

## 🚀 Installation

Ensure you have the compatible versions of Ruby and Rails before installation.

Add the following line to your `Gemfile`:

```bash
gem "immosquare-cookies"
```

Then run:

```bash
bundle install
```

---

## 🎨 Styles Integration

For proper styling, include the `immosquare-cookies.scss` stylesheet. Depending on your Rails version, the way to include it varies:

### Rails 5

Add to your application's CSS manifest (usually `application.css`):

```css
*= require immosquare-cookies
```

### Rails 6 and Above

Make sure that SASS has access to all of Rails' assets (`Rails.application.config.assets`). Set it up using [cssbundling-rails](https://github.com/rails/cssbundling-rails):

1. In the script section of `package.json`, invoke:

```json
"scripts": {
    ...
    "build:css": "ruby datas/compile_sass.rb",
    "build:css-dev": "ruby datas/compile_sass.rb development"
}
```

2. Place the Ruby script, `data/compile_sass.rb`, in the appropriate directory:

```ruby
[...]
```

3. Update your `Procfile`:

```plaintext
puma:     bundle exec puma -C config/puma/development.rb
sidekiq:  bundle exec sidekiq -e development
css:      bun build:css-dev
js:       bun build-dev --watch
```

---

## 🛠 Usage

Display the consent banner by adding to your application layout or specific view:

```ruby
<%= render("immosquare-cookies/consent_banner") %>
```

Or with a link:

```ruby
<%= render("immosquare-cookies/consent_banner", :link => "https://legals.immosquare.com") %>
```

**Tip:** Check out a preview of the banner [here](#). *(Replace `#` with an actual link to an image or a live preview.)*

---

## Customization

Customize the banner's appearance and text using these options:

Option | Default | Description
------|---------|------------
`:key`| "_immosquare_consented" | Cookie name storing the user's decision.
`:document_name` | Localized string | Title at the banner's top.
`:refuse` | Localized string | "Refuse" button text.
`:accept` | Localized string | "Accept" button text.
`:text` | Localized string | Banner's content text.
`:link` | - | URL for the cookie/privacy policy document.
`:link_text` | Localized string | Text displayed before the link.
`:target` | "_blank" | Link's target, e.g., "_blank" for a new tab.

---

## Internationalization

This gem is i18n-ready. If you don't pass custom text, it will use default translations. Customize translations by adding the appropriate keys to your app's localization files.

---

## Support & Contribution

For bugs or feature requests, open an issue on [GitHub](#). *(Replace `#` with a link to your gem's GitHub repository issues page.)*

---

## License

This gem is under the [MIT License](https://opensource.org/licenses/MIT).
