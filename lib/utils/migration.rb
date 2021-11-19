# frozen_string_literal: true

module Utils
  module Migration
    module_function

    def migration_lookup_at(dirname)
      Dir.glob("#{dirname}/[0-9]*_*.rb")
    end

    def last_migration_file_name
      migration_lookup_at(MIGRATION_PATH).max.split('/').last
    end

    def empty_migrations?
      migration_lookup_at(MIGRATION_PATH).length.zero?
    end

    def current_migration_number
      return INITIAL_MIGRATION if empty_migrations?

      last_migration_file_name[0..3].next
    end

    INITIAL_MIGRATION = '0001'
    MIGRATION_PATH = 'db/migrations'

    private_constant :MIGRATION_PATH, :INITIAL_MIGRATION
  end
end
