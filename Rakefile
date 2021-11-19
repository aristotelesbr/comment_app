# frozen_string_literal: true

require 'rake'
require 'pry'

ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'sequel'

require_relative './config/initializers/dotenv'

Dir.glob('lib/tasks/*.rake').each { |r| load r }
