# frozen_string_literal: true

require_relative '../../config/application'

desc 'Allow console to have access to Models and Database'
namespace :app do
  task :console do
    Pry.start
  end
end
