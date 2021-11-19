# frozen_string_literal: true

require_relative 'container'

module Comments
  class Repository
    include Comments::Container::Import[repo: :entity]

    def create(attrs)
      repo.insert(attrs)
    end

    private

    attr_reader :repo
  end
end
