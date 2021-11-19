# frozen_string_literal: true

require 'yaml'
require 'erb'

require_relative '../utils/migration'

def db_config
  YAML.safe_load(ERB.new(File.read('config/database.yml')).result)
end

desc 'Allow manager database'
namespace :db do
  desc 'Create database'
  task :create do
    conn = db_config[ENV['SINATRA_ENV']]

    puts '============================================='
    puts "Created #{ENV['SINATRA_ENV']} database!"
    Sequel.connect(conn.merge('database' => 'postgres')) do |db|
      db.execute "DROP DATABASE IF EXISTS #{conn['database']}"
      db.execute "CREATE DATABASE #{conn['database']}"
    end
    puts '============================================='
    puts 'DONE ✅'
  end

  desc 'Drop database'
  conn = db_config[ENV['SINATRA_ENV']]

  task :drop do
    puts '============================================='
    puts 'Drop database...'

    Sequel.connect(conn.merge('database' => 'postgres')) do |db|
      db.execute "DROP DATABASE IF EXISTS #{conn['database']};"
    end
    puts '============================================='
    puts 'DONE ✅'
  end

  desc 'Create migration'
  task :migration do
    migration_name = ENV['NAME']
    next_migration_number = Utils::Migration.current_migration_number
    path = "db/migrations/#{next_migration_number}_#{migration_name}.rb"

    template = <<~EOF
      # frozen_string_literal: true

      Sequel.migration do
        up do
        end
        down do
        end
      end
    EOF

    puts '============================================='
    puts "Create migration #{migration_name} - #{path}"
    File.open(path, 'w') { |file| file.write(template) }
    puts '============================================='
    puts 'DONE ✅'
  end

  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    Sequel.extension :migration

    conn = db_config[ENV['SINATRA_ENV']]

    puts '============================================='
    version = args[:version].to_i if args[:version]
    Sequel.connect(conn) do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
    puts 'DONE ✅'
    puts '============================================='
  end
end
