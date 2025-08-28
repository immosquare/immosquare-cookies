require_relative "lib/immosquare-cookies/version"

Gem::Specification.new do |spec|
  spec.license       = "MIT"
  spec.name          = "immosquare-cookies"
  spec.version       = ImmosquareCookies::VERSION.dup
  spec.authors       = ["immosquare"]
  spec.email         = ["jules@immosquare.com"]
  spec.summary       = "A customizable cookie consent banner for Rails applications."
  spec.description   = "immosquare Cookies Consent Banner allows Rails developers to effortlessly integrate a GDPR-compliant cookie consent prompt into their web applications. With built-in internationalization support and options to customize the banner's appearance and text, it offers a flexible and user-friendly solution for obtaining user consent."
  spec.homepage      = "https://github.com/immosquare/immosquare-cookies"
  spec.files         = Dir["{app,config,db,lib}/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")
end
