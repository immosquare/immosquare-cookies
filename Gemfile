source "https://rubygems.org"

gemspec

group :development do
  gem "immosquare-cleaner"
  ##============================================================##
  ## Language Server Protocol : https://shopify.github.io/ruby-lsp/
  ##============================================================##
  gem "ruby-lsp"
end

##============================================================##
## Anything the specs need belongs here and not in :development,
## which the CI skips (cf. bin/ci).
##============================================================##
group :test do
  gem "activesupport"
  ##============================================================##
  ## Drives a headless Chrome so the specs run the banner's inline
  ## JavaScript for real. The runner needs Chrome installed.
  ##============================================================##
  gem "ferrum"
  gem "rspec"
  gem "simplecov",      :require => false
  gem "simplecov-lcov", :require => false
end
