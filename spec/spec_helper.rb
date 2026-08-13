# frozen_string_literal: true

require "bundler/setup"

##============================================================##
## A Rails engine is normally loaded from inside a booting Rails
## application, where ActiveSupport core extensions are already in
## place. railties calls delegate_missing_to while defining its own
## classes, so requiring the engine on a bare ruby blows up before
## reaching any of our code. Loading ActiveSupport first reproduces
## the minimum host context the engine is entitled to expect.
##============================================================##
require "active_support/all"
require "immosquare-cookies"

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
