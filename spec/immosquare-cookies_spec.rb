# frozen_string_literal: true

##============================================================##
## Smoke test. Thin on purpose, but it guards the one failure
## that ships silently and breaks every host application at
## once: a gem whose require chain no longer resolves. Loading
## spec_helper already requires the gem, so a broken require, a
## syntax error or a dependency dropped from the gemspec fails
## here before any richer spec gets the chance to run.
##============================================================##
RSpec.describe(ImmosquareCookies) do
  it "exposes a semver VERSION" do
    expect(ImmosquareCookies::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
  end
end
