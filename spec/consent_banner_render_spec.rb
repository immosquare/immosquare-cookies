# frozen_string_literal: true

require_relative "support/consent_banner_renderer"

##============================================================##
## The banner is rendered on every page so that a "Manage cookies"
## link can reopen it: a stored choice only hides it. A request
## without a cookie jar renders nothing and must not raise.
##============================================================##
RSpec.describe("consent banner rendering") do
  include ConsentBannerRenderer

  it("renders a visible banner when no choice is stored") do
    html = render_banner({})

    expect(html).to(include("immosquare-cookies-container"))
    expect(html).not_to(match(/<div[^>]*id="immosquare-cookies-container"[^>]*hidden/))
  end

  it("renders the banner hidden once a choice is stored") do
    html = render_banner({ConsentBannerRenderer::COOKIE_NAME => "false"})

    expect(html).to(match(/<div[^>]*id="immosquare-cookies-container"[^>]*hidden/))
  end

  it("renders nothing without a cookie jar") do
    expect(render_banner(nil).strip).to(eq(""))
  end
end
