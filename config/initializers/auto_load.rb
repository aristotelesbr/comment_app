# frozen_string_literal: true

require File.expand_path('lib/utils/importable')

# Require all configs
File.expand_path('./..', __dir__).tap do |config|
  Dir[
    "#{config}/initializers/*.rb",
    "#{config}/application.rb",
  ].then { |files| files.each(&method(:require)) }
end

# Require app
File.expand_path('./../../app', __dir__).tap do |app|
  Dir[
    "#{app}/web/**/*.rb",
    "#{app}/lib/**/*.rb",
  ].then { |files| files.each(&method(:require)) }
end
