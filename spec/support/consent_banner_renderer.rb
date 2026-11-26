# frozen_string_literal: true

require "action_view"

##============================================================##
## Renders the consent banner partial outside of any host
## application. `cookies` is a controller helper in a real app:
## the view gets its own `cookies` method returning the given jar,
## which may be nil like in a request without a cookie jar.
##============================================================##
module ConsentBannerRenderer
  GEM_ROOT    = File.expand_path("../..", __dir__)
  COOKIE_NAME = "_immosquare_consented"

  I18n.load_path += Dir[File.join(GEM_ROOT, "config/locales/*.yml")]

  def render_banner(jar, locals = {})
    lookup = ActionView::LookupContext.new([File.join(GEM_ROOT, "app/views")])
    view   = ActionView::Base.with_empty_template_cache.new(lookup, {}, nil)
    view.define_singleton_method(:cookies) { jar }

    I18n.with_locale(:en) do
      view.render(:partial => "immosquare-cookies/consent_banner", :locals => {:site_name => "Example"}.merge(locals))
    end
  end
end
