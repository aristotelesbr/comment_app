# frozen_string_literal: true

require 'yaml'
require 'erb'
require_relative 'dotenv'

config_file = YAML.safe_load(ERB.new(File.read('config/database.yml')).result)

DB = {
  'test' => Sequel.connect(config_file['test']),
  'production' => Sequel.connect(config_file['production']),
  'development' => Sequel.connect(config_file['development'])
}[ENV['SINATRA_ENV']]
