# frozen_string_literal: true

require_relative 'container'

module Comments
  class GetAll
    include Comments::Container::Import[repo: :entity]

    def call
      repo.all
    end

    private

    attr_reader :repo
  end
end
