# IMMO SQUARE Cookies Consent Banner

This gem provides a simple and customizable way to display a cookie consent banner on your Ruby on Rails application.

## Installation

```bash
gem 'immosquare-cookies'
```

Then run `bundle install`.

## Usage

To display the consent banner, add the following code to your application layout or a specific view:

```ruby
<%= render("immosquare-cookies/consent_banner", :link => "https://legals.immosquare.com") %>
```

## Customization

You can customize the banner's appearance and text by passing various locals to the `render` call. Below are the available options:

- `:key` - Specifies the cookie name used to store the user's decision. Defaults to "_immosquare_consented".
- `:document_name` - The title displayed at the top of the banner. Defaults to a localized string.
- `:refuse` - Text for the "Refuse" button. Defaults to a localized string.
- `:accept` - Text for the "Accept" button. Defaults to a localized string.
- `:text` - Content text of the banner. Defaults to a localized string.
- `:link` - URL for the associated cookie or privacy policy document.
- `:link_text` - Text to display before the actual link. Defaults to a localized string.
- `:target` - Specifies the target for the link, e.g. "_blank" to open in a new tab. Defaults to "_blank".

### Example:

```ruby
<%= render("immosquare-cookies/consent_banner", 
           :key           => "custom_cookie_name",
           :document_name => "Our Cookie Policy",
           :refuse        => "No, thanks",
           :accept        => "I agree",
           :text          => "We use cookies for better user experience.",
           :link          => "https://your-privacy-policy-url.com",
           :link_text     => "Learn more about our policy here: ",
           :target        => "_self") %>
```

## Internationalization

This gem is i18n ready. If you don't pass any custom text, it will use default translations. You can customize these translations by adding the appropriate keys to your application's localization files.

The default keys used by the gem are:

- `immosquare-cookies.document_name`
- `immosquare-cookies.refuse`
- `immosquare-cookies.accept`
- `immosquare-cookies.text`
- `immosquare-cookies.link_text`

## License

This gem is available under the terms of the [MIT License](https://opensource.org/licenses/MIT).
