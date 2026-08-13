# frozen_string_literal: true

##============================================================##
## Starts SimpleCov before the library is loaded: a file already
## required by the time coverage starts escapes measurement and
## reports 0%. Hence the `--require coverage_helper` placed above
## `--require spec_helper` in .rspec — the order matters.
##
## Without COVERAGE=true this is a no-op, so a local `rspec` run
## stays fast and leaves no coverage/ directory behind.
##============================================================##
return if ENV["COVERAGE"] != "true"

require "simplecov"
require "simplecov-lcov"

SimpleCov::Formatter::LcovFormatter.config do |config|
  config.report_with_single_file = true
  config.output_directory        = "coverage"
  config.lcov_file_name          = "lcov.info"
end

SimpleCov.start do
  enable_coverage(:branch)
  add_filter("/spec/")
  formatter(
    SimpleCov::Formatter::MultiFormatter.new(
      [
        SimpleCov::Formatter::LcovFormatter,
        SimpleCov::Formatter::HTMLFormatter
      ]
    )
  )
end
