# frozen_string_literal: true

require 'dotenv'

config_env = {
  'production' => 'production.env',
  'development' => 'development.env'
}

Dotenv.load(config_env[ENV['SINATRA_ENV']])
