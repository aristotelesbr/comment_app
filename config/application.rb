# frozen_string_literal: true

raise 'Wrong Ruby version, please use a version >= 2.7' unless RUBY_VERSION >= '2.7.3'

ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'sequel'
require 'graphql'

require_relative 'initializers/auto_load'
