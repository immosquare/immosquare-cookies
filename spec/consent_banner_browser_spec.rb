# frozen_string_literal: true

require "ferrum"
require_relative "support/consent_banner_renderer"

##============================================================##
## Runs the banner's inline JavaScript in a headless Chrome. The
## page is served through request interception on a real http
## origin: document.cookie does not work on about:blank or file://.
##============================================================##
RSpec.describe("consent banner in the browser") do
  include ConsentBannerRenderer

  before(:all) do
    @pages   = {}
    @browser = Ferrum::Browser.new(:headless => true, :timeout => 10)
    @browser.network.intercept
    @browser.on(:request) do |request|
      body = @pages[URI(request.url).path]
      if body
        request.respond(:body => body.b, :responseHeaders => {"Content-Type" => "text/html; charset=utf-8"})
      else
        request.abort
      end
    end
  end

  after(:all) do
    @browser&.quit
  end

  before do
    @browser.cookies.clear
  end

  def visit(jar)
    banner = render_banner(jar, :cookies_to_remove => ["_ga"])
    @pages["/"] = "<!doctype html><html><head><meta charset=\"utf-8\"></head><body><a id=\"manage\" href=\"#immosquare-cookies\">Manage cookies</a>#{banner}</body></html>"
    @browser.go_to("http://immosquare-cookies.test/")
  end

  def banner_hidden?
    @browser.evaluate("document.getElementById('immosquare-cookies-container').hidden")
  end

  def browser_cookies
    @browser.evaluate("document.cookie")
  end

  ##============================================================##
  ## GDPR: refusing must delete the listed cookies present at that
  ## moment, including those set after the page loaded (an analytics
  ## cookie set after an earlier acceptance, before the visitor
  ## reopens the banner).
  ##============================================================##
  it("deletes a listed cookie set after page load when the visitor refuses") do
    visit({})
    @browser.execute("document.cookie = '_ga=GA1.1.123; path=/'")
    @browser.execute("document.getElementById('immosquare-cookies-refuse').click()")

    expect(browser_cookies).not_to(include("_ga="))
    expect(browser_cookies).to(include("#{ConsentBannerRenderer::COOKIE_NAME}=false"))
    expect(banner_hidden?).to(be(true))
  end

  it("reopens the hidden banner from a link to #immosquare-cookies and focuses it") do
    visit({ConsentBannerRenderer::COOKIE_NAME => "true"})
    expect(banner_hidden?).to(be(true))

    @browser.execute("document.getElementById('manage').click()")

    expect(banner_hidden?).to(be(false))
    expect(@browser.evaluate("document.activeElement.id")).to(eq("immosquare-cookies-accept"))
    expect(@browser.evaluate("location.hash")).to(eq(""))
  end

  ##============================================================##
  ## On pagehide the banner is hidden only when a choice is stored:
  ## a visitor who never chose must find it again when the page
  ## comes back from the back-forward cache.
  ##============================================================##
  it("hides a reopened banner on pagehide when a choice is stored") do
    visit({ConsentBannerRenderer::COOKIE_NAME => "true"})
    @browser.execute("document.cookie = '#{ConsentBannerRenderer::COOKIE_NAME}=true; path=/'")
    @browser.execute("document.getElementById('manage').click()")
    @browser.execute("window.dispatchEvent(new PageTransitionEvent('pagehide'))")

    expect(banner_hidden?).to(be(true))
  end

  it("keeps the banner visible on pagehide when no choice is stored") do
    visit({})
    @browser.execute("window.dispatchEvent(new PageTransitionEvent('pagehide'))")

    expect(banner_hidden?).to(be(false))
  end
end
