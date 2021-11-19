# frozen_string_literal: true

module Comments
  class Container
    extend Dry::Container::Mixin

    register('entity') { Comment }
    register('repository') { Repository.new }

    Import = Dry::AutoInject(Container)
  end
end
